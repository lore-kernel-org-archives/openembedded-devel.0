Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8AB75089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 22:46:37 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id y189-v6so893448itb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 15:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=WQuZMExcOrAp0qaSh5OLIhvts+E7Al6HW0HFExfBdVI=;
	b=ChmlPMt+wkFIZ02Msx3RuiCZjK2/cmep+CeCSBb6n25hBAD8fYtlLdz6wEFCyjy+WU
	oeH6u1JjvhXXy6uTO/MfXNSua6hIuVG6GHqunNRYPIqIzUoTZxNK+Codsm9jyzfoJi57
	DI3xldDDFNIGmr1SudJjaZO/a2sEFRcORvAMfjgaf8rPipiHOZ4SNnt6t99M9rTXurVa
	2v3xykD2QSykAk0S6rPoS0da1Qeb3FUorsfpw9nq9GaDW7PIYNtrH/qROnqWYvN5R1So
	w9VGCuHGGnv0LKpHNJzb+1l8lXrR+TyoL0cZd9Pznc1R1nLOdjQOytDh91I+XV9i8mk2
	VJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WQuZMExcOrAp0qaSh5OLIhvts+E7Al6HW0HFExfBdVI=;
	b=SVFEJVJ7Uc+OsbV/BKQB2uzwPJM4pnuc98SEfMTApJt8ufq1EwIGXVe9CuIrGD066B
	G5nXBe0jujp1eCmLPLLIBcsSNa3bDJMEf3Zg6ocNgqey9I/mkmop2KQx/IchEvo6nK9W
	5rQL4JQyPEWD4ZISXhI+RT6AZD/Aw0lcuZyl3PG5gZ4FuBsflR618Bxk0AsW4KqLWcQY
	O+elUi660dRKX+VurCGqXR71bbGM6306Reuagc6w34xBhZDvZbuZPBrj10Fzm3zdYGdJ
	kXGQGZPqenV2W3lEkSm0gF+NLjKuT7++w1N2jUUUNAkUwrhkTw8S8Vu5qGNIy/3NHbtv
	HL3Q==
X-Gm-Message-State: ALKqPwe1x/GAbeh3DsHKqCaLjXrJalJYCu/Q+VjTsA+8X0mfSVGysFbd
	m+qpiWNQXDzsSu+yXR1vu0ngyhaW
X-Google-Smtp-Source: AB8JxZoduB/CWHfV7OULCTCyTAYAEqhjRp76ZU7lU2e9hHWTYfR2bJFbDMi37KS3pu79ivdpdAnnLQ==
X-Received: by 2002:a24:6243:: with SMTP id
	d64-v6mr11796439itc.78.1525905998446; 
	Wed, 09 May 2018 15:46:38 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	z2-v6sm7351401ita.37.2018.05.09.15.46.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 15:46:37 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 18:46:33 -0400
Message-Id: <20180509224633.17514-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-multimedia][PATCH] openh264: switch away from github archive
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
X-List-Received-Date: Wed, 09 May 2018 22:46:38 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-multimedia/openh264/openh264_1.7.0.bb          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
index a7aaab3623..de8352336e 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
@@ -11,9 +11,10 @@ LICENSE = "BSD-2-Clause"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"
 
-SRC_URI = "https://github.com/cisco/openh264/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "93da4e76cfda7ede8fd2df51b0021efd"
-SRC_URI[sha256sum] = "9c07c38d7de00046c9c52b12c76a2af7648b70d05bd5460c8b67f6895738653f"
+S = "${WORKDIR}/git"
+SRCREV = "a180c9d4d6f1a4830ca9eed9d159d54996bd63cb"
+OPENHBRANCH = "openh264v1.7"
+SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${OPENHBRANCH};"
 
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
-- 
2.17.0.rc2.3.gc2a499e6c


