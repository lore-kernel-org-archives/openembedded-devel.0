Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P7CqR-0003R9-9G
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 21:55:08 +0200
Received: by wyb40 with SMTP id 40so1960555wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 12:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0XfwuYPL7/X3+CyXWB8n5VIFMe3U8KFmMpCepHAEmUk=;
	b=ABU38xPDH8YzjMu+4Abs37+j9Coot5y0pzekuX7qTljGz0bI54ZpA3Dw/z2C3LHmzj
	6a0YqzsZMwW3Eyt/VlXy1msc0nVyV+k4fjDlx7a9pADLgWirHCC0Am8lfyh9d21qUW8h
	iws7/MTWNrON1is+0iTokHh5uAGHmRZCexvj8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ML8mxqdraNsxd9MvPF+AfzZiEUi2W2amnJLaUSzsjuMeoHjJyq9keYuyiGDgLQOFIE
	7DOQL6aGcGeI5IFaW2gGeZQNIP+9eOZNUD0mj+xC/pbY2bD32n3k5R4NJsedcoVo2Hge
	ccAy2RhXKzUeiSQBUOlJJxAnE8XV3OJLu5LA0=
MIME-Version: 1.0
Received: by 10.227.156.210 with SMTP id y18mr2702131wbw.63.1287258872892;
	Sat, 16 Oct 2010 12:54:32 -0700 (PDT)
Received: by 10.227.141.70 with HTTP; Sat, 16 Oct 2010 12:54:32 -0700 (PDT)
In-Reply-To: <AANLkTi=GsruLS6bwKpO5WtuMvv4evj8Ry0qZejmyVTQj@mail.gmail.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<AANLkTinse8QO1RjTSFqQ10_SOR68C7wbhRq=qPGhDhzh@mail.gmail.com>
	<AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
	<AANLkTi=Y8kCYtSkh3Px8TAZbx1zTO_0QoM6wS_r7+hbV@mail.gmail.com>
	<AANLkTi=GsruLS6bwKpO5WtuMvv4evj8Ry0qZejmyVTQj@mail.gmail.com>
Date: Sat, 16 Oct 2010 21:54:32 +0200
Message-ID: <AANLkTi=sMXcw29P2Z-tzwu7NLaD92PfXMLOWceL4zXc4@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Reverse the order of OVERRIDES
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
X-List-Received-Date: Sat, 16 Oct 2010 19:55:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 16, 2010 at 9:35 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Sat, Oct 16, 2010 at 8:50 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Sat, Oct 16, 2010 at 8:24 PM, Chris Larson <clarson@kergoth.com> wrot=
e:
>>> On Sat, Oct 16, 2010 at 11:04 AM, Martin Jansa <martin.jansa@gmail.com>=
wrote:
>>>
>>>> Probably needs reversed OVERRIDES order also in bitbake.conf FILESPATH
>>>>
>>>> FILESPATH =3D "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) f=
or
>>>> fp in d.getVar('FILESPATHBASE', 1).split(':') for p in
>>>> d.getVar('FILESPATHPKG', 1).split(':') for o in (d.getVar('OVERRIDES',
>>>> 1) + ':').split(':')])}"
>>>>
>>>
>>> Yes, you're right. =A0OVERRIDES in bitbake is used such that the *last*
>>> defined overridden variable is used, but FILESPATH uses the *first* fil=
e it
>>> finds. =A0Reversing it there should indeed fix it. =A0Nicely spotted, t=
hanks. =A0I
>>> have some errands to run, so won't have a chance to apply a fix until t=
his
>>> evening, so if someone else wants to get it in, feel free.
>>
>> It's a bit more complicated
>>
>> OE om-gta02@shr ~/dev/recipes/xorg-xserver $ bitbake -e -b
>> xserver-xorg-conf_0.1.bb | grep ^OVERRIDES
>> OVERRIDES=3D"thumb:thumb-interwork:libc-glibc:pn-xserver-xorg-conf:fail-=
fast:build-linux:arm:linux-gnueabi:shr::om-gta02:local:armv4t:armv4t"
>>
>> that empty :: between shr and om-gta02 (where MACHINE_OVERRIDES should
>> be) is breaking it for both orders (ie ignoring all after om-gta02 or
>> after shr from with reversed order)
>
> Even with those 2 patches I've just sent I still have wrong order of
> TARGET_ARCH OVERRIDES :/.
>
>
> OE om-gta02@shr ~/dev/recipes/xorg-xserver $ bitbake -e -b
> xserver-xorg-conf_0.1.bb | grep ^FILESPATH=3D | sed "s/:/\n/g" | head -n
> 20
> FILESPATH=3D"
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/armv4t
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/armv4t
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/local
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/om-gta02
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/shr
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/linux-gnueabi
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/arm
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/build-linux
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/fail-fast
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/pn-xserver-xorg-co=
nf
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/libc-glibc
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/thumb-interwork
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/thumb
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/armv4t
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/armv4t
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/local
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/om-gta02
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/shr
> /OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/linux-gnueabi
> .....
>
> any hint?

Ah I have TARGET_ARCH (actually FEED_ARCH) twice in OVERRIDES, one
from sane-toolchain.inc and second from sane-feed.inc (maybe we should
drop one of them).

I have patch which preppends FEED_ARCH instead of appending it
-OVERRIDES .=3D ":${FEED_ARCH}"
+OVERRIDES =3D. "${FEED_ARCH}:"

in few distro configs

#       modified:   ../../conf/distro/chinook-compat.conf
#       modified:   ../../conf/distro/include/kaeilos-2010.inc
#       modified:   ../../conf/distro/include/kaeilos.inc
#       modified:   ../../conf/distro/include/sane-feed.inc
#       modified:   ../../conf/distro/include/sane-toolchain.inc
#       modified:   ../../conf/distro/maemo5-compat.conf

but now I'm quite confused if it's right fix, because with this
reversed order of OVERRIDES it's not enough to change from append to
preppend, because it also depends on order how
bitbake.conf/sane-*.inc/distro.conf are included together :/.

So now I have

OE om-gta02@shr ~/dev/recipes/xorg-xserver $ bitbake -e -b
xserver-xorg-conf_0.1.bb | grep ^OVERRIDES
OVERRIDES=3D"thumb:thumb-interwork:libc-glibc:armv4t:armv4t:pn-xserver-xorg=
-conf:fail-fast:build-linux:arm:linux-gnueabi:shr:om-gta02:local"

OE om-gta02@shr ~/dev/recipes/xorg-xserver $ bitbake -e -b
xserver-xorg-conf_0.1.bb | grep ^FILESPATH=3D | sed "s/:/\n/g" | head -n
20
FILESPATH=3D"
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/local
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/om-gta02
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/shr
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/linux-gnueabi
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/arm
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/build-linux
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/fail-fast
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/pn-xserver-xorg-conf
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/armv4t
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/armv4t
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/libc-glibc
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/thumb-interwork
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/thumb
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/local
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/om-gta02

but it doesn't seem right again :/

Regards,


