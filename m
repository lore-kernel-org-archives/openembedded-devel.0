Received: from nm15-vm2.bullet.mail.ne1.yahoo.com ([98.138.91.91])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <juhsis@yahoo.com>) id 1R76fy-0008CM-Tb
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Sep 2011 16:24:27 +0200
Received: from [98.138.90.54] by nm15.bullet.mail.ne1.yahoo.com with NNFMP;
	23 Sep 2011 14:16:40 -0000
Received: from [98.138.89.172] by tm7.bullet.mail.ne1.yahoo.com with NNFMP;
	23 Sep 2011 14:16:40 -0000
Received: from [127.0.0.1] by omp1028.mail.ne1.yahoo.com with NNFMP;
	23 Sep 2011 14:16:40 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 408387.33995.bm@omp1028.mail.ne1.yahoo.com
Received: (qmail 98089 invoked by uid 60001); 23 Sep 2011 14:16:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1316787400; bh=4q3lh48wsHK0mVe/2kakhJ46ew33ecPRVtZul3qeMWU=;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type;
	b=gRRMJEZj2tp1Ckgr/qpxKAWRNa5egyr2+NudRvbk5TwRgoX/Sh347cFdpwIDvPBcq3EjZJhSmijTB2MpVA1OhxgScQuZTFD2Tbzig3UeUhWBy+bSFrq/3skhpXFQnwr260VAU4mbxLQOnjXWcbTf/b5lX8Q+wphKIY2XOvx9Qrk=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type;
	b=s/YZQPLQNFAMAzN6EYyLGcfDH23XOi63krBgS5dVNg3Q4mtnxpHroGam2UKI2zvl/iwv5sw4t3f6/D+8nQ8pps+XCBzEVB45+pGF4pRctBmk2jtuu/htJB1GzIiRGEPnUt1LoMhRj1EA9EMZ9Uozb/y96n/joCEzYjm2NJAX+Is=;
X-YMail-OSG: i2akOogVM1nMb7Jqr1XNi5C5iHj3sCxag5YKKdVAcGbd4Ws
 wkhYyPSIw
Received: from [95.9.177.49] by web121512.mail.ne1.yahoo.com via HTTP;
	Fri, 23 Sep 2011 07:16:40 PDT
X-Mailer: YahooMailWebService/0.8.114.317681
References: <1316770597.99899.YahooMailNeo@web121512.mail.ne1.yahoo.com>
	<4E7C63C8.3050900@mlbassoc.com>
	<1316776207.30918.YahooMailNeo@web121514.mail.ne1.yahoo.com>
	<4E7C6A49.3080006@mlbassoc.com>
Message-ID: <1316787400.97536.YahooMailNeo@web121512.mail.ne1.yahoo.com>
Date: Fri, 23 Sep 2011 07:16:40 -0700 (PDT)
From: ibrahim demir <juhsis@yahoo.com>
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <4E7C6A49.3080006@mlbassoc.com>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: ti_cgt_c6000_6.1.17_setup_linux_x86.bin error while installing ti-codec-engine
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
X-List-Received-Date: Fri, 23 Sep 2011 14:24:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

I have fixed this problem.. As you said, it creates all the required things=
 in /opt/ti/.. instead of /OEBASE directory. Basicly what i did is, copying=
 all the things under directory /opt/ti and pasting them where the /bin/cl6=
x must stay.&#65533;

Thanks for your help.


On 2011-09-23 05:10, ibrahim demir wrote:
> Yes, i had write permission to /opt and i set it only read and execute. =
But when i run "bitbake ti-codec-engine" it gives "/bin/sh:
> /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/bu=
ild/tmp-angstrom_2008_1/sysroots/beagleboard-angstrom-linux-gnueabi/usr/sha=
re/ti/ti-cgt6x-tree/bin/cl6x: No
> such file or directory" (which is the error message, i get this morning =
a lot) What should i do next?

Please keep your replies on the mailing list so everyone benefits.&#65533;=
 Also, top-posting is poor form.

