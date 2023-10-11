Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B39CDB46A
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 16:34:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21326.1697042036138678450
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 09:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87D8814BF;
	Wed, 11 Oct 2023 09:34:36 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41AF23F7A6;
	Wed, 11 Oct 2023 09:33:55 -0700 (PDT)
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego.Sueiro@arm.com,
	Rahul.Singh@arm.com
Subject: [meta-oe][PATCH 0/3] Update linuxptp version to 4.1
Date: Wed, 11 Oct 2023 17:33:43 +0100
Message-Id: <20231011163346.1856498-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 16:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105426

Hi all,

this serie provides an update for the linuxptp recipe to use the latest v=
ersion
for the package (4.1).

It also install the default configuration file for ptp4l under /etc/linux=
ptp
and provides useful systemd services that are taken from the Ubuntu/Debia=
n .deb
package (unfortunately linuxptp doesn't provide them yet), files are from=
 here:

https://salsa.debian.org/multimedia-team/linuxptp/-/tree/master/debian

Luca Fancellu (3):
  linuxptp: update linuxptp recipe to 4.1
  linuxptp: install default configuration file in sysconfdir
  linuxptp: add systemd services

 .../0001-include-string.h-for-strncpy.patch   |  8 +--
 ...ditional-assignment-for-KBUILD_OUTPU.patch | 42 --------------
 .../linuxptp/Use-cross-cpp-in-incdefs.patch   |  8 ++-
 ...-Allow-CC-and-prefix-to-be-overriden.patch | 12 ++--
 .../linuxptp/systemd/phc2sys@.service         | 13 +++++
 .../linuxptp/linuxptp/systemd/ptp4l@.service  | 11 ++++
 .../linuxptp/linuxptp_3.1.1.bb                | 33 -----------
 .../linuxptp/linuxptp_4.1.bb                  | 58 +++++++++++++++++++
 8 files changed, 95 insertions(+), 90 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-m=
akefile-use-conditional-assignment-for-KBUILD_OUTPU.patch
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/system=
d/phc2sys@.service
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/system=
d/ptp4l@.service
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.=
bb
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb

--=20
2.34.1


