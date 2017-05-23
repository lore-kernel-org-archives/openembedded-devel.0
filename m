Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4482D6069C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 21:29:34 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id y128so24449072qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 14:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U9xsGwIQLY04uHJZq24PyE+q2ggUNmh4pYGcycys3Sc=;
	b=Wpd85BE3k9XsG/gfAAo7z7mfiUcsh27uqsAPrvJ74/styQgPPIsObHT5cX852KcCcS
	jRKRgkslTrk6Gyofn1iSD0m49ZSbR7hZIiXF/+RaQ04qEZN2TvxPEehaVXCTFtqavS3l
	XHLZN9gx4cqNXBf1Buc1BoR+AzJd4wQL1qDcETkuEsiI8Zgo2mfgklOwUwD6gPkL9x4W
	xhBL2HUrIfptjhTmp5zLltusdvmhcZiFZl33u0gEeJDn5p649UWVhVx6UdR43FMIEV3N
	IjffNksaox8Ci4Jbwx3eswbJy8BJjykDXba5UnxAFYPjU6C2KyOY9IQXLdcS+NBy9IVF
	7wpw==
X-Gm-Message-State: AODbwcBX1kW5dBjIgTHVTll4vm+emjETU9KvRSMdX5i6lpqcATNUJ9/F
	BukcDbUlQ/mSho+CVj0=
X-Received: by 10.55.212.134 with SMTP id s6mr21925108qks.128.1495574975894;
	Tue, 23 May 2017 14:29:35 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	u19sm1244938qtc.64.2017.05.23.14.29.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 May 2017 14:29:34 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 May 2017 17:29:16 -0400
Message-Id: <1495574956-16354-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libextutils-helpers-perl: update to version 0.026
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
X-List-Received-Date: Tue, 23 May 2017 21:29:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...tils-helpers-perl_0.022.bb => libextutils-helpers-perl_0.026.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-helpers-perl_0.022.bb => libextutils-helpers-perl_0.026.bb} (80%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb
similarity index 80%
rename from meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb
index 9a0234e..c027250 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb
@@ -5,11 +5,11 @@ SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Helpers/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=307057ce232899f5caa8858560c7274b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=223c04045664f72c3a6556462612bddd"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Helpers-${PV}.tar.gz"
-SRC_URI[md5sum] = "cf4fd6f8caa6daac33b1111c9e93162b"
-SRC_URI[sha256sum] = "d3f8cf700fb3414ca1260089755cbf64041455e4b744110677b1ba5bb9a3aa95"
+SRC_URI[md5sum] = "83b00c1e401321c425ae5db6b2b2fd12"
+SRC_URI[sha256sum] = "de901b6790a4557cf4ec908149e035783b125bf115eb9640feb1bc1c24c33416"
 
 S = "${WORKDIR}/ExtUtils-Helpers-${PV}"
 
-- 
2.7.4


