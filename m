Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id D050D76EBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 02:48:55 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id p65so9486455ywb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 19:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E9XdMuT62GJ5u5vlqfhmVJGt4MkwY7SrCGX8IRJHph8=;
	b=Yjf+n5MeUVU2sG+itjStPgzzFRHSDq/couIwxYI3JCTd2fPTfCQjnWwwPHSB/nQ/zh
	ghykGtT4GJVI+ikcFA5ipnbYIdJmCdpslQGwzqTOPas6LvdyGk87aXUC6bHopNy5gUwY
	XbRja78MkcckaCiThPvImJfaU9M2+jObKELDN5THb0LUp5Vehf/x0rZMYLrJyZ+/1Mzv
	Gt4ErkQaUk0jLvKyPy0/bCxfJMZi1GHIn9oVL7snUT8FnIMVCGgOrGkUBOd8TaDGfsRB
	MkNdDHeUAVZPdOWsRH9y+goYpb5JlkeKjnVNkxFMxtmk70xczB7VwzaGIqPyiwFdmaTr
	QamQ==
X-Gm-Message-State: AD7BkJIRsgsy9bJaEfWKtmZY6O5EaWg4kMMga/+TvbhFCS0sTiZcgGjg5+06oDXecE9+vw==
X-Received: by 10.37.17.65 with SMTP id 62mr340269ybr.100.1459997336717;
	Wed, 06 Apr 2016 19:48:56 -0700 (PDT)
Received: from localhost.localdomain ([12.166.78.2])
	by smtp.gmail.com with ESMTPSA id
	d140sm3666112ywb.48.2016.04.06.19.48.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 19:48:56 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 22:48:20 -0400
Message-Id: <1459997302-25271-9-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459997302-25271-1-git-send-email-derek@asterius.io>
References: <1459997302-25271-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 09/11] libextutils-config-perl: update to 0.008
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
X-List-Received-Date: Thu, 07 Apr 2016 02:48:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...tutils-config-perl_0.007.bb => libextutils-config-perl_0.008.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-config-perl_0.007.bb => libextutils-config-perl_0.008.bb} (73%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
similarity index 73%
rename from meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
index 78483b4..e93d388 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.007.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
@@ -5,11 +5,11 @@ SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Config/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b1b813683bd988732e7fd6a796bf7f47"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1932ab4d8b84c25fd7967aa18088e57e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.tar.gz"
-SRC_URI[md5sum] = "2829c0dfa8a7e51b3f582efbee4bb128"
-SRC_URI[sha256sum] = "2c1465078b876fd16a90507092805265528c2532d4937b03547a6dbdb8ac0eef"
+SRC_URI[md5sum] = "565a7b09c7cac5907a25bbe2c959a717"
+SRC_URI[sha256sum] = "ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfdaa3ee749e62f1a8c"
 
 S = "${WORKDIR}/ExtUtils-Config-${PV}"
 
-- 
1.9.1


