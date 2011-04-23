Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QDkWz-0004Lc-3v
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 23:38:21 +0200
Received: by eye27 with SMTP id 27so404484eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Apr 2011 14:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=TJ2VVrXLNoZx7WCc/1iyKWRWMagETTmvClk0zEwX2XI=;
	b=v4HFmC9DXDAiNsxmxihZ5vtsc1JJVErgndJmsSKigb0hYDcNpCZ6SfTrTKQE5I4FpD
	P7DlN5acsMWabU41zXDoZYy/W8sjMhjyiHQUnfV5ZHljvBKZC6ETN5Nq18XmKWnPMtli
	Fllno1GjhHgVu2lH1ld5mISYHs9O9J3xLmY0I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=EGJdv+EIwh3lqEVd/JdEC9Fy/AJWL2zPgf6PBeYFu+rV7NeiNfb2gV4F1VLEEnORev
	ttvJpeQV8LSvvxjpTAfKfNdhcz7ELGtzI0lTzoorEc2LYbDf1msEID/DHBexwP2gvWHe
	6hXT4+kM4sEMLIPduquly40CGyXr+LPwdh5gI=
Received: by 10.14.44.151 with SMTP id n23mr864747eeb.124.1303594544205; Sat,
	23 Apr 2011 14:35:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.119.196 with HTTP; Sat, 23 Apr 2011 14:35:14 -0700 (PDT)
In-Reply-To: <BANLkTimi6be3U-8PNH9VvDoHnhK=4xb6QQ@mail.gmail.com>
References: <1301955176-14829-1-git-send-email-ynezz@true.cz>
	<BANLkTim3y5mBwn6Qhfy754Oreioz93xQBw@mail.gmail.com>
	<BANLkTimi6be3U-8PNH9VvDoHnhK=4xb6QQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Apr 2011 14:35:14 -0700
Message-ID: <BANLkTikQ3f_fO26QyP6fUNss=sfFCXYRfQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH RFC] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Sat, 23 Apr 2011 21:38:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2011 at 2:23 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
>> Just to be sure, I moved udev to 04 after 03 sysfs.
>
> I'll add that /initscripts_1.0.bb expects udev as S04
>
> ...
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# udev will run as S04 if installed
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0../in=
it.d/sysfs.sh =C2=A0 =C2=A0 =C2=A0${D}${sysconfdir}/rcS.d/S03sysfs
> ...
>
> but udev starts as S03 since commit 523f22b938703b56a823fa9e9c577869669dd=
b82
> (udev: Use udev.inc and add udevadm to udev pacakge instead of udev-utils=
)
>
> Seems udev needs a fix...

yeah most of old recipes started it at 03 except 1
if its expected at 04 please change it
>
>
> Andrea
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


