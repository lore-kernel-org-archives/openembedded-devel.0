Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB0636093E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:33 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id u13so8128618plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Yeho3KMWu5unK92uOwD5so9EENLfzfX1EcnFwjPXRPA=;
	b=JC2QxuV/tBEn3DBYwtme/FJrVZxWoBuNTrLXpbPmEZ12ZyO6Itu783Jv0RB99bfNUl
	sipnpyrgs8uA84GlgySBQK6/y6pt7cjOou7xXPDbwNj6nAhRx1h1UBab966SBDLTGZmp
	xTsUQWgcGxvEWzYdbAodaiNf+IGOQGZ8uRkLG7fZdr8eU6onTis0M+tUpcU0gGAyb4ru
	cWOH615V4PvRzGGhjw+PCQ37qTtVohJmV4P5sy4UqJp0MXwAkL6hzfzPvFoLnu3nRIba
	p73qpx9n5A6QLZCm13aUk0Qm+fppAvnseEA/KPfLHYMyS74+IHL35PQos40Ly9CZtit1
	Y9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Yeho3KMWu5unK92uOwD5so9EENLfzfX1EcnFwjPXRPA=;
	b=Q3lOO4svXslat5WKT/z0UlVWWWu/biAnZM8yVgW2AO+Rk78QvM6+9scoDhNTaB43pi
	iYW3NnZA/KjhztyX2tPONFKQWj2iqGV2JAlx2sURFbcqVb7tHpdK3TRc6pd7CRyr8SQc
	JY4rfSzMfPgJ3wYubTwO18rvyhwsPk6xy2yNHfQ6lbQ9ygyvf+bYF7MliN/Jfte9yO5l
	gk6VWTw/ULxglkh23JcUk96lzLT6jeeCQqwt62IIMSakrpsCpL2ZFD/FDCH6+IH4UeaP
	cNqzOPxoSVAQ84p+v8OU+HyvKbDsmLxWQnqUPpw6R44PANhAEdm6IfII10dFfXCbUult
	znFQ==
X-Gm-Message-State: APf1xPDy8U6BdMmNDR3jTBcVFsDiLopnaRvzF3LQ/L7XIp2vaA8pMHjX
	SQonuD6H0aiMpo9UxJBgZ0XR8Q==
X-Google-Smtp-Source: AH8x226pu2qjdlIwaKefjisQtEI9iv0lfbNTgm4kZXtcTzXmHYRmYE6XgDRZBTVPKxqqHmP/nn7D0w==
X-Received: by 2002:a17:902:8d81:: with SMTP id
	v1-v6mr8439328plo.430.1519594415229; 
	Sun, 25 Feb 2018 13:33:35 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:32:58 -0800
Message-Id: <1519594406-24490-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 08/36] mongodb: move to recipes-dbs
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:33 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch   | 0
 .../0001-Tell-scons-to-use-build-settings-from-environment-va.patch       | 0
 .../0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch       | 0
 .../mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch           | 0
 .../mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch       | 0
 .../mongodb/mongodb/0001-mongo-Add-using-std-string.patch                 | 0
 .../mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch  | 0
 .../0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch       | 0
 .../mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch   | 0
 .../mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch         | 0
 .../{recipes-support => recipes-dbs}/mongodb/mongodb/arm64-support.patch  | 0
 .../mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch                 | 0
 meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb_git.bb           | 0
 13 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb/0001-mongo-Add-using-std-string.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb/arm64-support.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mongodb/mongodb_git.bb (100%)

diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
rename to meta-oe/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
rename to meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
rename to meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
rename to meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch
rename to meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-mongo-Add-using-std-string.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
rename to meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
rename to meta-oe/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
rename to meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch
rename to meta-oe/recipes-dbs/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
rename to meta-oe/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
diff --git a/meta-oe/recipes-support/mongodb/mongodb/arm64-support.patch b/meta-oe/recipes-dbs/mongodb/mongodb/arm64-support.patch
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb/arm64-support.patch
rename to meta-oe/recipes-dbs/mongodb/mongodb/arm64-support.patch
diff --git a/meta-oe/recipes-support/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch b/meta-oe/recipes-dbs/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch
rename to meta-oe/recipes-dbs/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch
diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
similarity index 100%
rename from meta-oe/recipes-support/mongodb/mongodb_git.bb
rename to meta-oe/recipes-dbs/mongodb/mongodb_git.bb
-- 
2.7.4


