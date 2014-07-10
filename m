Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id A1AFF65CB2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 08:52:53 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id A0D113300A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 10:52:53 +0200 (CEST)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0195.001; Thu, 10 Jul 2014 10:52:52 +0200
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Building Java 7
Thread-Index: AQHPkhQeLjZyUdCn6Uq67T0LrV6O+5uFCFuA///nGgCAACU5gIAJcK6QgAXa8UCABLNnwA==
Date: Thu, 10 Jul 2014 08:52:52 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA0614A7C3@SEXCHANGE0100.lpg.priv>
References: <1403794582-16605-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C430@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0612C63E@SEXCHANGE0100.lpg.priv>
	<20140627141915.GA23711@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C6A6@SEXCHANGE0100.lpg.priv>
	<20140627151503.GB23711@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C6D6@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0612EC9F@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0612F212@SEXCHANGE0100.lpg.priv>
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA0612F212@SEXCHANGE0100.lpg.priv>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.34]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeejfedrvdegucetufdoteggodetrfcurfhrohhfihhlvgemuceonhhonhgvqeenuceurghilhhouhhtmecufedttdenuc
Subject: Re: Building Java 7
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
X-List-Received-Date: Thu, 10 Jul 2014 08:53:01 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to identify the problem ...

Building one by one, I've got some problems: (more than only this)
ERROR: commons-cli: Recipe file does not have license file information (LIC=
_FILES_CHKSUM)
ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix
ERROR: Function failed: do_qa_configure
ERROR: Logfile of failure stored in: /home/me/poky/build/tmp/work/armv5te-p=
oky-linux-gnueabi/commons-cli/1.1-r0.1/temp/log.do_configure.10894
ERROR: Task 7 (/home/me/poky/meta-java/recipes-core/jakarta-commons/commons=
-cli_1.1.bb, do_configure) failed with exit code '1'

Is it the root reason ?

Thanks
Daniel.


-----Message d'origine-----

>Hm,
>
>maybee a race condition when making parallel builds. Can you run it with a=
 couple of times with bitbake -k whatever?
>
>Bye Henning
>--=20
>
>Error the second time :
>| ERROR: Function failed: do_compile (log file is located at /home/lpg/pok=
y/build/tmp/work/x86_64-linux/log4j1.2-native/1.2.17-r2/temp/log.do_compile=
.28195)
>ERROR: Task 2038 (virtual:native:/home/me/poky/meta-java/recipes-core/jaka=
rta-libs/log4j1.2_1.2.17.bb, do_compile) failed with exit code '1'


Hello,

Up ...
Still have the problem :(
I don't find any web information about the it :(


Thanks,
Daniel.

