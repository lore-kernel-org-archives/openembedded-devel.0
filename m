Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D31CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 14:07:24 +0000 (UTC)
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
 by mx.groups.io with SMTP id smtpd.web10.6873.1757315945653696324
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Sep 2025 00:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prolan.hu header.s=mail header.b=Cpg9OVOl;
 spf=pass (domain: prolan.hu, ip: 193.68.50.107, mailfrom: csokas.bence@prolan.hu)
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id F0394A0487
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Sep 2025 09:19:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:in-reply-to:message-id:mime-version:references:reply-to
	:subject:subject:to:to; s=mail; bh=TuahX7XSvKvwvEmbmKSPKV9ffLnvr
	UzSh2YKoyq28Js=; b=Cpg9OVOlg/DM1voP811pdJ9HW+/XySEUKLQQ6XXEGHLu1
	iFUORTTae8Q7haQxI8+FqPgAfn1hJOUX9hjMHs0dn9bJVqXkMGdQQvu+jggrDxSA
	ybPcFGJXJ/dDszceXQ9c1ySCyNHNV/XMnqmDFhRBdDNqZlscRkvHyUYwP3QH3U2Z
	wSLvI8DlTJNv9k9TmHbKmaEduB6i5eMibKC1sOCa5gwx24M6dOrweGKY9Xd89Ddq
	9FSRb1VCANp9BI58rBetG6ijbPArrHei0+JGdTqX2Rgx6sduAN+gO7cY+YDhAZN8
	lK4v5FNreL7502hzoHSKtRxnU3tn8pyK9RFMx+1Vla4Es8eSB3nywBGlZfwMF0M6
	nzMEhW3ykIvYUKmnIfzw1U16JmWOH+iwhn7F0lFJVDMApi8oGPGHktTYYtD+SXTk
	aSxTFMDI4++JxRFjkAGTPefKFfxk0JdrIdaTssZTbGzypRKaAsdm1exhQxudeT7e
	jwtF0j9NANsOms34poju1CVor3VEPntlX3gKrN4qFPVNrw6lIyPl5+j6GxZ1G9Ho
	L4yWxJS/UhsHRpGbEVUSo9h0u+ynB669Ny9i8gGABhbPX1GVW5O1AOIFn+JeT3EN
	I8oT6f/hA+vcMCRy6JAOKHhDX8DaQKWDFAJBA96X4rrqpMu6GN7s92w8vj7eKg=
Message-ID: <661a3c9e-1241-40aa-9ae3-2cf65d603878@prolan.hu>
Date: Mon, 8 Sep 2025 09:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: [meta-oe][scarthgap][backport-request] Re: Cannot start phc2sys on scarthgap
To: <openembedded-devel@lists.openembedded.org>
References: <0e42cad2-4d7b-4adf-9947-c3b431e09a1b@prolan.hu>
In-Reply-To: <0e42cad2-4d7b-4adf-9947-c3b431e09a1b@prolan.hu>
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E627560
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 14:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119334

Hi,

please backport commit 31f0b9d3d51a ("linuxptp: Add systemd instance=20
specifier for ptp4l dependency") to scarthgap.

Bence

On 2025. 08. 26. 11:50, Cs=C3=B3k=C3=A1s Bence wrote:
> Hi,
>=20
> There is a bug [1] in the service file of phc2sys that was fixed [2] in=
=20
> upstream OpenEmbedded. This fix was however not backported to scarthgap=
.=20
> Please backport this fix.
>=20
> Bence
>=20
> [1] https://bugs.launchpad.net/ubuntu/+source/linuxptp/+bug/2119028
> [2] https://git.openembedded.org/meta-openembedded/commit/meta-oe/=20
> recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.service.in?=20
> id=3D31f0b9d3d51a65b1c3d63eb6520e7ab174a8550c



