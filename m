Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCA86C16F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Dec 2018 02:29:42 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id u18so8167766plq.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2018 18:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=b1JIDjfbTh6o1gMGAyy0ircxhDFOSpUNdQCTlJ8aSXY=;
	b=G1fCMtXd0+5T8O9vO3JciBZnXclLrvQt8WFfkz5nAEj5mfu/xEoBxekzKeGcB2xWUF
	q19BRZ12BJ5SyfuYzjaKeku56uAtuaZvsW993NcY8ZhBq0xVrkzXueujwZaRrsPUSNae
	Cq/N5mU50eev7QXoT/90rao7b802UtTfedwHDaKTby+ZbsQ09U+1pyEzUSVQsBqEXuQC
	OtkL5WPIff52Izz0/3FRrw5weFTMN1IzqBVi3Ikc8yHHTjPVSXKVoreJWeDydAa71eB4
	uW3JJV16mKR1DfG2DFRGbOD97klZvUGettsBUS7/FKj27RiBfQgt6hWKE5x4Tf4JJOMc
	HhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b1JIDjfbTh6o1gMGAyy0ircxhDFOSpUNdQCTlJ8aSXY=;
	b=tyiJ8JS7TxGBNyipGMU6ZoxJKiC3i8JmeRFekU7+jUVWACule+XtSe2qvd6Aj621+K
	oa4/o8159E/O/eHxzlAK8MeYsViyyenFcEJWvGPD58uePxTVtdmtbcbSIEKzXVs5BOlQ
	I+5QK0wkUhfLvzBf0hryKGlDnZCVA+KdRUifruvn2yF8X1yU9nko2+pueWoW1umkiXY/
	lb0UJbLgFCO7h/KWy6cxH4dAo4IJxR21JSN7ux/Ggtf+pXZFWk7GPZ51ON7Fb/yWBqyr
	tTwWSmaSEA+aOXxGy8cRQ6WAGdHg9K8VyKa6QXdvKh2YDlnv0h1ahdln1QFMakVokzIN
	3scA==
X-Gm-Message-State: AJcUukctSog7r9i6C7R6Ng2367m4Jp8209qGQRX600DQMT2Tt/qg7f3Y
	NiBl6lxzHRaqbOmb0nNQKWul96ebPGo=
X-Google-Smtp-Source: ALg8bN7495DHIA03FnZdmwS1/Z7jC9Fo/+Ye0P1nxrtGvpGF2SV+Tts6IJBM0bJpLS49O/gLN6FmIg==
X-Received: by 2002:a17:902:7791:: with SMTP id
	o17mr21697157pll.60.1545877783420; 
	Wed, 26 Dec 2018 18:29:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	([2601:646:877f:9499:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	p2sm50666072pfp.125.2018.12.26.18.29.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 18:29:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Dec 2018 18:29:25 -0800
Message-Id: <20181227022925.5920-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181227022925.5920-1-raj.khem@gmail.com>
References: <20181227022925.5920-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] libedit: Upgrade to 20181209
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
X-List-Received-Date: Thu, 27 Dec 2018 02:29:42 -0000
Content-Transfer-Encoding: 8bit

Add native and nativesdk incarnations as well since clang needs it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{libedit_20180525-3.1.bb => libedit_20181209-3.1.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libedit/{libedit_20180525-3.1.bb => libedit_20181209-3.1.bb} (76%)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb b/meta-oe/recipes-devtools/libedit/libedit_20181209-3.1.bb
similarity index 76%
rename from meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
rename to meta-oe/recipes-devtools/libedit/libedit_20181209-3.1.bb
index 8cc0e959e0..c0a3d21360 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20181209-3.1.bb
@@ -15,7 +15,9 @@ FETCHCMD_wget += "-U bitbake"
 SRC_URI = "http://www.thrysoee.dk/editline/${BPN}-${PV}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[md5sum] = "97679319742f45d6cdcd6075511b14ac"
-SRC_URI[sha256sum] = "c41bea8fd140fb57ba67a98ec1d8ae0b8ffa82f4aba9c35a87e5a9499e653116"
+SRC_URI[md5sum] = "22e945a0476e388e6f78bfc8d6e1192c"
+SRC_URI[sha256sum] = "2811d70c0b000f2ca91b7cb1a37203134441743c4fcc9c37b0b687f328611064"
 
 S = "${WORKDIR}/${BPN}-${PV}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


