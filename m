Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P7BqJ-00013a-Ck
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 20:50:58 +0200
Received: by wwe15 with SMTP id 15so2042122wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 11:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IA0nw016+4fgsLImFrW2dKadUTKi0Ucoh9Lecnn8h8w=;
	b=RkBeYbOkfhnbO+CbGiO4jfEitN1jZJaCJUSgUO3GzziUyniEZqPcGMVEE2Wy17QDao
	ctb2XovwtpAR9zOWSLfgztJNvaOdRBzupEz+D5UmJSAvkQarttKUWFxJHkIrII0SvO7l
	JMy8SqGtIjiBFgQxQYEzfhJUkND7kybb0a10Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VLBm/7iLlrZiqrho8AIOKyKYy0KC+t18PDtEiS0pNz/hiVxaoMd4ORPNq7Wke6OEOa
	tpWhvCNQcjHWOpA8biNav59vmNWX1VTWqmiOAKBDPb4uwH2UJMpqyVkNdya3boZqH6us
	BNjc7sUxBplyGug4WQrM+0IvbDlclMly2iFfQ=
MIME-Version: 1.0
Received: by 10.227.128.68 with SMTP id j4mr2721168wbs.52.1287255015561; Sat,
	16 Oct 2010 11:50:15 -0700 (PDT)
Received: by 10.227.141.70 with HTTP; Sat, 16 Oct 2010 11:50:15 -0700 (PDT)
In-Reply-To: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<AANLkTinse8QO1RjTSFqQ10_SOR68C7wbhRq=qPGhDhzh@mail.gmail.com>
	<AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
Date: Sat, 16 Oct 2010 20:50:15 +0200
Message-ID: <AANLkTi=Y8kCYtSkh3Px8TAZbx1zTO_0QoM6wS_r7+hbV@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
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
X-List-Received-Date: Sat, 16 Oct 2010 18:50:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 16, 2010 at 8:24 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Sat, Oct 16, 2010 at 11:04 AM, Martin Jansa <martin.jansa@gmail.com>wr=
ote:
>
>> Probably needs reversed OVERRIDES order also in bitbake.conf FILESPATH
>>
>> FILESPATH =3D "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for
>> fp in d.getVar('FILESPATHBASE', 1).split(':') for p in
>> d.getVar('FILESPATHPKG', 1).split(':') for o in (d.getVar('OVERRIDES',
>> 1) + ':').split(':')])}"
>>
>
> Yes, you're right. =A0OVERRIDES in bitbake is used such that the *last*
> defined overridden variable is used, but FILESPATH uses the *first* file =
it
> finds. =A0Reversing it there should indeed fix it. =A0Nicely spotted, tha=
nks. =A0I
> have some errands to run, so won't have a chance to apply a fix until thi=
s
> evening, so if someone else wants to get it in, feel free.

It's a bit more complicated

OE om-gta02@shr ~/dev/recipes/xorg-xserver $ bitbake -e -b
xserver-xorg-conf_0.1.bb | grep ^OVERRIDES
OVERRIDES=3D"thumb:thumb-interwork:libc-glibc:pn-xserver-xorg-conf:fail-fas=
t:build-linux:arm:linux-gnueabi:shr::om-gta02:local:armv4t:armv4t"

that empty :: between shr and om-gta02 (where MACHINE_OVERRIDES should
be) is breaking it for both orders (ie ignoring all after om-gta02 or
after shr from with reversed order)

This is part of filespath (for first FILESPATHPKG - ${PF}) from
base_do_unpack in base.bbclass:
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/task-unpack'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/thumb'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/thumb-interwork'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/libc-glibc'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/pn-xserver-xorg-con=
f'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/fail-fast'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/build-linux'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/arm'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/linux-gnueabi'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/shr'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36'
        -- here is the problem
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/om-gta02'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/local'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/armv4t'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36/armv4t'
'/OE/dev/recipes/xorg-xserver/xserver-xorg-conf-0.1-r36'

Regards,


