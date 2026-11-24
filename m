Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11967.1795496988176837134
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KODwZ4XW;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3982; q=dns/txt;
  s=iport01; t=1795496988; x=1796706588;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3qj0hk5Y0WD25Yc/0mqBNW+YmvHxUuokwW68/mItnqQ=;
  b=KODwZ4XW+CHZX4jRxrE40V60TAFKvtzTNcBJv30y6QkWbGGNjSNWKPeF
   nfcnV+EgwwzT/6eQzSG48Oed2oTSsGL4aBFNjMd/Xw1CCmU3NF1jAeOkp
   bjNCYwKwanMhAQpvOdKaMXx9m6+WVXcJH8gVUDl7wEYBaOmhpB4JDFkkr
   v+eeQGA6wIexLaZKOMhQsNrYg9iTSGGTqbH41szS4wA2ACKDVw/ZIm4XL
   U0WioJ509P/SpZtXKPzZ/IqS1+KD1r421L0cGxtg6U6mOhLEJCDIIOnGB
   wO6i64tZc+SmEr26yAePxDOWZyxRJK4bnLXrrvbUGwOqX2qN3z0/TDHTl
   A==;
X-CSE-ConnectionGUID: AHqhTB7XSdea3cvChwYldg==
X-CSE-MsgGUID: dbK5CFISQOG8PHL+dCJjcQ==
X-IPAS-Result: =?us-ascii?q?A0BaAwBXGwVr/89K/pBaglmDTGFCSZNaAU+CIZ4sgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBkykCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyQSwEYARtCXESDAgGCdAIBEbsMgiyBAYMpAYFU2z8VgTiFQogkdoR9J?=
 =?us-ascii?q?xsbgXKEf4QKhn8EgiJ6Eo5rgVGISUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjOxeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnH?=
 =?us-ascii?q?x4bDgIfEAYWIQsbGA1IESw3FRkEPm4HlBSDGnQbBwGCDxgoTqUnoREKKIN5j?=
 =?us-ascii?q?CSVOhozqnKZCKRbhGqBaDyBWXAVgyIJShkP4H8jNQI7AgcCBw4DC5FogX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:NJCOz66kanv2+bAypX7KFAxRtGzGchMFZxGqfqrLsTDasY5as4F+v
 mIeXzvVPqqDMDChKNx1ao+2o0JQuMPSyoMxQAJr/CozZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOsPrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eFK0B+tpdXlF1+
 fERczsTRRCctua6z+fuIgVsrpxLwMjDNY4F/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO0In1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCzaIGFKofXG625mG6Ur
 EGb1ErYOSg9G4yn6R7G/lmOhOT2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7HQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:0HSwUK1sYrXxDLfN/evdZQqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: 9a23:Dt4Kb2Njq3YFFu5DcQl+9HI+RfAefnDUl3zOCE+nOGJlR+jA
X-Talos-MUID: 9a23:e85xUQauZMfl2uBTuzXP2RpMFfxRxIv+MGAp0pktmcuPDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60388356"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:09:44 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id F08F4180004B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:43 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 9FA7CCC124B; Mon, 23 Nov 2026 21:09:42 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 00/12] python3-virtualenv: Security fixes
Date: Mon, 23 Nov 2026 21:09:30 -0800
Message-Id: <20261124050942.1795310-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 05:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132910
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This series addresses twelve virtualenv CVEs in the Scarthgap
python3-virtualenv 20.25.3 recipe. Required upstream prerequisites and
follow-up corrections are carried as separate embedded patches.

The backports cover CVE-2024-53899, CVE-2026-113776,
CVE-2026-113732, CVE-2026-113726, CVE-2026-113725,
CVE-2026-113715, CVE-2026-113716, CVE-2026-113723,
CVE-2026-113720, CVE-2026-113719, CVE-2026-113721,
and CVE-2026-113722.

Hetvi Thakar (12):
  python3-virtualenv: fix CVE-2024-53899
  python3-virtualenv: fix CVE-2026-113776
  python3-virtualenv: fix CVE-2026-113732
  python3-virtualenv: fix CVE-2026-113726
  python3-virtualenv: fix CVE-2026-113725
  python3-virtualenv: fix CVE-2026-113715
  python3-virtualenv: fix CVE-2026-113716
  python3-virtualenv: fix CVE-2026-113723
  python3-virtualenv: fix CVE-2026-113720
  python3-virtualenv: fix CVE-2026-113719
  python3-virtualenv: fix CVE-2026-113721
  python3-virtualenv: fix CVE-2026-113722

 .../python3-virtualenv/CVE-2024-53899.patch   | 427 ++++++++++++++++++
 .../python3-virtualenv/CVE-2026-113715.patch  | 107 +++++
 .../python3-virtualenv/CVE-2026-113716.patch  | 117 +++++
 .../python3-virtualenv/CVE-2026-113719.patch  | 141 ++++++
 .../python3-virtualenv/CVE-2026-113720.patch  | 135 ++++++
 .../python3-virtualenv/CVE-2026-113721.patch  | 294 ++++++++++++
 .../python3-virtualenv/CVE-2026-113722.patch  | 207 +++++++++
 .../python3-virtualenv/CVE-2026-113723.patch  |  96 ++++
 .../python3-virtualenv/CVE-2026-113725.patch  |  76 ++++
 .../python3-virtualenv/CVE-2026-113726.patch  |  97 ++++
 .../python3-virtualenv/CVE-2026-113732.patch  |  66 +++
 .../python3-virtualenv/CVE-2026-113776.patch  | 148 ++++++
 .../bash-prompt-escaping-prerequisite.patch   |  42 ++
 .../bash-prompt-state-followup.patch          | 160 +++++++
 .../ensure-within-prerequisite.patch          | 107 +++++
 .../fish3-multibyte-quoting.patch             | 165 +++++++
 .../powershell-curly-quotes.patch             | 103 +++++
 .../seed-record-exclusive-write.patch         |  48 ++
 .../python/python3-virtualenv_20.25.3.bb      |  21 +-
 19 files changed, 2556 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2024-53899.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113715.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113716.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113719.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113720.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113721.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113723.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113725.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113776.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/bash-prompt-escaping-prerequisite.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/bash-prompt-state-followup.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/ensure-within-prerequisite.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/fish3-multibyte-quoting.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/powershell-curly-quotes.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/seed-record-exclusive-write.patch

-- 
2.35.6

