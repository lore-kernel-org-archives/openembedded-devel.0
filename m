Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1284C71E30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 04:14:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 30 Jan 2017 20:14:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,313,1477983600"; d="scan'208";a="37598144"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.191.81])
	by orsmga002.jf.intel.com with ESMTP; 30 Jan 2017 20:14:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Nicholson <Mike.Nicholson@viavisolutions.com>
Date: Tue, 31 Jan 2017 17:14:46 +1300
Message-ID: <2113169.Xj3b9sYz4X@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/5.3.3 (Linux/4.9.5-200.fc25.x86_64; KDE/5.29.0; x86_64; ; )
In-Reply-To: <F44878C7-F939-43ED-A849-F9392C7B604D@viavisolutions.com>
References: <F44878C7-F939-43ED-A849-F9392C7B604D@viavisolutions.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] populate_sdk_ext fails
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
X-List-Received-Date: Tue, 31 Jan 2017 04:14:50 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Mike,

On Monday, 30 January 2017 8:23:28 PM NZDT Mike Nicholson wrote:
> I=E2=80=99m attempting to generate an extensible SDK that includes the me=
ta-qt5
> layer.  Generating a standard sdk via Yocto works just fine but generating
> the extensible sdk fails with the following error:
>=20
>=20
> | NOTE: Executing create_sdk_files ...
> | DEBUG: Executing shell function create_sdk_files
> | touch: cannot touch
> | '/home/nic47222/Projects/viavi-platform/viavi-bsp/build/tmp/work/mts-po=
ky
> | -linux-gnueabi/viavi-image-qt5/1.0-r0/sdk-ext/image//opt/poky/2.1.1/sys=
roo
> | ts/x86_64-pokysdk-linux/usr/bin/qt5/qt.conf': No such file or directory
> =20
> It appears that here
> https://github.com/meta-qt5/meta-qt5/blob/9aa870eecf6dc7a87678393bd55b97e=
21
> 033ab48/classes/populate_sdk_qt5_base.bbclass#L7 the directory that should
> contain the qt.conf file does not exist.
>
> Are there known issues with the populate_sdk_ext command and the meta-qt5
> layer?

As Martin indicated you may be among the first people to try it.

> I can get generate the extensible SDK just fine if I make the following
> changes:
>
> diff --git a/classes/populate_sdk_qt5_base.bbclass
> b/classes/populate_sdk_qt5_base.bbclass
> index b6ce596..b66fe25 100644
> --- a/classes/populate_sdk_qt5_base.bbclass
> +++ b/classes/populate_sdk_qt5_base.bbclass
> @@ -4,6 +4,7 @@ inherit qmake5_paths
> create_sdk_files_prepend () {
>      # Generate a qt.conf file to be deployed with the SDK
>    =20
> qtconf=3D${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf
> +  mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS} touch
> $qtconf
>      echo '[Paths]' >> $qtconf
>      echo 'Prefix =3D ${OE_QMAKE_PATH_PREFIX}' >> $qtconf

So this is interesting. Whilst this is the most obvious fix, I think this=20
indicates a deeper issue may be present. The directory isn't there because =
the=20
eSDK works differently than the standard SDK for which this class was=20
obviously designed - it has an OE-style sysroot that appears under tmp/ wit=
hin=20
the SDK, not at the location this is writing to, so I'm not sure this will=
=20
work as desired. Have you tried installing and using the SDK after building=
 it=20
successfully?

Cheers,
Paul

=2D-=20

Paul Eggleton
Intel Open Source Technology Centre

