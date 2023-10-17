Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F09ECDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:32:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.215066.1697549547665024187
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ED9D2F4;
	Tue, 17 Oct 2023 06:33:07 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10CFF3F5A1;
	Tue, 17 Oct 2023 06:32:25 -0700 (PDT)
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: diego.sueiro@arm.com,
	rahul.singh@arm.com
Subject: [PATCH 0/2] Updates to the linuxptp recipe
Date: Tue, 17 Oct 2023 14:32:12 +0100
Message-Id: <20231017133214.1562048-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 13:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105554

In this serie I am itroducing templates for the systemd services, to incr=
ease
the portability and I'm also reducing the number of downstream patches.

Luca Fancellu (2):
  linuxptp: Drop unneeded downstream patches
  linuxptp: Use templates for the systemd services

 .../linuxptp/Use-cross-cpp-in-incdefs.patch   | 28 ---------------
 ...-Allow-CC-and-prefix-to-be-overriden.patch | 35 -------------------
 .../{phc2sys@.service =3D> phc2sys@.service.in} |  2 +-
 .../{ptp4l@.service =3D> ptp4l@.service.in}     |  2 +-
 .../linuxptp/linuxptp_4.1.bb                  | 17 +++++----
 5 files changed, 12 insertions(+), 72 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cr=
oss-cpp-in-incdefs.patch
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/build-=
Allow-CC-and-prefix-to-be-overriden.patch
 rename meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/{phc2sys@.=
service =3D> phc2sys@.service.in} (85%)
 rename meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/{ptp4l@.se=
rvice =3D> ptp4l@.service.in} (73%)

--=20
2.34.1


