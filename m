Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Ovfro-0002Wh-W1
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 02:28:54 +0200
Received: by pvg6 with SMTP id 6so2716415pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 17:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=GCgVlimeJroyfSUHXp2MN9hSBTD1fz1JxJFKixb63o8=;
	b=u3hNy7yeB86m1eiQ8u30e7qPzAFzPIA/GdXegF2CMcty8W/utCyNxl9q1NIz/6p1yk
	ONF+2SLCIG8D9HbXZEUMMo4qMyTz8Shrj6pxbgzsdh+CNgDq/uszaXZXTyiJSLUuf1B3
	2rKo5fhWtIBwyN0aeO28OzmxsCdh3CrflEbCA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=EE+2SmY+HbjzYj0QnlMVCO4V/esQpZRj/8xzcqz4JEIKN0vPz1LX+grMp0yMmD0WgE
	w7MzmcJgoB2RZEbk+8b5jaGCGH40jTQ7k2r0M6QXRK2QUaQdEsPqUy7gt82rrYvVAIeT
	4qqVecOi3DvwEk+jdNNCtVCZe3He2fL0d8eCc=
Received: by 10.142.121.7 with SMTP id t7mr735272wfc.88.1284510483338;
	Tue, 14 Sep 2010 17:28:03 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id n36sm882993wfa.16.2010.09.14.17.28.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 14 Sep 2010 17:28:02 -0700 (PDT)
Message-ID: <4C90130C.3040303@gmail.com>
Date: Wed, 15 Sep 2010 09:57:56 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] p4: remove broken and 4 years old recipes.
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
X-List-Received-Date: Wed, 15 Sep 2010 00:28:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Recipes are broken for all architectures except one (probably arm)
because the files in the SRC_URI depend on TARGET_ARCH and the md5/sha256
are presumably valid only for one of these.

Anyone wanting perforce should submit new recipes for new perforce versions.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/p4/p4.inc     |   72 -------------------------------------------------
 recipes/p4/p4_04.2.bb |   18 ------------
 recipes/p4/p4_05.2.bb |   18 ------------
 3 files changed, 0 insertions(+), 108 deletions(-)
 delete mode 100644 recipes/p4/p4.inc
 delete mode 100644 recipes/p4/p4_04.2.bb
 delete mode 100644 recipes/p4/p4_05.2.bb

