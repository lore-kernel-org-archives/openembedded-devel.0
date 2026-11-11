Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3284.1794374984292199101
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jKWWbeS/;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1588; q=dns/txt;
  s=iport01; t=1794374984; x=1795584584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zjArlukhizokAvRTPKfULiM9ObmMO3k2vSreoLmorI4=;
  b=jKWWbeS/bjS68Lf0UZsulYWw56MEBQ05nC+HaCTcWTbTYQBQY7qTgvPB
   TL0Ttaa17I20t+Lrnm6IgceTb7qHTX+Qf1sHywO/WCDdwZynQ9XEwurre
   Kutq6S4nJ9GfMkOR7z65q8E7LwP4XW38Qg3JPzoOS06uxvo2Ios6fR9ZQ
   bw7sR4pD/Qe1BeFJKbNuSSeDPrprwg/8OesCG7d4j8liy8DJmmN4XfVFz
   8CquDkraVly0x2TtVAzBYNzhBeUpmDSPBJ1uAEj3h8LLVetmQ9YpS+c8a
   twflR+iAULqgfSByJwdU46e6pyDz2runXdjc+IJwR76/6pLGdZXztKKzS
   A==;
X-CSE-ConnectionGUID: UspM4Gt3TtWGtDWIhrRywA==
X-CSE-MsgGUID: JsRV9DeaSYqMGE1mv1QaOg==
X-IPAS-Result: =?us-ascii?q?A0BHAgDP+/Nq/4v/Ja1aHgEBCxIMggULgld1YENJA5Vcb?=
 =?us-ascii?q?AOBE50PgX4PAQEBD0QNBAEBhD9GAo4eAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZATAgEDMgEYAS0QIDErHQENGYMCAYJ0AxG5V?=
 =?us-ascii?q?oIsgQGDKQE/AkNQ2zMBCxQBgTiFQogkdQGEfScbG4FygRWCc3aBBYFcAQGCL?=
 =?us-ascii?q?YVXIgSCIoEMjnSIdkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEcgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCn4YDUgRLDcVGQQ+b?=
 =?us-ascii?q?geSboMVgQ4sBBx5Fn2ldqERCiiDeIwkg12RXRozqnILmH2OCpZRhGqBaDxGg?=
 =?us-ascii?q?QELB3AVgyIJShkPji8KC4NggX/MXCYyAgwvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:ofrLm61YuqLTgLZDvvbD5YNwkn2cJEfYwER7XKvMYLTBsI5bp2MCn
 TQcW2iAPKuLYmDzKdAnO4+xoxkPsMDUzIRnGlNk3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmctazpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGMVouGNE35r1LHV5h6
 dAnCTAXVAGcrrfjqF67YrEEasULNsLnOsYb/3pn1zycVaxgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNU+RC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+OW2aoCLIIHUFK25mG66v
 Vj4rkj0CyorLfmw5GOA7CuVj8jAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:4bMO2KuuPb1/R3pgGdjM1J9d7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: 9a23:IhX4d25Lurspuk6uQdssyVUMP5wKbibh0Ej/P2OHKGZzcqyKYArF
X-Talos-MUID: 9a23:teXltwsmm/BaZU57HM2npipYCpZE7q2VOVkovrhfvtfdDCVXNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="532262569"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:29:43 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 654D018000211;
	Wed, 11 Nov 2026 05:29:43 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C751FCBEF98; Tue, 10 Nov 2026 21:29:42 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 8/9] python3-filelock: ignore CVE-2026-112910
Date: Tue, 10 Nov 2026 21:29:37 -0800
Message-Id: <20261111052938.3691463-9-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052938.3691463-1-dkelaiya@cisco.com>
References: <20261111052938.3691463-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132118
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Analysis:
- WindowsFileLock can ignore mode=0o600 and inherit the parent
  directory ACL instead of assigning owner-only permissions. [1][2]
- The issue also covers the ReadWriteLock database on Windows; the
  upstream advisory explicitly excludes UnixFileLock. [1]
- The Wrynose Linux target uses POSIX file permission handling and
  does not use the affected Windows security-descriptor code. [1][2]
- Mark the CVE as not applicable to the Linux target platform.

Reference:
[1] https://github.com/tox-dev/filelock/security/advisories/GHSA-8mx5-7m5m-r77g
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-112910

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
index 814fd59eb3..40c4fe9427 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 CVE_PRODUCT = "tox-dev:filelock"
 
 CVE_STATUS[CVE-2026-112907] = "not-applicable-platform: Windows oplock handling is not used on Linux"
+CVE_STATUS[CVE-2026-112910] = "not-applicable-platform: Windows ACL inheritance is affected; Linux uses POSIX file permissions"
 
 SRC_URI += " file://run-ptest \
     file://CVE-2026-112939.patch \
-- 
2.35.6
