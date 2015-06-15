Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 382017413A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 03:15:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="97039560"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jun 2015 11:19:47 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5F3E0Dv009440;
	Mon, 15 Jun 2015 11:14:00 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 15 Jun 2015 11:15:46 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] lvm2: add systemd support
Thread-Index: AQHQprk6c0L26+57VkqgY8W3Jxo6hZ2s4NdQ
Date: Mon, 15 Jun 2015 03:15:37 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E87390803E@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1433812320-1835-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<CAMKF1so8YC7TsmBUcoqoXKJoOj7cE=JdTXq9jPxLRkiSV24cSw@mail.gmail.com>
In-Reply-To: <CAMKF1so8YC7TsmBUcoqoXKJoOj7cE=JdTXq9jPxLRkiSV24cSw@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.85]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] lvm2: add systemd support
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
X-List-Received-Date: Mon, 15 Jun 2015 03:15:35 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Sunday, June 14, 2015 11:45 PM
> To: openembeded-devel
> Subject: Re: [oe] [meta-oe][PATCH] lvm2: add systemd support
>=20
> On Mon, Jun 8, 2015 at 9:12 PM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> > +SYSTEMD_AUTO_ENABLE =3D "disable"
>=20
> why is it disabled by default.

In my experience, if I set a service enable, the service may not start succ=
essfully and automatically.
This is because some service may rely on hardware devices and also it is ne=
eded to set the
Configuration files to start the service successfully.

So I set the service disabled.

Thanks

Li xin
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

