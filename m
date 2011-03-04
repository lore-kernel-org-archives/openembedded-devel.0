Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PvPzv-0000SR-RY
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 09:04:27 +0100
Received: by fxm8 with SMTP id 8so1907867fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 00:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=eZKFvpVYCKrAbgiCbVXwdQBsBm7Krokync3Pob4xhk8=;
	b=Z6K0lZmrGNE2LgcBVOKrsYsOSo4XtLnGFCSSSWEzFhWRCvegam324kympuVRppW2T6
	kF77xGl8wPqLaL73mA+VTvKZxYQ4shy1SoDLL75+i47CUIa6o8TkMgSpRuXbxamRYVm3
	YUNhksqlV52Dz0HurwNGgrrtWWAXtNYpi3Ssc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=LI+Ls7ZIzQk88N7HOgI+yYOeMhGozkviQwSHtv+7eN2eBtbdbsE5x1i2m/hcWOiBxz
	zrkEISQaYBY6oGCHx6HHo6lPsibzXt3AdelNx2mcGHM+OD3TvcxiTstUWZr626AzJ9Qt
	sT9gWEsdjYJae0UB1m/ra7SqkiiAEeSC/381I=
Received: by 10.223.5.3 with SMTP id 3mr417575fat.0.1299225778230;
	Fri, 04 Mar 2011 00:02:58 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y11sm322396fam.15.2011.03.04.00.02.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 00:02:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Mar 2011 09:02:49 +0100
Message-Id: <1299225769-12329-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] linux-kexecboot: remove extra quotes arround INITRAMFS_COMPRESSION RD_COMPRESSION, which made 'make oldconfig' to ignore them
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
X-List-Received-Date: Fri, 04 Mar 2011 08:04:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/linux/linux-kexecboot.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux-kexecboot.inc b/recipes/linux/linux-kexecboot.inc
index 87ef03d..9154f42 100644
--- a/recipes/linux/linux-kexecboot.inc
+++ b/recipes/linux/linux-kexecboot.inc
@@ -153,9 +153,9 @@ do_configure_prepend() {
                ${S}/.config
 
                echo '${KERNEL_COMPRESSION}' >>${S}/.config
-               echo '"${INITRAMFS_COMPRESSION}"' >>${S}/.config
+               echo '${INITRAMFS_COMPRESSION}' >>${S}/.config
                echo 'CONFIG_INITRAMFS_SOURCE="initramfs.cpio.${INITRAMFS_COMPRESSION_SUFFIX}"' >>${S}/.config
-               echo '"${RD_COMPRESSION}"' >>${S}/.config
+               echo '${RD_COMPRESSION}' >>${S}/.config
         fi
 
         yes '' | oe_runmake oldconfig
-- 
1.7.4.1



