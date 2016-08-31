Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B41B731BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 05:34:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7V5YLxa003469
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 22:34:21 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.206]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Tue, 30 Aug 2016 22:34:21 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 00/16] control ipv6 support based on DISTRO_FEATURES
Thread-Index: AQHR/ekbBfff699yekSTXX75w5hBuqBilrNA
Date: Wed, 31 Aug 2016 05:34:20 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA0131063DD4@ALA-MBB.corp.ad.wrs.com>
References: <cover.1472027350.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1472027350.git.jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.203]
MIME-Version: 1.0
Subject: Re: [PATCH 00/16] control ipv6 support based on DISTRO_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2016 05:34:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

I don't see a comment or rejection on these, will these be merged soon?

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Wednesday, August 24, 2016 5:07 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH 00/16] control ipv6 support based on DISTRO_FEATURES
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> There is ipv6 configure option for these packages, and we need them
> to be controled by DISTRO_FEATURES.
>=20
> Tested with and without ipv6 in DISTRO_FEATURES on qemux86-64 and qemuarm=
.
>=20
> ---
> The following changes since commit dc48e768f527cbed0cc3899f6a2ebb396cd9ad=
a8:
>=20
>   meta-oe: remove trailing spaces (2016-08-22 15:56:29 +0200)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib.git jhuang0/r_ipv6_160824-0
>   http://git.pokylinux.org/cgit.cgi//log/?h=3Djhuang0/r_ipv6_160824-0
>=20
> Jackie Huang (16):
>   chrony: control ipv6 support based on DISTRO_FEATURES
>   cyrus-sasl: control ipv6 support based on DISTRO_FEATURES
>   daq: control ipv6 support based on DISTRO_FEATURES
>   mtr: control ipv6 support based on DISTRO_FEATURES
>   ntp: control ipv6 support based on DISTRO_FEATURES
>   squid: control ipv6 support based on DISTRO_FEATURES
>   stunnel: control ipv6 support based on DISTRO_FEATURES
>   tftp-hpa: control ipv6 support based on DISTRO_FEATURES
>   tnftp: control ipv6 support based on DISTRO_FEATURES
>   wolfssl: control ipv6 support based on DISTRO_FEATURES
>   znc: control ipv6 support based on DISTRO_FEATURES
>   iperf: control ipv6 support based on DISTRO_FEATURES
>   php: control ipv6 support based on DISTRO_FEATURES
>   cherokee: control ipv6 support based on DISTRO_FEATURES
>   xfce4-mailwatch-plugin: control ipv6 support based on DISTRO_FEATURES
>   inetutils: fixes for ipv6 feature
>=20
>  .../recipes-connectivity/daq/daq_2.0.6.bb          |  3 ++
>  .../inetutils/inetutils/fix-disable-ipv6.patch     | 43 ++++++++++++++++=
+-----
>  .../inetutils/inetutils_1.9.4.bb                   | 10 ++---
>  .../recipes-connectivity/wolfssl/wolfssl_3.9.0.bb  |  2 +
>  .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |  2 +
>  .../recipes-daemons/squid/squid_3.5.20.bb          |  2 +
>  .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |  3 ++
>  meta-networking/recipes-irc/znc/znc_git.bb         |  3 ++
>  .../recipes-support/chrony/chrony_2.4.bb           |  5 ++-
>  meta-networking/recipes-support/mtr/mtr_0.86.bb    |  2 +
>  meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb |  5 ++-
>  .../recipes-support/stunnel/stunnel_5.28.bb        |  5 ++-
>  .../recipes-support/tnftp/tnftp_20151004.bb        |  5 ++-
>  meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     |  3 ++
>  meta-oe/recipes-devtools/php/php.inc               |  5 ++-
>  .../recipes-httpd/cherokee/cherokee_1.2.98.bb      |  3 +-
>  .../mailwatch/xfce4-mailwatch-plugin_1.2.0.bb      |  3 ++
>  17 files changed, 83 insertions(+), 21 deletions(-)
>=20
> --
> 2.8.3
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

