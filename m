Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 49B36793D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 02:43:48 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id a19-v6so395790otl.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 19:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=l7GHyhhQkoOm2gB3GaB17E3bHhFR9FBcu0d+N4/UJU8=;
	b=S3zddqXrHi54VzZhSLvZvTyA0KdBd+lGQW2Ph/6slzCWPSD4OuqqYqIqOBB1nHPLa+
	SAXS+ZzzDCdsgBmakIXvXtYzCsbLVSn8Slctwwi8WsAaeGBW1aFHSxJTnyEm1qfvKbr7
	6L6c8Xb4mbCZrX8JsdAkxi9UNhg8a56s7CwhO8hGjRkRMmEATUvcTUHfim8srDNcBeqE
	YI/qt2Gh57my5kJfXLYs23eAUEh1YTtRyL4G3mlzA647z+HMyZZQThdLTklPuJrn2vGc
	+9NZG5fGSoNWwj1Fgach5Sw/8WOMdpmiERzMeDk07LJ8hHxQbC82xMIOAtaakGzESQsj
	esTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=l7GHyhhQkoOm2gB3GaB17E3bHhFR9FBcu0d+N4/UJU8=;
	b=ruln0/64oYCavmpvY3MD19xF7jTb/W9Xvep61QEKbst+7h9gmsYT+08FqlaPjMgx+d
	i+hD9NGj4WuvpTMK7F8NN3YOOmjaLEODASQejt3zxNxOtfpu8zP/kpWHNzyIw01LnBaj
	Cd29ZgsPTUXcLfb8kH3bdqovZigNiyE+2cD7I00j62wmk0D+RGp6xE27gGfNnaDNNTiK
	aAuVhqxHjwojvaGcSnqDzKeI+k7MHgD5v5+cxxABxw6Zw/BKs57KL3/8W6ihDkXgDxiZ
	UmIYLAj/BnJQCqtyJVI/1tBQtx6FMZEjs5RK3bUjjPgNtjUS7iZwh01Qy6wmbQrcOLhW
	x4Rw==
X-Gm-Message-State: APzg51AjutAOiwRzSYe1CXr6gEjDdK7VcqbQPuctvahiT0/TkHlWWNZb
	lXt+XsEHtv3dVK/ZT+ORvGCOrOtglfEeqMJmciE=
X-Google-Smtp-Source: ANB0Vda5x0CNyYe2iXWedfsImysOz5bOEXUvFRc6nBFfdEzueOGDXIKCOItqrVpTrSzETS1ucvTasZOPDH8yjc9faqk=
X-Received: by 2002:a9d:4b89:: with SMTP id
	k9-v6mr14832140otf.227.1537238629245; 
	Mon, 17 Sep 2018 19:43:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490c:0:0:0:0:0 with HTTP; Mon, 17 Sep 2018 19:43:48
	-0700 (PDT)
In-Reply-To: <e94e4772-fc13-d170-1e53-6a7423fc514f@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
	<CA+chaQdzPyhGSR=2yr6y6OvC8yKMq80nOX=WWnqdgqZkeN4Pow@mail.gmail.com>
	<362229a8-d5aa-e0eb-a1b6-fa3d71ff68c4@windriver.com>
	<CALbNGRQNttTSCKZokeJ==i-kyrreQquRK7AE4ezsGY5=DZjLSg@mail.gmail.com>
	<72350b64-9160-f1bd-992b-ffbf3c18d5b3@windriver.com>
	<e94e4772-fc13-d170-1e53-6a7423fc514f@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 18 Sep 2018 04:43:48 +0200
Message-ID: <CALbNGRToA-6efy=PfzdpHxTvgCvSd=+GiOxbrxxCJdNxtD21_A@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/19] 19 recipes to split one dpg package only
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2018 02:43:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2018 at 3:57 AM, Hongxu Jia <hongxu.jia@windriver.com> wrot=
e:
> On 2018=E5=B9=B409=E6=9C=8818=E6=97=A5 09:41, Hongxu Jia wrote:
>>
>> On 2018=E5=B9=B409=E6=9C=8818=E6=97=A5 02:40, Andreas M=C3=BCller wrote:
>>>
>>> You know that this explodes image size - because dbg package RDEPENDS
>>> on all non debug packages now - or did I miss something.
>>>
>>> E.G fontforge: We need all the python-dbg in the iamge now
>>>
>>> With this images with dbg-packages turn into non usable.
>>>
>>> Haven't got the point what gets better by doing so
>>
>>
> Do you mean previous sub python-dbg only 56K, but after applied this fix,
> the image size enlarged to 24M?
>
> du -sh packages-split/fontforge-dbg/usr/lib/python2.7/site-packages/
> 56K packages-split/fontforge-dbg/usr/lib/python2.7/site-packages/
>
> du -sh packages-split/fontforge-dbg/
> 24M     packages-split/fontforge-dbg/
>
> I doubt that could gdb work correctly that only python-dbg
> without debug library? (Maybe gdb stop at libraries)
>
> packages-split/fontforge-dbg/usr/lib/.debug/libfontforgeexe.so.2.0.0
> packages-split/fontforge-dbg/usr/lib/.debug/libgdraw.so.5.0.0
> packages-split/fontforge-dbg/usr/lib/.debug/libgutils.so.2.0.0
> packages-split/fontforge-dbg/usr/lib/.debug/libgunicode.so.4.0.0
> packages-split/fontforge-dbg/usr/lib/.debug/libgioftp.so.2.0.0
> packages-split/fontforge-dbg/usr/lib/.debug/libfontforge.so.2.0.0
>
> packages-split/fontforge-dbg/usr/lib/python2.7/site-packages/.debug/fontf=
orge.so
> packages-split/fontforge-dbg/usr/lib/python2.7/site-packages/.debug/psMat=
.so
>
> //Hongxu
>
>
>> Sorry, I didn't get your point :(
>>
>> First, do you mean one dbg package take more image size than sub
>> dbg packages? I am afraid the sub dbg package could not work correctly
>> (see my comments above)
>>
>> Especially only one hardlink of separated debug info file in each
>> directory (see commits `d4eaf42 package.bbclass: only one hardlink
>> of separated debug info file in each directory' in oe-core)
>>
>> Second, does this fix cause dbp package RDEPENDS issue? Or already
>> existed issue? If the former, please paste a reproduce steps, if the
>> latter,
>> as I mentioned above, RP rethinks to improve debug package dependency
>> handling in 2.7 (its too late for 2.6 now.),
>>
>> //Hongxu
>>
Oopps - ${PN}-dbg RDEPENDs on ${PN} (still?) - My thoughts were a bit
upside down :). Sorry for the noise.

Andreas

