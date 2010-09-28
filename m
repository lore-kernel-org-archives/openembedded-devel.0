Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0dS8-0005Nx-Eh
	for openembedded-devel@openembedded.org; Tue, 28 Sep 2010 18:54:54 +0200
Received: by iwn2 with SMTP id 2so4378996iwn.6
	for <openembedded-devel@openembedded.org>;
	Tue, 28 Sep 2010 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=+sRa+1GUV5mzhgd2j+/YuEsltaylyhcOM7vs09B/VYw=;
	b=KSiduZNPkod2Mxvpd+EDWh0Y7fA423rbPcUSaOlEAnYNtePace8NtalwFlA4JfTP12
	f92CljuExGnP2HFTDi05zEVBlS1of6gP2cWAiUOE+8+x1JA1QE9GexoAujdwFbZDDEPx
	P1maXBGac+8ew5VUlGywnQHvaHQgyl5CFewhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=oNaX63WRC/40rVdZMWMNBRK5Aamt0u4+q7oRpWn2HPBADvoUfX1HlER/Kr91UB9pD5
	F4l78SWVoVA/tGtczuJ2UjGJrK/A4yfpxDkl3Rx1QeLNXWOBveFJ0fx0huhBrknwOct5
	iaxERzC6hppMcug9K8MjwSqjMv9XU+w3+PAqw=
MIME-Version: 1.0
Received: by 10.231.174.5 with SMTP id r5mr186839ibz.132.1285692878441; Tue,
	28 Sep 2010 09:54:38 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 28 Sep 2010 09:54:38 -0700 (PDT)
Date: Tue, 28 Sep 2010 18:54:38 +0200
Message-ID: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
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
Subject: generate a named kernel in ${DEPLOY_DIR_IMAGE}
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
X-List-Received-Date: Tue, 28 Sep 2010 16:54:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

As I needed to generate two different kernels for the same machine I
had some kind of problem (as emailed yesterday).
For now I've solved it as follows:

I created a 2nd recipe (in an overlay):
linux-small_2.6.34.bb
this one essentially only requires linux_2.6.34.bb and sets S to the linux_${PN}
Then I can just add a dir linux-small and add the small defconfig in it.

That way bitbake linux-small should give me the 2nd kernel.
And actually it builds the kernel but this one is also packaged in a
kernel-*.ipk.
I could have made two different machines, but that seemed somewhat
overkill, so in the end I decided to modify do_install_append in
linux.inc.

This function currently reads:

do_install_append() {
	oe_runmake headers_install
INSTALL_HDR_PATH=${D}${exec_prefix}/src/linux-${KERNEL_VERSION}
ARCH=$ARCH
}

And I just added a line:
    cp ${D}/boot/uImage ${DEPLOY_DIR_IMAGE}/uImage-${PN}

That way both kernels end up with different names in the deploy dir.
In the image recipe I can then just copy them in a post process
command to the proper location.
(btw that is also why I went for uImage-${PN} and not for
uImage-${PN}-${KERNEL_VERSION}, the kernel version is not known in the
image recipe so it is much harder to copy the right/latest uImage to
the kernel.

Rationale for typing this message is threefold:
- first of all I wanted to record and share what I have done, so
others can use it
- secondly I would appreciate feedback on my solutions (and maybe
someone sees a way to improve it)
- and lastly I would like to inquire if people feel the above line
would be a nice addition to the stock linux.inc. If so I'l happily
prepare a patch.

Your feedback is appreciated.

Frans


