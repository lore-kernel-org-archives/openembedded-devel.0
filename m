Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0dDf-0008Ew-QO
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 18:39:56 +0200
Received: by iwn2 with SMTP id 2so4363168iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=vD7SFeR1pRBQEVtzTdxouWyAwi9eRTQBfGGVw3pl67o=;
	b=mIrUsn7efs4agJdLhmM34kPLKWREI0WMl8am5Iu7PUhumP2OtYFQwXJ6SxLr5U9r/+
	rUUHyJ9f/ttarMvu7xxEJf/ftLEA0mNzlgrzAZdy3MPrZZ4lS0e562TqeLh2GEetMzeC
	03GAu++rdX8URK2g+dJoDLJxvmXfGL/M82rf4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=cV91zfajhFgcrYlNhYC6gCjZVkrcbOMlCVgXdhJgmRvTUJGOy9Ia/bYycx66cgooMh
	5i/H2ZOnOJ8AP7XP6Z6GTEyXfP76yQwhfbwIEWT0zCMu/fLV1d3GpoyR9cYKjZ/CCRpP
	YRbDe952Kph0StF1efrpShduz53ve1Uefvs48=
MIME-Version: 1.0
Received: by 10.231.169.10 with SMTP id w10mr180017iby.106.1285691982994; Tue,
	28 Sep 2010 09:39:42 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 28 Sep 2010 09:39:42 -0700 (PDT)
Date: Tue, 28 Sep 2010 18:39:42 +0200
Message-ID: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] kernel NOTE messages fix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Sep 2010 16:39:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

Earlier today Henning and I (tirggered by ynezz) had a discussion on
irc on the loooong list of kernel NOTE messages.
(things like: NOTE: /kernel/arch/arm/mach-at91/at91x40_time.c)
This was also discussed earlier with Eric Benard (also on irc).
I promised Henning that I should write a note (pun intended :-) ) to
the list, and here it is.

Basically the issue is that kernel.bbclass in kernel_do_install copies
a lot of files to ${D} so that eventually they end up in staging (this
copying is done in sysroot_stage_all_append ). These files are not
added to any package so insane.bbclass (or is it sane.bbclass
nowadays) barfs about these files.
The reason these files end up in staging is for building out-of-tree
kernel modules.

As it stands we see 3 solutions:

1) rm -rf the files in sysroot_stage_all_append after staging them
issue is that packaging can run in parallel, so in order to do this
these these two tasks need to be serialized

2) add them to kernel-dev. That way the NOTE disappears. However this
does increase the kernel-dev package size with 90 MB or so.
Technically it would allow building out-of-kernel modules on the
target. Then again currently this is not possible and I have never
heard complaints about it (actually for embedded systems it is often
not a good plan to build on the target, although with current high end
systems this becomes more feasible).

3) copy the files directly from the work area to staging. That way
there are no unpackaged files in image/ so no NOTE messages.
Additional advantage is that it is faster as we save the copy to the image dir.

The following patch makes (3) happen:

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 5f8bc8a..05ddcc1 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -121,7 +121,12 @@ kernel_do_install() {
                 oe_runmake SUBDIRS="scripts/genksyms"
         fi

-       kerneldir=${D}/kernel/
+
+}
+
+sysroot_stage_all_append() {
+
+        kerneldir=${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}

        if [ -e include/asm ] ; then
                # This link is generated only in kernel before
2.6.33-rc1, don't stage it for newer kernels
@@ -197,12 +202,7 @@ kernel_do_install() {
        install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
        [ -e Module.symvers ] && install -m 0644 Module.symvers $kerneldir/

-       cp -fR scripts $kerneldir/
-}
-
-sysroot_stage_all_append() {
-       sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
-       cp -fpPR ${D}/kernel/.config ${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
+       cp -fR scripts $kerneldir/
 }

 kernel_do_configure() {

I have tested this patch and for me it works fine and building the
kernel is greatly improved (mostly due to the NOTE messages that are
not generated, but also partly due to the copying step that is
avoided, so personally I am quite happy with this one.

But before committing this patch I'd like to discuss this on the list.
Your response is appreciated.

Frans.

PS: anyone an idea why these NOTE messages take so long time? I must
say I never timed it, but I heard people say 2 messages/sec, which
seems quite slow.


