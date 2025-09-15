Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC13BCAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 10:58:56 +0000 (UTC)
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
 by mx.groups.io with SMTP id smtpd.web11.28897.1757930041288821704
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Sep 2025 02:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prolan.hu header.s=mail header.b=b3hKknJL;
 spf=pass (domain: prolan.hu, ip: 193.68.50.107, mailfrom: csokas.bence@prolan.hu)
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 94370A054D;
	Mon, 15 Sep 2025 11:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=UcOENckNb6ZlgXXSuMjN
	jDapZbdO8JfiAhZY4SWq+BQ=; b=b3hKknJLxkFPincwiV//FqS7hLd0QPRxxici
	kIMsHhPHifH33VBbXUotgLE5OS6ZoNfc1oHFeup+4TbWmA8HxfAbUu0b0v5cg1ef
	CFmnjG6OvMzPchCaXvZ45XSwZmVG+bOpDzj+QsEYxU7CBPYT3XdvfZDVBXsb84b9
	L5iSoWn6uCARJDbOUKGQ6cXq++lFtC7A95sK7N6nhvAKKJZE+Es2D9pv5sFkegTe
	40bw8bJiJ5uKeCRzxUKMpINK+VhoKVb0XDMsP7MAXWvKH9ovAiZ+dWGT7ZvEOycq
	AzZMWOqVcBxcXEpFnmJhoeMt5LUeLh7CUVRtpt9eOgoQzkS7JiEOzDIvnatE1LlV
	nkl4KcUAIz48TuYTFILWhqZyPY37b4/kmZdaimVnRFE0P3QUJj9TNdbgsQCy9HYy
	12DKQmf8dTefCnlSf7lE+9iYsTKodSWjTLfvhwp+gNTQs44Dpb9a9+DUnUh/S1G2
	QC8nWuJU4qWZkr+Cz6+2cBiW2eKcKuk8xjpxiDl32Ki00MdfKiCwcX6u/BOBzRIW
	FVQkGwb0LsZ4M4a0FBNgIFsbedR+rYfWx7tPzNK7ChInYMi62LW+wd5jx5lJ2KUT
	vcJ02JFZHYOZWR9cXOhEkQMjjM+M9ulGfeM7TDrK40isRlShOQPF9f3HpX4B2SkY
	TKo2vOQ=
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
To: <openembedded-devel@lists.openembedded.org>
CC: Martin Schwan <m.schwan@phytec.de>, Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Subject: [meta-oe][scarthgap][PATCH] linuxptp: Add systemd instance specifier for ptp4l dependency
Date: Mon, 15 Sep 2025 11:53:11 +0200
Message-ID: <20250915095310.800122-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0e42cad2-4d7b-4adf-9947-c3b431e09a1b@prolan.hu>
References: <0e42cad2-4d7b-4adf-9947-c3b431e09a1b@prolan.hu>
MIME-Version: 1.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1757930036;VERSION=7998;MC=1082431426;ID=39116;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2998FD515E627266
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 10:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119406

From: Martin Schwan <m.schwan@phytec.de>

Add the instance specifier to the ptp4l dependency for the phc2sys
service, so the corresponding service is automatically started
correctly. This fixes the following error messages, when starting the
phc2sys@... service:

    Failed to restart phc2sys@eth0.service: Unit ptp4l.service not found.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 31f0b9d3d51a65b1c3d63eb6520e7ab174a8550c)
Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>
---
 .../linuxptp/linuxptp/systemd/phc2sys@.service.in             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2s=
ys@.service.in b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/p=
hc2sys@.service.in
index f66dd2d010..7d1d975ea3 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.ser=
vice.in
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.ser=
vice.in
@@ -1,8 +1,8 @@
 [Unit]
 Description=3DSynchronize system clock or PTP hardware clock (PHC)
 Documentation=3Dman:phc2sys
-Requires=3Dptp4l.service
-After=3Dptp4l.service
+Requires=3Dptp4l@%i.service
+After=3Dptp4l@%i.service
 Before=3Dtime-sync.target
=20
 [Service]

base-commit: 205638f9edf8e1aa1fbcf28555625fe56f2701a5
--=20
2.43.0



