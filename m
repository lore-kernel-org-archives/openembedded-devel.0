Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32759.1793879734814018546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aS+vpkMR;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so15098115e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879733; x=1794484533; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4sqNIEtRTctrq4KxwAIFvrosycQNoPA6EOdxnICUKjc=;
        b=aS+vpkMRtcOA6cV7DmoRas+L9VtWo6XpONfMYrrZ1nLUP3PIEL1ewO6CTClCSxrYZR
         Ey7QoNa4q9hu+L+EPX0PHffpDatKsL4O9H/2nzJrqLTvKDCMXmcmJv/+K12V6Tqc/8yb
         QlYSWe0lvWrH0DMv4RHOWKUoe9eDNp9yiOiyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879733; x=1794484533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sqNIEtRTctrq4KxwAIFvrosycQNoPA6EOdxnICUKjc=;
        b=kenE4XcV0FBHhjzGxvw3wasWDTExPtmw+kOnBZp45qiDhW6ZB8KWvEpWweDdRKRgAh
         goYqQHya1RWd0/kBOzwTrzlHukjF9UXZuXyxdDknbFpUjgMmYXIeSnbIl8LmZhNvlfWC
         9aWrA/QAi8uhkPpkI/QiNMjDmfjhvsk9gai9fIhR/VL5SHg+mNabPH/3JBp7V3feOskp
         x9iFefOKQ3cBSztJ//kLOcz3ljJQigwDyHHoaF+2WL3AYvgJixiDVNLiHGnrO131jiAI
         eiTzV2uRyWcv/kPcfJWnttxniQvwusLv6JQf2dbssEHVQXHHL1sGjWrdvym1RFQzlwtI
         Wprw==
X-Gm-Message-State: APuU4Z/YC6cq8pEaPKk9rx4M0Q8m/ySRu9G2E4+LnbSn1h3L2VAYqNWK
	DvyvCRN2mRNyQnhZJrlXX9KY+qC2FV9lgLqNrK1CfRGj6HAfrU28RNjYWfgBvy3OgqVfrBRksfw
	9z15Y
X-Gm-Gg: AYBFou2p6+WMRGo0R59hkFsxH3dd+T/xROuUf708bDV3T0OiSuJ5twQVGEHhJwNl0Rr
	8iwsM8uHwAB9j11klA4IyR8Dm3LAtgr1tyMqrSYrivHS4zHvh+8U8NQ8SbT5SsSjTnpbTCdyMD1
	jt7q0XnLdmm8j7x4JK+Kj4Zt98PH/Q3B9zitnXyvVaDQ1N3frY1Ini0IYuTykUicuik3E7gflep
	6ebRv+BqnP1xYJr+JBPOI6e+uWS6wgF1NdsG48AJYZulxZs+NsUYKnxq59AHbVoBi/3jve61thv
	sPDt/xvGIa/W6p998U+d0bpG/gslU+SWUVUyFuXsaBbsoVYycWaPkc/15CXH8//kKidB71YaICr
	SZNhj1eGDwD9/vsEmwYP48xY13lcLplXqr2FX9WOzl21ZtH6rA6KQhJdRq8q28zFsRNmZZ+9suw
	pTC3CBM/edhLPmTiKLQu77Ccv9ezi9usEQeF+3uybCsnadz8Kgi7L9Q7QmbNiIuCKmG39Df68ic
	OMmPTgeY1qSs/cfPi39P9nUJauMLELEdrX857sLDO1ovFhBEE4x6pNecdYfZ6cFdATX7jHWImO9
	cL7hmqXYUaskdOS8oMrfOvZtJYVV3Sq5Fe+xKTu2Gi+0wvXoHx46ubEjHLtiHdCA5LANTJUxfjp
	OFliHedccU7jPmyxcAfdMQunYGdIZbxyhsUmPjhcEe0ZCZmdsYzvd/w==
X-Received: by 2002:a05:600c:a49:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4ac180f1b83mr442696765e9.23.1793879733095;
        Thu, 05 Nov 2026 03:55:33 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:32 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/19] python3-django: Upgrade 6.1.2 -> 6.1.3
Date: Thu,  5 Nov 2026 13:55:12 +0200
Message-ID: <20261105115526.634289-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131905
Content-Type: text/plain; charset="utf-8"

Upgrade to release 6.1.3:

Security fixes:

- CVE-2026-108147: Potential memory exhaustion in MultiPartParser
  via base64-encoded file upload
- CVE-2026-111211: Potential log injection via unescaped geometry
  form values
- CVE-2026-111362: Server-side request forgery via crs member of
  GeoJSON geometrie
- CVE-2026-113593: Potential exposure of private data via empty
  and missing Vary headers
- CVE-2026-113733: Password hash disclosure to “view only” admin
  users with custom user models
- CVE-2026-114582: Server-side request forgery via
  SpatialReference string input

Bug fixes:

- Fixed a bug in Django 6.1 where accessing a deferred field with
  the FETCH_PEERS fetch mode overwrote values that peer instances
  had already modified locally or loaded via refresh_from_db() with
  an explicit fields argument. The fix also addresses a KeyError
  when a peer's row had been deleted
- Fixed a regression in Django 6.1 where the YAML serializer
  crashed if passed the sort_keys option
- Fixed a regression in Django 6.1 where a Value expression with a
  None value and an output field other than JSONField crashed on
  SQLite when used in a top-level JSONField in lookup. Using such an
  expression in an IN lookup is likely unintended, since SQL NULL
  cannot match any value.
- Fixed a regression in Django 6.1 where legend_tag() with a
  custom attrs could add the required_css_class more than once.
- Added compatibility for oracledb 26.0.0+
- Fixed a crash in makemessages on Windows when processing files
  with non-ASCII names on Python 3.15+, or with UTF-8 mode enabled
  on older Python versions.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-django_6.1.2.bb | 4 ----
 meta-python/recipes-devtools/python/python3-django_6.1.3.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_6.1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_6.1.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_6.1.2.bb b/meta-python/recipes-devtools/python/python3-django_6.1.2.bb
deleted file mode 100644
index ff1ba01d68..0000000000
--- a/meta-python/recipes-devtools/python/python3-django_6.1.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require python3-django.inc
-inherit python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "a1e92451ccb8b514e91bbb3b6d186d20b4030558f116b5d9de6535455ff210b7"
diff --git a/meta-python/recipes-devtools/python/python3-django_6.1.3.bb b/meta-python/recipes-devtools/python/python3-django_6.1.3.bb
new file mode 100644
index 0000000000..64f6d412ea
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_6.1.3.bb
@@ -0,0 +1,4 @@
+require python3-django.inc
+inherit python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "b5d2d9e35295065d13b1927b3f19a59bd119f737aa6299def14ccca1ae3c8c0d"
-- 
2.47.3

