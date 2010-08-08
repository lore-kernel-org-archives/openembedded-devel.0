Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1OhwM2-00043R-GZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Aug 2010 05:15:19 +0200
Received: by qyk11 with SMTP id 11so1059815qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Aug 2010 20:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=wjqD04GQlYsZJGa4Jx3unrNY0w116yMotj7n8FA6bTg=;
	b=eOPXLTxojXD2hjtQPZVjMg6/k96JaRXuWwaHcJJaSqqJ7MNERNPDMIVzLXg0a+zls4
	PqYKd03UlCX2ql2rGKhRKQAJbWMD/EKJD0Bh260wYJMd94WsGPSKYcY+tcFjoL6hSqMe
	YVuIat5rW2NCVPN3oNrIOO+0nMi+/bijXVN6A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=DBUCoXw+uxb3LKbkWaVgTt333k3ckydOAr9oNdgMwedUCecvHC4qCCF4hKnlgYaRcP
	ZAuOJTie2zjqk41OE5TqfizgNBuZOwdTVbv2FOpydNxgxn1n++zfEPWSt684uyrL6Kx0
	Fju7CG/H8z/fh/r9gAp6GXviKe0i/b1wxGm7o=
Received: by 10.224.19.195 with SMTP id c3mr5173433qab.270.1281237309100; Sat, 
	07 Aug 2010 20:15:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.89.20 with HTTP; Sat, 7 Aug 2010 20:14:49 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
Date: Sat, 7 Aug 2010 20:14:49 -0700
Message-ID: <AANLkTikqC4jZ2YrjVUiibof1vCOMUhr4=uq4UWFGtdo0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] pkgconfig.bbclass: Remove spurious rpaths and -isystem includes from pkgconfig files.
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
X-List-Received-Date: Sun, 08 Aug 2010 03:15:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I made the following change to my pkgconfig.bbclass to fix some
staging-qa.  Firstly, does this patch look good (I'm still learning
here)?  Secondly, should a change like this also be made so libraries
specified by pkgconfig files are actually available on the target?

--- a/classes/pkgconfig.bbclass
+++ b/classes/pkgconfig.bbclass
@@ -2,7 +2,7 @@ DEPENDS_prepend = "pkgconfig-native "

 do_install_prepend () {
        for i in `find ${S}/ -name "*.pc" -type f` ; do \
-               sed -i -e 's:-L${STAGING_LIBDIR}::g' \
+               sed -i -e 's:-L${STAGING_LIBDIR}:-L${prefix}/lib:g' \
...

Thanks,

Ash
>>>>>>
Signed-off-by: Ash Charles <ashcharles@gmail.com>
[PATCH] pkgconfig.bbclass: Remove spurious rpaths and -isystem
includes from pkgconfig files.

* Some build configurators such as cmake include -isystem paths to use
the staged system headers but these should not be included in
pkgconfig files.
* Likewise, pkgconfig.bbclass currently strips -R options from
pkgconfig files; this should likewise apply to -rpath-link options.
* Finally, we currently dispose of -I paths in our pkgconfig file that
point to the staging directory but we in fact want to modify the -I
paths to the correct location on the target.
---
 classes/pkgconfig.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/pkgconfig.bbclass b/classes/pkgconfig.bbclass
index cf37ca1..ae69258 100644
--- a/classes/pkgconfig.bbclass
+++ b/classes/pkgconfig.bbclass
@@ -4,7 +4,9 @@ do_install_prepend () {
        for i in `find ${S}/ -name "*.pc" -type f` ; do \
                sed -i -e 's:-L${STAGING_LIBDIR}::g' \
                        -e 's:-R${STAGING_LIBDIR}::g' \
-                       -e 's:-I${STAGING_INCDIR}::g' \
+                       -e 's:-rpath-link,${STAGING_LIBDIR}::g' \
+                       -e 's:-I${STAGING_INCDIR}:-I${prefix}/include:g' \
+                       -e 's:-isystem${STAGING_INCDIR}::g' \
                        $i
         done
 }
-- 
1.7.0.4


