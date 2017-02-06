Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8667871999
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:00:50 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id b65so135776499wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2017 12:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VUDUOZOnQ0kHY1xCOl989VBJUGTsCvEJq2vsoy+XnMo=;
	b=L0qvQzLLPJCE9QQu8oyw/261/VdPylSgrcGmwpZmF8P+emwiPjPKGF4d755CW1dkE9
	I60bAXVG1eRPCQYQKa2i/MH+r1nrIXrw/pkWUTdCs5VZ6i5VPR5r9r8bGnzAeKX4n0nG
	kucJZEI8AOa6T54eeiMX+ZZ90rrpohZpLZ8VwQ09r0W3F/Hnd537mxeLZyivnXLu3hHV
	fdiuRKgbwRnDTKGv/X5BJPlyNz9enXN7rRpZJA3Nt8f8lhaS1653u4GaliW4ExC7hat4
	GPo4Dn0zxclt076V/4XPKofors++DENgvnmQYWeSipheB9c89VHCFD1rqvTuHmjylveV
	VHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VUDUOZOnQ0kHY1xCOl989VBJUGTsCvEJq2vsoy+XnMo=;
	b=JJXmv12PtLMNq4WbSZ157P3q3l8t1Z58EZjb5HKRA02DftMVWftsbx7GDcuLwKohdE
	bx0wpM3tW5g+yTjbRQdXKyByJSy/EcsIQBKOVIld1Gof2yuPmhZJPSzIr4QSvi47RiJ8
	ahWno3sEZdvlM7GJmXpxCBwl8R7k7ygePeUoCGpvZKm0FWvKZMQjP+voF7JS5yWuu4oQ
	x8CVMwDY99UpU1OnYI4RDD5oel6l30BbLssjQd7RgD85wnC4EJZGVyK2rKaRgf8I1t2v
	BwJHqXMl6fEZNJeAVTbkGEq/2JuEIjwe+8SGSpaUyjBUOkauoRxUb5GHvCdKGmogtvnd
	xSBw==
X-Gm-Message-State: AIkVDXIeoNe3kNBd5EfyksJg7UQzQtMtSpkeMjiWLoOh2DLzuyUAO1BRix3B5sx71IH/Lw==
X-Received: by 10.223.175.49 with SMTP id z46mr13269722wrc.84.1486411250901;
	Mon, 06 Feb 2017 12:00:50 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E97DF1461E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e97d:f146:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	b8sm3328308wrb.17.2017.02.06.12.00.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 12:00:50 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Feb 2017 21:00:39 +0100
Message-Id: <20170206200039.32123-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170206200039.32123-1-schnitzeltony@googlemail.com>
References: <20170206200039.32123-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libtevent: fix SRC_URI - http has gone
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
X-List-Received-Date: Mon, 06 Feb 2017 20:00:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
index 7939e03..f9657d2 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv3+"
 DEPENDS += "libtalloc"
 RDEPENDS_python-tevent = "python"
 
-SRC_URI = "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
+SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
            file://tevent-Add-configure-options-for-packages.patch \
 "
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=4e458d658cb25e21efc16f720e78b85a"
-- 
2.9.3


