Return-Path: <sam.nelson@ti.com>
X-Greylist: delayed 415 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Mar 2015 20:30:00 UTC
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 8479360034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2015 20:30:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HKN6VP022216
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2015 15:23:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HKN50g011657
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2015 15:23:05 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Tue, 17 Mar 2015 15:23:04 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Query on meta-java layer: openjdk-7-jre: compilation issue
	with '-fuse-ld-bfd'
Thread-Index: AdBg76GigPIijuwIRJSeq1NY3JWS8g==
Date: Tue, 17 Mar 2015 20:23:04 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905814FFE9@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Query on meta-java layer: openjdk-7-jre: compilation issue with '-fuse-ld-bfd'
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
X-List-Received-Date: Tue, 17 Mar 2015 20:30:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,
I am using an openembedded setup and using the daisy branch.
I am trying to use meta java: git://git.yoctoproject.org/meta-java  to comp=
ile openjdk-7-jre and seeing the following error:

| arm-linux-gnueabihf-gcc: error: unrecognized command line option '-fuse-l=
d=3Dbfd'

Looks like the addition of '-fuse-ld=3Dbfd" was introduced with the followi=
ng commit in meta-java:
commit cb351db824b0eb4a71514156bba543f6dde19740
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Tue Jan 20 16:14:23 2015 +0100

I am using linaro toolchain: gcc-linaro-arm-linx-gnueabihf-4.7-2013 and doe=
s not support "-fuse-ld" option. Any ideas on how this can be fixed?



