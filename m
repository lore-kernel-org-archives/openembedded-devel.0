Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB4978E00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:27:57 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id q8-v6so5214476wmq.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+DTI9D+r9X+Wwbi2zjp1FY6FJF1zVC8Sux7/It76TAY=;
	b=VEUF3BKMMhCyiZIKrl/NkPHIiE29Y+Q4w5AxXfifvkAfut/2D1heZMDUdXoIX0IBcg
	YYaRhBQSQrTyxNAM1SnYZqhqHrrLDk6kqcaJZJFC5E/mUMzjksC+0LKwwi5l3M/Ovw7Y
	xnmYmGRkGxdDM9CM8uPFgzbrKcVMDtmVv8VE250bMNEX6RtmQEpL8Pq79RqBzNGU8IMh
	PIltTbgiRZLLpXyQSVwdfxv9eoDHuTAUHkwoL+fguPQVxeGm7tXjkpkrpxfZkR0415Qq
	QKoE5bHBMTSbyQM3IxLuSRT1T1vNA/ZVYotBWePZd43L2mAjJO0Lck1bN+zpmFv3X7xm
	tsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+DTI9D+r9X+Wwbi2zjp1FY6FJF1zVC8Sux7/It76TAY=;
	b=WuX+YQA7AYaQr+JMt6ODK5SnA1rgOZ0AhUlIOo50KsoJgS/em4+aQOW38sY0EIE4nM
	mEg/k+YDadw/yvmKhc22RnZB9doDOXVP0KIyJsxVcoHoNgCAB5VMY13twQ0MnSCHNz/X
	Qoc6tiOCVpIf/TAxD4ithqlPktQQk2Z5SD3LpidwnyEP8EEd3SWCD5kHq76uT/YfldFD
	XM3DAVTOJidrp5FX7ZS12Uj9yAmvuEGeCTMAMDKe+dgoZLe1HrqrVBaFVlhu07dKxVj2
	1SN39WkjF0AiujkWg5KKj+lcJy0TF3pz9VwvbsGrEvfLQ05yDAVOYrTgPB5x//YCa6Xy
	h7Eg==
X-Gm-Message-State: AOUpUlHurCRIsW4O7uo4Sz+vZ+U1CmX4pF2xdCVtXTAjYCiBmAH6EacX
	KmdmSciliNspANKBWv+FGF7is/MF
X-Google-Smtp-Source: AA+uWPzWrALWa37nxGL3BcHxeONxQkmLmknTWUxhRZRa1GCWDHEgnx6LGD7+zK7QKAheZk6fmhiBPw==
X-Received: by 2002:a1c:1bc2:: with SMTP id
	b185-v6mr18398573wmb.160.1534444077843; 
	Thu, 16 Aug 2018 11:27:57 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.27.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:27:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:34 +0200
Message-Id: <20180816182748.2400-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/16] gtksourceview3: upgrade 3.24.6 -> 3.24.8
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
X-List-Received-Date: Thu, 16 Aug 2018 18:27:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gtksourceview3_3.24.6.bb => gtksourceview3_3.24.8.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview3_3.24.6.bb => gtksourceview3_3.24.8.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.6.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.8.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.6.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.8.bb
index 87e48ed3c..7cb88665a 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.6.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.8.bb
@@ -15,7 +15,7 @@ inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-intr
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/${PNAME}-${PV}.tar.xz"
-SRC_URI[md5sum] = "c09ccfc80f78083841f8fe266c1ac52a"
-SRC_URI[sha256sum] = "7aa6bdfebcdc73a763dddeaa42f190c40835e6f8495bb9eb8f78587e2577c188"
+SRC_URI[md5sum] = "52f8c83ad21ad75e9ee6cca03ce2e63f"
+SRC_URI[sha256sum] = "1e9bb8ff190db705deb916dd23ff681f0e8803aec407bf0fd64c7e615ac436fe"
 
 FILES_${PN} += " ${datadir}/gtksourceview-3.0"
-- 
2.14.4


