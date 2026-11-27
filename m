Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8102.1795739766854974629
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CKrqKk9G;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f06ff94acfso33647475ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739766; x=1796344566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPDLng8VDCnI0GrOEsrly6K+35ZzeNmcdzJjX4zHBZg=;
        b=CKrqKk9GZsM2mFVZnVYhBHJwzkbgIWvZRYQd8PYEndojICGG4EumFz3FMCRVJy6ri9
         eXnrPESkfg6RE1s5AQxXuZ2QG6bRe40VFgH+p6zk7JHzcXHkHNURcbwI/NmIUSVxiQL2
         f8sKYrGXTMq+E6uWRoVOl9mfu/EMs5vStsUhk1YfwawB/VRdBTDhlhC/ryuhXPLmh/2K
         fvem3NXrPv4jE9MFu9/QpbdIPErNYocJkwSbd3J+mBgXCPYv1TwlkvjjJkAgwQn1QCtA
         aDn1XAZCxLxVusMfO1sHq3/ls+TLbsoFSH+b4tyFL/fU4e4zQMDMnsiZQ6PN8n0nw/gD
         qD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739766; x=1796344566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mPDLng8VDCnI0GrOEsrly6K+35ZzeNmcdzJjX4zHBZg=;
        b=SAzYbdt9VYS7Xe/BSWcQLliavS1qTKDXQatiXZ0neg2nM8+Ng3bZIoUbAUD3pdzQoi
         WwDuse8pKZO2Q5Z0G+njjG6QE5io2SKP9aBrK7xaZ5pyXz9iax9PRIrQOKzQWVEC4n4u
         iGeXf0OsVdKWd5f5RedbI6BgNS9kTwMnXhfPdlgu+MqWjdY8r3iGCDJBR2qxPKKFW2cB
         l3i6iv28InX+rHD6QyuWJKaIqsNqNHbeAWx7Pr0e68UNxwO++q9egrNBUaDbpXyRFBbQ
         QXZP4pcWMeYRDkuOh5GMf+AaI7ZcOr3ZY8Y+1kQ8eGgjz1CgpFLAvxPBf/hSW6NTylZn
         apkA==
X-Gm-Message-State: APuU4Z/JV7LCVIoqwrtG4Ulwm+MxUEw4NlnDBYCc0zBuLK2E2dy0mG/7
	dSt6n3DwsoWdR87e1lLGz2YqAz15Jn6SJioOUqjQHv9idwBOfSCxbISMIv5FBA==
X-Gm-Gg: AZFdTZcb7l6kwsVbQslvfqhYMTCeWEl3DqhtshMMLTn+Hwt8VJCTNR+TJSWPoA4iSmb
	fj+3nHmZe5Y6sm2hrC/ZcX4dhxiZD8FxyGK/PE+gIzsNlMHW0ySQrkk02doIkPnlbvryG0UJsgd
	gi0fv6Nx7OEMWlnROKMQXdBlmjtbqDEjpI972s8CSewTvkIb/XMVvmmcp+lcXDfHgPIt1764nJr
	N7aV+Cn8y3UVuNKaqOSwkTqwtM4xJOynP4XTbl1EH3JMRA2F3A8H9rCmWsarOTFTC/dfI6MLzXh
	rIsInVczk615mj66wIwXZLsZzIXpzmLkpuOOj4q7HAeaVg9WX2UL1OBecVe11HSKf7nHKwwwyQv
	ZpDj6nE3ggFlOBpE/OkUWwFkvduxCO0Zg0msowuEvudk8jh7cAKnDvSjLi+IvAgIALTJg+wTMLS
	g0IPrfwFgobWxxAFrJ5SfjaFr9jTwOahfeDNspg26PWZAQNsNT//u8kb9+1l2UABUw+hPOLLU/b
	eJZVlFHj7N/umx55OaFDub43YN0nozjZrJdj6Vb3zKY6yfzSfbpBCvk9EeDzJT7uDrkx43cKmw3
	SAN6r3lVK42DJKr4OGp/7DKRiC1c9B8R8f6WymB1FZsjNYbTJGtNBMM/XgYO9iEH6boysKn8sxH
	5UF3Q0DcUkM2iKkI7KyWFu7MTpagD6/bodFDmeST/2/mgWZwHcCW7gzFGc95Mjdfgy94KzkePgJ
	zwzIjRtlv577wCG0wL11q8oeURQFvqqLGtcIHkwbMe6qJfp2ojXhFiJMTCiN2MX8ph2w1zGdWjs
	j+/Is2jzkv0BEuwHwy1u51x0wa2XcdhFku4AMtr0+RFuyk4qbuIdc4yupc5wYPVvFk5TmbF258p
	Mqdb
X-Received: by 2002:a17:902:f70f:b0:2df:90d4:7758 with SMTP id d9443c01a7336-2f03f118282mr186735575ad.23.1795739766079;
        Thu, 26 Nov 2026 16:36:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 02/39] mailcap: Fetch from github.com/InfrastructureServices/mailcap
Date: Thu, 26 Nov 2026 16:35:06 -0800
Message-ID: <20261127003543.2167775-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133172
Content-Type: text/plain; charset="utf-8"

releases.pagure.org is gone and upstream moved to GitHub, which has no
release tarballs. Fetch the r2-1-54 tag with git; its tree matches the
old release tarball (a GitHub tag archive would fail the src-uri-bad QA
check).

The tags use dashes (r2-1-54), which the git tag check cannot map to PV,
and the listings with dotted versions (Fedora) are behind a bot wall, so
mark the upstream version as unknown.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/mailcap/mailcap_2.1.54.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.54.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.54.bb
index 4b47b3a9d4..0e2cdef478 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.54.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.54.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Helper application and MIME type associations for file types"
-HOMEPAGE = "https://pagure.io/mailcap"
+HOMEPAGE = "https://github.com/InfrastructureServices/mailcap"
 DESCRIPTION = "The mailcap file is used by the metamail program. Metamail reads the \
 mailcap file to determine how it should display non-text or multimedia \
 material. Basically, mailcap associates a particular type of file \
@@ -16,9 +16,11 @@ SECTION = "System Environment/Base"
 LICENSE = "MIT AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8dce08227d135cfda1f19d4c0c6689de"
 
-SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
+SRC_URI = "git://github.com/InfrastructureServices/mailcap.git;protocol=https;branch=master;tag=r${@d.getVar('PV').replace('.', '-')}"
+SRCREV = "9699055a1b4dfb90f7594ee2e8dda705fa56d3b8"
 
-SRC_URI[sha256sum] = "9a4032202fc0d2b0858f41b167389a9cfe52ac24ec282e6479b90765319de113"
+# Release tags are r2-1-54, which the git tag check cannot map to PV
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 inherit update-alternatives
 
