Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id EC12871FC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 17:54:02 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id k14so12129941wgh.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lU/s68ERX/bYC8oKXF0kzPD0dsinoqR90Y1wsZVuUnY=;
	b=AZck6W+8RUwxcVqtxN/CFbR9r//J2wwhdYRa3hWpyFzLhuAdFmBpriVsO4nA84/sML
	HxldnTaey7bQ9RwyLXL/vYv06RE2YvxQBKLTc+hj3ZrjBds55AgXkM+3WU+fjzPG+e/K
	b8P2ZCtiRquWiYnAQWBTmjgKrW3D0WtsR2mEJEVbGuq+UVGYzmAbV9aLrZ6xIapQU1b9
	HfRhX8NHim0OiXbUoEWk3+qqCAX13lk8LkVjtpeR/uDF1DCmVtRnN9lwXj4fEmz6EoaC
	t9CQm77qyllPLV2V4Ja9U1mScD7ZWDl+WLfZEveoT3atNoNuoXpF7zSnIHsSayCVatju
	ouxg==
X-Gm-Message-State: ALoCoQl7xO1zj/g+RrMD/N53rqBhi9c25zqWxpNHxcCF0wG+lel8NG8HKfcp6tiYmJF8Dq2Kh9V8
X-Received: by 10.180.11.65 with SMTP id o1mr19606391wib.22.1415728442815;
	Tue, 11 Nov 2014 09:54:02 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dx8sm14461196wib.2.2014.11.11.09.54.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 09:54:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Nov 2014 17:53:50 +0000
Message-Id: <1415728430-30366-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1415728430-30366-1-git-send-email-ross.burton@intel.com>
References: <1415728430-30366-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/5] libmediaart: add new recipe
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
X-List-Received-Date: Tue, 11 Nov 2014 17:54:03 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-support/libmediaart/libmediaart_0.7.0.bb   |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb

diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb
new file mode 100644
index 0000000..ed7f079
--- /dev/null
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Library tasked with managing, extracting and handling media art caches"
+
+LICENSE = "LGPLv2+ & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
+                    file://libmediaart/extract.c;endline=18;md5=dff2b6328ab067b5baadc135f9876c36 \
+                    file://tests/mediaarttest.c;endline=18;md5=067106eaa1f7a9d918759a096667f18e"
+
+DEPENDS = "glib-2.0 gdk-pixbuf"
+
+GNOME_COMPRESS_TYPE = "xz"
+SRC_URI[archive.md5sum] = "1a44933d4cd0064e3c76d8d0ddacddc9"
+SRC_URI[archive.sha256sum] = "3a9dffcad862aed7c0921579b93080d694b8a66f3676bfee8037867f653a1cd3"
+
+inherit gnomebase gtk-doc
+
+EXTRA_OECONF = "--disable-introspection --disable-qt --enable-gdkpixbuf"
-- 
1.7.10.4


