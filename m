Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 95615739BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 09:38:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99339400"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2015 17:42:14 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t769aqLt012666
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Aug 2015 17:36:52 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Thu, 6 Aug 2015 17:38:47 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH v2] geoip: upgrade 1.6.0 -> 1.6.6
Thread-Index: AQHQz+8GKE9uKB0wgku7sJDrrPxWMZ3+sUoQ
Date: Thu, 6 Aug 2015 09:38:46 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8011BCB9246@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <20150805123908.GB2452@jama>
	<1438824615-4091-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<CAMKF1soyQMz7YFO9-u3YGAqAJZ8+DO62of++izujH7Ae9eo+Cw@mail.gmail.com>
In-Reply-To: <CAMKF1soyQMz7YFO9-u3YGAqAJZ8+DO62of++izujH7Ae9eo+Cw@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH v2] geoip: upgrade 1.6.0 -> 1.6.6
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
X-List-Received-Date: Thu, 06 Aug 2015 09:38:57 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: openembedded-devel-bounces@lists.openembedded.org
>[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>Khem Raj
>Sent: Thursday, August 06, 2015 10:24 AM
>To: openembeded-devel
>Subject: Re: [oe] [meta-networking][PATCH v2] geoip: upgrade 1.6.0 -> 1.6.=
6
>
>On Wed, Aug 5, 2015 at 6:30 PM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
>> *Modify SRC_URI.
>
>why do switch to git instead of tarball ?
>
>> *Modify chksum of file COPYING and LICENSE,since the context changed.
>
>why did checksums change? you need to explain that

OK, Patch v3 will be sent.

>
>> But the LICENSE has not been changed.
>
>in what way ?

I had checked LICENSE of geoip-1.6.0 and geoip-1.6.6 by SPDX and fossology =
server.
From the SPDX file, I found that LICENSE had not been changed.
------------------------------------=20
$ cat geoip-1.6.6.spdx
......
PackageLicenseDeclared: (LicenseRef-12 and GPL-2.0+ and LicenseRef-3 and Li=
censeRef-1 and LGPL-2.1 and LicenseRef-4 and LGPL-2.1+ and LicenseRef-7 and=
 GPL-3.0+ and GPL-2.0-with-autoconf-exception and LicenseRef-8 and LicenseR=
ef-9 and LicenseRef-10 and LicenseRef-5 and LicenseRef-2 and LicenseRef-6 a=
nd LicenseRef-11)

$ cat geoip-1.6.0.spdx
......
PackageLicenseDeclared: (LicenseRef-2 and GPL-2.0+ and LicenseRef-4 and Lic=
enseRef-5 and LicenseRef-1 and LGPL-2.1 and LicenseRef-6 and LicenseRef-8 a=
nd LGPL-2.1+ and LicenseRef-9 and GPL-3.0 and LicenseRef-10 and LicenseRef-=
11 and LicenseRef-7 and LicenseRef-3 and GPL-2.0-with-autoconf-exception)
------------------------------------


Cheers,
Li

