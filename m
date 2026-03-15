Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D25D58B2C
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:35:41 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28880.1773581740338626301
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hDE2EAB5;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3641; q=dns/txt;
  s=iport01; t=1773581740; x=1774791340;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0GFuJ51d8t/dOWee8RQcm0wQ5Ef5rUF4Z8dGh2EaGtY=;
  b=hDE2EAB5z1YjuLpayA2uJXubTk2JXHSe2viWTV643ZRQR2ArsQ1srC9G
   cuF9IWjs2DfuVfCAkIrIBmBiZMBAERW+fmPcxXe+xsNY+x8FVVUIxMmXs
   JirecgfXfAxrWx+okcLtDe8SCE1VQshGFo3+JOJ8uePe44QbNZX3Gmsbu
   DWTB4Zuv+BdeB0dpIpvUx/jc0ttupq+4sIdvbu7/G2+fbjpdJ8SLyLUCO
   Xv9w7ye6ADTrHAtRf9Mc1H6GPtGTyyqS/zCieu5CCH6Ikqnx6+UBOKskh
   w1Jqz9O1zXpZAbjhb/UnOZt60mKG0bysS9H4CSh/SIRGbi7RnUuVqStXs
   g==;
X-CSE-ConnectionGUID: 5UUczptjQkiYJ7fjdFJbmw==
X-CSE-MsgGUID: RxIb+EX6RDiKd/CzPoCWdg==
X-IPAS-Result: =?us-ascii?q?A0BvCgCjtLZp/5T/Ja1aglmCSIEAX0JJA5QngiGeHYF/D?=
 =?us-ascii?q?wEBAQ89FAQBAZIrAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZchxMBGAFdXESDAgGCcwIBEbFrgiyBAYMoAYFT2zIVgTiFPIgZd?=
 =?us-ascii?q?IR6JxsbgXKEB4FhGgGKAQSCInoUgXmFQgaDNYg2SIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsFCMUGwQ+bgeNe?=
 =?us-ascii?q?j2CNIEPgTwKaSgRIaVCoQ4KKIN0jB6VOhozqmuETJQ6pAlQhGiBagE5gVlwF?=
 =?us-ascii?q?YMiCUkZD444zSQjNQIBBTYBBwIHDgKBc5F9AQE?=
IronPort-Data: A9a23:yHoNZquSqUyXQUsKP0HOCYppcufnVAZfMUV32f8akzHdYApBsoF/q
 tZmKTrQOKyJYjajeowgad++oxlV68PcndVhQQdk+3xgRn8SgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs/na9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwp9tKCnNW6
 f4hKzE8TE+Nhe6Y4ri+Vbw57igjBJGD0II3oHpsy3TdSP0hW52GGvyM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtHYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoLbG5wKwB/B/
 Qoq+UzDEjAQd/GvlwCp81GgwcTdpSTQZ44dQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:Mf6T/q8Pqh6VdLJ2vm9uk+DNI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0WMnqAeQfxEXMYVmpM
 JdT5Q=
X-Talos-CUID: 9a23:bmITJGHCO9w7cu0aqmI6yXMfCNg5cETezUbyfEG6BUhLQriKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A9+M64AwhIiiOEcawijI9H1LOg3maqJ6+KUpOvKV?=
 =?us-ascii?q?YgeWFFiA3ECWlix+IToByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="696176113"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:39 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 5179B18000261
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:39 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id EC8EBCC12B5; Sun, 15 Mar 2026 06:35:38 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 0/24] Pull request (Cover letter only)
Date: Sun, 15 Mar 2026 06:34:17 -0700
Message-Id: <20260315133441.3034831-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125219

From: Deepak Rathore <deeratho@cisco.com>

This series extends a set of recipes to support native and nativesdk variants.
These packages are needed as host or SDK artifacts in certain dependency chains
(e.g., perf/tracing and networking toolchains), where dependency resolution
fails when only the target variant exists.

None of the changes alter target package behavior; they solely enable the
required native/nativesdk build paths.

Testing:
  - Built each recipe as native/nativesdk on x86-64 with no errors.
  - Verified existing target builds are unaffected.

Deepak Rathore (24):
  libburn: extend recipe for nativesdk builds
  libisoburn: extend recipe for nativesdk builds
  libisofs: extend recipe for nativesdk builds
  iscsi-initiator-utils: extend recipe for native/nativesdk builds
  open-isns: extend recipe for native builds
  tcpdump: extend recipe for native/nativesdk builds
  nodejs: extend recipe for nativesdk builds
  libyang: extend recipe for native/nativesdk builds
  libtracefs: extend recipe for native/nativesdk builds
  trace-cmd: extend recipe for native/nativesdk builds
  audit: extend recipe for native builds
  cunit: extend recipe for nativesdk builds
  python3-arrow: extend recipe for native/nativesdk builds
  python3-fastnumbers: extend recipe for native/nativesdk builds
  python3-future: extend recipe for nativesdk builds
  python3-icu: extend recipe for native/nativesdk builds
  python3-ipy: extend recipe for nativesdk builds
  python3-jsonpatch: extend recipe for native/nativesdk builds
  python3-natsort: extend recipe for native/nativesdk builds
  python3-ordered-set: extend recipe for native/nativesdk builds
  python3-sh: extend recipe for native/nativesdk builds
  python3-tabulate: extend recipe for native/nativesdk builds
  python3-types-python-dateutil: extend recipe for native/nativesdk builds
  python3-websocket-client: extend recipe for native/nativesdk builds

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb           | 2 +-
 meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb        | 2 +-
 meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb          | 2 +-
 .../iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb               | 1 +
 meta-networking/recipes-support/open-isns/open-isns_0.102.bb           | 1 +
 meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb              | 1 +
 meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb                      | 2 +-
 meta-oe/recipes-extended/libyang/libyang_3.13.6.bb                     | 1 +
 meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb                  | 1 +
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb                    | 1 +
 meta-oe/recipes-security/audit/audit_4.1.3.bb                          | 2 ++
 meta-oe/recipes-test/cunit/cunit_2.1-3.bb                              | 2 +-
 meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb             | 1 +
 meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb       | 1 +
 meta-python/recipes-devtools/python/python3-future_1.0.0.bb            | 2 +-
 meta-python/recipes-devtools/python/python3-icu_2.16.1.bb              | 2 ++
 meta-python/recipes-devtools/python/python3-ipy_1.01.bb                | 2 +-
 meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb          | 1 +
 meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb           | 1 +
 .../recipes-devtools/python/python3-ordered-set_4.1.0.bb               | 2 +-
 meta-python/recipes-devtools/python/python3-sh_2.2.2.bb                | 1 +
 meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb          | 1 +
 .../python/python3-types-python-dateutil_2.9.0.20241003.bb             | 1 +
 .../recipes-devtools/python/python3-websocket-client_1.7.0.bb          | 1 +
 24 files changed, 26 insertions(+), 8 deletions(-)

-- 
2.35.6