You'll need to clean out the tools package so it gets reinstalled.
At the very least, try these steps:
&#65533;  % bitbake ti-cgt6x ti-codec-engine -c clean
&#65533;  % bitbake ti-codec-engine

--------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------------------------------
> *From:* Gary Thomas <gary@mlbassoc.com>
> *To:* openembedded-devel@lists.openembedded.org
> *Cc:* ibrahim demir <juhsis@yahoo.com>
> *Sent:* Friday, September 23, 2011 1:47 PM
> *Subject:* Re: [oe] ti_cgt_c6000_6.1.17_setup_linux_x86.bin error while =
installing ti-codec-engine
>
> On 2011-09-23 03:36, ibrahim demir wrote:
>>&#65533; Dear developers,
>>
>>
>>&#65533; I mentioned that an error at my last message half our ago, but =
when i run this commands there appear another error:
>>
>>&#65533; #bitbake -f -c fetch ti-cgt6x
>>&#65533; #bitbake ti-codec-engine
>>
>>&#65533; The result of first command is:
>>
>>&#65533; ***************************************************************=
**************
>>&#65533; parana@parana-desktop:/media/8cb6c643-3377-4bb9-99bc-810069de57=
57/home/parana/setup-scripts$ bitbake -f -c fetch ti-cgt6x
>>&#65533; NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. I=
nstall it to increase performance.
>>&#65533; Loading cache: 100% |##########################################=
#| ETA: 00:00:00
>>&#65533; Loaded 7202 entries from dependency cache.
>>&#65533; NOTE: Angstrom DOES NOT support fso-apm because regular apmd is=
 good enough--:--
>>&#65533; NOTE: Angstrom DOES NOT support ipkg because ipkg has been supe=
rseded by opkg:16
>>&#65533; NOTE: Angstrom DOES NOT support libiconv because the glibc buil=
tin iconv replacement is used
>>&#65533; NOTE: Angstrom DOES NOT support libiconv because the glibc buil=
tin iconv replacement is used
>>&#65533; NOTE: Angstrom DOES NOT support libiconv because the glibc buil=
tin iconv replacement is used
>>&#65533; NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils=
 3.x has been replaced by bluez4
>>&#65533; NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3=
.x has been replaced by bluez4
>>&#65533; NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3=
.x has been replaced by bluez4
>>&#65533; NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3=
.x has been replaced by bluez4
>>&#65533; NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils=
 3.x has been replaced by bluez4
>>&#65533; NOTE: Angstrom DOES NOT support bash-noemu because doesn't work=
 on the target:03
>>&#65533; Parsing recipes: 100% |########################################=
#| Time: 00:00:19
>>&#65533; Parsing of 7333 .bb files complete (6576 cached, 757 parsed). 7=
979 targets, 316 skipped, 0 masked, 0 errors.
>>
>>&#65533; Build Configuration:
>>&#65533; BB_VERSION =3D "1.12.0"
>>&#65533; METADATA_BRANCH =3D "2011.03-maintenance"
>>&#65533; METADATA_REVISION =3D "ece41e4"
>>&#65533; TARGET_ARCH =3D "arm"
>>&#65533; TARGET_OS =3D "linux-gnueabi"
>>&#65533; MACHINE =3D "beagleboard"
>>&#65533; DISTRO =3D "angstrom"
>>&#65533; DISTRO_VERSION =3D "2011.03"
>>&#65533; TARGET_FPU =3D "hard"
>>
>>&#65533; NOTE: Resolving any missing task queue dependencies
>>&#65533; NOTE: Preparing runqueue
>>&#65533; NOTE: Executing RunQueue Tasks
>>&#65533; NOTE: Running task 2 of 2 (ID: 0, /media/8cb6c643-3377-4bb9-99b=
c-810069de5757/home/parana/setup-scripts/sources/openembedded/recipes/ti/ti=
-cgt6x_6.1.17.bb, do_fetch)
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_fetch: Started
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_fetch: Succeeded
>>&#65533; NOTE: Tasks Summary: Attempted 2 tasks of which 1 didn't need t=
o be rerun and 0 failed.
>>&#65533; ***************************************************************=
**************
>>
>>&#65533; Then the second and the error is can be seen at log:
>>
>>&#65533; ***************************************************************=
**************
>>&#65533; parana@parana-desktop:/media/8cb6c643-3377-4bb9-99bc-810069de57=
57/home/parana/setup-scripts$ bitbake ti-codec-engine
>>&#65533; NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. I=
nstall it to increase performance.
>>&#65533; Loading cache: 100% |##########################################=
#| ETA: 00:00:00
>>&#65533; Loaded 7202 entries from dependency cache.
>>&#65533; NOTE: Angstrom DOES NOT support fso-apm because regular apmd is=
 good enough--:--
