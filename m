Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PEOm4-00056g-8M
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 17:04:21 +0100
Received: from [192.168.0.75] (dslb-084-058-178-210.pools.arcor-ip.net
	[84.58.178.210])
	by email.infrascan.de (Postfix) with ESMTPSA id 521FC1B40D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Nov 2010 17:04:36 +0100 (CET)
Message-ID: <4CD42BE7.8090109@sensortherm.de>
Date: Fri, 05 Nov 2010 17:08:07 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla-Thunderbird 2.0.0.24 (X11/20100329)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: dm355_codecs_03_10_00_00.tar.gz
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
X-List-Received-Date: Fri, 05 Nov 2010 16:04:21 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

i try to install the recipe ti-codecs-dm355_3.10.00.00.bb:

MACHINE=3Ddm355-leopard bitbake -b  ti-codecs-dm355_3.10.00.00.bb

I get the following error:

klaus@ubuntu:~/development/oe$ MACHINE=3Ddm355-leopard bitbake -b
ti-codecs-dm355_3.10.00.00.bb
NOTE: preferred version 1_13_000 of ti-codecs-dm355 not available (for
item ti-codecs-dm355)

Build Configuration:
BB_VERSION        =3D "1.8.18"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "a33cf7368366d425c71369339e88a50d5660b7c0"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "dm355-leopard"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2010.7-test-20101104"
TARGET_FPU        =3D "soft"

NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 2 of 17 (ID: 8,
/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.0=
0.00.bb,=20


do_fetch)
NOTE: fetch
ftp://gtftp01.gt.design.ti.com/arago/dm355_codecs_03_10_00_00.tar.gz
--2010-11-04 20:28:42--
ftp://gtftp01.gt.design.ti.com/arago/dm355_codecs_03_10_00_00.tar.gz
            =3D>
`/home/klaus/development/oe/downloads/dm355_codecs_03_10_00_00.tar.gz'
Resolving gtftp01.gt.design.ti.com... failed: Name or service not known.
wget: unable to resolve host address `gtftp01.gt.design.ti.com'
NOTE: fetch http://mirrors.openembedded.org//dm355_codecs_03_10_00_00.tar=
.gz
--2010-11-04 20:28:42--
http://mirrors.openembedded.org//dm355_codecs_03_10_00_00.tar.gz
Resolving mirrors.openembedded.org... 82.197.159.157
Connecting to mirrors.openembedded.org|82.197.159.157|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-11-04 20:28:42 ERROR 404: Not Found.

NOTE: fetch http://sources.openembedded.org//dm355_codecs_03_10_00_00.tar=
.gz
--2010-11-04 20:28:43--
http://sources.openembedded.org//dm355_codecs_03_10_00_00.tar.gz
Resolving sources.openembedded.org... 140.211.169.165
Connecting to sources.openembedded.org|140.211.169.165|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-11-04 20:28:43 ERROR 404: Not Found.

NOTE: fetch
http://www.angstrom-distribution.org/unstable/sources/dm355_codecs_03_10_=
00_00.tar.gz
--2010-11-04 20:28:43--
http://www.angstrom-distribution.org/unstable/sources/dm355_codecs_03_10_=
00_00.tar.gz
Resolving www.angstrom-distribution.org... 188.40.83.200
Connecting to www.angstrom-distribution.org|188.40.83.200|:80... connecte=
d.
HTTP request sent, awaiting response... 404 Not Found
2010-11-04 20:28:43 ERROR 404: Not Found.

NOTE: Task failed: Fetch failed:
ftp://gtftp01.gt.design.ti.com/arago/dm355_codecs_03_10_00_00.tar.gz;name=
=3Ddm355codecsbin
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.0=
0.00.bb=20


do_fetch failed
ERROR: Task 8
(/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.=
00.00.bb,=20


do_fetch) failed
NOTE: Tasks Summary: Attempted 1 tasks of which 1 didn't need to be
rerun and 1 failed.
ERROR:
'/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.=
00.00.bb'=20


failed
klaus@ubuntu:~/development/oe$



Where is the file? Is the recipe to old?

Thanks!

Regards,
Klaus




--=20

Sensortherm GmbH
Sitz:/Head quarter: Hauptstra=DFe 123, 65843 Sulzbach (Taunus)
Registergericht:/Registry office: Amtsgericht Frankfurt/M.
Eintragungs-Nr.:/Registry-No. HRB 52438
Gesch=E4ftsf=FChrer:/General Manager: Werner Weldert



