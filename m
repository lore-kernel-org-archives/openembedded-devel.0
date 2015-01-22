Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E50FE725F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 03:19:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56444961"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jan 2015 11:14:35 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0M3HOWY000675
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 11:17:25 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Thu, 22 Jan 2015 11:18:01 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH v3] openl2tp: add new recipe
Thread-Index: AQHQKdF5kqt+g05oFUqDzafh05ET0ZzLi/gg
Date: Thu, 22 Jan 2015 03:18:00 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8738F0420@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1420563255-30869-1-git-send-email-joe_macdonald@mentor.com>
In-Reply-To: <1420563255-30869-1-git-send-email-joe_macdonald@mentor.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.35]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH v3] openl2tp: add new recipe
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
X-List-Received-Date: Thu, 22 Jan 2015 03:19:28 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi, Joe

Thank you very much.
It's very kind of you to help me to add patch.

I think it will solve the problem by adding "PARALLEL_MAKE =3D """ in the b=
b file.
And I will resend the patch.

Best Regards,
Li


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of J=
oe
> MacDonald
> Sent: Wednesday, January 07, 2015 12:54 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-networking][PATCH v3] openl2tp: add new recipe
>=20
> From: Li xin <lixin.fnst@cn.fujitsu.com>
>=20
> OpenL2TP is an open source L2TP client / server, written specifically for=
 Linux. It has
> been designed for use as an enterprise L2TP VPN server or in commercial,
> Linux-based, embedded networking products and is able to support hundreds=
 of
> sessions, each with different configuration.
> It is used by several ISPs to provide L2TP services and by corporations t=
o implement
> L2TP VPNs.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>=20
> Still not ideal, but I managed to track down the world build failure and =
I think the
> additional patch I added will resolve it, since it looks like a relic of =
gcc behaviour on
> 32-bit systems.  There's also some problem with the generated dependencie=
s in
> the project makefile that I may take a look at later, but it's a comparat=
ively fast
> package to build so serializing it doesn't seem to be a complete disaster=
.  If
> someone with better Makefile-fu than I wants to dig into that one, that'd=
 be great.
> The issue somes from l2tp_options.h not being generated quite quickly eno=
ugh for
> the processing of lt2p_private.h.
>=20
> -J.


