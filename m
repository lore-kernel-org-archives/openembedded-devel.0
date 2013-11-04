Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id F14A36BE6E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 16:44:44 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgfinance.com) with ESMTP id 1B52C7240D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 17:44:44 +0100 (CET)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0158.001; Mon, 4 Nov 2013 17:44:44 +0100
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Pb compilation with BB_NUMBER_THREADS != 1
Thread-Index: Ac7ZfSkEPoMMXLdQT8GPRy5WLZp9zQ==
Date: Mon, 4 Nov 2013 16:44:42 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA06003FE2@SEXCHANGE0100.lpg.priv>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.30]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeeiledrheefucetufdoteggodetrfcurfhrohhfihhlvgemuceonhhonhgvqeenuceurghilhhouhhtmecufedttdenuc
Subject: Pb compilation with BB_NUMBER_THREADS != 1
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
X-List-Received-Date: Mon, 04 Nov 2013 16:44:46 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm on a virtual Ubuntu 12.04 server, 16 cores, 8Go RAM free frequency (max=
 =3D 163840MHz)

With BB_NUMBER_THREADS =3D '1', the entire project is successfully build in=
 12h30.

With BB_NUMBER_THREADS =3D '4' (same result with 12)

| LD_LIBRARY_PATH=3D/home/xxxxxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/work=
/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2:/home/xxxxxxxxxxbuild/tmp-a=
ngstrom_v2012_05-eglib
c/sysroots/x86_64-linux/usr/bin/../lib/pseudo/lib:/home/xxxxxxxxxxbuild/tmp=
-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/bin/../lib/pseudo/lib64=
  ./perl -f -Ilib pod/buildtoc --
build-toc -q
|
|       Making x2p stuff
| make[1]: Entering directory `/home/xxxxxxxxxxbuild/tmp-angstrom_v2012_05-=
eglibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/x2p'
|
| make[1]: Leaving directory `/home/xxxxxxxxxxbuild/tmp-angstrom_v2012_05-e=
glibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/x2p'
| pod/buildtoc: no pods at pod/buildtoc line 305.
| make: *** [pod/perltoc.pod] Error 255
| ERROR: oe_runmake failed
NOTE: package perl-native-5.14.2-r0: task do_compile: Failed
NOTE: package perl-5.14.2-r6: task do_fetch: Started
NOTE: package perl-5.14.2-r6: task do_fetch: Succeeded
ERROR: Task 1239 (/home/xxxxxxxxxxsources/openembedded-core/meta/recipes-de=
vtools/perl/perl-native_5.14.2.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 4055 tasks of which 4053 didn't need to be r=
erun and 1 failed.

Summary: 1 task failed:
  /home/xxxxxxxxxxsources/openembedded-core/meta/recipes-devtools/perl/perl=
-native_5.14.2.bb, do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Known problem ?
Any solution ?

Thanks
Daniel.


