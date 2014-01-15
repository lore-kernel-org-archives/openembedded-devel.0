Return-Path: <t_dufff@yahoo.ca>
Received: from nm27-vm4.bullet.mail.gq1.yahoo.com
	(nm27-vm4.bullet.mail.gq1.yahoo.com [98.136.216.147])
	by mail.openembedded.org (Postfix) with ESMTP id 647A06B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 19:52:10 +0000 (UTC)
Received: from [216.39.60.183] by nm27.bullet.mail.gq1.yahoo.com with NNFMP;
	15 Jan 2014 19:52:11 -0000
Received: from [98.137.12.204] by tm19.bullet.mail.gq1.yahoo.com with NNFMP;
	15 Jan 2014 19:52:11 -0000
Received: from [127.0.0.1] by omp1012.mail.gq1.yahoo.com with NNFMP;
	15 Jan 2014 19:52:11 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 71623.47756.bm@omp1012.mail.gq1.yahoo.com
Received: (qmail 53511 invoked by uid 60001); 15 Jan 2014 19:52:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s1024;
	t=1389815530; bh=i1I2uHh+wFnYfAYWTilRnNiRDbBq1jDuhau7GmTvmNo=;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=UQvGdu4sydfSfhGWmTfIbyIK/Cq5QbQogn8qrQ+8aj51S3izXOAatdiQNSpgbYNUSgQG5jpUyShFfS8tBWPrBoxs3fcFBWl/dgtOmg9+uihlL767urwSvPS6qvb5Iamj7cU1yLsqiK4sTc7PWYj74rUvEfUwDYM58ePjRQ5eJ9g=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.ca;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=ZpnTY4UAU4IYwYNHZdKd8//xMkkqY7mLOoqFNCtLg/dQDOrMiDPIoac2mv9DZn9+Q3dg315Pc6IxhqwSd5kccVrIu1OEyr8ot9bHu0wX+Mz3NHPBR7S1FMC9ppcjz1UJn44D+fPupfo5YPoTNnRBxqI6Dv7yBXQzNj5gWq2qiLE=;
X-YMail-OSG: Bk0.mogVM1nqC3QdiPVg8hG__k3vH9iGpxYC6mfjC67Psjz
	M5UWdhLreii.oDkmA5GiGxX5pFLytU1EQa0IHuYZdtamI7iYOQiRgvnk1G_W
	8eyLdQnEfxvrxNqWg40wTQuK6HzRI6E5tytpMbtiyVQWl_ZcV1s6Z8XLdddo
	sYZ1sKuGOl4jAbb2JKDd_UOyapL9m.cb3R1RypNWcTEvjFQTN_hpZhuWbCck
	KwW8YFrw4HEtrD6ekCalONoK.S743q.ofJSJumOHnud7a1lNDDZzRyVwSsoU
	kD.85uq8xchPxiA9N992WLUkyE48UbXFLmKye5CML8sU3jMvgtffTsWpkKwR
	c24RC9LoGBhP_kUl2kSKmYMcFFcVlXFzvMq704osjPSPnUOdIthgv7U5Wxyp
	d93RfNKnhH_JKRigtVdJE7v1N7_4QdkPei715TeMfAjD6aCPWpG9Yjz7kt9u
	8Mx.jIRXIqTelBUmGAClhyRrtJBLWf4x8KjgY6mxdK7._A8keKrylaudfW.r
	W2P2GYzFH3T4b4qiu67d1xZV6LY_cB_EDDUIS1FwwIV.9WvJHirt9xXsxQzH
	IyMAfw4xT1T20jhVe
Received: from [173.178.26.39] by web164705.mail.gq1.yahoo.com via HTTP;
	Wed, 15 Jan 2014 11:52:10 PST
X-Rocket-MIMEInfo: 002.001,
	VGhhbmsgeW91IE1hcnRpbiBmb3IgeW91ciBoZWxwLAoKSSBoYWQgdG8gcmVtb3ZlIHRoZSBkaXJlY3RvcnkgOiBGSUxFU18ke1BOfSArPSAiL3VzciIgYW5kIGFkZCB5b3VyIHNvbHV0aW9uLgoKVGhhbmsgeW91IGEgbG90ICEKCkkgYXBwcmVjaWF0ZQoKS3JpcwoKCgoKT24gV2VkbmVzZGF5LCBKYW51YXJ5IDE1LCAyMDE0IDI6MzQ6NDYgUE0sIE1hcnRpbiBKYW5zYSA8bWFydGluLmphbnNhQGdtYWlsLmNvbT4gd3JvdGU6CiAKT24gV2VkLCBKYW4gMTUsIDIwMTQgYXQgMTE6MDc6NTNBTSAtMDgwMCwga3JpcyABMAEBAQE-
