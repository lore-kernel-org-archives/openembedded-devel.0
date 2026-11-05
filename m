Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30040.1793869208926666976
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=B5F62Jcf;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6159; q=dns/txt;
  s=iport01; t=1793869208; x=1795078808;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PpwJ06bwh6ezR1fgc7hcc45qC4k8DZO694g4ezYkGfY=;
  b=B5F62JcfIpphtHSwnqyA7bumwaW+zfZ3iwsA5+dKeRmuprbfbsgFqcqE
   CV68wKHWlslQVaZXYIAr/rozQbMXU8rByx1hQz94uZSjxrLu7cleAK3yZ
   wNAELVYKNrK7oMIGyB5+yK6okMh1X0fxSx/KfOWbeF3ANwdHqLY2HRxwI
   t8yYFLw6LKzE7b/A4+omioOV8I6Om6z0J5NyOeWVIU/5fqHBg9qu5DUog
   BJP+XmMrp6WDxWlxjvxdugalxGRKBwxtR2Kjd84/5qtWpFvZa+xHUrJmV
   6q0bn/ZZEBglS8OjN9qIHUEZHPFDmtdYonwgYvknXvz1FFHvm5/HPYiVU
   A==;
X-CSE-ConnectionGUID: mvjL86q7SCCa3Bwbe7wSaA==
X-CSE-MsgGUID: dIifEnyxTuq9M54TyzIIFQ==
X-IPAS-Result: =?us-ascii?q?A0BbAABRROxq/47/Ja1aHQEBAQEJARIBBQUBgX0HAQsBg?=
 =?us-ascii?q?0tgQ0mTWgFPgiGeJIF+DwEBAQ83GgQBAZMkAiY1CA4BAgQDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEKAQEFAQEBAgEHBYEOE4ZckEsBGAFdXB0BJoMCAYJ0AxG8KoIsgQGDK?=
 =?us-ascii?q?QGBVNs/FYE4AYU/iCN2hH0nGxuBcoR+iwkEgiJ6Eo5ygVSGcUiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCU?=
 =?us-ascii?q?YIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyO?=
 =?us-ascii?q?RAwHiQvBRwmQBsKGBgNSBEsNxUZBD5uB5Ivgh9yexMBByiBF2koBZMHBZJlo?=
 =?us-ascii?q?REKKIN4jCSVOhozqnGZCKRbhGmBagM3gVlwFYMiCUoZD+B/JjICOwIHAgcOA?=
 =?us-ascii?q?wuRaAImBAOBTwEB?=
IronPort-Data: A9a23:UcA+2aJjMm9U+dh3FE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS0GFUx
 mUYXG/VOP7fN2Hwc9h1bt7j9EIGvZHcn9I2QQId+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmYoajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1rEkMSbdMBpd1cKmgV3
 +MSJW8SVRmq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBULAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME6ojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsi+a2YYWIK4ziqcN9kmeZq
 E/A7nTFHwhLEYHD9SuX01OCv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1vfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:0az1nalEr3MhY9Kx6ef1Cmimt4XpDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3AO23ZHWgf12eQRtXFyEML5jzZaDJud2Pf6CeOOhC?=
 =?us-ascii?q?DIk1gE5eKQ1LP55htup87?=
X-Talos-MUID: 9a23:EwR/iQR29jkIxMSWRXTgpTBsGcF585izEREozMk6qtulFAJJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="536397598"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:07 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id BB2DE18000201
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:07 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 65419CC1611; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 00/18] python3-virtualenv: Security fixes
Date: Thu,  5 Nov 2026 00:59:49 -0800
Message-Id: <20261105090007.351866-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131882
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This 18-patch series backports upstream security fixes and adds CVE
applicability statuses for python3-virtualenv 21.2.1 on Wrynose.

The backports address configuration injection, seed-wheel verification,
shell activation and prompt escaping, unsafe filesystem writes and
cleanup, copied-file permissions, and temporary-cache handling.

The following 18 CVEs are covered by the security fixes:

 - CVE-2026-102925
 - CVE-2026-102930
 - CVE-2026-102938
 - CVE-2026-113713
 - CVE-2026-113714
 - CVE-2026-113715
 - CVE-2026-113716
 - CVE-2026-113717
 - CVE-2026-113719
 - CVE-2026-113720
 - CVE-2026-113721
 - CVE-2026-113722
 - CVE-2026-113723
 - CVE-2026-113725
 - CVE-2026-113726
 - CVE-2026-113732
 - CVE-2026-113776
 - CVE-2026-115586

