Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9D31E77715
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:34:03 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id hb5so4869783wjc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=W8/g8ksdM5pNWWBCB+FQXsRytpc2DJV13WMSFgltJcw=;
	b=fhv+Zpcs6Y3U25XcPh0TqQxMNC24itbqUKPQ7BtrW9kOIbXECJm76sjXjiGMD05jWG
	YoTYZMjDw4Il4tfOIWL54iZgUmELZhfdXKA6cQN/mPzHD5uIYR5Xp/qgZ5kTFFdvf6Rm
	i9DxhGmaVSsy7WZyRMsqKre1YQ2ItWbi4yI5lPoFPlZYvPJ3dB0HRRiJtWs/q2N8h/Qr
	bw7FIyNWZJG7fqza2WCF2KVVQCXNOI3A9qz8Kg22P/dGFPePXYIJMD9P/4Tw5v41NDc7
	oeenb6iVsSNoeMylnna6fOvgijAOtSEA8yLfkgQYrHKdxsxcNg7wv/B0ExCXc1Cd/dy0
	Zzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=W8/g8ksdM5pNWWBCB+FQXsRytpc2DJV13WMSFgltJcw=;
	b=VOvM+ntZevsFNtl/XPAd+ZIUDQxfErgFHO0Yz6A7ekvy5AmHR8/qM8TXmh3RRqL8tI
	es0HL5oaZyIJNenhhnLOzmAx1aArV6Lk74siXaD1B5Cnba20d/Y+e0xopK4FpQfCay+F
	WL/Fi+iHxsPzhoPEc2peYVaX2sdCxF3m0T6lgJwnmn6yeNT0E3gPL/mJHNYv2AcErAVU
	afZD55q6Ga8IrtVyDf2D9Tpl0X9duRJkxUCXg8qr0soQxnv66FZUKkWF4QQRRpRnFIZ7
	4mgE4CUjcYSV8dmt1+pla6HqyVEhepAoPPaQdMQUAFpQldiVZRwfOqLq1dR9QJbGU70W
	PDzQ==
X-Gm-Message-State: AIkVDXI/aio//QVu5xb+96MjuBlQY4fh5TfL9uZ1JMNHpD/A/BvOI5kv/dOO2OtVC4cF3Q==
X-Received: by 10.194.191.201 with SMTP id ha9mr10834810wjc.205.1482446044593; 
	Thu, 22 Dec 2016 14:34:04 -0800 (PST)
Received: from localhost.localdomain (p579F7B0D.dip0.t-ipconnect.de.
	[87.159.123.13]) by smtp.googlemail.com with ESMTPSA id
	m145sm34179574wma.3.2016.12.22.14.34.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Dec 2016 14:34:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 23:33:37 +0100
Message-Id: <1482446018-17187-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
References: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] mpd: update to 0.19.21
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
X-List-Received-Date: Thu, 22 Dec 2016 22:34:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/musicpd/{mpd_0.19.15.bb => mpd_0.19.21.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.15.bb => mpd_0.19.21.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
index f0b5c88..0071b89 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
@@ -9,8 +9,8 @@ SRC_URI = " \
     http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
     file://mpd.conf.in \
 "
-SRC_URI[md5sum] = "bb855b1689c9e863c2dd214ab1cb9344"
-SRC_URI[sha256sum] = "0cb9a223894b038ce966ce6d651d9b3ea3bdc7d7b9bec8d1e9e7e091cbc29b8b"
+SRC_URI[md5sum] = "fc19f76b512bd471b6af5214965ff7c5"
+SRC_URI[sha256sum] = "8305b8bc026f4b6bde28b8dd09bfdddbe5590acf36358eed4d083a396e301730"
 
 inherit autotools useradd systemd
 
-- 
2.5.5


