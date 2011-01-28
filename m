Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1PikOb-0001m4-09
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 10:13:33 +0100
Received: by fxm17 with SMTP id 17so3153288fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 01:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=yPm4WXrNqQDLNfiK84E20pijweCGLY61i8RoCJW9gas=;
	b=wFnH7aX9Z9XovIxO24rKACjZ8MfZKNnWAvRtEBB7cxqdk1gfxMkCPcIcLWtXdZqncE
	UhWHdZX/S8FepS2SHxKLyD9DFHFbsmfe1zMEdUyO4mDQNfs1Z0hD603bx0eRdAX5AVE5
	iay/jbRcDEaHPvGOeyaLQmfe5B3wnivpcTL44=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=mxYx1unNfkR8SkVi6GDWapowlipB46Or6fF1QYC7JQAfO1JJjixOiGQXClvJer2D5v
	zPR8juyph0osep/AnXUS8axZMnnsryF+PIshcMham7nKC6XZ/lTn6ZL+8Omro9lrvDvw
	VbFKBC0i46BYo1UpX+bnOB3MaV7rpqXbovT6Y=
Received: by 10.223.86.140 with SMTP id s12mr2073736fal.145.1296205960027;
	Fri, 28 Jan 2011 01:12:40 -0800 (PST)
Received: from localhost.localdomain (dial-92-52-20-198-orange.orange.sk
	[92.52.20.198])
	by mx.google.com with ESMTPS id 5sm6325547fak.23.2011.01.28.01.12.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 28 Jan 2011 01:12:39 -0800 (PST)
From: "sujak.marek" <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jan 2011 10:12:06 +0100
Message-Id: <1296205926-12241-1-git-send-email-sujak.marek@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] linux: Set default kernel for vmx25 to 2.6.35
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
X-List-Received-Date: Fri, 28 Jan 2011 09:13:33 -0000

Signed-off-by: sujak.marek <sujak.marek@gmail.com>
---
 recipes/linux/linux_2.6.35.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/linux/linux_2.6.35.bb b/recipes/linux/linux_2.6.35.bb
index 98edfaa..5060c02 100644
--- a/recipes/linux/linux_2.6.35.bb
+++ b/recipes/linux/linux_2.6.35.bb
@@ -15,6 +15,7 @@ DEFAULT_PREFERENCE_qemumips64 = "1"
 DEFAULT_PREFERENCE_qemuppc = "1"
 DEFAULT_PREFERENCE_qemux86 = "1"
 DEFAULT_PREFERENCE_nokia900 = "1"
+DEFAULT_PREFERENCE_vmx25 = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2;name=kernel \
            ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.${STABLEV}.bz2;apply=yes;name=stablepatch \
@@ -116,6 +117,8 @@ SRC_URI_nokia900 = "\
 	file://inconsistent-mmc-fix-2.6.35.patch \
 	file://defconfig "
 
+SRC_URI_append_vmx25 = "file://linux-2.6.35-vmx25-20110112.patch"
+
 CMDLINE_nokia900_shr = "snd-soc-rx51.hp_lim=42 snd-soc-tlv320aic3x.hp_dac_lim=6 console=tty1 root=/dev/mmcblk1p1 rootwait panic=20 debug"
 
 SRC_URI[kernel.md5sum] = "091abeb4684ce03d1d936851618687b6"
-- 
1.7.0.4



