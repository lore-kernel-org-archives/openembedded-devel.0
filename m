Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 050B86C1CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 08:04:14 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id s75so22570558ilc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 00:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ne7o58EAYJBdpO5zvEXL0CXwUMyhoIIiVHbpCUguZCY=;
	b=RnVbb8wyuj/PAwCEkgwjsSoElorYyvj++lpiguTQ6twxw3cScoJU9ivxbaALii5wvT
	rA/stg378YaT7xBG913yH6OadzSf72nxgkI2dRGFA/7b20NrIrk9ZB5Vf+njFm+9UBUh
	YCKvvc7s0a095icmcGRygKA96O9BwUnOp6zhGfa91cWBLpY6GtknaKHx9gWYdNoonjAU
	1YoMa0FIZy6M8o/epSGFXulyma76PJzrR2oX8mwtk+iLWTiaoypli+g4otVf/asiZd63
	qj/KcNUk9ljoYVy6ANI++zovfHXZ2+C+HDyIsXpTdgd/rgj6U5q3iDOrZWiE0AQ2JIl5
	8I7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ne7o58EAYJBdpO5zvEXL0CXwUMyhoIIiVHbpCUguZCY=;
	b=kSMLhiOh8mbkQQI1yzuWBaB2VAHlhr/S2Ch1mf6KUXJ2c5+JHUHRok/+jiiBfiPljg
	+f/eEL29CacJxS/M76lyJD0mg5SNEKNjKD2CiZg/DMhkAc1pN8vpNbMyQC6OJwcCNXv2
	GVSum/onwLG4j1C8J/UPoeYaVUEHeyLuXrKkbDs6ZT/3/jmj5JnynTPWd7L3uSQArykO
	3QUGSAotVjeg1hFuUMMtevzSBv+1Qbtgr1PNc8TGLUj0EYaGnst48VK2rKLXhBwsODHI
	nyG6BW/7UMdBWGcuUw+c0+baQYSMc0xJnAHFUZnzwk3by3fV9c1j+AY/CZXT7LAZb/01
	03fQ==
X-Gm-Message-State: APjAAAXelJQeLaHBXkGfJGqpBhXFqubGeLG7V/c0sQZ1H3/SarUkkdZl
	6Od41HvGDgjhRDs1yjZ4PiG1UgRDaShrKLLNECk=
X-Google-Smtp-Source: APXvYqzwXVC/eOoZ42dLGEbZ6g/6VMmH3718hySnbNnwTM25OhU9w2c9dZtGA1tH2KRJ74CT08MMrhsP9iZU6aMzqQc=
X-Received: by 2002:a92:d80e:: with SMTP id y14mr2167168ilm.267.1574237056066; 
	Wed, 20 Nov 2019 00:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
	<20191119071730.2682-4-schnitzeltony@gmail.com>
	<CAMKF1sp-CsNE6A0MPBYCgbD0cXXHU89zQyeCTSjP83UtTh6krA@mail.gmail.com>
In-Reply-To: <CAMKF1sp-CsNE6A0MPBYCgbD0cXXHU89zQyeCTSjP83UtTh6krA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 20 Nov 2019 09:04:04 +0100
Message-ID: <CALbNGRRAw_57dRRufUzWK6KEu6qTjG4deM_UwvswQFUnJLFesw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/9] tracker-miners: initial add 2.3.1
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
X-List-Received-Date: Wed, 20 Nov 2019 08:04:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 5:35 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Nov 18, 2019 at 11:18 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> >
> > tracker-miners is a mandatory runtime-dependency for nautilus
> >
>
> fails to build on x86
>
> https://errors.yoctoproject.org/Errors/Details/277884/
>
Same procedure - hope V2 coming soon...

Andreas

