Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25E8C61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:54:06 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3306.1788252844442102265
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2026 01:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AjqW6Lbc;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2038; q=dns/txt;
  s=iport01; t=1788252844; x=1789462444;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZKGXjcubxCoM7bdXn7QbNj+JbC2CFCK3EbP5H02jRzc=;
  b=AjqW6LbcyYT/3ca4aGXiuUBxQmqmbNsXKPYySRCdWbUEFlY47GsvJbho
   zhxRltd4zcHWvRffvwoG8Emd1alA5giIPhavGfMPf6kKNX33aRhnk4d3i
   qEG03EX82U0hAEtHNyxz+h72/dEfjgCfAqmXqIQym5NYWrY36DgtC1z1e
   QA3gVrltWYH4QjUJgkv8Mu4EpTcXQqX/f5SEX9XMP4qvCSFNO6JdsHqVu
   V6iNwbntQt2BxmuPfIVlJHZ54fYHs0r12Or8O6u4mVMO2fv4rVi4Rw7Nb
   P8GZO7U0KfO70omj7vbi6WX7wnEIVMLKklvzdgDZk6ADEMcOMFNwu4oe8
   A==;
X-CSE-ConnectionGUID: LwMWv0JkQ12BpjhhwOXQtw==
X-CSE-MsgGUID: uXe1WyQjRoSud9oGBB+xcA==
X-IPAS-Result: =?us-ascii?q?A0BaAwCMkZZq/4oQJK1aglmDS19CSZNZAYJwnh6Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY15AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQCAbwdgiyBAYMoAYFU2zwVBYEzhT+IInaEf?=
 =?us-ascii?q?CcbG4FyhH6ENFyFeASCInoSk2NIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQ0bBgWBHYEog0QjGTZ6gQlegSspYAESF4EJgggCgleCAwIBSUMOB0dTC?=
 =?us-ascii?q?SoCCQsYDUgRLDcVGQQ+bgeOXx+CUoEPgSYggRERB5Mgkj6hDwoog3aMIpU6G?=
 =?us-ascii?q?jOqbJkIpA1NhGmBaDyBWXAVgyIJShkP3lwkNQI7AgcCBw4DC5FqgXwBAQ?=
IronPort-Data: A9a23:VfcmRqvWUcYHm6cdnjXqVbWfU+fnVABfMUV32f8akzHdYApBsoF/q
 tZmKWrXOfqMazb0fosgPIix8EMGupPTyIBgGgdv/CA2Fy9GgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/Pb8Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw3vlSPn8W1
 /8hcWondhKDh/2R8IunVbw57igjBJGD0II3s3Vky3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWYQd/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKFIYTbHpUMwx/wS
 mTu4lT0Wy4LDd6lzgGY/iOrqcXl3jPwcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmcHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:32WQn6ynGPB9FnxwYUmlKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:ummH2mDKp9Uw/mj6Ew140XEKQuImSySH5m/SI0+nLlZQVKLAHA==
X-Talos-MUID: 9a23:oXrUZAmC4SeOqk4NnPEhdnp/BMox3LWXCnoKqogK6s6rHwYzKzy02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,255,1779148800"; 
   d="scan'208";a="830938151"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Sep 2026 08:54:03 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 7AAEF180008EA;
	Tue,  1 Sep 2026 08:54:03 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 13347CE1C04; Tue,  1 Sep 2026 01:54:03 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch v2 0/5] libssh: Fix multiple CVEs
Date: Tue,  1 Sep 2026 01:53:52 -0700
Message-Id: <20260901085357.1254306-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 08:54:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129620

From: Hetvi Thakar <hthakar@cisco.com>

Backport five upstream libssh security fixes to the 0.10.6 recipe on
 scarthgap:

 - CVE-2026-59843
 - CVE-2026-59844
 - CVE-2026-59846
 - CVE-2026-59848
 - CVE-2026-59850

Carry these as focused backports instead of upgrading libssh because
newer releases include API and functional changes outside the security
scope.

CVE-2026-15370 and CVE-2026-59849 affect libssh >= 0.11.0.
CVE-2026-59842 and CVE-2026-59851 affect only libssh 0.12.0 and rely on
code or features absent from 0.10.6. NVD correction requests have been
submitted for these inaccurate affected-version entries; therefore, no
CVE_STATUS entries are added.

The individual commits retain the upstream fix provenance and advisory
references for each CVE.

Testing:
- Applied all five patches to libssh 0.10.6 in series order without
  conflicts or fuzz.
- Package build completed successfully.
- Ptest completed successfully. 

Hetvi Thakar (5):
  libssh: Fix CVE-2026-59843
  libssh: Fix CVE-2026-59844
  libssh: Fix CVE-2026-59846
  libssh: Fix CVE-2026-59848
  libssh: Fix CVE-2026-59850

 .../libssh/libssh/CVE-2026-59843.patch        |  84 +++
 .../libssh/libssh/CVE-2026-59844.patch        |  52 ++
 .../libssh/libssh/CVE-2026-59846.patch        |  87 +++
 .../libssh/CVE-2026-59848-regression.patch    |  45 ++
 .../libssh/libssh/CVE-2026-59848.patch        | 684 ++++++++++++++++++
 .../libssh/libssh/CVE-2026-59850.patch        |  40 +
 .../recipes-support/libssh/libssh_0.10.6.bb   |   6 +
 7 files changed, 998 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59843.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59844.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59846.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59848-regression.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59848.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59850.patch

-- 
2.35.6


