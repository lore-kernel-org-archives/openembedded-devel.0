Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id AED187F7C4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Nov 2019 19:54:56 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id s5so7401014pfh.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Nov 2019 11:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pmD57IzzerRpli4ZydCauu82ADMWJoSNwijWWYSwSaI=;
	b=cfJ9H8I6arOYiYqMb3IAVFBbefYjwUS8oPn8mXT/mx+OsUpobLDo0tJuJw9KUUjOn4
	1HSc9trR3tSBDgo9AkThaTF5+e2X5z+tiK31JyiybxtIHfQrnGnOamikHlUMkzD7fWCQ
	QcSAv8OEd7/ZTCUycJDaLHlD6RRAxxlGJQZPxhXcqTfPHrX5PVYUcqiE6j+V8f8OI/dZ
	mtrs5R8sKyKRf7nZ6lKWg2A+0bu9/fVjixf2JAand2GItptIFv8SnZy/dD3fqVJv9lmn
	ut1yBxt0p/+sg3ajJhZwCrGkBJ7DCA6BXOaoGoFvm3465XkGtK6FJ/n/vp02L/dzQEKx
	8U2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pmD57IzzerRpli4ZydCauu82ADMWJoSNwijWWYSwSaI=;
	b=JpV/Bdrkpmj1K3lGxyscnJer7RlBoWSEHlcOnzkrpxK78laL5I/GEisOdQGS56+pr3
	qu30HZmPF+o1UAsZqmChyAqDR+/7n5ciDf4FAAfxtBpfEZoITpCVIxsw2x59e300ix5d
	aTt0Kbp+b8ZyvTQpy5pSH9tgXDoEj6/5I2kPPWNoTHdiCu2TbXbGbpv6ssdtWB69GcGp
	AO1tuCNlBdzznPlFanwlP8W+Fm6XeoN7qHeyan++d+TOknIt0NTBay/PQ3OSgUs+FiHC
	1FoGC4F4rl4Dab4KePWDbdFqHCYPc7sSd9kXmrtpf3eLud1R1IW/lOAUXroQtD2xVnVN
	iLxg==
X-Gm-Message-State: APjAAAUjxbLD5piII1vBR4yVlhfeD6DJp2SVKlHPvcMQctoNpLpHaqIq
	lXCuqCV2DNrGCCqdNIRuxciCgoTXJAg=
X-Google-Smtp-Source: APXvYqzR5Y1F+fYLcDkA/BUeqd4AKGniTAqzZY4VHX5Vbl5/yiZo2Dlidz7bukTpK87pNIDw7KG0qA==
X-Received: by 2002:aa7:9787:: with SMTP id o7mr20740233pfp.120.1573329297161; 
	Sat, 09 Nov 2019 11:54:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::5caf])
	by smtp.gmail.com with ESMTPSA id
	z23sm9265162pgj.43.2019.11.09.11.54.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 09 Nov 2019 11:54:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Nov 2019 11:54:36 -0800
Message-Id: <20191109195436.78248-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] sip: Upgrade to 4.19.19
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
X-List-Received-Date: Sat, 09 Nov 2019 19:54:56 -0000
Content-Transfer-Encoding: 8bit

Needed for QT 5.13 based python modules

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/sip/sip.inc                        | 6 +++---
 .../sip/{sip3_4.19.16.bb => sip3_4.19.19.bb}                | 0
 .../recipes-devtools/sip/{sip_4.19.16.bb => sip_4.19.19.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip3_4.19.16.bb => sip3_4.19.19.bb} (100%)
 rename meta-oe/recipes-devtools/sip/{sip_4.19.16.bb => sip_4.19.19.bb} (100%)

diff --git a/meta-oe/recipes-devtools/sip/sip.inc b/meta-oe/recipes-devtools/sip/sip.inc
index 092531b322..d8e32a7687 100644
--- a/meta-oe/recipes-devtools/sip/sip.inc
+++ b/meta-oe/recipes-devtools/sip/sip.inc
@@ -5,9 +5,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 
 SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
-          "
-SRC_URI[md5sum] = "7e854b0da395ddc8fb5da82d0321994d"                           
-SRC_URI[sha256sum] = "184c790d58e9527fc6bdac2bbf8638f3d1b41dea922cad8eb83172b4ba70c620"
+"
+SRC_URI[md5sum] = "98111479309dc472410f26080d6d4a88"
+SRC_URI[sha256sum] = "5436b61a78f48c7e8078e93a6b59453ad33780f80c644e5f3af39f94be1ede44"
 
 S = "${WORKDIR}/sip-${PV}"
 
diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.16.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
similarity index 100%
rename from meta-oe/recipes-devtools/sip/sip3_4.19.16.bb
rename to meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.16.bb b/meta-oe/recipes-devtools/sip/sip_4.19.19.bb
similarity index 100%
rename from meta-oe/recipes-devtools/sip/sip_4.19.16.bb
rename to meta-oe/recipes-devtools/sip/sip_4.19.19.bb
-- 
2.24.0


