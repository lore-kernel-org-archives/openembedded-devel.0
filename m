Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P7CYN-00012e-VK
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 21:36:34 +0200
Received: by wyb40 with SMTP id 40so1951375wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 12:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zu6G7YiP5tGhBoRFX+GIS7BcX3P4vi/C3JPaKAUzCu8=;
	b=dQ2ShAmETSnpP7235Zhxxti+0750lEgrzOWoJS+TCpOtRZfdEfvViIddIN3bu/E+vu
	MIs74MS4Ky760P41qWxHdFaurZL7TfGX0laqMllis2U904ypMcAqxvju4Aop5e292nR+
	i8h80HwbHL6WjkQ5ugvVaysW1xf13gyXnSYSE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=N/E/WxKG87et+9pafiHlfAfhe7fxAFz8/HqIdf/Hrr+3UTJ416ptDJa2tWtrqRnVVd
	fdA4n6zoYDFEWNg6XI9nIj7Ie3Ejq/8jE5YXtxAiIlncsUMmYeGe11D0I+V45MOxqFMc
	D7SD4fKR+O8CB5W2BBCGd0PGlgsjpDyxRB1Vc=
MIME-Version: 1.0
Received: by 10.227.147.82 with SMTP id k18mr2696454wbv.64.1287257749256; Sat,
	16 Oct 2010 12:35:49 -0700 (PDT)
Received: by 10.227.141.70 with HTTP; Sat, 16 Oct 2010 12:35:49 -0700 (PDT)
In-Reply-To: <AANLkTi=Y8kCYtSkh3Px8TAZbx1zTO_0QoM6wS_r7+hbV@mail.gmail.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<AANLkTinse8QO1RjTSFqQ10_SOR68C7wbhRq=qPGhDhzh@mail.gmail.com>
	<AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
	<AANLkTi=Y8kCYtSkh3Px8TAZbx1zTO_0QoM6wS_r7+hbV@mail.gmail.com>
Date: Sat, 16 Oct 2010 21:35:49 +0200
Message-ID: <AANLkTi=GsruLS6bwKpO5WtuMvv4evj8Ry0qZejmyVTQj@mail.gmail.com>
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
X-List-Received-Date: Sat, 16 Oct 2010 19:36:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 16, 2010 at 8:50 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Sat, Oct 16, 2010 at 8:24 PM, Chris Larson <clarson@kergoth.com> wrote=
:
>> On Sat, Oct 16, 2010 at 11:04 AM, Martin Jansa <martin.jansa@gmail.com>w=
rote:
>>
>>> Probably needs reversed OVERRIDES order also in bitbake.conf FILESPATH
>>>
>>> FILESPATH =3D "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) fo=
r
>>> fp in d.getVar('FILESPATHBASE', 1).split(':') for p in
>>> d.getVar('FILESPATHPKG', 1).split(':') for o in (d.getVar('OVERRIDES',
>>> 1) + ':').split(':')])}"
>>>
>>
>> Yes, you're right. =A0OVERRIDES in bitbake is used such that the *last*
>> defined overridden variable is used, but FILESPATH uses the *first* file=
 it
>> finds. =A0Reversing it there should indeed fix it. =A0Nicely spotted, th=
anks. =A0I
>> have some errands to run, so won't have a chance to apply a fix until th=
is
>> evening, so if someone else wants to get it in, feel free.
>
> It's a bit more complicated
>
> OE om-gta02@shr ~/dev/recipes/xorg-xserver $ bitbake -e -b
> xserver-xorg-conf_0.1.bb | grep ^OVERRIDES
> OVERRIDES=3D"thumb:thumb-interwork:libc-glibc:pn-xserver-xorg-conf:fail-f=
ast:build-linux:arm:linux-gnueabi:shr::om-gta02:local:armv4t:armv4t"
>
> that empty :: between shr and om-gta02 (where MACHINE_OVERRIDES should
> be) is breaking it for both orders (ie ignoring all after om-gta02 or
> after shr from with reversed order)

Even with those 2 patches I've just sent I still have wrong order of
TARGET_ARCH OVERRIDES :/.


OE om-gta02@shr ~/dev/recipes/xorg-xserver $ bitbake -e -b
xserver-xorg-conf_0.1.bb | grep ^FILESPATH=3D | sed "s/:/\n/g" | head -n
20
FILESPATH=3D"
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/armv4t
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/armv4t
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/local
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/om-gta02
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/shr
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/linux-gnueabi
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/arm
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/build-linux
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/fail-fast
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/pn-xserver-xorg-conf
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/libc-glibc
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/thumb-interwork
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/thumb
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/armv4t
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/armv4t
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/local
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/om-gta02
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/shr
/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1/linux-gnueabi
.....

any hint?

Regards,


