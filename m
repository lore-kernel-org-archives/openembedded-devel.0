Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5F671A92
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Feb 2018 07:46:29 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id f4so760079plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Feb 2018 23:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CKm2VRI+x/2U4IDOeQSsfPMPKJ11xSsyr6Sol6Y+KV0=;
	b=okPi/43A7lqZ7pcxXpZuzvQQVbpA7usQE9u4uQOb1i5P5Ez4jkwasU7BpR4Sq6Op0A
	j3iWklaWYI9eN/5kzRCEOrA1alwfzclVwfJ1JT6tyi3xjJMp9RcCu8Liuxhh/VTuJj/N
	iUQ4gLXxvEIFBxs0T2Gnl9yMWBClvsHsxs9qy1doWfEsEOqz7sCNUpr5akHJOemyl4cc
	iFx46ZRKq6gGXDT77jH76suH+3DPDbmKNzDUnBpPMnhl7mb5PgsysO2tAcp8K7BwBeww
	LtDzE4FudxDUQShE7EluwdHT4buiT1FpWQTJmX9Nvg1BFXjRGTevFpidO1LuBl3etIN7
	uwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CKm2VRI+x/2U4IDOeQSsfPMPKJ11xSsyr6Sol6Y+KV0=;
	b=GgGa7y9T7Ar9YLVNbhx/or16VNBLRqcXTPgMvR9ZvEfu83uZZ4B4LevYO3HgRr2lAt
	Jcq/f7L0h9KzbUhdhdzunJ+GGASjF41e4pvbIsZ7VNnUjKeshK59s43P8TfljcMAyIFH
	hww6R97i3UrqQii5hR+R9RdshbPTZHHvUrBW7N2d3DDgnd7pgwo2EKVFNKwiiP1JT6SW
	YRTcIJFrP3f39fgjhzkoGqVAIqnwnj0Dmjabk9yAj7I7chQ1sTIaXPaGqmxxF3Gh0ATm
	PfWYAiXfPbIZD5F+AObGgXejAM6yaacgPU7iIUvFPEZGp3DLbyPKewIb4gH1DiWLHy+T
	CrUw==
X-Gm-Message-State: APf1xPBdQhVHHHOSqFgp9fz4nTE62rQjbDFfRaDnvdu88T/aia+qFkUb
	QR/dm+emgNqtOEzwVwk+0ntDzw==
X-Google-Smtp-Source: AH8x227fCVixTdBkexsl4BMhw8PLq/7vLWVof80yWT4Lph8hbQRi5qo9NWwI3Z7wukA8wNSdaqWrrg==
X-Received: by 2002:a17:902:968e:: with SMTP id
	n14-v6mr1561245plp.21.1517903190412; 
	Mon, 05 Feb 2018 23:46:30 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::5590])
	by smtp.gmail.com with ESMTPSA id
	s90sm20976060pfi.139.2018.02.05.23.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 23:46:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Feb 2018 23:46:15 -0800
Message-Id: <20180206074619.22165-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180206074619.22165-1-raj.khem@gmail.com>
References: <20180206074619.22165-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] alsa-oss: Upgrade to 1.0.28
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
X-List-Received-Date: Tue, 06 Feb 2018 07:46:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../alsa/{alsa-oss-1.0.17 => alsa-oss}/libio.patch       | 16 ++++++++--------
 .../alsa/{alsa-oss_1.0.17.bb => alsa-oss_1.0.28.bb}      |  6 ++----
 2 files changed, 10 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-multimedia/alsa/{alsa-oss-1.0.17 => alsa-oss}/libio.patch (66%)
 rename meta-oe/recipes-multimedia/alsa/{alsa-oss_1.0.17.bb => alsa-oss_1.0.28.bb} (75%)

diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss-1.0.17/libio.patch b/meta-oe/recipes-multimedia/alsa/alsa-oss/libio.patch
similarity index 66%
rename from meta-oe/recipes-multimedia/alsa/alsa-oss-1.0.17/libio.patch
rename to meta-oe/recipes-multimedia/alsa/alsa-oss/libio.patch
index a053e4c60..5299945e1 100644
--- a/meta-oe/recipes-multimedia/alsa/alsa-oss-1.0.17/libio.patch
+++ b/meta-oe/recipes-multimedia/alsa/alsa-oss/libio.patch
@@ -1,7 +1,7 @@
-Index: alsa-oss-1.0.15/alsa/stdioemu.c
+Index: alsa-oss-1.0.28/alsa/stdioemu.c
 ===================================================================
---- alsa-oss-1.0.15.orig/alsa/stdioemu.c	2007-10-15 10:50:40.000000000 +0200
-+++ alsa-oss-1.0.15/alsa/stdioemu.c	2008-07-21 22:17:06.303161438 +0200
+--- alsa-oss-1.0.28.orig/alsa/stdioemu.c
++++ alsa-oss-1.0.28/alsa/stdioemu.c
 @@ -37,7 +37,9 @@
  #endif
  
@@ -12,7 +12,7 @@ Index: alsa-oss-1.0.15/alsa/stdioemu.c
  
  struct fd_cookie {
  	int fd;
-@@ -99,7 +101,11 @@
+@@ -99,7 +101,11 @@ static FILE *fake_fopen(const char *path
  
  	if (open_mode && fdc->fd > 0) {
  		result = fopencookie (fdc,"w", fns);
@@ -24,11 +24,11 @@ Index: alsa-oss-1.0.15/alsa/stdioemu.c
  	}
  	return result;
  }
-Index: alsa-oss-1.0.15/configure.in
+Index: alsa-oss-1.0.28/configure.ac
 ===================================================================
---- alsa-oss-1.0.15.orig/configure.in	2007-10-15 10:50:40.000000000 +0200
-+++ alsa-oss-1.0.15/configure.in	2008-07-21 22:16:11.719837298 +0200
-@@ -33,6 +33,12 @@
+--- alsa-oss-1.0.28.orig/configure.ac
++++ alsa-oss-1.0.28/configure.ac
+@@ -35,6 +35,12 @@ if test "$with_aoss" = "yes"; then
    LIBS="$OLD_LIBS"
  fi
  
diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb
similarity index 75%
rename from meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb
rename to meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb
index 8966dbbc1..0c4a9f545 100644
--- a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb
+++ b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb
@@ -3,11 +3,12 @@ SECTION = "libs/multimedia"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "alsa-lib"
-PR = "r1"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/oss-lib/alsa-oss-${PV}.tar.bz2 \
     file://libio.patch \
 "
+SRC_URI[md5sum] = "91f57e8cee1ad4cc956caa8b62ac5d43"
+SRC_URI[sha256sum] = "3ae62caa88a0bc7b30ed836dcb794dc6ef4d3650439e2260db54cace7d5c6ad5"
 
 inherit autotools
 
@@ -17,6 +18,3 @@ do_configure_prepend () {
     touch NEWS README AUTHORS ChangeLog
     sed -i "s/libaoss.so/${LEAD_SONAME}/" ${S}/alsa/aoss.in
 }
-
-SRC_URI[md5sum] = "1b1850c2fc91476a73d50f537cbd402f"
-SRC_URI[sha256sum] = "8d009e23e2cbee1691ec3c95d1838056a804d98440eae7715d6c3aebc710f9ca"
-- 
2.16.1


