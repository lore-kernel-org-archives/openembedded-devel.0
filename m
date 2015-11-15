Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 82B2677396
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 16:17:50 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so143800526wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 08:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SHFr+qYVnz3eMGGcr1KlsXIMnDSODFj/r94LDVp/opA=;
	b=K9lAL8ErVDwXZGH8MndS8NsC0JBMUa7KU1P5SFiQidwPClAsI8RJrM/8zgIgxDX3P5
	3DKkUeK1W21Stt0MgzjxpYjo5YkpSZ7NDdPPmhVtqhXxp+wKHULXN+2qMGsHEr9h+OBa
	6jkS/8c25wyh1YyQJLsu/bHXurhPD3FG2WFg3TquQfpE25so+1OyxPqVTsxVZF4VL8AK
	gnMP8axawB4yc/3Wc3cD/G5ogTnfWeVgVzQCvX0sVwuKovPGFegta/DG4fZ5/IDqMw7h
	GPwmrLouF85YWc/WNcBNM7NJ5vLo638nI1Y2Wmfh7NGNUM+Vg413PsKG5GSJuWewNQpY
	CVhw==
X-Received: by 10.28.55.200 with SMTP id e191mr13774235wma.83.1447604270156;
	Sun, 15 Nov 2015 08:17:50 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q6sm10740434wjx.28.2015.11.15.08.17.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Nov 2015 08:17:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Nov 2015 17:17:39 +0100
Message-Id: <1447604260-5460-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 7/8] gvfs: don't depend on samba by default
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
X-List-Received-Date: Sun, 15 Nov 2015 16:17:50 -0000

* we don't want to introduce dependency on meta-networking just because of this

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
index 166e5d2..fb5185f 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
@@ -22,7 +22,7 @@ FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${datadir}/gvfs/mounts/trash.moun
 RDEPENDS_${PN} = "gvfs-gdu-volume-monitor"
 RRECOMMENDS_gvfsd-ftp += "openssh-sftp openssh-ssh"
 
-PACKAGECONFIG ?= "libgphoto2 ${@base_contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'samba', d)}"
+PACKAGECONFIG ?= "libgphoto2"
 
 PACKAGECONFIG[libgphoto2] = "--enable-gphoto2, --disable-gphoto2, libgphoto2"
 PACKAGECONFIG[samba] = "--enable-samba --with-samba-includes=${STAGING_INCDIR} \
-- 
2.6.3


