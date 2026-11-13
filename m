Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1807.1794588324758180553
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 08:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YhDBeWTs;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: alex.kiernan@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0d63f60bcso14222567b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 08:45:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794588324; cv=none;
        d=google.com; s=arc-20260327;
        b=geH7W4G1wgZkzxoxYhhQkk7J1wyZIWb48kMvSfgsxsKQKgTB+4gMErAElSuolNLkJx
         9oge3xTjAL+RXeTiHv4sBIOZ/sOZycvrVH4q9xgFBbZ0goyMCFbtcVGt7C4XQU/etiOl
         vXtZzQFnnGZexiZqDrsu5dn38X4mJkf8ID7EP/dbw95WC0Kp/V3sTFSYRY0HLKiI9CG+
         UGsnPYFK0JVlFcAJBmBUNDvNO+XZqsCMvHSt8JCWigZfcaA7HNshDiT0TgDCVkzhWLyc
         06igTrOV/OC0A4OdKmY9SmWMgqgCdObpUfs57uX/NziVG0gIgbYvTGakqkgxMcL6iT+s
         15mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1XMLcK+NxMYmGgDO+QfrBjOTY1bPjAzfAfiGFfJXjHo=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=dLCWxCV8g646pSrTPXmR6b7sif3dQqvz3KMSvCV6/dR3/KXmr/a8ekVq7sx93vK/qL
         RuoF/q6n9S4kEDLskqS6WEryMvt8IShPOtEOCmBq4wlEZcNVqt1zi6YqH5JYBeVOnWfS
         SaeeZkAtg4T7s7IMlsjrVbEYChqevYHXQhhATnNHHci7+XyMN2T/Jc2FdM6i4n43vcJS
         9I558Kp16f5ndq7OXvMC2WBrPIUn9G3FinnOQvnhpb4UqCmT5Q/zH8qtjFW1PVEM3t9e
         aaZ+k4RKDtPOLF2xtJE3bGsYli7Hs2QCb2eDbIOmRjaGZP7h9efXnO2JB8/DDIx07PXe
         VKdw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588324; x=1795193124; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1XMLcK+NxMYmGgDO+QfrBjOTY1bPjAzfAfiGFfJXjHo=;
        b=YhDBeWTshhmFfRrrkAlXnMIE4+X3FPodtzUZC0exaiN5rAEShcpnsUPAKmGJGVwmUn
         trntmd/QGTGY8wPSY6hP8h+ECnrBlw+1T9jywnb5sSFQd3Tqcoo9LKqAntX8rmtDDH1d
         k/eXheRAOIm7rvrFxaLuF5A3PU+t8HORNSdRuHABtKaqTEA7ke3UEZTLe6kcRm1f1UxL
         XIC+fXGDFLhh5URsRwAvy7eG1jr6fPkIs6TYDOqQej1ne69lY3UiXBF5lniqOUwcL1F1
         YMdvQda7iIFIfBG/jCse47O545JRYtYcWv3jyYEJ1T7vQqAvIjBT4Ka0di46gKzgzBSb
         OLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588324; x=1795193124;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1XMLcK+NxMYmGgDO+QfrBjOTY1bPjAzfAfiGFfJXjHo=;
        b=t9a1E2WuLJXptmMqORK4kf1ifBoMLkZrwGWGzvWeH9D2FG3BtfJ8flL6tRSj9fsd/M
         Ba7WZKTaSlGiSv30G9+3WWMnrg1dxkcPFJpZTANd+PjjWzh7Rl2YuaVm1GsmuOCjotY8
         swiBjADI75UDjzFLdNqRGuq1k2bmiVxtLE8TIvVvJlFYIPsy4/4leafZvtH2tE6mardz
         UXTvpb3d4MCWRE7/R7l+vew6K+vtFY1jU6uCgyoTbSFIjYI16RqJlGfXqsPrTksSm/PN
         oCyE4DNVYnITg3WYpE9kc+l4DjC0315dKj5oC1YyRi6NISsRRtnxbQl4grFKItGbwwNi
         z4Fw==