X-Mailer: YahooMailWebService/0.8.172.614
References: <1389812873.92918.YahooMailNeo@web164702.mail.gq1.yahoo.com>
	<20140115193446.GC3742@jama>
Message-ID: <1389815530.3034.YahooMailNeo@web164705.mail.gq1.yahoo.com>
Date: Wed, 15 Jan 2014 11:52:10 -0800 (PST)
From: kris duff <t_dufff@yahoo.ca>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <20140115193446.GC3742@jama>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: non debug package contains .debug directory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jan 2014 19:52:12 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Thank you Martin for your help,

I had to remove the directory : FILES_${PN} +=3D "/usr" and add your solut=
ion.

Thank you a lot !

I appreciate

Kris




On Wednesday, January 15, 2014 2:34:46 PM, Martin Jansa <martin.jansa@gmai=
l.com> wrote:
=20
On Wed, Jan 15, 2014 at 11:07:53AM -0800, kris duff wrote:
> Hello,
>=20
> I'm working to port a custom software.
>=20
> bitbake complain about :
>=20
> NOTE: Checking Package: fcgi
> ERROR: QA Issue: non debug package contains .debug directory: fcgi path =
/work/armv7a-vfp-neon-poky-linux-gnueabi/fcgi-0.25-r0/packages-split/fcgi/u=
sr/bin/.debug/fast.fcgi
> ERROR: QA run found fatal errors. Please consider fixing them.
>=20
> In my recipe I added :=20
> FILES_${PN}-dbg +=3D "${WORKDIR}/trunk/Debug"
> FILES_${PN}-dbg +=3D "${WORKDIR}/trunk/Debug/*"
>=20
> I also tried :=20
> FILES_${PN}-dbg +=3D "${D}/usr/bin/.debug"
> FILES_${PN}-dbg +=3D "${D}/usr/bin/.debug/*"

Don't use ${D} or ${WORKDIR} prefix, it's path like on target so just:

FILES_${PN}-dbg +=3D "${bindir}/.debug"


> no luck for now. I tried few other things and I don't understand how to =
do that.
>=20
> Any help would be highly appreciated!

There is plenty of examples in layers, git grep is often best friend.

--=20
Martin 'JaMa' Jansa&#65533; &#65533;  jabber: Martin.Jansa@gmail.com
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
From B40290@freescale.com  Thu Jan 16 03:29:06 2014
Return-Path: <B40290@freescale.com>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0253.outbound.messaging.microsoft.com [213.199.154.253])
	by mail.openembedded.org (Postfix) with ESMTP id 182106B2E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 03:29:06 +0000 (UTC)
Received: from mail163-db9-R.bigfish.com (10.174.16.254) by
	DB9EHSOBE001.bigfish.com (10.174.14.64) with Microsoft SMTP Server id
	14.1.225.22; Thu, 16 Jan 2014 03:29:06 +0000
Received: from mail163-db9 (localhost [127.0.0.1])	by
	mail163-db9-R.bigfish.com (Postfix) with ESMTP id EBCA11600EA	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 03:29:05 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IP=
V:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah=
1d2ah21a7h1fc6hzz1de098h17326ah8275bh8275dh1de097h186068hz2dh2a8h839hd24he5=
bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758=
h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfe=
h1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h2487h1155h)
Received: from mail163-db9 (localhost.localdomain [127.0.0.1]) by mail163-=
db9
	(MessageSwitch) id 1389842942633653_26614;
	Thu, 16 Jan 2014 03:29:02 +0000 (UTC)
Received: from DB9EHSMHS011.bigfish.com (unknown [10.174.16.251])	by
	mail163-db9.bigfish.com (Postfix) with ESMTP id 8E7074C0048;
	Thu, 16 Jan 2014 03:29:02 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS011.bigfish.=
com
	(10.174.14.21) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 16 Jan 2014 03:29:02 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 16 Jan 2014 03:29:00 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id s0G3SuCc007132;	Wed, 15 Jan 2014 20:28:57 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jan 2014 11:28:34 +0800
Message-ID: <1389842914-12116-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Content-Type: text/plain
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$=
TlsDn%
Subject: [oe] [meta-oe][PATCH] python-mako: remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembed=
ded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject
