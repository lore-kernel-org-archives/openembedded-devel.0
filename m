Return-Path: <vinay.k.awasthi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 575F173217
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:37:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Aug 2015 05:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="777459867"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2015 05:37:54 -0700
Received: from orsmsx158.amr.corp.intel.com (10.22.240.20) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 28 Aug 2015 05:37:53 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
	ORSMSX158.amr.corp.intel.com (10.22.240.20) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 28 Aug 2015 05:37:53 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.72]) by
	FMSMSX114.amr.corp.intel.com ([10.18.116.8]) with mapi id
	14.03.0224.002; Fri, 28 Aug 2015 05:37:53 -0700
From: "Awasthi, Vinay K" <vinay.k.awasthi@intel.com>
To: Richard Leitner <richard.leitner@skidata.com>
Thread-Topic: [oe] [meta-java][PATCH] OpenJDK-8: For x86 and ARM
Thread-Index: AQHQ4S6rk/kNK4G/kEmAahahrXQ/Ep4hdLoA///ln+A=
Date: Fri, 28 Aug 2015 12:37:52 +0000
Message-ID: <0B500046-DC54-41F1-A692-F9E015A995DD@intel.com>
References: <1440724441-692-1-git-send-email-vinay.k.awasthi@intel.com>,
	<55E009D2.6010106@skidata.com>
In-Reply-To: <55E009D2.6010106@skidata.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java][PATCH] OpenJDK-8: For x86 and ARM
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
X-List-Received-Date: Fri, 28 Aug 2015 12:37:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you for trying out! At present hotspot does not compile for arm32 ...=
Various compilation issues in code that may requires Oracles assistance...

Yes mixed mode is working for x86....

Thanks,
-Vinay=20
408-765-9407
415-770-3385 (cell)

> On Aug 28, 2015, at 12:13 AM, Richard Leitner <richard.leitner@skidata.co=
m> wrote:
>=20
> Hi Vinay,
> thanks for working on that!
>=20
>> On 08/28/2015 03:14 AM, Vinay K. Awasthi wrote:
>> Rebased it again with latest change-set and tested it on oe-core master =
with latest mate-openembedded.
>>=20
>> There is no change in recipe.
>>=20
>> This enables OpenJDK-8 jre/jdk for x86 and ARM.
>>=20
>> This recipe is tested for arm (zero VM) and x86 (hotspot vm).
>>=20
>> To build just use bitbake openjdk-8.
>=20
> I successfully compiled and tested it for/on an ARMv7 Cortex A9 CPU:
> # /usr/lib/jvm/java-8-openjdk/jre/bin/java -version
> openjdk version "1.8.0-internal"
> OpenJDK Runtime Environment (build 1.8.0-internal-leri_2015_08_28_08_47-b=
00)
> OpenJDK Zero VM (build 25.60-b23, interpreted mode)
>=20
> Also X11/awt/swing works fine! Only problem for me is that ZeroVM is
> running in "interpreted mode". Therefore my programs are running really
> slow.
>=20
> Was the "mixed mode" available/working in your tests?
>=20
> IMHO a working JIT (=3D> mixed-mode) is a must-have for merging this patc=
h
> upstream. What do you think Otavio?
>=20
> thanks & regards,
> Richard L

