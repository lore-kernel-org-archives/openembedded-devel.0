Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 80F9B6D39C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 02:08:05 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id u6-v6so16822146ljd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 18:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=BEN/n8faYPgNxbcwD12SDGo1U8+c8ZbejQlFR5orSHM=;
	b=EE06W+LEI0tGQfC6b+L+JCrzQykdh/yepv4k5XkHh9GjceFPlh4ovt4c3kBrL5Q10g
	kxCaoOqezSUrv0ReR+jbRfpoGe6477zbKMl26SQjapvLKpVERUjeQN5G1GuyIMLrWYYu
	1m3AOhIhUNIIM3yh2j9rwYucIYM8JvJne54CUsC11SD9Yyo/POVBGQ50MXut7u+bKZBX
	4QOhkDshlXhQMpmI5z/pLTAFgky7Tp+u2LsmYDgFv6PJ0OglNSMfw4weyvTXfp2JvUms
	Br4tQfjnRbD9J9bwyT2TG8x3MYUPyb61kHBsVar3qw8lMMBur2DVBwaqFfIat1YfkS/d
	Rd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BEN/n8faYPgNxbcwD12SDGo1U8+c8ZbejQlFR5orSHM=;
	b=fNsXMyrh6l/pboweNeFrpVD9PZHRf8rHpNZzVFGbWsM/JdruB5MToskFw2o87NQv7B
	b93o4ezb7i7AaSX0YbRGtPRVXifQBQmN0yTU4cbL66wJbQiTnQtQnrkjE3b2h0j/JGG+
	jdwWemdfbWdp069D26PbQ3EQ3WQ58+B3Mn6dnGegf/mHmqqhddCp52IpV/BlJPYoWkA5
	LIZyeAHTBgTtOT8ilXw45qMObAXxVIwFGXZKfOl6eedLFya2KsMEgsm3SKGflFr+MUO0
	JrB8e0mOdnTVLqV70Haf7eoxJd3UE1x1/wfatN9g4fCxXFpQEIOGLCk/5+IfH/VNU7OT
	ptkw==
X-Gm-Message-State: AA+aEWZVvzTDn6QpDspNYtOqx9wPrAAM913xzrczwFDYZMMmjyPSyp5k
	7zhVQbIvDBLPW4/XBTnH8NHRCyoiQI0=
X-Google-Smtp-Source: AFSGD/Ve/0P8i1Fpg9adftp2TzACu6tw5Ocu9cFVw0ewW0zIablfow+ja2yMycoPippwLjByCOXDeg==
X-Received: by 2002:a2e:1551:: with SMTP id
	17-v6mr14249464ljv.68.1543975685351; 
	Tue, 04 Dec 2018 18:08:05 -0800 (PST)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id d2sm3323449lfg.16.2018.12.04.18.08.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 18:08:04 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2018 03:08:02 +0100
Message-Id: <20181205020802.31335-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [PATCH v2] jansson: update to 2.12
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
X-List-Received-Date: Wed, 05 Dec 2018 02:08:05 -0000

License MD5 hash has been changed due to modified copyright year in the
LICENSE file.

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta-oe/recipes-extended/jansson/jansson_2.11.bb | 12 ------------
 meta-oe/recipes-extended/jansson/jansson_2.12.bb | 13 +++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/jansson/jansson_2.11.bb
 create mode 100644 meta-oe/recipes-extended/jansson/jansson_2.12.bb

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.11.bb b/meta-oe/recipes-extended/jansson/jansson_2.11.bb
deleted file mode 100644
index 370fa2248..000000000
--- a/meta-oe/recipes-extended/jansson/jansson_2.11.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
-HOMEPAGE = "http://www.digip.org/jansson/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8b70213ec164c7bd876ec2120ba52f61"
-
-SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "7af071db9970441e1eaaf25662310e33"
-SRC_URI[sha256sum] = "6e85f42dabe49a7831dbdd6d30dca8a966956b51a9a50ed534b82afc3fa5b2f4"
-
-inherit autotools pkgconfig
-
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.12.bb b/meta-oe/recipes-extended/jansson/jansson_2.12.bb
new file mode 100644
index 000000000..3cc353ee7
--- /dev/null
+++ b/meta-oe/recipes-extended/jansson/jansson_2.12.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
+HOMEPAGE = "http://www.digip.org/jansson/"
+BUGTRACKER = "https://github.com/akheron/jansson/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fc2548c0eb83800f29330040e18b5a05"
+
+SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "0ed1f3a924604aae68067c214b0010ef"
+SRC_URI[sha256sum] = "5f8dec765048efac5d919aded51b26a32a05397ea207aa769ff6b53c7027d2c9"
+
+inherit autotools pkgconfig
+
-- 
2.17.1


