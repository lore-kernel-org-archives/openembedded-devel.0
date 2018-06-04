Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1966F750ED
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:49:07 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id f1-v6so18303968plt.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CkjNCFYzmRvXaJdAUqA8ZGwM2YFdEFQ/GxCuaqixxOw=;
	b=NeKOrDZAggXIXalJ8SpkG8PqgIuyuT2HclTZ3llxe8i0Tq/CW4danVVEo40Wi8xMeb
	YOVIuRJLNO/8OHNqvMQg9vrHI73qdmpcjTxeA1JA6J0aOssnp+XM9B9FK3pXell8kJEg
	KYZWTqtNeaUVVz+ewMm7WH54MHRcF+LFbf7YPoTO7/+hj19sz3L+P2A1V8qFjgIv93YO
	Z3yvPt7ro0n6tW5CYYaUAtQgOoAEcp3IyDX3K3CpCsovyW1P7ZOcjrlqhDaCWaVSgvJE
	rfh7qsADOd1ClGsT0/5GvTgG/nlzuiMfVm15QlaIKUHVThf7w1PLcZ9Zkn1Uxbr3yg0H
	4luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CkjNCFYzmRvXaJdAUqA8ZGwM2YFdEFQ/GxCuaqixxOw=;
	b=uVMaQFMvO40e2dnH8iqPzcYb8qyjy9hdpZLOd0xRSKU2qZRk2cjlhjrOa3W81MZfeP
	FihQWwidUU+yaO5D1JR7FgLGiMpR4RZ119k147tPxPUtYkA+8o0Md0RdQqCX2kMypFDf
	iHNSIyGZmZAeUEVvYchar06EMvI2epPcYE+qf1zoCPsc5ugu8Xp02Z3io6swkitGxCnr
	/vTwXNSeEjkhuta1RLZxWVeLlgCJwTVGY/aBdeZBQMYK5Fkuhp8StSH8CaIZvKnXm9LK
	993S+G73VPAH0vGpVcetLP/nSvJHPBvo1zgyPup42LCQLbT3xR1FxqHcEWbdcbabOt+o
	50yw==
X-Gm-Message-State: ALKqPweya4EWS972MtHETzIpj6LWumEv5Jwizp6Z63Mt7v+djuMQidXj
	4ioAbO4IirAyUXikNb6o5QQ=
X-Google-Smtp-Source: ADUXVKLWKcqEX25hc9fOQxDAs9dRBlRQwiGSBJXeT3Z4uDTjqGRKvR0yYESfEMX4ykdtOlQ28c9XdQ==
X-Received: by 2002:a17:902:7d89:: with SMTP id
	a9-v6mr19768494plm.238.1528080548358; 
	Sun, 03 Jun 2018 19:49:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.49.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:49:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:47 -0700
Message-Id: <b6a6853f677c466b9560c8c823671d3731e665dc.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 13/15] wireshark: Update to 2.2.11
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
X-List-Received-Date: Mon, 04 Jun 2018 02:49:07 -0000

From: Armin Kuster <akuster@mvista.com>

changed --with-ssh to --with-libssh=DIR

includes:

wnpa-sec-2017-47 : CVE-2017-17084
    The IWARP_MPA dissector could crash. (Bug 14236)

wnpa-sec-2017-48 : CVE-2017-17083
    The NetBIOS dissector could crash. (Bug 14249)

wnpa-sec-2017-49 : CVE-2017-17085
    The CIP Safety dissector could crash. (Bug 14250)

release notes:
https://www.wireshark.org/docs/relnotes/wireshark-2.2.11.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.10.bb => wireshark_2.2.11.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.10.bb => wireshark_2.2.11.bb} (92%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
similarity index 92%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
index 5358ba0..5eb372e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "ae3a1a43a6e3687f44a738fd15d78021"
-SRC_URI[sha256sum] = "8574a5e1fdec7affae640924bd46c1aed1bd866e02632fa5625e1450e4a50707"
+SRC_URI[md5sum] = "a79ba6cda83be2a91bde4110fe194788"
+SRC_URI[sha256sum] = "a9f11621e85d7e1d72259157edd94825e72af3fd72e184b8474459f92ad5fc40"
 
 inherit autotools pkgconfig perlnative
 
@@ -39,7 +39,7 @@ PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
 PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
 PACKAGECONFIG[sbc] = "--with-sbc=yes, --with-sbc=no, sbc"
 
-PACKAGECONFIG[libssh] = "--with-ssh=yes, --with-ssh=no, libssh2"
+PACKAGECONFIG[libssh] = "--with-libssh=${STAGING_LIBDIR}, --with-libssh=no, libssh2"
 
 
 # these next two options require addional layers
-- 
2.7.4


