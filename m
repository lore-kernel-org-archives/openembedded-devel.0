Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 241AC6A49F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Jun 2013 12:06:16 +0000 (UTC)
Received: from LMUC430092 (lmuc430092.bmw-carit.intra [192.168.101.2])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id B605640077
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Jun 2013 13:11:10 +0200 (CEST)
From: "Lukas Bulwahn" <lukas.bulwahn@oss.bmw-carit.de>
To: <openembedded-devel@lists.openembedded.org>
References: <1370297534-9882-1-git-send-email-danismostlikely@gmail.com>
In-Reply-To: <1370297534-9882-1-git-send-email-danismostlikely@gmail.com>
Date: Tue, 4 Jun 2013 14:06:15 +0200
Message-ID: <07c501ce611b$ea241e90$be6c5bb0$@oss.bmw-carit.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQGeM026ipwU04oDKSIj0DbBwd49KZmF0O6Q
Subject: Re: [oe-core][PATCH] Make Python IPv6 aware
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
X-List-Received-Date: Tue, 04 Jun 2013 12:06:16 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: de

Hi Dan,

in my layer, I simply activate IPv6 support for python with a simple
bbappend file:

https://github.com/bmwcarit/meta-ros/blob/master/recipes-devtools/python/=
pyt
hon_2.7.3.bbappend

Lukas

> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag
> von danismostlikely@gmail.com
> Gesendet: Dienstag, 4. Juni 2013 00:12
> An: openembedded-devel@lists.openembedded.org
> Betreff: [oe] [oe-core][PATCH] Make Python IPv6 aware
>=20
> I found that gateone would crash with a socket error when Python isn't
> compiled with IPv6 support. This patch enables it when DISTRO_FEATURES
> includes ipv6.
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


