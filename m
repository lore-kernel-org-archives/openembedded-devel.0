Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 616C06FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:53:43 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r126so9993044wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 23:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SE9c71iu0mvpi8oJ0kxPtR/ZtQkmDzNQVccRRjAj49A=;
	b=ffyGfOPleSjjfAymiNpsxHt8heQxRn+RbUZQBmeToKKEfYaWjYcryNFT85QUnDJ1Lp
	aI7O2OP6D5iwjP3HLOdkze5gDXGPXZberFTlyBYudyk1fuqdlc/v/7Rmjza2lNDUXowi
	EgtExpI1kv/n9Q3Yk0ioXsMX1fp0S7bJbHo4epX5hCssNAqIzbsaa6K1hFj+q8fs5Nzl
	iqzfNaRdLbyJGWCa1X1shvDgSAAPtR5vpqDo6GG0xd2S3LB3s9VZc58ajU2lN/QRsLKi
	04GvQna+WC9up0opFrnUF/5EucJbIsKwHgZonsCW8L9TmutS7AxIpojUUX7zRstYKOdG
	kuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SE9c71iu0mvpi8oJ0kxPtR/ZtQkmDzNQVccRRjAj49A=;
	b=tAdF/fdajWFKcOXFqgnVEc71Y1WbGVC/7QyTATckb4iDB1v1JVPjeUA76maqO5be5p
	ev/H55Q6JdHY1T4OFTaGHSjOpEjc0yPVYhODqkl+8uNruEcmPBjrorNTggnUZ/QB1+dh
	eH0H3O24Dw5Xl0mDNpSroPKXLNWZJ8q5XeyOi8H9qY25MEmKPToJe/S5JkuYH4H/f5NT
	o+W6JBsBFyi3Ok7gUjQ5WLVWVl/1DGLRrCKa0EaeP/oAcsr44MW9K6JMqM8TreEnUbnL
	hVl5DxqIcfuN+IezbUEaa2LDWttGPfqpCv+TviulSotuYTiKh47K8E6LotniIuMD1kM6
	zTVQ==
X-Gm-Message-State: AIkVDXJjjupwpn48fRE9Hot6/Af0qfonhDRUJuEq+9HDSLVrYRCxvTLVGVveOqVhXZ181w==
X-Received: by 10.28.147.72 with SMTP id v69mr6078329wmd.51.1484812423787;
	Wed, 18 Jan 2017 23:53:43 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	l67sm11050656wmf.1.2017.01.18.23.53.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 23:53:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2017 08:53:27 +0100
Message-Id: <1484812412-26806-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] libopus: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Thu, 19 Jan 2017 07:53:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/libopus/{libopus_1.1.2.bb => libopus_1.1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libopus/{libopus_1.1.2.bb => libopus_1.1.3.bb} (94%)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
similarity index 94%
rename from meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb
rename to meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
index e5882e8..b5eef82 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
@@ -9,8 +9,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e304cdf74c2a1b0a33a5084c128a23a3"
 
 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
-SRC_URI[md5sum] = "1f08a661bc72930187893a07f3741a91"
-SRC_URI[sha256sum] = "0e290078e31211baa7b5886bcc8ab6bc048b9fc83882532da4a1a45e58e907fd"
+SRC_URI[md5sum] = "32bbb6b557fe1b6066adc0ae1f08b629"
+SRC_URI[sha256sum] = "58b6fe802e7e30182e95d0cde890c0ace40b6f125cffc50635f0ad2eef69b633"
 
 S = "${WORKDIR}/opus-${PV}"
 
-- 
2.7.4