>>&#65533; NOTE: Angstrom DOES NOT support ipkg because ipkg has been supe=
rseded by opkg:13
>>&#65533; NOTE: Angstrom DOES NOT support libiconv because the glibc buil=
tin iconv replacement is used
>>&#65533; NOTE: Angstrom DOES NOT support libiconv because the glibc buil=
tin iconv replacement is used
>>&#65533; NOTE: Angstrom DOES NOT support libiconv because the glibc buil=
tin iconv replacement is used
>>&#65533; NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3=
.x has been replaced by bluez4
>>&#65533; NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils=
 3.x has been replaced by bluez4
>>&#65533; NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3=
.x has been replaced by bluez4
>>&#65533; NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3=
.x has been replaced by bluez4
>>&#65533; NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils=
 3.x has been replaced by bluez4
>>&#65533; NOTE: Angstrom DOES NOT support bash-noemu because doesn't work=
 on the target:03
>>&#65533; Parsing recipes: 100% |########################################=
#| Time: 00:00:16
>>&#65533; Parsing of 7333 .bb files complete (6576 cached, 757 parsed). 7=
979 targets, 316 skipped, 0 masked, 0 errors.
>>
>>&#65533; Build Configuration:
>>&#65533; BB_VERSION =3D "1.12.0"
>>&#65533; METADATA_BRANCH =3D "2011.03-maintenance"
>>&#65533; METADATA_REVISION =3D "ece41e4"
>>&#65533; TARGET_ARCH =3D "arm"
>>&#65533; TARGET_OS =3D "linux-gnueabi"
>>&#65533; MACHINE =3D "beagleboard"
>>&#65533; DISTRO =3D "angstrom"
>>&#65533; DISTRO_VERSION =3D "2011.03"
>>&#65533; TARGET_FPU =3D "hard"
>>
>>&#65533; NOTE: Resolving any missing task queue dependencies
>>&#65533; NOTE: Preparing runqueue
>>&#65533; NOTE: Executing RunQueue Tasks
>>&#65533; NOTE: Running task 743 of 1240 (ID: 275, /media/8cb6c643-3377-4=
bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recipe=
s/ti/ti-cgt6x_6.1.17.bb, do_unpack)
>>&#65533; NOTE: Running task 744 of 1240 (ID: 290, /media/8cb6c643-3377-4=
bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recipe=
s/ti/ti-cgt6x_6.1.17.bb,
> do_distribute_sources)
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_unpack: Started
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_distribute_sources:=
 Started
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_distribute_sources:=
 Succeeded
>>
>>&#65533; This will install C6000 Code Generation Tools on your computer.=
 Continue? [n/Y]
>>&#65533; Software License Agreement for
>>&#65533; Code Generation Tools, Utilities and Run-Time Libraries
>>
>>&#65533; /--------------------------------------------------------------=
------
>>&#65533; | IMPORTANT - PLEASE READ THE FOLLOWING LICENSE AGREEMENT CAREF=
ULLY. |
>>&#65533; | |
>>&#65533; | THIS IS A LEGALLY BINDING AGREEMENT. AFTER YOU READ THIS LICE=
NSE |
>>&#65533; | AGREEMENT, YOU WILL BE ASKED WHETHER YOU ACCEPT AND AGREE TO =
THE |
>>&#65533; | TERMS OF THIS LICENSE AGREEMENT. DO NOT CLICK "I HAVE READ AN=
D |
>>&#65533; | AGREE" UNLESS: (1) YOU ARE AUTHORIZED TO ACCEPT AND AGREE TO =
THE |
>>&#65533; | TERMS OF THIS LICENSE AGREEMENT ON BEHALF OF YOURSELF AND YOU=
R |
>>&#65533; | COMPANY; AND (2) YOU INTEND TO ENTER INTO AND TO BE BOUND BY =
THE |
>>&#65533; | TERMS OF THIS LEGALLY BINDING AGREEMENT ON BEHALF OF YOURSELF=
 AND |
