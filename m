Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7FFC07E97
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 02:56:00 +0000 (UTC)
Received: from ci74p00im-qukt09090301.me.com (ci74p00im-qukt09090301.me.com [17.57.156.20])
 by mx.groups.io with SMTP id smtpd.web11.63587.1701312954993834638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 18:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=uR/T3091;
 spf=pass (domain: subset.ch, ip: 17.57.156.20, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1701312953; bh=I/6K8LoQMyDI0k3wVPqatT8/zz2Upgi68eg04nIUw0Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=uR/T30919YCtHcWDT0ueBeq2g28j8cqISV3HACT1qJGUDgpZZr37z4oBNlvirgni/
	 DsjUYoBBfbrUWMwQDd8/vAtOSU55CXzhMm4+EbaUnWQ+9cK5Tqzo0Ehfig0KMg8V6X
	 /EH3XPQUOrpg4+/ZTQ1wBaekwHW+2CX/3zIEqhpMzeHRnw9Z2srLMmgwYfcpiYJY5O
	 kOpQ/tEbEe9DsqKWG6g713f8JAavPh1XaYG2ZywwMV1dxOulKTPvoXkkzDc02wC0LE
	 9QgOyYYFewz1pf+1wV5vU8Oek12cinluNAZjXYXN+1qHydVFMcfq/lZkizr8J4cqzG
	 q+5tbAzhomE7Q==
Received: from localhost.localdomain (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09090301.me.com (Postfix) with ESMTPSA id A82D5112022B;
	Thu, 30 Nov 2023 02:55:52 +0000 (UTC)
From: patrick.wicki@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [oe][meta-networking][PATCH 0/6] Update and improve squid
Date: Thu, 30 Nov 2023 03:55:23 +0100
Message-ID: <cover.1701312810.git.patrick.wicki@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: QQVYYLzyiv1xiVFo7XK8J8rfQZyLVp7E
X-Proofpoint-ORIG-GUID: QQVYYLzyiv1xiVFo7XK8J8rfQZyLVp7E
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=872 spamscore=0 malwarescore=0 clxscore=1030
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2311300020
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 02:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107153

From: Patrick Wicki <patrick.wicki@siemens.com>

Update to the latest upstream version and clean up / refresh patches.

While at it, I made the package more configurable. A lot of dependencies
are only relevant for authentication. We actually even remove the perl
RDEPENDS downstream along with disabling auth and things seem to work
just fine... But tbh I don't understand when and how exactly squid uses
perl, so I didn't feel comfortable including that change.

This is my first patch here, so I'm not very familiar with the
conventions yet. Commits are pretty fine-grained, and I omitted the
changelog since it'd be huge.

Patrick Wicki (6):
  squid: update from v5.7 to v6.5
  squid: add nm dispatcher reload hook
  squid: add auth packageconfig
  squid: move configs to sub package
  squid: add url-rewrite-helpers packageconfig
  squid: add systemd service

 ...for-Wno-error-format-truncation-comp.patch | 18 ++---
 ...quid-conf-tests-run-on-target-device.patch | 74 +++++++++++++++++++
 ...d-dynamic-ldb-link-test-in-configure.patch | 40 ----------
 .../files/Set-up-for-cross-compilation.patch  | 10 +--
 .../files/Skip-AC_RUN_IFELSE-tests.patch      | 25 +++----
 .../recipes-daemons/squid/files/run-ptest     |  1 +
 .../squid/files/set_sysroot_patch.patch       | 41 ----------
 ...-t-do-squid-conf-tests-at-build-time.patch | 61 ---------------
 .../recipes-daemons/squid/files/squid.nm      |  7 ++
 .../squid/{squid_5.7.bb =3D> squid_6.5.bb}      | 66 +++++++++++------
 10 files changed, 150 insertions(+), 193 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0002-squi=
d-make-squid-conf-tests-run-on-target-device.patch
 delete mode 100644 meta-networking/recipes-daemons/squid/files/Fix-flawe=
d-dynamic-ldb-link-test-in-configure.patch
 delete mode 100644 meta-networking/recipes-daemons/squid/files/set_sysro=
ot_patch.patch
 delete mode 100644 meta-networking/recipes-daemons/squid/files/squid-don=
-t-do-squid-conf-tests-at-build-time.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/squid.nm
 rename meta-networking/recipes-daemons/squid/{squid_5.7.bb =3D> squid_6.=
5.bb} (66%)

--=20
2.43.0


