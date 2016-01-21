Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40E8A700F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 09:08:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0L98bCD026191
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 01:08:38 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.91]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Thu, 21 Jan 2016 01:08:36 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java] unversioned source files
Thread-Index: AQHRVBCTsRcrqMXOrUmRZK0MxHgIE58FrSZA
Date: Thu, 21 Jan 2016 09:08:35 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C79ADFA@ALA-MBA.corp.ad.wrs.com>
References: <56A071BB.6070608@mlbassoc.com>
In-Reply-To: <56A071BB.6070608@mlbassoc.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.132]
MIME-Version: 1.0
Subject: Re: [meta-java] unversioned source files
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
X-List-Received-Date: Thu, 21 Jan 2016 09:08:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Gary Thomas
> Sent: Thursday, January 21, 2016 1:51 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-java] unversioned source files
>=20
> I just built the latest openjdk-7 and noticed that there are
> a number of source files downloaded that have no version
> information:
>    sources/corba.tar.bz2
>    sources/hotspot.tar.bz2
>    sources/jaxp.tar.bz2
>    sources/jaxws.tar.bz2
>    sources/jdk.tar.bz2
>    sources/langtools.tar.bz2
>    sources/openjdk.tar.bz2

The original download file doesn' t have version in the name:
http://icedtea.wildebeest.org/download/drops/icedtea7/2.7.0/corba.tar.bz2

>=20
> This seems very problematic to me - how is this expected to work,
> especially when there are changes?

Yeah, there is potential issue, we should fix it by using "downloadfilename=
"
in SRC_URI to rename those files.

Thanks,
Jackie

>=20
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

