Return-Path: <erwann.roussy@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14E5C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:20:30 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.120659.1669648820977387696
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 07:20:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=dfc430d2-d198-11ec-948e-34200cb392d2 header.b=FvxtQVeq;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: erwann.roussy@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B8EEA9C06E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 10:20:19 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 0maXeCpPSVkK
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2022 10:20:19 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 336D39C07B9
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 10:20:19 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 336D39C07B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1669648819; bh=0XWwewQP35HoSlAudDEksv2LdsvIzW4Rm1Lb3f0c+xY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=FvxtQVeq0YMg6m6nxb8u1VK+J+jgLnVmx+ggGMDq/RVOHr+yFtBRANbefP7U+TV9b
	 na0b6m4qjYC4Zr+w6+fmebeq7Qnt4XwIwxAmT/wtAVltWrST86Cs1IgdlPFfzOkjOK
	 8YvH80B+mUS+Pb8bCt+4kZpX72nNkdKQsh+ElcSOQGm5zkOuoe2KBcBizTj4BNScEE
	 dOYj4VR+noPLvVRacTK6Y7wSsvIpn7BAtC5kW2kuhG+sxhVFDTMOsOjHYw9wKcHEGt
	 zgh8m19tKznIvs7u6aI5M/NNKeMAu6ZXJ6FYWK39HPfD7Qfd+Zuu6RWw0Tor0FnMI/
	 s6aIKb3W+JmTQ==
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id J5mQMWRzgDWZ
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2022 10:20:19 -0500 (EST)
Received: from jean.bzh.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C2CCA9C06E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 10:20:18 -0500 (EST)
From: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][meta-oe][PATCH 0/3] Add tuna recipe and dependencies
Date: Mon, 28 Nov 2022 16:19:14 +0100
Message-Id: <20221128151916.3541948-1-erwann.roussy@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 15:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99826

Tuna a is cui/gui tool for tuning of running processes.
It is helpful to show and change irq affinity on an embedded system.
This series add tuna recipe and its two dependencies.



