Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FE1CCD1BB
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 18:32:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.20642.1761071529524669642
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 11:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HhtWrmx3;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47117f92e32so39458185e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 11:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761071528; x=1761676328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zr2iLk/yeYniq8vrSxnrDzMjevUe3tjxK2DeLAAlO2Y=;
        b=HhtWrmx31J3VkMWozkRswpsIV/7erN8sG1X1OgSm0IgTFVZG8EI9JAOduI4jtEAjmO
         hT0OBNifFXr6n3Ft3cvIZGVi0oLGlrwMJgL0079K+CHhhVqEDFBQMVGV8P4oq5Y5+ICf
         42ch0xc92IknX2rIY9M6g1rOTORNGEyrRGY37gyJvg1SzQHV7sCiZr873WMi2Vn3jH5S
         2uJ7CU6Ez1+JAJUZeyk4QzwIukMgQM8IDJSk5DJcoPyxWMGPUJoXdSLxAucLrKYzhEDb
         tN3vs4/TOY1tFL/nqGXQA96STa1xZDNRo2zWYgTBSBae0Z4H3RvkbM9yaURGUTW2pKYG
         y+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761071528; x=1761676328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zr2iLk/yeYniq8vrSxnrDzMjevUe3tjxK2DeLAAlO2Y=;
        b=pQd+2aKuxfakxxmAXxRvNmv9VjYFyz8A4fpFWFzeD0/0lVVJNRFgsAW8uV96Y7YwoJ
         Khtvzmq+4TTTqhLPew+ezXY3jJxeLpTbUgQu4Hz73NxW3dVHMUXvU+9FBfty5GjU1HA7
         4MTSfgzmWK/7s9J4rNErWO27QWx0umpeZuaa/nr8owVWji7WzR6Z7CESnm70FvgLr1RX
         fb/eXbM111mXYog5G5HjwQ+/n+yebVBRdpj/1GsEaoUh9zn2Q20momHDuONvTj9sp3T8
         nAzyXke1TNlwh3m5jiV9sGP3jOx/0oxOsw98q+6PA049P+JZGWoMCEM/1c+gBZCCQ3fG
         uI4w==
X-Gm-Message-State: AOJu0YxaMyyvcpDCq4pYvupRDu4HbWl0KQqnLDaEQx00kGDyQA0Srf0Q
	uxcmPPMIYRJEnr6V6xA6xpeaC7zLthCvQXTHP3qimEtm0taQsARx9fD12Av7ig==
X-Gm-Gg: ASbGncsjqQx9vBhX1dCW8/bZZZ7RLXy0mVnSrOOu6aPjunKCntuQodYiEVl6E/l4vlJ
	rphPjASDVJrH75yCLesD9C6+w2NpjHZkXiHVQuv8tJggVQBIeFkvX0Yi/u9dbbQ2tLfj3wPhE10
	tbkhjUOL5mYtrCCqV7U12M3pUvr7vBKBRinWw9bSO6geG8eWVOupaychLO+rnOBNeAquCqCPsht
	q/NuL0/ybZkR/0ab7L1I9Dcd1i0YL0+3AysBGlLwIQsZw/jtY264omkM+FVYSiD4yMRlYil0f0g
	GG2pmt2KmIx0YhmLJ+u6/5C4HjOdFf128Ra4eHRGb60ZaoCC5y8lONw10mFA5ECwGFOKkJDhf0p
	AlvBtIamOLrjWWtdEG1ASsjZ9AnrYsaB2PoLvp43+On6qUxUs7P34CLhG0MGMkMksAESkM8rJEw
	==
X-Google-Smtp-Source: AGHT+IEbWIvDx37j4ifkrhyBj5PiIZzdBFbNGRZiKlCfDQEdB3KRPKjh0Hf7wqN9/GZaifz88n0cRw==
X-Received: by 2002:a05:600c:548a:b0:46f:b42e:edce with SMTP id 5b1f17b1804b1-47117925db7mr121356125e9.39.1761071527794;
        Tue, 21 Oct 2025 11:32:07 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496cf3b45sm20984535e9.7.2025.10.21.11.32.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:32:07 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 4/6] squid: patch CVE-2023-46724
Date: Tue, 21 Oct 2025 20:32:02 +0200
Message-ID: <20251021183204.269102-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251021183204.269102-1-skandigraun@gmail.com>
References: <20251021183204.269102-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 18:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120844

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-46724

Pick the patch from the details of the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../squid/files/CVE-2023-46724.patch          | 41 +++++++++++++++++++
 .../recipes-daemons/squid/squid_4.15.bb       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2023-46724.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-46724.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-46724.patch
new file mode 100644
index 0000000000..177e6e0c18
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2023-46724.patch
@@ -0,0 +1,41 @@
+From 7025a946c8795244f8b50a40a84640ca8ed9e321 Mon Sep 17 00:00:00 2001
+From: Andreas Weigel <andreas.weigel@securepoint.de>
+Date: Wed, 18 Oct 2023 04:14:31 +0000
+Subject: [PATCH] Fix validation of certificates with CN=* (#1523)
+
+The bug was discovered and detailed by Joshua Rogers at
+https://megamansec.github.io/Squid-Security-Audit/
+where it was filed as "Buffer UnderRead in SSL CN Parsing".
+
+CVE: CVE-2023-46724
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/792ef23e6e1c05780fe17f733859eef6eb8c8be3]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/anyp/Uri.cc | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/anyp/Uri.cc b/src/anyp/Uri.cc
+index 54597f1..b0b60cf 100644
+--- a/src/anyp/Uri.cc
++++ b/src/anyp/Uri.cc
+@@ -173,6 +173,10 @@ urlInitialize(void)
+     assert(0 == matchDomainName("*.foo.com", ".foo.com", mdnHonorWildcards));
+     assert(0 != matchDomainName("*.foo.com", "foo.com", mdnHonorWildcards));
+ 
++    assert(0 != matchDomainName("foo.com", ""));
++    assert(0 != matchDomainName("foo.com", "", mdnHonorWildcards));
++    assert(0 != matchDomainName("foo.com", "", mdnRejectSubsubDomains));
++
+     /* more cases? */
+ }
+ 
+@@ -756,6 +760,8 @@ matchDomainName(const char *h, const char *d, uint8_t flags)
+         return -1;
+ 
+     dl = strlen(d);
++    if (dl == 0)
++        return 1;
+ 
+     /*
+      * Start at the ends of the two strings and work towards the
diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
index 9ac420d579..2c33d45bbf 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://CVE-2021-46784.patch \
            file://CVE-2022-41317.patch \
            file://CVE-2022-41318.patch \
+           file://CVE-2023-46724.patch \
            "
 
 SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"

