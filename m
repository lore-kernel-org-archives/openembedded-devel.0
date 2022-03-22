Return-Path: <embedded@vivavis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC1CC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 11:18:20 +0000 (UTC)
Received: from mx-relay77-hz1.antispameurope.com
 (mx-relay77-hz1.antispameurope.com [94.100.132.239])
 by mx.groups.io with SMTP id smtpd.web12.8505.1647947897552738943
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vivavis.com header.s=hse1 header.b=d6X5zE4g;
 spf=pass (domain: vivavis.com, ip: 94.100.132.239,
 mailfrom: prvs=0073b3416d=embedded@vivavis.com)
Received: from unknown ([185.80.187.2]) by mx-relay77-hz1.antispameurope.com;
 Tue, 22 Mar 2022 12:18:15 +0100
Received: from grp-ex01.Vivavis.int (192.168.17.53) by grp-ex01.Vivavis.int
 (192.168.17.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Tue, 22 Mar
 2022 12:18:10 +0100
Received: from grp-ex01.Vivavis.int ([::1]) by grp-ex01.Vivavis.int ([::1])
 with mapi id 15.02.0986.015; Tue, 22 Mar 2022 12:18:10 +0100
From: "embedded (VIVAVIS AG)" <embedded@vivavis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Question about usage of FILESEXTRAPATHS variable
Thread-Topic: Question about usage of FILESEXTRAPATHS variable
Thread-Index: Adg91SEdHgwuh9HUQh2/fgTfU7s7tw==
Date: Tue, 22 Mar 2022 11:18:10 +0000
Message-ID: <2261745fc01a4e3887ee98f98a425e88@vivavis.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.1]
x-g-data-mailsecurity-for-exchange-state: 0
x-g-data-mailsecurity-for-exchange-error: 0
x-g-data-mailsecurity-for-exchange-sender: 23
x-g-data-mailsecurity-for-exchange-server: 
 61419075-592b-4c8d-b7a0-bf1d145a8b8e
x-c2processedorg: 2f045ba3-9b34-4118-a5bd-6c10d5957477
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-cloud-security-sender: embedded@vivavis.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay77-hz1.antispameurope.com with 1521A61F8C8
X-cloud-security-connect: unknown[185.80.187.2], TLS=1, IP=185.80.187.2
X-cloud-security-Digest: bee5a159ea1869a9c91d7c94ff8615cb
X-cloud-security: scantime:1.582
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=vivavis.com; h=from:to
	:subject:date:message-id:content-type:content-transfer-encoding
	:mime-version; s=hse1; bh=JvoQ663oWYQi68A2GcKkE7TYQhDyA9NYshQYMb
	BRhBU=; b=d6X5zE4gsAeI3EcZldLEdoU3SUkXexG59gui4fFT2eX00Aq/dAur57
	9PrENzO2xCtPFb5l37P93HnKV5ppM0TU4d4LtCOTMg6Ua2/Tbhru+AyltH9V3o/N
	o2ayvpVZ4GwKDx/NxVTxlcMe8XIVDbH60uO1jI7vPT0rwITpZ7gL3QfXaWoTVuRO
	WMe9TgmEueGqj1sipybDJvcMo4ht1C/9iXE59kvCGwCYVumFmuOAgMflqdgN+Fm1
	Kozb6cDS0ozI6o+VfQIuL+3+E3kHM8LsN0OOjEHZLhSGchHjj3ZrttnEnt4qfN7o
	UdUNH0ZPQqw4dicwo4zFFYxPoqjbNNIA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 11:18:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96134

Hi,

I wonder which assignment is correct within an append file.

FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
or
FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${BPN}:"

The development manual (latest version) shows in chapter 3.1.2:
  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${BPN}:"

But in chapter 3.1.5 the recipes-bsp/formfactor append file uses
  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"

The reference manual only shows examples using ${PN}.

I've searched for ${BPN} usage in Poky and found only this one
./meta-poky/recipes-core/busybox/busybox_%.bbappend:FILESEXTRAPATHS_prepend=
 :=3D "${THISDIR}/${BPN}:"

Without additional prefix or suffix added, should I use ${PN} or ${BPN}?
Are there possible pitfalls from using ${BPN} instead of ${PN}?
When appending for a native recipe only, it seems clear to write ${BPN}-nat=
ive.

It would be nice to shed some light onto this topic.

Thank you,

Carsten

