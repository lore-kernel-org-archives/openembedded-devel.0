Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKvwP-00060E-Rh
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 17:42:02 +0100
Received: by yxd5 with SMTP id 5so5242592yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 08:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=BJqO/zGZzvUV78U3ja4fiad/MtUkY+dL98ID9ZxEYCw=;
	b=x/9lgKEBueJKOJZfDmz6z9cFoZJNzFhr8VHqTiBpUxurJheaaeE/6/lv+5iKF6a+E/
	8GIc97sOPiwnofhodYMLKqzUW13H84zRDPuNrsgW5UjdGSOIbcl6dyXErOvye845N9on
	f8fKQR4mMMj1LuQwR62IV2SVXYL+1BjiNE1+g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=s69mWlVPuaYx9gfSpYAo+qyUmPvl/nauaUHwdfsdU6RHWXCkxpxVzIQm/lWXC0uvPQ
	rLKucpVxzI19CoMD1jrOF6rkdejazuhD2U9dVSiQ/NMA005XxzngV9P6hwv9zfac97El
	Ksv7pw6HAdyuKCqpCF8RKQr0ukpCrI9a7Px9M=
Received: by 10.91.121.3 with SMTP id y3mr8917591agm.156.1290530446930; Tue,
	23 Nov 2010 08:40:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 23 Nov 2010 08:40:26 -0800 (PST)
In-Reply-To: <20101123141703.GE3274@jama>
References: <1290521490-1975-1-git-send-email-eric@eukrea.com>
	<20101123141703.GE3274@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Nov 2010 08:40:26 -0800
Message-ID: <AANLkTinok7air3DLq16+i0gnScJesq8qe3X0bi9O41iM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] micro: update prefered binutils for arm
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
X-List-Received-Date: Tue, 23 Nov 2010 16:42:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 6:17 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Nov 23, 2010 at 03:11:30PM +0100, Eric B=C3=A9nard wrote:
>
>> * with this, the build finish but image creation fails with :
>> http://tinderbox.openembedded.net/public/logs/task/10935754.txt
>
> this should be fixed with
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D237192e0a8=
3e5a629133e387c2aa9e5dc322982a
>

the idea of using a proper release is a good one. but not only
for arm but for all arches please.

> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


