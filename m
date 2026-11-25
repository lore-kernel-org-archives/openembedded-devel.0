Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37933.1795594077918812140
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aCxoaXr3;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso2524346eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594077; x=1796198877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UWQSZhZj2D30drYMfI4lCxGjS3QmBpW0rWlChPRpxA=;
        b=aCxoaXr3aDueqB1Lonxqf6SH9jqVELlw8MmQ/W3aq8OMFGAtKRGxwmmoUpXhvCz3g8
         HXl3MKMLfjuLkhfStHOfWJ3jiRhNCIDu3HEUfw22gpPFerbf2nW5KpYC6cKGWhG9/f6s
         nk64oc4Y1gjmulduA6Wocp0QbZ0uzHlM6x5CWVW48RlRHqYmcnUmf6RhcZWzBcVCmmwh
         7KXbTyrvOCUuj7EXrSMMejJ0OcToTvfTYjDKAL6PcsQ2SEDjxNkpBrFPyAK21EPHcyxz
         ynpdUeVQr/L/afq3TBa1HMNKz79YRUAVh2t0Mq56QA2qAn4bfUpKrhL8hxmHyQrde0I0
         h2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594077; x=1796198877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UWQSZhZj2D30drYMfI4lCxGjS3QmBpW0rWlChPRpxA=;
        b=JiJpw9ysPQVLVQYcCxXOoz04WVrIPIohoQ7VTGyCGlrJrT0AjRy54uU3sXCR9V+PvX
         eDZF2lmMHUtRmA6ffJ33SVTynPqH1uhjptKkrvpi14GC02YSxP2Txe6bAW2UTJuV5X83
         hDNS8uHsXTy173xc8sf5y7I2KO4FSPco5NORebREqhAJbduLu8W2wJLOaqifJVva3CFS
         OIsur2GWdnXAuuZRx/avSniW+rFPbFmXZSl5No8sNPfnjFKDZH3YN42AU6o00Buzb1tO
         Jfi8VbkBsMsNbc6URBznNWvhFE5ymuKdlUWrdwIeDyCfh1v1BenAIi9Qlo0ri9c0V6TO
         Cz9g==
X-Gm-Message-State: APuU4Z+7s6BBldtk2b5Zd4uC8vWD0uWlenw+VFf2NdnDA9ceLylk3s23
	iQkRsY9Pj/6iUThxvC75GhCK1d0jNDDP745Vz0z/44LdOPyxdRNB+fV9Qk4F0okX
X-Gm-Gg: AZFdTZdX7RF8JNulfMVBRgWsJI5Q+BbZ+OVyx8OF8ad/QJlR63K+efqI1PKA80vnsdz
	DV17c5oAxtbIwRFSH1n0DSpNNTgVF9iTiZoWaYTn3GvwErF3qnffcHLzR1Ll7/Xjv83sBvq620J
	onz6WL6kYRg9pRv7PUw2IeQ/68fFv79CSABGEiY9hwcuOobP5we10Z5AnQe/rHgfO/31Cppyt7L
	2Ra9hpHgc9Ad7yEquoJwp8QXCAxRfIJenjvk4J4nIeJfe57U1cfNXnfJUs5bGWA536IkQSumOQX
	DMnOBmdaIcQrTQiHyL8J0RFcQypAtC9/MEyHGZuCn6GmE7p4PDyFoFEe4c9+evjtct1no17OD8n
	ip4Yy1N9do7vBnMeuylfB/IhxoZgfipN/jHDyH4BUteXVorkaQcMk+Q+RvE0zcIwpwHNCkfyTKi
	cGYKgmJ1nHDfzUVck05J9uRvBu+2U4WgsjKP98fKkK/Op+s2pB4eQM7FkiWzWW7/FTPsDQGB5j1
	Cyn0+JwBgHvsxtRcFR69jTXIl7I2yP/gapWCqKE/Xhkjyw6pOyXI/PJUtW4jA0V9cGnkQFrIF39
	bgb+LpPtCxf818FWeLkq2zGn2BLBPQ+aARfjyghw4YfVaDsgKw8Iwkv5OQFlXpRtkv/wqNTdi1h
	XOjR+qxR+71JlNvqTbWdRtZ+oA+7YNuPnaYK4AaX7zlPHIco1l0F5igMarioZAQPL8gpqc6vTVU
	SeDJxBN7R+hY8YQFc+zsGIdyaD6xCuM79GyJq2eGVylCCXuZKvTnTQJW/CNdxhV+h3lt/wirYVQ
	FMnAJoV4iFDrIsZ9gUUIP/x7xs58HnPnWXCUuEQsw8DFlJWW6pNo1mP0NLrDnKQb8pydy0E0pxo
	tLyh
X-Received: by 2002:a05:693c:60d4:b0:37e:fac6:7ef1 with SMTP id 5a478bee46e88-38571120627mr17849686eec.39.1795594077204;
        Wed, 25 Nov 2026 00:07:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 11/55] zabbix: upgrade 7.4.16 -> 8.0.0
Date: Wed, 25 Nov 2026 00:06:27 -0800
Message-ID: <20261125080732.2419614-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133014
Content-Type: text/plain; charset="utf-8"

- New major LTS release: OpenTelemetry-based application performance
  monitoring (traces, metrics, logs) with ClickHouse as history and
  telemetry backend; OpenTelemetry collector on the proxy
- Complex event processing, a JSON item value type, an MCP server for AI
  agents, a mobile app, dashboard export/import and Elasticsearch
  8.x/9.x support
- Removed: deprecated macros, host/template massupdate and
  hostinterface.replacehostinterfaces API methods, HTTP agent JSON/XML
  validation and pre-1.6 agent support
- Breaking: changed API access defaults, SAML signing enabled by
  default, TLS verification for HTTP-based templates and media types,
  extended UnsafeUserParameters, read-only built-ins in JavaScript
  preprocessing
- Raised minimum PHP and database versions (Elasticsearch now needs 8.0
  or newer)

Derive the download directory from PV and add an upstream check against
the tags of the GitHub mirror.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../zabbix/{zabbix_7.4.16.bb => zabbix_8.0.0.bb}           | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_7.4.16.bb => zabbix_8.0.0.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.4.16.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_8.0.0.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_7.4.16.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_8.0.0.bb
index 568235e698..b66967b71d 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.4.16.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_8.0.0.bb
@@ -23,11 +23,14 @@ DEPENDS  = "libevent libpcre2 openldap virtual/libiconv zlib"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/7.4/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "0e2c391dc184acce8e34250e7326a51e19c8bcee31e67b8497f5526247ecd261"
+SRC_URI[sha256sum] = "55469ac599fd1443370ecf4288655d4d62109ad3a686711c4f3e0d428338ca77"
+
+UPSTREAM_CHECK_URI = "https://github.com/zabbix/zabbix/tags"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
 
 inherit autotools-brokensep pkgconfig systemd useradd
 