>>&#65533; | YOUR COMPANY. |
>>&#65533; \--------------------------------------------------------------=
------/
>>
>>&#65533; IMPORTANT -- READ CAREFULLY: This software license agreement
>>&#65533; ("Agreement") is a legal agreement between you (either an indiv=
idual
>>&#65533; or entity) and Texas Instruments Incorporated (TI"). The "Licen=
sed
>>&#65533; Materials" subject to this Agreement include the software progr=
ams
>>&#65533; that TI has granted you access to download with this Agreement =
and any
>>&#65533; "on-line" or electronic documentation associated with these pro=
grams,
>>&#65533; or any portion thereof, as well as any updates or upgrades to s=
uch
>>&#65533; -- Press space to continue or 'q' to quit --
>>&#65533; Do you accept the TI CG EULA in LICENSE.txt? [y/N]
>>
>>&#65533; Where do you want to install C6000 Code Generation Tools?
>>&#65533; [/opt/TI/TI_CGT_C6000_6.1.17]
>>&#65533; Installing C6000 Code Generation Tools...
>>
>>&#65533; Installing Linux Code Generation Tools...
>>&#65533; Installing Unix Format READMEs...
>>&#65533; Installing Linux Format Include Files...
>>&#65533; Installing Linux Format Libraries...
>>&#65533; Installing Unix Manual Pages...
>>
>>&#65533; Installation complete.
>>
>>&#65533; ---------------------------------------------------------------=
------------
>>
>>&#65533; Remember to set environment variables appropriate to your shell=
. Examples:
>>
>>&#65533; (ba)sh -
>>&#65533; export
>>&#65533; C6X_C_DIR=3D"/opt/TI/TI_CGT_C6000_6.1.17/include;/opt/TI/TI_CGT=
_C6000_6.1.17/lib"
>>
>>&#65533; tcsh -
>>&#65533; setenv C6X_C_DIR
>>&#65533; "/opt/TI/TI_CGT_C6000_6.1.17/include;/opt/TI/TI_CGT_C6000_6.1.1=
7/lib"
>>
>>&#65533; DOS -
>>&#65533; set
>>&#65533; C6X_C_DIR=3D/opt/TI/TI_CGT_C6000_6.1.17\include;/opt/TI/TI_CGT_=
C6000_6.1.17\lib
>>
>>&#65533; ---------------------------------------------------------------=
------------
>>
>>&#65533; -- Press space to continue ---- Press space to continue --NOTE:=
 package ti-cgt6x-1_6_1_17-r4: task do_unpack: Succeeded
