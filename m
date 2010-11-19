Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PJPSr-0004Ez-6j
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 12:49:14 +0100
Received: from [192.168.178.20] (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 8A29C1B40D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 12:49:20 +0100 (CET)
Message-ID: <4CE663F6.2060806@sensortherm.de>
Date: Fri, 19 Nov 2010 12:48:06 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE64779.3020802@sensortherm.de> <ic5k25$ksc$2@dough.gmane.org>
In-Reply-To: <ic5k25$ksc$2@dough.gmane.org>
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: buildserver
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Nov 2010 11:49:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 19.11.2010 11:37, schrieb Koen Kooi:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 19-11-10 10:46, Klaus Schwarzkopf wrote:
>> Hi,
>>
>> i have some problems with the ti recipes, see my emails on the list.
>>
>> The two problems are:
>> * the recipes are out of date and don't work.
>
> Why do you say that? They are currently tracking the state of the
> unreleased upcoming SDK, so from a TI POV they are from the future!
> Furthermore, they all build and work. An autobuilder builds them for al=
l
> TI boards multiple times per day and tinderbox is all green.
> And on the boards we test, the resulting packages work.
>
>> * the recipes can't download the source files.
>
> Read the recipes, not all sources can be downloaded with wget, some
> require certification.


I test it for example with the recipe ti-codecs-dm355_3.10.00.00.bb. I=20
found no required certification in the recipe. The version in the latest=20
DVSDK 3.10 is 3.10.00.02.
Also
MACHINE=3Ddm355-evm bitbake -v  ti-codec-engine-test-image
don't build.

How can i get a working image for the dm355 with ti-codecs?



klaus@ubuntu:~/development/oe$ MACHINE=3Ddm355-evm bitbake -v  -b=20
ti-codecs-dm355_3.10.00.00.bb
NOTE: preferred version 1_13_000 of ti-codecs-dm355 not available (for=20
item ti-codecs-dm355)

Build Configuration:
BB_VERSION        =3D "1.8.18"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "0d09102"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "dm355-evm"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2010.7-test-20101119"
TARGET_FPU        =3D "soft"

NOTE: Preparing runqueue
NOTE: Marking Active Tasks
NOTE: Pruned 14 inactive tasks, 17 left
NOTE: Assign Weightings
NOTE: Compute totals (have 1 endpoint(s))
NOTE: Executing runqueue
NOTE: Running task 1 of 17 (ID: 10,=20
/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.0=
0.00.bb,=20
do_setscene)
NOTE: Running task 2 of 17 (ID: 8,=20
/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.0=
0.00.bb,=20
do_fetch)
NOTE: fetch=20
ftp://gtftp01.gt.design.ti.com/arago/dm355_codecs_03_10_00_00.tar.gz
--2010-11-19 12:27:49--=20
ftp://gtftp01.gt.design.ti.com/arago/dm355_codecs_03_10_00_00.tar.gz
            =3D>=20
`/home/klaus/development/oe/downloads/dm355_codecs_03_10_00_00.tar.gz'
Resolving gtftp01.gt.design.ti.com... failed: Name or service not known.
wget: unable to resolve host address `gtftp01.gt.design.ti.com'
NOTE: fetch http://mirrors.openembedded.org//dm355_codecs_03_10_00_00.tar=
.gz
--2010-11-19 12:27:52--=20
http://mirrors.openembedded.org//dm355_codecs_03_10_00_00.tar.gz
Resolving mirrors.openembedded.org... 82.197.159.157
Connecting to mirrors.openembedded.org|82.197.159.157|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-11-19 12:27:52 ERROR 404: Not Found.

NOTE: fetch http://sources.openembedded.org//dm355_codecs_03_10_00_00.tar=
.gz
--2010-11-19 12:27:52--=20
http://sources.openembedded.org//dm355_codecs_03_10_00_00.tar.gz
Resolving sources.openembedded.org... 140.211.169.165
Connecting to sources.openembedded.org|140.211.169.165|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-11-19 12:27:53 ERROR 404: Not Found.

NOTE: fetch=20
http://www.angstrom-distribution.org/unstable/sources/dm355_codecs_03_10_=
00_00.tar.gz
--2010-11-19 12:27:53--=20
http://www.angstrom-distribution.org/unstable/sources/dm355_codecs_03_10_=
00_00.tar.gz
Resolving www.angstrom-distribution.org... 188.40.83.200
Connecting to www.angstrom-distribution.org|188.40.83.200|:80... connecte=
d.
HTTP request sent, awaiting response... 404 Not Found
2010-11-19 12:28:00 ERROR 404: Not Found.

NOTE: Task failed: Fetch failed:=20
ftp://gtftp01.gt.design.ti.com/arago/dm355_codecs_03_10_00_00.tar.gz;name=
=3Ddm355codecsbin
ERROR: TaskFailed event exception, aborting
ERROR: Build of=20
/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.0=
0.00.bb=20
do_fetch failed
ERROR: Task 8=20
(/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.=
00.00.bb,=20
do_fetch) failed
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be=20
rerun and 1 failed.
ERROR:=20
'/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.=
00.00.bb'=20
failed
klaus@ubuntu:~/development/oe$

--=20
Sensortherm GmbH
Sitz:/Head quarter: Hauptstra=DFe 123, 65843 Sulzbach (Taunus)
Registergericht:/Registry office: Amtsgericht Frankfurt/M.
Eintragungs-Nr.:/Registry-No. HRB 52438
Gesch=E4ftsf=FChrer:/General Manager: Werner Weldert


