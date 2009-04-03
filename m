Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1Lpolk-0002KS-KO
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 21:09:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id 1B22F5010901
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Apr 2009 16:13:51 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14X9nTZXIKhL
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Apr 2009 16:13:42 -0300 (BRT)
Received: from [192.168.1.103] (unknown [189.120.39.163])
	by mail.2mi.com.br (Postfix) with ESMTP id 99A0450277D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Apr 2009 16:13:41 -0300 (BRT)
Message-ID: <49D65E44.2080002@2mi.com.br>
Date: Fri, 03 Apr 2009 16:06:44 -0300
From: "Jader H. Silva" <jader@2mi.com.br>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1236890935.6250.26.camel@northpole>	<1237220171.4020.4.camel@faraday>	<be7a9f3d0903161800i3f6735c8u7eafe009f2cb0b88@mail.gmail.com>	<1237928739.20348.3.camel@northpole>
	<878wmu48qc.fsf@neumann.lab.ossystems.com.br>
In-Reply-To: <878wmu48qc.fsf@neumann.lab.ossystems.com.br>
X-SA-Exim-Connect-IP: 208.51.207.131
X-SA-Exim-Mail-From: jader@2mi.com.br
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: calibrateproto git tag
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
X-List-Received-Date: Fri, 03 Apr 2009 19:09:41 -0000
Content-Type: multipart/mixed; boundary="------------040900010600040406050105"

--------------040900010600040406050105
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Otavio Salvador escreveu:
> "Jader H. Silva" <jader@2mi.com.br> writes:
>
>  =20
>> Em Seg, 2009-03-16 =C3=A0s 22:00 -0300, Otavio Salvador escreveu:
>>    =20
>>> 2009/3/16 Marcos Amorim <marcos@2mi.com.br>:
>>>      =20
>>>> libxcalibrate_git add tag
>>>>
>>>>
>>>> git diff packages/xorg-lib/libxcalibrate_git.bb
>>>> diff --git a/packages/xorg-lib/libxcalibrate_git.bb
>>>> b/packages/xorg-lib/libxcalibrate_git.bb
>>>> index f9e1587..7f889df 100644
>>>> --- a/packages/xorg-lib/libxcalibrate_git.bb
>>>> +++ b/packages/xorg-lib/libxcalibrate_git.bb
>>>> @@ -6,7 +6,7 @@ DEPENDS =3D "virtual/libx11 calibrateproto libxext"
>>>>  PV =3D "0.0+gitr${SRCREV}"
>>>>  PE =3D "1"
>>>>
>>>> -SRC_URI =3D
>>>> "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate;protocol=3D=
git"
>>>> +SRC_URI =3D
>>>> "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate;protocol=3D=
git;tag=3Dmaster"
>>>>        =20
>>> Please use AUTOREV in conf/distro/include/insane-srcrevs.inc and a go=
od
>>> one at conf/distro/include/sane-srcrevs.inc. This makes images easier=
 to
>>> be reproducable.
>>>      =20
>> Add calibrateproto sane revision to sane-srcrevs.inc, corrected this b=
ug
>> in my compilation.
>> Patch is attached.
>>    =20
>
> [...]
>
> Please send the patch in git format-patch; so I can queue it here in my
> tree and push it together with other fixes.
>
>  =20

Patch in git format-patch is attached, sorry for the delay.

--------------040900010600040406050105
Content-Type: text/x-patch;
 name="0001-Add-calibrateproto-and-libxcalibrate-sane-srcrevs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-Add-calibrateproto-and-libxcalibrate-sane-srcrevs.patch"

From 7511e3619f63200239efcff64996616c700024ab Mon Sep 17 00:00:00 2001
From: Jader H. Silva <vo@northpole.(none)>
Date: Fri, 3 Apr 2009 16:00:17 -0300
Subject: [PATCH] Add calibrateproto and libxcalibrate sane srcrevs

---
 conf/distro/include/sane-srcrevs.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index fc341f3..bb9b75b 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -19,6 +19,7 @@ SRCREV_pn-assassin ?= "268"
 SRCREV_pn-assassin-thumbnail ?= "4690"
 SRCREV_pn-bfin-uclibc ?= "1857"
 SRCREV_pn-bootchart-lite ?= "4"
+SRCREV_pn-calibrateproto ?= "1da6fd1e2c7a49648245c98481fabea8b9690a8c"
 SRCREV_pn-clutter-box2d ?= "3197"
 SRCREV_pn-clutter-cairo ?= "3210"
 SRCREV_pn-clutter-gst ?= "3188"
@@ -98,6 +99,7 @@ SRCREV_pn-libowl ?= "277"
 SRCREV_pn-librfid ?= "2094"
 SRCREV_pn-libw100 ?= "47"
 SRCREV_pn-libowl ?= "277"
+SRCREV_pn-libxcalibrate ?= "209d83af61ed38a002c8096377deac292b3e396c"
 SRCREV_pn-libxosd ?= "627"
 SRCREV_pn-linux-bfin ?= "3758"
 SRCREV_pn-linux-hackndev-2.6 ?= "1308"
-- 
1.5.6.3


--------------040900010600040406050105--
