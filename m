Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314B4C7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:34:46 +0000 (UTC)
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
 by mx.groups.io with SMTP id smtpd.web10.3140.1750433679672916102
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@geanix.com header.s=protonmail header.b=kDm3s681;
 spf=pass (domain: geanix.com, ip: 79.135.106.111, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1750433676; x=1750692876;
	bh=Yk1zFgyecFDb4/39+a/Vo4ra0Sexm4MJR/Z0cUbIh2k=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kDm3s681BE+Ejwd0i4U/vPmZzBuimgJQTQzB1iLCR7sdnVD10wmi03PZgW1Yg73Gx
	 WYuGuLmqfJDgn2nqs3TB/BjJmT8PQbr7DQ5mvTN/lNobj7HCrcrRXwrkqULT2qYTDK
	 DBz+dG19lFBQi40RCmuF2oAKL5YLJ219AK7JHqFKnVYEDY/scmL79Q8lnO+ORTBLf5
	 08pm4ERposTmZrI7CwjtjQG66ttktzE7A3ZGx7YwLIyV1FHEnbivgRt9ug8pY27rOL
	 1ETzloMQ02+hYtLxpc1Q5m9aYK5zM5TeNeItwbxmS+mM7X84MZ47zo6+J9ENYNjxG3
	 g022PXXklRFRw==
X-Pm-Submission-Id: 4bP1k32sYGz1DDr6
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH meta-oe v2 0/2] syslog-ng: Add stomp and examples
 PACKAGECONFIG options
Date: Fri, 20 Jun 2025 17:34:28 +0200
Message-Id: <20250620-syslog-ng-stomp-v2-0-3c9a2da1dcd0@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIR/VWgC/3WNQQqDMBBFryKz7pRJsMF21XuIi6jTOFATSSQo4
 t0b3Hf5+Lz3D0gchRO8qgMiZ0kSfAF9q2CYrHeMMhYGTfpBRhOmPX2DQ+8wrWFecLR13xiljGk
 IirVE/sh2FVuYebUYGLoyTFKEuF9PWV3z32hWSFjXZHp6smJNb8fWy3YfwgzdeZ4/lw7KErgAA
 AA=
X-Change-ID: 20250620-syslog-ng-stomp-da4b86116680
To: openembedded-devel@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750433674; l=901;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=iMt6VGbyX1vpDTemRtwQVLxFWUmXgfJV+ZEE68+m3IU=;
 b=eUqTF+W1PhkbHY9n2CoTjd8mC+dxsJGg4ab28o6QP2NINsM5HibIAhYUtfvVw1uvwhOe8tfJd
 UVD8E1MIR93Av4K2D2OghDZyNtk/0cn27sCX51eb2+xfUHEjP+ICAqB
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117976

While STOMP module is optional in syslog-ng, we have been enabling it by
default without PACKAGECONFIG support to disable it since forever.

This change disables it (and example modules), requiring anyone actually
wanting it to enable it through PACKAGECONFIG.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Changes in v2:
- Fixed typo/copy-paste error in stomp PACKAGECONFIG option (sorry!)
- Link to v1: https://lore.kernel.org/r/20250620-syslog-ng-stomp-v1-0-4406b09e1e20@geanix.com

---
Esben Haabendal (2):
      syslog-ng: Add stomp PACKAGECONFIG option
      syslog-ng: Add examples PACKAGECONFIG option

 meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb | 2 ++
 1 file changed, 2 insertions(+)
---
base-commit: 820047afe48a0d48056f4752defc3d2803c9d906
change-id: 20250620-syslog-ng-stomp-da4b86116680

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


