Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 97D8065DFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 07:28:31 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s397SP9A014694
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Apr 2014 09:28:30 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Wed, 9 Apr 2014 09:28:25 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] How can I use gdb in oe?
Thread-Index: AQHPUzW833CqhXf9TE6LqHLohEpMIZsI4M30
Date: Wed, 9 Apr 2014 07:28:24 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3B0981@post.tritech.se>
References: <CALYKT1gcCmYKqy55T3Xv7qevR2g-EWv-y9dabjzz-D8psdYF2w@mail.gmail.com>
In-Reply-To: <CALYKT1gcCmYKqy55T3Xv7qevR2g-EWv-y9dabjzz-D8psdYF2w@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Subject: Re: How can I use gdb in oe?
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
X-List-Received-Date: Wed, 09 Apr 2014 07:28:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
Assuming that you mean to debug programs on your target...=0A=
=0A=
Prerequisites:=0A=
- a network connection between your target and your development host (it's =
possible to use a tty too).=0A=
- OE built SDK installed on your host.=0A=
- gdbserver package installed on your target.=0A=
- your binary (my-program) on target=0A=
- an unstripped version of your binary in the working directory on host.=0A=
=0A=
The exact commands below will vary with the install path of your SDK (/usr/=
local/oecore-x86_64 in my case)=0A=
and target specifics (e.g. powerpc, ppce300c3... in my case).=0A=
=0A=
On target:=0A=
# gdbserver :2345 my-program=0A=
=0A=
On host:=0A=
$ source /usr/local/oecore-x86_64/environment-setup-ppce300c3-oe-linux=0A=
$ powerpc-oe-linux-gdb my-program=0A=
(gdb) set sysroot /usr/local/oecore-x86_64/sysroots/ppce300c3-oe-linux=0A=
(gdb) target remote <target-ip>:2345=0A=
(gdb) br main=0A=
(gdb) cont=0A=
...=0A=
=0A=
Good Luck!=0A=
// Mats=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Journeyer J. Joh [oosaprogram=
mer@gmail.com]=0A=
Sent: Tuesday, April 08, 2014 4:20 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: [oe] How can I use gdb in oe?=0A=
=0A=
Hello,=0A=
=0A=
I use open-embedded in my company.=0A=
It is used in Qualcomm's communication module - specifically on AP=0A=
(Qualcomm's chipset is composed of MDM + AP).=0A=
=0A=
And when I compile oe linux, I use bitbake.=0A=
=0A=
In this environment I'd like to use gdb to debug applications for this oe=
=0A=
linux.=0A=
=0A=
How can I use gdb in this?=0A=
I have experience in using gdb in just PC environment. Not in embedded env.=
.=0A=
=0A=
Thank you very much in advance!=0A=
=0A=
Sincerely=0A=
Journeyer=0A=
=0A=
----------------------------------------=0A=
Journeyer J. Joh=0A=
o o s a p r o g r a m m e r=0A=
a t=0A=
g m a i l  d o t  c o m=0A=
----------------------------------------=0A=
--=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=

