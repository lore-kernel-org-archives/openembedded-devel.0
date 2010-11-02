Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PD5Oe-0002MF-IH
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 02:10:45 +0100
Received: by pxi2 with SMTP id 2so690876pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 18:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=hb7+7RWP0XAtCp6gNMOtyF8fFG2+9YwUm1fDTE4OtW0=;
	b=pUOM0CNChr6bbYZc013MrxykYJwxag5KSSCQovz2+8gJoh/dtYdemkJOZy/ve3x4pZ
	NbpyOKMc4KiGfVH4zKUMadFFiBgHRut3YdL6kHzG1BL9LtbCuJvR9lv1WP8oOKd0yENT
	mqhmER3DEkIipd5L5zacElN5vIbJSOlOEO7rk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=VjpAPn05VmIzTiJDhCb7aLaEiEXpnCaykgSPqcSVtSYwXGhTBWtCgS1aimHLLbXuCu
	FFtetbx1F6cZeIiCvkzG01jcltJ2XDOzjTKvQlPp8Rz2KIJKVPqzvtWlRceHn0O/6qGA
	sMEB2I7npmK/usa0m81AoQhinJGdZ0QxiGUn0=
Received: by 10.142.201.1 with SMTP id y1mr4645517wff.345.1288660194825;
	Mon, 01 Nov 2010 18:09:54 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id e14sm9835372wfg.8.2010.11.01.18.09.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Nov 2010 18:09:54 -0700 (PDT)
Message-ID: <4CCF64DD.9080709@gmail.com>
Date: Tue, 02 Nov 2010 11:39:49 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.14) Gecko/20101020 Thunderbird/3.0.9
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
Subject: [PATCH] gphoto2_2.4.8.bb: Stop configure from looking in /usr/local/include
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
X-List-Received-Date: Tue, 02 Nov 2010 01:10:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 * Point configure at where it can find jpeg.
 * Explicitly disable cdk and aalib.
 * Fix license while here.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gphoto2/gphoto2_2.4.8.bb |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes/gphoto2/gphoto2_2.4.8.bb b/recipes/gphoto2/gphoto2_2.4.8.bb
index ea54713..836ea85 100644
--- a/recipes/gphoto2/gphoto2_2.4.8.bb
+++ b/recipes/gphoto2/gphoto2_2.4.8.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "gphoto2 is a command-line utility to fetch pictures from digital cameras"
 SECTION = "console/utils"
-LICENSE = "GPL"
-DEPENDS = "libtool libgphoto2 popt"
+LICENSE = "GPLv2+"
+DEPENDS = "libtool libgphoto2 popt jpeg"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/gphoto2-${PV}.tar.bz2;name=gphoto2 \
            file://gphoto-popt-fixup.patch"
@@ -11,6 +12,10 @@ SRC_URI[gphoto2.sha256sum] = "a2e2f70fd6051234cbc3d76dc82df6991e8a07ead56aa8d5c4
 
 inherit autotools
 
+EXTRA_OECONF="--without-cdk \
+		--without-aalib \
+		--with-jpeg-prefix=${STAGING_EXECPREFIXDIR}"
+
 do_configure_append() {
         find ${S} -name Makefile | xargs sed -i 's:/usr/include:${STAGING_INCDIR}:'
 }
-- 
1.7.1



