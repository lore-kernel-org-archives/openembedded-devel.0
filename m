Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 046E1744DF
	for <openembedded-devel@openembedded.org>;
	Fri, 30 Mar 2018 01:12:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2U1Cn1c006870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@openembedded.org>;
	Thu, 29 Mar 2018 18:12:51 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.201]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Thu, 29 Mar 2018 18:12:49 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Thread-Topic: geoip versions
Thread-Index: AdPHwtMUmTEhJghyQie/Grg01bS4hA==
Date: Fri, 30 Mar 2018 01:12:48 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F341D889@ALA-MBD.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.116.220]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: geoip versions
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
X-List-Received-Date: Fri, 30 Mar 2018 01:12:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The SRC_URIs for geoip source from maxmind are not versioned and are not a =
reliable source of the version you are trying to build.  I think the source=
s are mirrored on a yocto site, but, once again, lack version info, so they=
 might or might not match what you want.

It would be easy enough to add a yocto(?) PREMIRROR with version info to th=
e recipe, but I have no idea how to establish the physical mirror.  Also, t=
he recipe versions and the versions of the source may well not be in sync b=
ecause the source changes frequently, and I think, without notice.  I reali=
ze this is an odd case, but it would be nice to have some solution to this =
maintenance issue.

Joe

