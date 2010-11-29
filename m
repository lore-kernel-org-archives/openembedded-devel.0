Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PMwfi-0007pu-9Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 06:53:07 +0100
Received: by pxi17 with SMTP id 17so673555pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Nov 2010 21:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=QqTQMpN+p5NO0mYL+bF4h/WqnXmqgVuCLkzxst5m3EY=;
	b=OgSuRguLJW8npCtRHhE1NvX6aHvYxwf8tc9eDbvde8ySQ+inagd/BfcXUvW5IMOzCW
	Pywgo2LsT6CEhRT/+w2CfazY3y8YdwRZY9xI96gq21qHzmc5vR4JqnQbrc6eAUSH8mYG
	qaOunsoRjYkDBO9wZnk5gol6rygUStEfq6WbI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=Sw37y1HtLivA4PLaE/r/6Xbhd8wwBZaj/dEMSoXBcvYtSdWwILuiiI8IGKGfXpWLcf
	bIq2IoA4iem2rDvWVehLeQIjXPQVKAIBW9APBku5GxBaIfO/Th9bWczk+JiGbgrluYKY
	Fh0ca88S6D6nHdHCtRr8IFd7jfiER0qfG+ibM=
Received: by 10.142.222.8 with SMTP id u8mr4826927wfg.404.1291009904415;
	Sun, 28 Nov 2010 21:51:44 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id p8sm7004063wff.4.2010.11.28.21.51.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 28 Nov 2010 21:51:43 -0800 (PST)
Message-ID: <4CF33F69.2030307@gmail.com>
Date: Mon, 29 Nov 2010 16:21:37 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libdrm_2.4.22.bb: Fix build for uclibc when DISTRO_FEATURES lacks largefile.
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
X-List-Received-Date: Mon, 29 Nov 2010 05:53:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

  CC     intel.lo
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/errno.h:29:0,
                 from intel.c:32:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/features.h:216:5: error: #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file support enabled.
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:72:0,
                 from intel.c:33:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/bits/uClibc_stdio.h:61:2: error: #error Sorry... uClibc was built without large file support!
In file included from intel.c:33:0:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:83:26: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'fpos_t'
In file included from intel.c:33:0:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:719:12: error: expected declaration specifiers or '...' before 'fpos_t'
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:721:12: error: expected ';', ',' or ')' before '*' token
make[2]: *** [intel.lo] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/dri/libdrm_2.4.22.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/recipes/dri/libdrm_2.4.22.bb b/recipes/dri/libdrm_2.4.22.bb
index 107e8b8..fb94e4c 100644
--- a/recipes/dri/libdrm_2.4.22.bb
+++ b/recipes/dri/libdrm_2.4.22.bb
@@ -17,3 +17,9 @@ EXTRA_OECONF_append_angstrom = " --disable-radeon "
 PACKAGES =+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel', '',d)}"
 
 FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
+
+do_compile_prepend_libc-uclibc() {
+	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/intel.c', d)}"
+	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/vmwgfx.c', d)}"
+	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/nouveau.c', d)}"
+}
-- 
1.7.1