X-Gm-Message-State: APuU4Z8JFPt0q8jBKGu65Hd5RSZGW9tqLEwGg/TkvZ+2XLY2PJu3WO9X
	1tSe22Yxt/HzmL4/hm734bMaezZfzo/YS+AUepzj2c7Vq49bQEAujQ4PjRS8Dfyh1u0o7G1LfNB
	P95omCIEU/94sjFlkmTnKEfVZ4xssiTI=
X-Gm-Gg: AYBFou1QYjYGTzznz1J0Dqxr9icmkua6/H93xykYmqOglNqRJtsHXGBWhpe9ACw5kBZ
	i940ckTYIoXFHd4X+rjnm5I96+xIMe5KXdbeePVw0QRyOjsG7N/G5dFJrdnFoAD6q0JAMTaHXdG
	Qr3LpyXCpK/uyDLaauDlcXRK/2x+caCzC2gKlBktcqWdyOuZcu4yxDnD54+ksfH6BZEN2CPpWBg
	KN+/Ndi9IEajagjc8qt3QNwDgiPkDpV9fhN3ioZOLhagzBLSBHeKut4DE8uDgg2MP1GnMU0XUF4
	odZCU+g/RByaeHUUZAu4yg57Go6uhgywv63itrOPB9TikOMcnmrKInQESnRmX5SgB7V7QSN/qHv
	vvueHh3/vmoyYhUrRoB8oy3Dgs+28RRBdfCWjTEylBXHoVmf3C4xtoEkl0LrOrTx4
X-Received: by 2002:a05:690e:4383:b0:67c:3a6c:d0c3 with SMTP id
 956f58d0204a3-67d896f9d45mr1254859d50.68.1794588323468; Fri, 13 Nov 2026
 08:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
 <CAMKF1sqnzQEBmAnpMZoEkuHzQwVQj0zF0wYTi2nAB1EWYTckYQ@mail.gmail.com>
 <CAO5Uq5QU9QWyWt0=YN7g7BXZLhaD=eF4wpEOMr7VpvpvOoDxwg@mail.gmail.com> <CAMKF1srWhrv9=n8Teawbf2_BK+dCdw+DTDw7hWuJj4VPQD2n4Q@mail.gmail.com>
In-Reply-To: <CAMKF1srWhrv9=n8Teawbf2_BK+dCdw+DTDw7hWuJj4VPQD2n4Q@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 13 Nov 2026 16:45:10 +0000
X-Gm-Features: AclHuK9GIWEh5qfnLyX_hEVhxeRjaFwib9ltzdkMTOMLEpPuZNko4NhnGs8QyFY
Message-ID: <CAO5Uq5TzwAke7ugwQtMJs5_z2fWTLejemBR2-_0VF+FK++Zwvw@mail.gmail.com>
Subject: Re: [oe] [PATCH meta-oe 00/10] android-tools: adbd fixes and opt-in
 access control for Linux systems
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 16:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132249

On Fri, Nov 13, 2026 at 4:29=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Fri, Nov 13, 2026 at 2:08=E2=80=AFAM Alex Kiernan <alex.kiernan@gmail.=
com> wrote:
>>
>> That's fair...
>>
>> I guess the right thing at this point is to drop the series as I've
>> not engaged (and really don't have the time at this point) with the
>> Debian maintainers to try and land it there and I suspect some
>> wouldn't fit with their goals (thinking things like using build.prop
>> to gate authentication) and almost certainly none of it would be able
>> to land upstream in Google as it's irrelevant to Android. Also they've
>> got significant divergence in later releases (things like libadbusb
>> look like might solve a load of problems).
>
>
> Upgrading might be a better option here, adding patches diverges us more
>

Debian is still shipping 34.x, their 35.x is an experimental branch,
Android is on 37.x (but appears to have stopped tagging it separately
from the Android base release).

That said, bumping it up looks like it may not be that bad (though
libadbusb looks like it's a dead end anway as it's host side and not
obviously published anywhere).

This is where I got to (well Claude with direction from everything I
already had...):

https://github.com/A-Squared-Projects/meta-android-platform-tools

Still trying to chase down the failures on cable pulls, which I
currently have covered with a watcher script (yuck!)

--=20
Alex Kiernan
