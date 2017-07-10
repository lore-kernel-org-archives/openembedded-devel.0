Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id D6F956FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 17:35:18 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id c11so148050843wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xXcJ6d+6ipCjrAGwOT+KoUY5ZDrU6I1+/8B/EB/PD88=;
	b=LJGx2SArBcszfSpWLyaPHtxexYP72BbPcV19S7Oj99oSsMtsFg+7yX4mIq+GB9UcP0
	DTcZmkZV4oKKm44KY+eCw5bDbcyUOeNxteBY8ykz+NG9GSWSsEhhUAuQsWi+Pvs8g6QE
	qwDF/kcMx1B+5BhWfsjGeD6tnhZHW+ZrJooPR5xnbt7qVyAg1nGklJAy0hStchJOtsaR
	aYK9ph9c4Bau5lR04jdJ53iqGsub2HcmiAdhOeknnF6K4Guy5y/Guv/YzDD5rNLwcMjh
	IqHpEpcLwNy9AgCSvVITYzOEPttPg7TMyQiNhT1pruTpGFeJCgloyRIFqbj9xwv1zDMF
	Mcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xXcJ6d+6ipCjrAGwOT+KoUY5ZDrU6I1+/8B/EB/PD88=;
	b=pgxqULcLLldxaKYrkypbh9arW462hKLxYz+AhhIwjARX9UEGe2r1QMqSiml1Rg19K9
	Gf15bZ/DxWLhMy8GfynLqiM7qu63eLPXfX9axat2vngTvBQOHHaoCLc4xPieQwMAA5Ps
	quckEDvwcUVv7hEL5SYzi8LsrM7p1SU4Nxv3HBVH+nf2OIWNt9TL3j9/Qcbag2RxkR2b
	YukEKn1tIUnYSUJCjm9zONUsRNLYT6XRmLf0bL4L5w7y2z5HXmJP7VEhx4rYL9ctpj1C
	FumFfFxXHTfPNbSYxj5+03RO7ctOsbVAvWYJrutRzC0+d3Hp6rxkp8NHeRDlIFeB9Mwc
	nfVA==
X-Gm-Message-State: AIVw112OzVcqGd5X9pwhZKhHOgaoNX/dDr285P0T6c7JKA2CpUdmiaOu
	pnzOXWK+vFnX6Uxy
X-Received: by 10.223.176.164 with SMTP id i33mr7871676wra.165.1499708119415; 
	Mon, 10 Jul 2017 10:35:19 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E9066A861E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e906:6a86:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	z195sm11980102wmz.28.2017.07.10.10.35.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 10:35:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 19:35:03 +0200
Message-Id: <20170710173507.3843-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170710173507.3843-1-schnitzeltony@googlemail.com>
References: <20170710173507.3843-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] gvfs: update 1.28.3 -> 1.32.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jul 2017 17:35:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gvfs/{gvfs_1.28.3.bb => gvfs_1.32.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.28.3.bb => gvfs_1.32.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.32.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.32.1.bb
index 62b757f..94d8954 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.32.1.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "gvfs is a userspace virtual filesystem"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 
-inherit gnome bash-completion
+inherit gnome bash-completion gettext
 
 DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.md5sum] = "d2399a1a217dd5030e8830c7e7c813c2"
-SRC_URI[archive.sha256sum] = "458c4cb68570f6ef4a9e152995c62d0057c3e0a07ed64d84c7200cdd22f0bd17"
+SRC_URI[archive.md5sum] = "cbe766b46f324e17d7abcfb4a89a1684"
+SRC_URI[archive.sha256sum] = "d0b6c9edab09d52472355657a2f0a14831b2e6c58caba395f721ab683f836ade"
 
 EXTRA_OECONF = " \
     --disable-gdu \
-- 
2.9.4