diff --git a/recipes/p4/p4.inc b/recipes/p4/p4.inc
deleted file mode 100644
index a8121c1..0000000
--- a/recipes/p4/p4.inc
+++ /dev/null
@@ -1,72 +0,0 @@
-# p4 .bb build file
-# Copyright (C) 2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see /COPYING)
-
-DESCRIPTION = "Perforce client and server binaries"
-HOMEPAGE = "http://www.perforce.com"
-LICENSE = "Perforce"
-
-def p4_arch(d):
-	import bb, re
-	arch = bb.data.getVar('TARGET_ARCH', d, 1)
-	os = bb.data.getVar('TARGET_OS', d, 1)
-
-	if re.match("^linux.*$", os):
-		r = re.compile("([0-9]+\.[0-9]+).*")
-		m = r.match(base_read_file(bb.data.expand('${STAGING_KERNEL_DIR}/kernel-abiversion', d)));
-		os = "linux"
-		if m and re.match("^.*86.*$", arch):
-			os = "linux%s" % m.group(1).replace('.','')
-
-	if re.match("^i.86$", arch):
-		arch = "x86"
-	elif arch == "x86_64":
-		arch = "amd64"
-	elif re.match("^mips.*$", arch):
-		arch = "mips"
-
-	return "%s%s" % (os, arch)
-
-P4ARCH = "${@p4_arch(d)}"
-P4BASEURL = "http://filehost.perforce.com/perforce/r${PV}/bin.${P4ARCH}"
-
-#Because these files are all named the same thing, regardless of version or arch
-PREMIRRORS=""
-DL_DIR="${WORKDIR}/${P4ARCH}"
-
-SRC_URI="\
-	${P4BASEURL}/p4;name=p4 \
-	${P4BASEURL}/p4api.tar;name=p4api \
-	${P4BASEURL}/p4d;name=p4d \
-	${P4BASEURL}/p4ftpd;name=p4ftpd \
-	${P4BASEURL}/p4p;name=p4p \
-	${P4BASEURL}/p4web;name=p4web"
-S = "${WORKDIR}"
-
-PACKAGES += " ${PN}-server"
-FILES_${PN} = " ${bindir}/p4"
-FILES_${PN}-server = " ${bindir}/p4d ${bindir}/p4ftpd ${bindir}/p4p ${bindir}/p4web"
-
-do_stage() {
-	install -d ${STAGING_INCDIR}/p4api
-	install -m 0644 *.h ${STAGING_INCDIR}/p4api/
-
-	oe_libinstall -a libclient ${STAGING_LIBDIR}
-	oe_libinstall -a librpc ${STAGING_LIBDIR}
-	oe_libinstall -a libsupp ${STAGING_LIBDIR}
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${includedir}/p4api
-	install -d ${D}${libdir}
-
-	install -m 0644 *.h ${D}${includedir}/p4api/
-	for p4bin in p4 p4d p4ftpd p4p p4web ; do
-		install -m 0755 $p4bin ${D}${bindir}/
-	done
-
-	oe_libinstall -a libclient ${D}${libdir}/
-	oe_libinstall -a librpc ${D}${libdir}/
-	oe_libinstall -a libsupp ${D}${libdir}/
-}
diff --git a/recipes/p4/p4_04.2.bb b/recipes/p4/p4_04.2.bb
deleted file mode 100644
index 6b1d527..0000000
--- a/recipes/p4/p4_04.2.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-# p4 .bb build file
-# Copyright (C) 2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see /COPYING)
-
-require p4.inc
-
-SRC_URI[p4.md5sum] = "ba983759366018ad2d90a7e088f509eb"
-SRC_URI[p4.sha256sum] = "de8bce2b3ae085a973dca4f7208c3cb1ab1fdc9bbcc9e3496ad3d56a4923dba0"
-SRC_URI[p4api.md5sum] = "1eb1fb53531e09a03f158957016d55a6"
-SRC_URI[p4api.sha256sum] = "7d5455c9aa77aea548f3b52f579bf41fff034f0be1c283840b88be401f817792"
-SRC_URI[p4d.md5sum] = "690a404af3d916dc7c1cfa5a14a51171"
-SRC_URI[p4d.sha256sum] = "e41d44dbc5bd60f2140f0774945154105759b2dabf4c26c097cf754797274e39"
-SRC_URI[p4ftpd.md5sum] = "c099df674fb3c249cb1d1984f00d573e"
-SRC_URI[p4ftpd.sha256sum] = "9839564335035bc92041fafd93d05a811dc4243bb72269b3afe5ba823f016418"
-SRC_URI[p4p.md5sum] = "02de68f26da402689f661662217cd77f"
-SRC_URI[p4p.sha256sum] = "24d153529f669ff5fd9dc0d7a09bf7c6e658ee2d2496ab8025a2aaf12425907c"
-SRC_URI[p4web.md5sum] = "7bf9967719351c7a0758e20641978358"
-SRC_URI[p4web.sha256sum] = "70ebe07343989de042b9ef7866cfca540cfb28458e6c475d516c6916f4feb468"
diff --git a/recipes/p4/p4_05.2.bb b/recipes/p4/p4_05.2.bb
deleted file mode 100644
index ba60aa8..0000000
--- a/recipes/p4/p4_05.2.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-# p4 .bb build file
-# Copyright (C) 2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see /COPYING)
-
-require p4.inc
-
-SRC_URI[p4.md5sum] = "9bc57695db5885ffac0a352fc17a7f84"
-SRC_URI[p4.sha256sum] = "56dd1cb2364b8c8618f9019b641d17d6b307a5a797f3ac31c16a01247554e10c"
-SRC_URI[p4api.md5sum] = "7bdb4d9f59a231cc90a8e93709ec1595"
-SRC_URI[p4api.sha256sum] = "2e742bf3358f9b8b38f692f4222f96d6901a6faedca155942f58435cee385614"
-SRC_URI[p4d.md5sum] = "9a72849bb39cfe19da018271824a3ae1"
-SRC_URI[p4d.sha256sum] = "d67bc483b3cbccdcf32db6af21f02d20793a4c3ccc4b758c3a66374b410b73e8"
-SRC_URI[p4ftpd.md5sum] = "eb47a4e532fca795893f0c727ae59c84"
-SRC_URI[p4ftpd.sha256sum] = "bb5de57d0098e1c6f0d238cc4e658c64579b26fc1df58b9ce59c057fcb5b2f4c"
-SRC_URI[p4p.md5sum] = "eed70a3a6af7e59a44d614d4a8022ff0"
-SRC_URI[p4p.sha256sum] = "b4b6546d16f161a50337bf9f5dfaf3a4795a3c9b56931e7ee2ace8bcf1863d6e"
-SRC_URI[p4web.md5sum] = "e97b15e64be5a3773880f7d66e87a541"
-SRC_URI[p4web.sha256sum] = "ce72ef785a92aa8c71b6525e37da49bebab670a046b2ee0c023713f5aa497826"
-- 
1.7.1