>>&#65533; NOTE: Running task 1184 of 1240 (ID: 276, /media/8cb6c643-3377-=
4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recip=
es/ti/ti-cgt6x_6.1.17.bb, do_patch)
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_patch: Started
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_patch: Succeeded
>>&#65533; NOTE: Running task 1185 of 1240 (ID: 286, /media/8cb6c643-3377-=
4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recip=
es/ti/ti-cgt6x_6.1.17.bb, do_configure)
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_configure: Started
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_configure: Succeede=
d
>>&#65533; NOTE: Running task 1186 of 1240 (ID: 287, /media/8cb6c643-3377-=
4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recip=
es/ti/ti-cgt6x_6.1.17.bb, do_qa_configure)
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_qa_configure: Start=
ed
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_qa_configure: Succe=
eded
>>&#65533; NOTE: Running task 1187 of 1240 (ID: 288, /media/8cb6c643-3377-=
4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recip=
es/ti/ti-cgt6x_6.1.17.bb, do_compile)
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_compile: Started
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_compile: Succeeded
>>&#65533; NOTE: Running task 1188 of 1240 (ID: 277, /media/8cb6c643-3377-=
4bb9-99bc-810069de5757/home/parana/setup-scripts/sources/openembedded/recip=
es/ti/ti-cgt6x_6.1.17.bb, do_install)
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_install: Started
>>&#65533; ERROR: Logfile of failure stored in:
> /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/bu=
ild/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_=
6_1_17-r4/temp/log.do_install.24167
>>&#65533; Log data follows:
>>&#65533; | + do_install
>>&#65533; | + install -d
> /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/bu=
ild/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_=
6_1_17-r4/image/usr/share/ti/ti-cgt6x-tree
>>&#65533; | + cp -pPrf
> '/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/b=
uild/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1=
_6_1_17-r4/cgt6x_6_1_17/*'
> /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/bu=
ild/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_=
6_1_17-r4/image/usr/share/ti/ti-cgt6x-tree
>>&#65533; | cp: cannot stat
> `/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/b=
uild/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1=
_6_1_17-r4/cgt6x_6_1_17/*': No
> such file or directory
>>&#65533; NOTE: package ti-cgt6x-1_6_1_17-r4: task do_install: Failed
>>&#65533; ERROR: Function 'do_install' failed (see
> /media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana/setup-scripts/bu=
ild/tmp-angstrom_2008_1/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_=
6_1_17-r4/temp/log.do_install.24167
> for further information)
>>&#65533; ERROR: Task 277 (/media/8cb6c643-3377-4bb9-99bc-810069de5757/ho=
me/parana/setup-scripts/sources/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb,=
 do_install) failed with exit code '1'
>>&#65533; ERROR: '/media/8cb6c643-3377-4bb9-99bc-810069de5757/home/parana=
/setup-scripts/sources/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb' failed
>>&#65533; ***************************************************************=
**************
>>
>>&#65533; Even if i didnt understand why i get all the errors bitbake can=
 generate:) , i still wonder what is wrong..
>
> Check to make sure that you don't have write permission to /opt
> If you have write permission in the directory /opt, the installer
> fails to put the tools where they belong in your OE build.
>
> --
> ------------------------------------------------------------
> Gary Thomas | Consulting for the
> MLB Associates | Embedded world
> ------------------------------------------------------------
>
>

--=20
------------------------------------------------------------
Gary Thomas&#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; =
&#65533;  |&#65533; Consulting for the
MLB Associates&#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#6553=
3; |&#65533; &#65533; Embedded world
------------------------------------------------------------
From mdpoole@troilus.org Sat Sep 24 01:51:26 2011
Received: from na3sys009aog118.obsmtp.com ([74.125.149.244])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mdpoole@troilus.org>) id 1R7FWg-0002pi-A2
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Sep 2011 01:51:26 +0200
Received: from mail-gx0-f171.google.com ([209.85.161.171]) (using TLSv1) b=
y
	na3sys009aob118.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTn0aPdB7wX50nTATdSE4+rxY75oEyQXd@postini.com;
	Fri, 23 Sep 2011 16:46:07 PDT
Received: by mail-gx0-f171.google.com with SMTP id 27so3697257gxk.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2011 16:46:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.130.138 with SMTP id v10mr4940499ics.159.1316810812422;
	Fri, 23 Sep 2011 13:46:52 -0700 (PDT)
Received: by 10.42.166.3 with HTTP; Fri, 23 Sep 2011 13:46:52 -0700 (PDT)
In-Reply-To: <4E7C63C8.3050900@mlbassoc.com>
References: <1316770597.99899.YahooMailNeo@web121512.mail.ne1.yahoo.com>
	<4E7C63C8.3050900@mlbassoc.com>
Date: Fri, 23 Sep 2011 16:46:52 -0400
Message-ID: <CAOU-OA+uKFYL4nJutdTHsUCYnGy9