CVE-2026-113714 and CVE-2026-113717 are addressed by the follow-up
backport included with CVE-2026-102930. The CVE-2026-113723 commit also
includes the CVE-2026-115586 follow-up to avoid introducing the prompt
handling regression from the initial upstream fix.

The series adds separate applicability statuses for three CVEs:

 - CVE-2026-102937: Windows cmd.exe batch activation is not selected
   for Linux interpreters. The exclusion is conditional on Linux;
   other platforms, including MinGW SDK builds, remain unexcluded.

 - CVE-2026-113718: The affected Xonsh activator is absent from
   virtualenv 21.2.1.

 - CVE-2026-113724: safe_delete() uses ignore_errors=True, making
   the vulnerable chmod error callback unreachable.

The package version remains unchanged at 21.2.1. Required upstream
prerequisites and follow-up fixes are included, together with the
python3-packaging runtime dependency needed for wheel verification.

Validation performed:

 - BitBake do_patch, do_compile and package build completed successfully
   for python3-virtualenv 21.2.1.

Hetvi Thakar (18):
  python3-virtualenv: fix CVE-2026-102938
  python3-virtualenv: fix CVE-2026-102930
  python3-virtualenv: fix CVE-2026-102925
  python3-virtualenv: fix CVE-2026-113732
  python3-virtualenv: fix CVE-2026-113776
  python3-virtualenv: fix CVE-2026-113726
  python3-virtualenv: fix CVE-2026-113725
  python3-virtualenv: fix CVE-2026-113723
  python3-virtualenv: fix CVE-2026-113715
  python3-virtualenv: fix CVE-2026-113720
  python3-virtualenv: fix CVE-2026-113719
  python3-virtualenv: fix CVE-2026-113721
  python3-virtualenv: fix CVE-2026-113716
  python3-virtualenv: fix CVE-2026-113722
  python3-virtualenv: fix CVE-2026-113713
  python3-virtualenv: Ignore CVE-2026-102937
  python3-virtualenv: Ignore CVE-2026-113718
  python3-virtualenv: Ignore CVE-2026-113724

 .../python3-virtualenv/CVE-2026-102925.patch  | 296 +++++++
 .../CVE-2026-102930-dependent.patch           | 115 +++
 .../CVE-2026-102930_p1.patch                  | 309 +++++++
 .../CVE-2026-102930_p2.patch                  | 293 +++++++
 .../CVE-2026-102930_p3.patch                  | 777 ++++++++++++++++++
 .../python3-virtualenv/CVE-2026-102938.patch  | 141 ++++
 .../python3-virtualenv/CVE-2026-113713.patch  | 113 +++
 .../python3-virtualenv/CVE-2026-113715.patch  | 165 ++++
 .../python3-virtualenv/CVE-2026-113716.patch  | 208 +++++
 .../python3-virtualenv/CVE-2026-113719.patch  | 207 +++++
 .../python3-virtualenv/CVE-2026-113720.patch  | 156 ++++
 .../python3-virtualenv/CVE-2026-113721.patch  | 477 +++++++++++
 .../CVE-2026-113722_p1.patch                  | 262 ++++++
 .../CVE-2026-113722_p2.patch                  |  50 ++
 .../python3-virtualenv/CVE-2026-113723.patch  | 233 ++++++
 .../python3-virtualenv/CVE-2026-113725.patch  |  88 ++
 .../CVE-2026-113726-dependent.patch           | 168 ++++
 .../python3-virtualenv/CVE-2026-113726.patch  | 149 ++++
 .../CVE-2026-113732_p1.patch                  | 116 +++
 .../CVE-2026-113732_p2.patch                  | 120 +++
 .../python3-virtualenv/CVE-2026-113776.patch  | 133 +++
 .../python3-virtualenv/CVE-2026-115586.patch  | 526 ++++++++++++
 .../python/python3-virtualenv_21.2.1.bb       |  31 +
 23 files changed, 5133 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102925.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930-dependent.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102938.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113713.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113715.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113716.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113719.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113720.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113721.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113723.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113725.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726-dependent.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113776.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-115586.patch

-- 
2.35.6

