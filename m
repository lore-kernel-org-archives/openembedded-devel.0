Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07AFC79F83
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:49:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10392.1788515347182565279
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WdS+oyVp;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-495437bb891so5974445e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 02:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788515345; x=1789120145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9MJZNFjRteUoWxnwZXEtpqhRQmrbviszqaYVyvNYbo=;
        b=WdS+oyVpPNUDGoGnes81tXoRAT0mkJoRIRBvofW1mjSf78pf8Sh3sxaL3JVCHld1t3
         mC/4r6qW43tLvq0rbP5S80ciEQ3lZ+SW17nKXU+VrgTivHfY1S9CfR+AwiTF+HMIA4kq
         OguyoxlKgkTijDONAAR9WU1Q+7IV8RZ+oC3Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515345; x=1789120145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9MJZNFjRteUoWxnwZXEtpqhRQmrbviszqaYVyvNYbo=;
        b=hHbgepqAE3BqtfCtWtz3ZqNsypl6kS2DUqWGBkuw5u+T98aNr1SltSHW/FAH6Jb6+p
         coRUPrQE9g8/ydONvlLTGnuZU1o4Lbr3cUtGdpq3YaMZ0NWXfl6vtvhMghyyiu/WopXB
         z8PY0uP9EWzahFRNCRam43p4dEmDquMRQ4QmHXOAbeMdNTxUE5dsDCmDqzVDfhVd73Tj
         Aevx8eD9aloB44H0btS+CxO8eWVJSD4uAvClwS8WTgb0/4TZmh7ZSdZFEhk6kZA6MBIL
         HibJQJaGFQYhLPHZa35CsA9dab9nh430/sVXLb0ympahHuMh8U7UYlQhgLU/kcjV2H6T
         CRRw==
X-Gm-Message-State: AFuF++knekmIyuhPbTc25c3szXT0GXAYiisnhK220wLpCXh4/wZ8j5Z5
	7Nfk4iMK/ZKEtZg7zhj63VNvfpzlvbrOSO3YKs9lg4CGiU8oPuNGNzMNnIwygOecn+wwhF7bnug
	YYaIQ
X-Gm-Gg: AYBFou0fO0n4dKT9sq7EZc3oEBcnoZc//mNGy2cpDtOGzuFbHjjUclKTF2Wji1UieKn
	AiHNhlkJBq6I7nl2Ea/ZGgdbUmEfZqybg2gcwrecbuZY6ra15UuK3I5EfjtAJodZu++If4HgcGD
	vDrbzQvKFtZdKdp9FWnSd9lFIIogwEPy+q6QJw8CfnMtXn6yHpOR5qJVaAwEZiFDAspz2v7XZ1S
	Hn3K/1o+bl3S0qBC2h7JzcIMWt3SwM9lJRvk9LDTrwcb31cm8JZqQQwi1b3Ko1bWOQNlDob638B
	zAq2nJQhLt1WBYtTRVj5wITs2jTYdK0vJkzAAvHscbudw45taozf50EKZDQxrxjP/aY3CcqEUQa
	yrcLnHqusTYS8Ogd8ownQ7WdW1J5BuQatvrfO4LIsPVgoBgrv+0c7o93iXRJM8kRW1tzH/QJzPV
	JRuhPtwgL7npnpfi5KuaknmYEMRH7v0miWJ1HIV1/OZwC8Q/BoygT0cyCaRP/2Al9UkJf9i9vVr
	05GqG5LVCoQTYbLnCODb+mK3zsf6Gk3DuHVUEKcp+h4cFCqEAtnIDIvogyvCy73h1Rl9IJmhepg
	Fpe+N4v94f2QQ+ClTqiH1uRc
X-Received: by 2002:a05:600c:871b:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49cf82cbac2mr36349935e9.5.1788515345352;
        Fri, 04 Sep 2026 02:49:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d4938sm141045965e9.2.2026.09.04.02.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:49:03 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-glances: Upgrade 4.3.2 -> 4.5.6
Date: Fri,  4 Sep 2026 12:48:54 +0300
Message-ID: <20260904094854.3706560-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904094854.3706560-1-leon.anavi@konsulko.com>
References: <20260904094854.3706560-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 09:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129754

Upgrade to release 4.5.6:

Bugs corrected:

- Alert level decided by dict ordering: a failing+slow URL is
  downgraded to WARNING, an unscanned URL reports CRITICAL
- GPU plugin duplicates card name and omits N/A for unavailable
  metrics in multi-GPU
- GPU plugin duplicates the utilisation value and paints it with
  the memory colour in multi-GPU
- IP plugin displays wrong interface: outer loop in get_ip_address()
  never breaks
- VideoCore (v3d) memory shows ~93% on Raspberry Pi 5 with
  gpu_mem=4M - misleading denominator from drm-total-memory
- CSV export: --stdout-csv data rows desync from header when
  network interfaces change count at runtime
- Glances Network plugin with mismatched schema not logging in
  TimescaleDB export

Security patches:

- as_dict_secure() Value-Level Bypass Leaks Credentials in URL
  Values via /api/4/config - CVE-2026-68520
- --disable-config-exec does not cover on-alert action commands
  - CVE-2026-68519
- Command injection bypass of action-template sanitizer via
  cross-field shell-operator reconstruction - CVE-2026-68518
- Incomplete fix of CVE-2026-32608: action-template sanitizer is
  bypassed by nested stat values - CVE-2026-62982
- REST API CORS Credentials Guard Uses Exact-Match Instead of
  Membership Test - CVE-2026-68517

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-glances_4.3.2.bb => python3-glances_4.5.6.bb}    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-glances_4.3.2.bb => python3-glances_4.5.6.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb b/meta-python/recipes-devtools/python/python3-glances_4.5.6.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
rename to meta-python/recipes-devtools/python/python3-glances_4.5.6.bb
index e4cd7d59e7..8738d5c7b1 100644
--- a/meta-python/recipes-devtools/python/python3-glances_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-glances_4.5.6.bb
@@ -1,9 +1,11 @@
 SUMMARY = "Glances is an open-source system cross-platform monitoring tool."
+DESCRIPTION = "Glances an Eye on your system. A top/htop alternative for \
+GNU/Linux, BSD, macOS and Windows operating systems."
 HOMEPAGE = "https://nicolargo.github.io/glances/"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=852ecadc0ac7e6f4d7144d5544a3815b"
 
-SRC_URI[sha256sum] = "736faa7faea3bcd58afffd6443974b4ed4b498627a71ce5d6c9640b7b5ddbd94"
+SRC_URI[sha256sum] = "8a26329f0a25e878d53c2558f1eb0615b09acc1dce2ba523cab32dbe175fe8bf"
 
 PYPI_PACKAGE = "glances"
 
-- 
2.47.3


