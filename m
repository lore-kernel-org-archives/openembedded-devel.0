Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8BDA37DE36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:29 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id p15so25694691eds.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5AQKW/7MBgd2Qd+ALYBuswMZKAvYQ++NM2TkPMZRGdY=;
	b=XbHjIJMCfzp7Jz/nfKNPkPPuGAR2Xzs7Mi7ENO5GSu37PBqRskn2qiMqPT7Jy90j4/
	r1GOEyKeBWGLmT1dqcvcjVyanA+S0hVWP7bvFpscLbRjlYQqqANhr+QWSpaM+BcOjZX9
	snE9cZUktrPqRMuD/+9Y/oisdYwlHNpHgu+mASuU02i6enjr/lV0X+cRblv43DHuJvXP
	s1MwNpNH5ndjxfPrcYuO3q6LWnPW8ECbXoWJDOn+Ij+zVq9M8hAuRbwE/Dd2MzIWH40d
	gZebrHnptrRe/rGAoUNsEtuVfcttjOsAcWJzEjBopjNGw2kdMPTXqy59bQ3RXWrEURvF
	3X5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5AQKW/7MBgd2Qd+ALYBuswMZKAvYQ++NM2TkPMZRGdY=;
	b=iC9eGuYNYFJ+O4f6AvC12H6or9a0XLiYjFR0yqDbnDGTZxNkbTI88KcS+S0eqzcMyf
	5TMsoMzRCyLbZbG2W09ZzQb+fTWhMXwrYNtMtgHA6QwAHTFMZSoVMfwXeBJocGuqymHs
	V6gi1jEqlg+olZkCIj51VlWJGdr1AMOEspzuW3RAQXhYCZb/nfzYojzd9R0fO/JDHDMk
	RWc0jbrGrKJD/ybLzR94t/QF2k2hQtNrgknAba5Jj8Vs3cIoIMpcuWgeMXcc8uhBRUN/
	LcACkfWXFhNTIZtsTol8QQmH/xErmBCZMvKuRZZPYF+8DpEzHtIXCWt+LsWWV2nN+wpD
	01JQ==
X-Gm-Message-State: APjAAAXoI48MexxMOUEDiyuL6KXRtMmFOsMlcxqrnFiOnC97F2Y+8i1e
	banFwQoai4uMIFXqtl+7dCR/zygkSIM=
X-Google-Smtp-Source: APXvYqwTAaadZxdhspI0i56qbCfV6BkyxasXMbZWd4kXSMSHI0BBpa6l2ai19Oy+BrYV6s16tSUJzQ==
X-Received: by 2002:a50:974b:: with SMTP id d11mr133637010edb.24.1561449150105;
	Tue, 25 Jun 2019 00:52:30 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:28 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:02 +0200
Message-Id: <20190625075223.13585-3-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 02/23] openjd7: remove support for kerberos
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:29 -0000
Content-Transfer-Encoding: 8bit

It triggers a lot of dependencies, and it is no clear that
is needed.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 794bf58..26e71ce 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -67,7 +67,7 @@ DEPENDS = " \
     jpeg libpng giflib \
     gtk+ glib-2.0 \
     cups fontconfig \
-    rhino krb5 \
+    rhino \
     libxt libxinerama libxrender libxtst libxi \
     freetype alsa-lib libffi \
     attr \
@@ -134,6 +134,7 @@ EXTRA_OECONF = " \
 EXTRA_OECONF += " \
     --disable-system-pcsc \
     --disable-system-sctp \
+    --disable-system-kerberos \
 "
 
 do_configure_prepend() {
-- 
2.20.1


