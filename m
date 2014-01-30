Return-Path: <sanjay_dorairaj@cable.comcast.com>
Received: from cable.comcast.com (pacdcavout01.cable.comcast.com
	[69.241.43.119])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6F66E9BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 13:35:39 +0000 (UTC)
Received: from ([24.40.56.114])
	by pacdcavout01.cable.comcast.com with ESMTP  id 97wm3m1.81440171;
	Thu, 30 Jan 2014 08:35:37 -0500
Received: from PACDCEXMB12.cable.comcast.com ([169.254.6.198]) by
	PACDCEXHUB01.cable.comcast.com ([fe80::84e8:95f3:f13b:169e%12]) with
	mapi id 14.03.0158.001; Thu, 30 Jan 2014 08:35:37 -0500
From: "Dorairaj, Sanjay" <Sanjay_Dorairaj@cable.comcast.com>
Thread-Topic: Errors when using populate_sdk - has anyone encountered this
	before?
Thread-Index: AQHPHcAoamcSiPXbe0Gl8VYvFAPP6g==
Date: Thu, 30 Jan 2014 13:35:36 +0000
Message-ID: <CF0F9308.4046D%Sanjay_Dorairaj@cable.comcast.com>
In-Reply-To: <1391086167-31517-1-git-send-email-chase.maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.3.4.130416
x-originating-ip: [68.87.16.248]
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: "ridish.ra@lntinfotech.com" <ridish.ra@lntinfotech.com>,
	KalyanKumar Nagabhirava <kalyankumar.nagabhirava@lntinfotech.com>
Subject: Errors when using populate_sdk - has anyone encountered this before?
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
X-List-Received-Date: Thu, 30 Jan 2014 13:35:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <75D5CECE9144C64591F751BF1C63923E@cable.comcast.com>
Content-Transfer-Encoding: quoted-printable

Hi All,

We are getting build error when using populate_sdk for our RDK builds. Has
anyone seen this?=20

For generating sdk we use  "bitbake -c populate_sdk rdk-generic-image"
command ,  we are getting below error:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
NOTE: Applying patch 'relocatable_sdk.patch'
(../meta-linaro/meta-linaro/recipes-devtools/qemu/files/relocatable_sdk.pat
ch)
ERROR: Command Error: exit status: 1  Output:
Applying patch relocatable_sdk.patch
can't find file to patch at input line 13
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Upstream-Status: Inappropriate [SDK specific]
|
|In order to be able to change the dynamic loader path when relocating
|binaries, the interp section has to be made big enough to accomodate
|the new path (4096 is the maximum path length in Linux).
|
|Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
|
|Index: qemu-1.4.0/ldscripts/i386.ld
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
|--- qemu-1.4.0.orig/ldscripts/i386.ld  2013-02-15 15:05:35.000000000 -0800
|+++ qemu-1.4.0/ldscripts/i386.ld       2013-02-28 22:55:36.138816418 -0800
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
can't find file to patch at input line 26
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: qemu-1.4.0/ldscripts/x86_64.ld
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
|--- qemu-1.4.0.orig/ldscripts/x86_64.ld        2013-02-15
15:05:35.000000000 -0800
|+++ qemu-1.4.0/ldscripts/x86_64.ld     2013-02-28 22:55:36.138816418 -0800
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch relocatable_sdk.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
/home/ridish/RDK-RI-NICO-2/build-qemux86/tmp/work/i686-nativesdk-rdksdk-lin
ux/nativesdk-qemu/1.6.0+gitAUTOINC+0169c51155-r2/temp/log.do_patch.15188
ERROR: Task 1574=20
(virtual:nativesdk:/home/ridish/RDK-RI-NICO-2/meta-linaro/meta-linaro/recip
es-devtools/qemu/qemu_git.bb, do_patch) failed with exit code '1'


Regards,


Sanjay


>


