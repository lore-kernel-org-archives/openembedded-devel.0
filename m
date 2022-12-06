Return-Path: <erwann.roussy@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76D9C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 10:35:11 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.44721.1670322904326255027
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Dec 2022 02:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=dfc430d2-d198-11ec-948e-34200cb392d2 header.b=gGDkbe6w;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: erwann.roussy@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D55099C0721;
	Tue,  6 Dec 2022 05:35:02 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ud-n3tFuVFup; Tue,  6 Dec 2022 05:35:02 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4F3539C0695;
	Tue,  6 Dec 2022 05:35:02 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 4F3539C0695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1670322902; bh=WvjC1R0j/RPOdR61G118addNWlEF3l35YKh8OfveNpw=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=gGDkbe6wLsXRXQ6KnljCLCv/V6LvFeVnzMe0flP65HyKJGWM7Uhv0+bK/Y6D3c4Aw
	 hNTcjKxdh/Wl49uv58V0Wi+vzi+2TRjiB0EQ757yG7sOrQ9V0ksgfOoqt3GOlYkftY
	 25TVpheikyvs163FgN27P6tElfXhBwiwO96B/0peqGkykO+2JCpcNCncCd4CB2J4FH
	 OtISCPycbdrWtwetAsQt8itZZFGhU3XwEqrmXWXtvglalxz+5neShnK4rfg2xjg6x9
	 1KIaaD7cf5ReDFS8B56LecMpMW8BO7tBLY5nRRhijMQHMGd6phse/K8P9wVkBtMfhB
	 dmFl1xkNLKuiQ==
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id l-t3wWsmerYB; Tue,  6 Dec 2022 05:35:02 -0500 (EST)
Received: from jean.bzh.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C67449C0680;
	Tue,  6 Dec 2022 05:35:01 -0500 (EST)
From: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-python][PATCH v2] Add tuna recipe
Date: Tue,  6 Dec 2022 11:34:44 +0100
Message-Id: <20221206103444.255618-1-erwann.roussy@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 10:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99957

Tuna a is cui/gui tool for tuning of running processes.
It is helpful to show and change irq affinity on an embedded system.
This series add tuna recipe and its two dependencies.

Changes since v1 :
- Tuna has been moved in meta-python instead of meta-oe. This is because
  tuna depends on python3-linux-procfs which is in meta-python and
  meta-oe does not depends on meta-python.
- python3-linux-procfs and python3-schedutils are not part of this serie
  anymore cause they are already merged in meta-python.
- python3-schedutils was removed from tuna RDEPENDS cause I discoverd it
  was not required anymore.



