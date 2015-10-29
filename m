Return-Path: <henry.bruce@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6E07E755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 23:00:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Oct 2015 16:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,216,1444719600"; d="scan'208";a="822687292"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by fmsmga001.fm.intel.com with ESMTP; 29 Oct 2015 16:00:35 -0700
Received: from orsmsx114.amr.corp.intel.com (10.22.240.10) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 29 Oct 2015 16:00:35 -0700
Received: from orsmsx104.amr.corp.intel.com ([169.254.3.250]) by
	ORSMSX114.amr.corp.intel.com ([169.254.8.204]) with mapi id
	14.03.0248.002; Thu, 29 Oct 2015 16:00:35 -0700
From: "Bruce, Henry" <henry.bruce@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: openjdk-7 and gcc v5
Thread-Index: AdESnZ0dnPu3CKC7S3uLnmy1oEzhfg==
Date: Thu, 29 Oct 2015 23:00:35 +0000
Message-ID: <F81DC1078564A34BB4DA30CAE03814D12D4EB65D@ORSMSX104.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: openjdk-7 and gcc v5
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
X-List-Received-Date: Thu, 29 Oct 2015 23:00:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Many thanks to contributors who fixed openjdk build issues introduced by gc=
c v5 and for maintainers for pushing the updates.
However one problem remains: openjdk build fails in openjdk/jdk/make/java/n=
io due to -static compiler flag being used in conjunction with -pthread giv=
ing error
/usr/bin/ld: cannot find -lpthread
/usr/bin/ld: cannot find -lc

I fixed this by removing -static flag from Makefile. Not sure of this was t=
he right thing to do (so I didn't submit patch) but it worked for me.=20
I added the following to the an openjdk bbappend and it fixed the build and=
 resulting jre is running OK.

do_configure_append() {
	gcc -v 2>&1 | grep 5\..
	if [ "$?" =3D=3D "0" ]; then
		sed -i s/-static// ${B}/openjdk/jdk/make/java/nio/Makefile
	fi
}

Regards,

Henry Bruce


