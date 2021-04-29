Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web12.3066.1619678299416120460
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Apr 2021 23:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bcnd4gHb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619678298; i=@fujitsu.com;
	bh=4sY6cu4cVDVluQEIcjkJCLEcAr41JzQhg1JElPDm8ww=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bcnd4gHbngwosvMXwaASMAPWAj6+x9Y6jA0edtUczKeFv5hE9Q21paqKXoOL0FKfl
	 +Pq1FUp9QwF7f/SeUWLmrzLMtChtpnItsdooIfj4k6TUOk9MtFhLZUgt5BmTRvKN+q
	 7AaTQE6TATQ2v94399TUD37s9UWcUf1uzT1i6nLvTKE50juJ1JXVGC+VTWzq8kwGsG
	 VBUHbQD0PsgYVZjirI20HfwWDyLFwcyysqUITKqBjqiCMnMA9iXjDTt9yRwAYSA6MM
	 h2VHY1VRx/70EdgJ+E9lHpDdCzAKmKDU30xGYUotGojf3FGNjc8+jYiinjIkdivxIV
	 iWpeOOe554f2g==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id F3/D4-55620-9545A806; Thu, 29 Apr 2021 06:38:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1Y0M6Uo
  wuLVR1+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzVi64gp7wQ7OiqbPy9kbGK9zdDFycggJzGaS
  WPJMt4uRC8g+zijx/dh2ZpAEm4CORMeLbhYQW0RAX2Lp7D1gcWEBV4mTnduA4hwcLAKqEneWa
  IGEeQXcJNb+vswGYksIKEhMefieGSIuKHFy5hOwMcwCEhIHX7xghqhRlNi+8wwLhF0psX3aWc
  YJjDyzkLTMQtKygJFpFaNFUlFmekZJbmJmjq6hgYGuoaGRrqGlma6RqaleYpVukl5qqW55anG
  JrqFeYnmxXnFlbnJOil5easkmRmAQpRQc+b+DcfmbD3qHGCU5mJREebd0diYI8SXlp1RmJBZn
  xBeV5qQWH2KU4eBQkuAtDe5KEBIsSk1PrUjLzAEGNExagoNHSYQ3NgAozVtckJhbnJkOkTrFq
  CglzisI0icAksgozYNrg0XRJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvAEgU3gy80rgpr
  8CWswEtHjZ+TaQxSWJCCmpBqYszlQnDUfzTU0H5U5EfUtT7+VxcneslV7FMEkhsXD/mt8Vk9Y
  /e7Vr2erNImuDNlW7yXb+41l6I0FWWi71w/2YZ5/+ZgjMLqo+1KGWcdX8hTLjx99XDyziS7wa
  VG8++Z/jnrWftz1JfP1ovU7zjf+1p0wPvJm7ePOrLUtm39L/LpsYf1JQ+7XMaYHr8a5LedMCb
  E/+Zrk61/B+lLbWRa7PUcftHN1epKxa2cbPZJr2OnGe08fJ2qeCfAI+OnKXNsydPdlC4uz8gH
  fmf++eddixc36F2twqe9nKOc9dkoTX5b+J0uWx0xDOeVEyWeX37AMBqmcVpW+brWvOnKNrnnH
  67+eAJb1iNf0ftqyouGWqxFKckWioxVxUnAgAIdhCLB0DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-291.messagelabs.com!1619678297!43044!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19140 invoked from network); 29 Apr 2021 06:38:17 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-15.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 06:38:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13T6cHvS028324
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 07:38:17 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 07:38:15 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] rsyslog: upgrade 8.2102.0 -> 8.2104.0
Date: Fri, 30 Apr 2021 02:38:10 +0800
Message-ID: <1619721490-4921-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../rsyslog/{rsyslog_8.2102.0.bb => rsyslog_8.2104.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2102.0.bb => rsyslog_8.2104.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2104.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2104.0.bb
index 921124024..3f1ec91ab 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2104.0.bb
@@ -31,8 +31,8 @@ SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "1f6150dfd2ef38db37c2165e98d2f2b1"
-SRC_URI[sha256sum] = "94ee0d0312c2edea737665594cbe4a9475e4e3b593e12b5b8ae3a743ac9c72a7"
+SRC_URI[md5sum] = "a0213c989bce297944901e1a85286b8b"
+SRC_URI[sha256sum] = "710981c3c34f88d5d1fb55ecfc042aecad8af69414b2b1602b304f4dedbf9f43"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1

