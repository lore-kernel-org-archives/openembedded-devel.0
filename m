Return-Path: <prvs=087ee24f7=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0EF7EDE6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 07:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1562743714; x=1594279714;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=dCsi1FaQUvE5PkMWSTXf+7NxIG9AsBe1LL2g3Ag4kBA=;
	b=Ej+6NAV6aD8eKMjv09JcnoD7UPVqkG9Op3wze92dxYpX3DZ9bQX8nfxO
	LHlopnyH/1/oqcMmuVxCcdH5m6aEVyDjS1+Ju4ZB3DlOUw1XfHhx/RKK5
	UnXXpOiX+2JtcqB5K+8iT9LHmXFDYlboO05gxn0ofKrnYs3a2hmu/djBm
	iRV9dhTejPq4Y3e9/s6pXx3FIaVvSXutgUEOKggokJZr9EpLpogFlpCU5
	e5w0tOlY1AqxPIbCnMILNlecjuJ02dwwmxK4xcrKLrjKpd5whL7I6Sfdy
	qvq7VthX4/NsUaMsK9FhOAXamkgnZvMgkfP5Gumkkar/yB6muwaxsDt0Z w==;
IronPort-SDR: 6FTbjR/g0N9BnwPwhp9nVDOq+m6jiC24YrGPDTF264XTSzA1ve9Yf9BBECm9SeV6HWEZM5DAEA
	9ZhaHQHZDzopv5au0cdPHlrv/70NvQkIsNhXsOjEtcCsWekh9K4M+BqnQv6kHtjex1AlU2uDLa
	jgHVHt8zRvPJiQKrzdrNyXgjNNmnBkFixBPtxJ4Cfhj/t4CBbUpyKYgKHtnqZeZ1o1jkSSMZCa
	dLKSh+5X3ixlvVyGXqmoVF3TKCy6u4wdF+E2PimF8qPJYOklV2fnMDmOcaQYMZ1Odzv+fDJ7cI
	xAE=
X-IronPort-AV: E=Sophos;i="5.63,473,1557180000"; 
   d="scan'208";a="2231570"
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190705111824.22255-1-ricardo@ribalda.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <8bb0ffb0-f55e-3d65-a328-4ad6cdb3300d@skidata.com>
Date: Wed, 10 Jul 2019 09:28:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH v4 00/23] Multiple patches for multiconfig
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
X-List-Received-Date: Wed, 10 Jul 2019 07:28:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
this is a note to let you know that I've just added this setries to the
master-next branch of the meta-java repository at
     git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 05/07/2019 13:18, Ricardo Ribalda Delgado wrote:
> Patches to build meta-java with multiconfig and aarch64.
> 
> v2 and v3 have been reviewed at
> https://github.com/ribalda/meta-java/tree/v2
> https://github.com/ribalda/meta-java/tree/v3
> 
> Richard, thanks for your patience :)
> 
> 
> Ricardo Ribalda Delgado (23):
>    icedtea7: Add missing DEPENDS
>    openjdk7: Make kerberos optional through PACKAGECONFIG
>    openjdk8: Make kerberos optional through PACKAGECONFIG
>    classpath: Fix build with targets aarch64
>    jamvm: Do not build for aarch64 targets
>    cacao: Do not build for aarch64 targets
>    javasqlite: Create cc tool to make libtool happy
>    jdon: Fix location of S
>    rxtx: Fix path of javac
>    jamvm: Fix binary name for javac
>    cup: Do not use all as PACKAGE_ARCH
>    dbus-java: Do not use all as PACKAGE_ARCH
>    rhino: Do not use all as PACKAGE_ARCH
>    ca-certificates: Cannot be an allarch package
>    xalan-j: Do not use all as PACKAGE_ARCH
>    xom: Do not use all as PACKAGE_ARCH
>    jaxen: Do not build an all PACKAGE_ARCH
>    jlex: Do not build as an all PACKAGE_ARCH
>    bsf: Do not build as all PACKAGE_ARCH
>    poi: Do not build as all PACKAGE_ARCH
>    xom: Allow re-running do_compile
>    jdom: Do not use all as PACKAGE_ARCH
>    dom4j: Do not use all as PACKAGE_ARCH
> 
>   .../ca-certificates-java_20180516.bb          |  2 +-
>   recipes-core/cacao/cacao_2d6f6c14daf9.bb      |  2 ++
>   .../classpath/classpath-0.99/aarch64.patch    | 19 +++++++++++++++
>   recipes-core/classpath/classpath_0.99.bb      |  1 +
>   recipes-core/cup/cup_0.10k.bb                 |  1 +
>   recipes-core/icedtea/icedtea7-native.inc      |  3 ++-
>   recipes-core/jakarta-libs/bsf_2.4.0.bb        |  4 +++-
>   recipes-core/jakarta-libs/poi_3.0.bb          |  2 ++
>   recipes-core/jamvm/jamvm.inc                  |  5 +++-
>   recipes-core/jamvm/jamvm_git.bb               |  1 +
>   .../javasqlite/javasqlite_20150419.bb         |  8 ++++++-
>   recipes-core/jlex/jlex_1.2.6.bb               |  2 ++
>   recipes-core/openjdk/openjdk-7-common.inc     |  4 +++-
>   recipes-core/openjdk/openjdk-8-cross.inc      |  4 +++-
>   recipes-core/rhino/rhino_1.7r4.bb             |  2 ++
>   recipes-core/xalan-j/xalan-j_2.7.1.bb         |  4 +++-
>   recipes-core/xml-commons/dom4j_1.6.1.bb       |  1 +
>   recipes-core/xml-commons/jaxen_1.1.6.bb       |  2 ++
>   recipes-core/xml-commons/jdom_1.1.3.bb        |  4 ++++
>   recipes-core/xml-commons/xom_1.2.10.bb        | 14 +++++++++--
>   recipes-extended/dbus/dbus-java_2.7.bb        |  5 +++-
>   recipes-extended/rxtx/files/javapath.patch    | 23 +++++++++++++++++++
>   recipes-extended/rxtx/rxtx_2.2.0.bb           |  5 ++--
>   23 files changed, 105 insertions(+), 13 deletions(-)
>   create mode 100644 recipes-core/classpath/classpath-0.99/aarch64.patch
>   create mode 100644 recipes-extended/rxtx/files/javapath.patch
> 

