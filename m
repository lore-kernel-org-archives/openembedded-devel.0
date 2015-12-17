Return-Path: <erkka.kaaria@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A4D097317A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 11:40:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 17 Dec 2015 03:39:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,440,1444719600"; 
	d="scan'208,217";a="843173194"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 17 Dec 2015 03:39:53 -0800
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.13]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.138]) with mapi id
	14.03.0248.002; Thu, 17 Dec 2015 11:39:53 +0000
From: "Kaaria, Erkka" <erkka.kaaria@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java] Openjdk-8 and D_FORTIFY_SOURCE
Thread-Index: AdE4uQZsBMwFgAMzQxSbU9q3GRht0A==
Date: Thu, 17 Dec 2015 11:39:52 +0000
Message-ID: <17C19527BD855F428F22685986FD58BEA3EA47@IRSMSX103.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java] Openjdk-8 and D_FORTIFY_SOURCE
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
X-List-Received-Date: Thu, 17 Dec 2015 11:40:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Currently openjdk-8 fails to build if D_FORTIFY_SOURCE is set through SECUR=
ITY_CFLAGS. This happens, because gcc requires at least -O for this feature=
 to work. Otherwise a warning is generated ("_FORTIFY_SOURCE requires compi=
ling with optimization"), which then gets turned into an error by -Werror.

This is easy enough to fix by providing appropriate compiler flags through =
EXTRA_OECONF and -with-extra-cflags. The recipe however contains a warning =
that adding -with-extra-cflags will break building demos for jdk. Everythin=
g seems to work correctly on my machine even if I add the parameter (packag=
e is generated for demos, no build failures), but I assume that this warnin=
g is there for a reason.

There are few ways of solving this as far as I can see:


1.       Just add the -with-extra-cflags and disable demos.

2.       Remove D_FORTIFY_SOURCE from SECURITY_CFLAGS

3.       Patch the openjdk build files, either removing -Werror or adding -=
O2

I personally prefer the first solution, as I don't really see any value in =
providing demos. The second solution would weaken security, which I'd like =
to avoid if at all possible. The third solution on the other hand feels lik=
e it's too hacky-ish for this problem (not to mention that removing -Werror=
 is basically the same than removing D_FORTIFY_SOURCE).

Best Regards,
Erkka K=E4=E4ri=E4


---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

