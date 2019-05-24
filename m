Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 67A177E414
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 06:45:39 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z4so6965600iol.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 23:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lYO4h1c1N/KrdqMK6G01S0AyHPSv5HTNeN0/aX3SQ/s=;
	b=YoBWxshjsiDwlIGKIADqjsVlfjKu/ixDZ09n+pxEAa707lBtjHQHk/AxKWZh5hlpxd
	UPkpwzfPKrwDAcFRmBxTc6h3zApVAtkyPnIF2tdcZY5vKCvjAUSWqNoTvuhbZG1b5RQV
	XjtsYS85LdmYpvUP8w1fxugd3BLCVaYH2ZDPD/60wYjNfLxRe+9UuzoIaQ0GPiK/rWZq
	WYZlKrn766NLfxZwaR9d5LXqf1KVu/zvCltUnCGedyyh2Pn7dlqo+aKjv3vdSxXciNjp
	FIDWHWS2LoVAHH8QWqx4Cd/wOwXQXpQzJfSHew/Inbx+sFvosCuJ7/g7Oj0R89guRbdY
	WXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lYO4h1c1N/KrdqMK6G01S0AyHPSv5HTNeN0/aX3SQ/s=;
	b=aO676WlM1v90hWjV2/NBRgbLnbdQ8s5yvjZuIjs2vZ9gknXgmBcBUHuEYjzCJxpSLt
	zD4qtifST/X4EwFaZUFEQ/ycE3oAi+XZ3M6BA9vHha5RjCUMFzjuyPpRohx2jeqlihNi
	Z75TwRvio3Qn1ZUX8YPqBJpMVQJWmW7W/2DiaS3lsHceQeD79Hrp1prC1hyahqi/DJqM
	cYscbIp7PWlaJW4iWUwX8+BUw4lWkhgUOd51bhRjG2TwORnKeBlPOLOiQgEd28Y2xg3I
	DbHuOa6bvjeeMvzIvEqe/KbZgITBaq/FNbmcUJBr1myHnJdK+F1K7SJDmWMtsI79j9K1
	vOWA==
X-Gm-Message-State: APjAAAVeEDI6C/BU7vQz5jJHeN47/A5s/Q9m27eu7VK9oU18sHQNnBhh
	WSzoKfaSYOBZA68gRmfK8gK8uy6ZadgdLpdSFJA=
X-Google-Smtp-Source: APXvYqzLhS+JbuiWwvHNEEGa0WgTkmScE/GHEiSOd8YS2mxY9CbQFhHFY2wSPL7WUjmIjEOpmV8qnegob9qi0IGAM20=
X-Received: by 2002:a5d:9a11:: with SMTP id s17mr32525070iol.267.1558680340460;
	Thu, 23 May 2019 23:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
	<8008aa3c-b117-c46c-aa1c-618a8c1a504d@gmail.com>
In-Reply-To: <8008aa3c-b117-c46c-aa1c-618a8c1a504d@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 24 May 2019 08:45:28 +0200
Message-ID: <CALbNGRRBCp-8dJ3S1AkA_Q=MfbD_ge13gLyW+0A5=mcq5w8jyw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/41] More GNOME & cleanups
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
X-List-Received-Date: Fri, 24 May 2019 06:45:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 24, 2019 at 6:07 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Andreas
>
> This is good stuff, I wanted to stage it for some CI but the series
> does not apply cleanly over master-next. If you can send a v2 of whole
> series rebased on master-next that will be super cool
>
> Thanks
> -Khem
>
Hi Khem,

it went out too early and based on master - sorry. Will send a V2 - as
soon as I have:
* a solution for gnome-help.bbclass adding IMAGE_LINGUAS specific
packets to image that is independent of oe-core modification
* mozjs building with python3
* a full gnome session running with issues acceptable

Andreas

