Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6D270EF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 07:29:05 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so15285480wgh.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 00:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6eJzcYH8Z5SzvfU8mCccJZ1Waoqg2F9RGvj3AqdAv1A=;
	b=Gk32uFwrA8P2pzx0KrbKHp9Cmg6QOEdtmyhZrUDTdAZmC3vktyRH+zl5LdN2Uf2Wd+
	nesE1isEwcX+MxtX1AxYbfnmDFqUWWPOEADsdVWFxEoAuBfPPPJyoncgpsNMyymiub2+
	VUXXs5B1qwCjp3UthXqKtP5YsyAwwcYpcqcp2SYuEnbmIA3fEYh58hUvsAP5XPMrZ9Jx
	J1vep5HzpGwcGtGfNp3bZr/cCALBrKrLt2eB8mBCgfKo/01WE9PJqixWwWpzkCh1Uw16
	p3jArRESWM6/ets1wTDWrQ0LNkkvFFhHWSQz39VXWUh7YUKZyPzhEY8+lzKT04SjyDFq
	3ArQ==
X-Gm-Message-State: ALoCoQndBr4y1450f6w8otwUsi3ev7mIoUQyYXa93zXMPfy8XLHMyNN7tibZoMwD5rOUmMzzZEyx
X-Received: by 10.180.10.166 with SMTP id j6mr26652933wib.73.1409124546866;
	Wed, 27 Aug 2014 00:29:06 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id o10sm5979410wia.0.2014.08.27.00.29.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Aug 2014 00:29:06 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Aug 2014 09:29:00 +0200
Message-Id: <1409124541-12549-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-initramfs][PATCH 1/2] dracut: add 'getopt' to RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Aug 2014 07:29:13 -0000

This drags in full util-linux, a future TODO is to split up util-linux
completely in OE-core.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index 945ba0f..9909a6d 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -33,7 +33,8 @@ FILES_${PN} += "${datadir}/bash-completion \
                 ${libdir}/kernel \
                "
 
-RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid bash ldd"
+# 'getopt' is in the util-linux main package
+RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid util-linux bash ldd"
 # This could be optimized a bit, but let's avoid non-booting systems :)
 RRECOMMENDS_${PN} = " \
                      kernel-modules \
-- 
1.9.0


