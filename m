Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F04AC5DF97
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:02:25 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.700.1787335336650791888
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EzeXXb/U;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d5cad1a6baso12849055ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 11:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787335336; x=1787940136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h0uyvyBH+iOKSP3oW8+pEyXz4vOf/X7inkmCw06xgY0=;
        b=EzeXXb/U+ripaN1JYpmlQosqu5VlHh9cLMyk6/ylUzcimQ6m9tEJOSRt3CDIzZxcb5
         gohv+4nO7VG1R06pha9r52exvArFrJRV2M0On14Eue51tB5nPyaSeNg3rghqiz01/cln
         e29hXrO6VTmys18dqBOo84PMDvx4zKCg3uJ+6IclOVvqSmCNuW1TmEV/oIwK1K/acEMz
         UraqnUVkkjvGnwaKbOTmvBo+1lxecF+mP6xGk3z1J1XWGzGGXDsi84aHXHQTXHQECCBo
         NQPg/H502cmaQ/4Xp0fkuflA4En1xBXhykXYQNmbpW4eUXF8XtvvzMBObgu9nM0ezUTd
         6B4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787335336; x=1787940136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0uyvyBH+iOKSP3oW8+pEyXz4vOf/X7inkmCw06xgY0=;
        b=J7xzQlicNE5qfoaNAOA7q745Cd9d1jqCK/RhuSFCN3ybv16igZCGxJRPsYRGfdpAgG
         gMnVec8kr80Iot/Jh86jjG4UQisgMI3BAUVik/w/FaaaoWfGjJFNlXM4SjhgFFIk5gYu
         O8+MlWadxUoxTV381eKkXszbaTrb4FSvfXdgX4EPcKHmjwy6i99PnrvZ5UQMWZTo1Sln
         ReuhvgZ6iLlCcHs6kRQGrFysEJbIcQvU18Uvfx7N2a/ckTXdbRnKnmnEDCGZo1RyeDa7
         sWs6GD/gKZQUFbhCWJSStndhzlclxKY1y5unR3Mk8M/tWQd5VqbKJ6r0aDe1dU7PXTfH
         0I8g==
X-Gm-Message-State: AFuF++ng8q04H7HB/VbRwYpbIJAskL8qR3CBGyLflhf4mBpMggUwwOAd
	X+I28fMUxLP6NtSPm7l5tXfkyyfn5VCMUsYUenzQA+2hM8n9PYi8U+orWRZxUwQY
X-Gm-Gg: AR+sD12yKctdEW3yy/WIh1rVjstLBOwnsu+lv2xO4v0aW3piDDTb9hFMLcy1aqh1r0U
	k3cMksoMPepHVeFbHFs2yvyZl7f28oWyXD1Ec5Iws/KkYcIBY7a8+MkhmveeSBz4SrRtwwFbsWR
	I4Z2vfA4Qdpwj62Y5iSJcppRnDMKTIdNMNxJ298a7eOzE2T+3d/gF6IGCloi7IU3uUD7KXlOTt8
	4Kir8I3nDZaT2Rb1w9NYVqhmD4QyzP4OziAawtN6kF7Hy430FqFEv0f7FcNsI/qGeaPeFPwdG9S
	JWspCJesGdEokNCS72bOgU9fw/yupBEW+9U8ssOd2lXGGhclkTGpBJ0+TMtQiMvII5Wbn7WHOpd
	dz1tLcRD/YjPccDMmJUaSGiOS9bbP9VvqJJ15Pp34Nr6q5oiaotw5L0cpkdZ6DdgfbSU90B2G9e
	Fiz60IBmU/y8vOtmw2CGdpdc4pdPCcg+XAmx/Xtf9jfx2yhKt1uP82rC2Gfr+0rxJzBMSt5Wmhb
	j/3FTxPYeKhtVnhG6N2RTE8rWobYaMACpIokWFgzrJJDl+ctDYBK+++7BTVqGupqnSDRpi5cTo4
	sjZqLoVUXSvstOUqwe0cLQXBGk7GkIpy1zDb+Q1AG/yS3bG4KvN2barSbrTn13nK9RZFDVRPd7S
	1sUkrKi6lbxNYXPv9nj985CzS5Gjd7dZ/0/PELeqAXq6vrQ==
X-Received: by 2002:a17:902:f78f:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2d64ad92e17mr162464695ad.3.1787335335772;
        Fri, 21 Aug 2026 11:02:15 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb46sm26102708eec.3.2026.08.21.11.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:02:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/9] xdg-dbus-proxy: use VIRTUAL-RUNTIME_dbus for ptest RDEPENDS
Date: Fri, 21 Aug 2026 11:02:03 -0700
Message-ID: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 18:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129425

From: Khem Raj <raj.khem@gmail.com>

Hardcoding "dbus" makes the ptest image unbuildable on any distro that
selects a different system bus implementation. On a systemd distro
setting VIRTUAL-RUNTIME_dbus = "dbus-broker", do_rootfs fails to
solve:

  package dbus-broker-37 conflicts with dbus provided by dbus-1-1.16.2
  package systemd requires dbus-broker, but none of the providers can
    be installed
  package xdg-dbus-proxy-ptest requires dbus, but none of the providers
    can be installed

Depend on ${VIRTUAL-RUNTIME_dbus} instead so the ptest package pulls
in whichever bus the distro actually uses.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
index a8e0a651ad..eb21f701d6 100644
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
@@ -23,6 +23,6 @@ CVE_STATUS[CVE-2026-34080] = "fixed-version: fixed in 0.1.7"
 PACKAGECONFIG = "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[tests] = "-Dtests=true -Dinstalled_tests=true,-Dtests=false -Dinstalled_tests=false"

-RDEPENDS:${PN}-ptest += "dbus"
+RDEPENDS:${PN}-ptest += "${VIRTUAL-RUNTIME_dbus}"

 BBCLASSEXTEND = "native"

