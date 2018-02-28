Return-Path: <zakiah.md.ismail@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B14857846C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 03:48:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 19:48:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,403,1515484800"; 
	d="scan'208,217";a="178638480"
Received: from kmsmsx151.gar.corp.intel.com ([172.21.73.86])
	by orsmga004.jf.intel.com with ESMTP; 27 Feb 2018 19:48:54 -0800
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.160]) by
	KMSMSX151.gar.corp.intel.com ([169.254.10.67]) with mapi id
	14.03.0319.002; Wed, 28 Feb 2018 11:48:53 +0800
From: "Md Ismail, Zakiah" <zakiah.md.ismail@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Dependency loop in cryptsetup
Thread-Index: AdOwRwoR1Kgn94eTS/+PgBRAOALaiA==
Date: Wed, 28 Feb 2018 03:48:52 +0000
Message-ID: <1A5BB22468458840B08C979DDA869BF27EB738@PGSMSX103.gar.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDJiNzRiNzEtOWNkMi00OGIwLThhOTMtMjc4YTI3NGQyOTE3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJMRlZzZEY0MDBRWEZ3Vlg3WWRRcTBJeUJwTG9cL2JHcDVFSGVxakthNDZXcHRcL210b1hFa05iV1wvbGhPSTRWNUgxIn0=
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Dependency loop in cryptsetup
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
X-List-Received-Date: Wed, 28 Feb 2018 03:48:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I want to enable cyrptsetup in systemd by adding PACKAGECONFIG_append_pn-sy=
stemd =3D " cryptsetup" in my local.conf; however, I encounter the dependen=
cy loop issue. The issue is similar to this: https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D11856. The difference is I'm using the latest commit =
from meta-openembedded rocko branch. Please advise on the steps to solve th=
is issue. Thanks in advance!

Regards,
Zakiah



