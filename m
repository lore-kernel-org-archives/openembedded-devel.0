Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id F3CFF7F29F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 22:56:17 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id n197so975909iod.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jP+x9q6Q2/m32Z+ZeiY6xDztuQH2Mga33vwKYk26b64=;
	b=OIXuiWF9e2LPp2C+/Cp1mEZP6FcWICNgCHMFu+dpu1Cl+7PhBObskMWoaigyb0BlDF
	tPMPP4qsylkEX75kfV1LbysTasURRm8uFSrMm6QHAR+J0eTmdLLs/RCGHsx9Rw+vPTbb
	xm9qMYSoOc2VcAJve4ny2NWiGMLrvaxPmBthDHBHvCGiiPtDyKFZIwu7GwDXzZxHhZS6
	5/T9VIBfwfY8xOhW63pibvE6CHcPY2xrIIpcl/VvaPOBAJc1dcnw5X5PtA0ZNJ3nIIGE
	ZmIVRPtbidm6MiaAgtJyqDmtz0qbQlZnFUOVBB61+sx9/E3qSpwu4W08WkCOX///P7hU
	OcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jP+x9q6Q2/m32Z+ZeiY6xDztuQH2Mga33vwKYk26b64=;
	b=dArqwqAvtFq3g87bSkxjL8QgZbhnUjTmGlB0j4vWeB2waRzN33qMvp3X/mEZxB4z2b
	ncNqTZvG96qaH9KIdRXOhIYxGKrYwjeqViRy/0BTNwSF1oYf7d6PYBz7z5kXbEokL41E
	gP7LIJAy+fU9l60H2oGWLl0iy7a0yY52F6kPxgXyw0X/vBHOHp1U+PDwZEJx9TCLK/eO
	1DXEKu6S5JOvzmtlrkCexkpZ5FbqVCspIx10AZd0t4a3uuIcQU3UHxrrQF0x1YJxR0gQ
	eU078yEYYXTG7XoCHxOS5qrvsiOaEdxMmp5w97f7quK8gNL6oes2C4hGnPT1AaKXiuk3
	9nSA==
X-Gm-Message-State: APjAAAUpgw3y8kWNqHZSgF4KQEzW80qz2BImo8HQLvUPhwA+5czqNP+/
	IqfpNasWMLoU6yKz++LA0ylLv6uW8pIQ03L1M1c=
X-Google-Smtp-Source: APXvYqx1N8jBQ8Wymuis3st3P+t6MvY/5Pq4MGwzP9pqJYDWOXFxMd5eOE38KryPta0rlpoTtx6dHuHTWk3m+Aqt4/g=
X-Received: by 2002:a5d:9555:: with SMTP id a21mr7678812ios.299.1567032978814; 
	Wed, 28 Aug 2019 15:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
	<20190817111825.GA2828@localhost>
In-Reply-To: <20190817111825.GA2828@localhost>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 29 Aug 2019 00:56:07 +0200
Message-ID: <CALbNGRSBQv22cpj+T+KBS-1oOhpUomXBN78FHhFw52=pGEOp9A@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][PATCH 0/4] vlc adjustments
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
X-List-Received-Date: Wed, 28 Aug 2019 22:56:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2019 at 1:18 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Sat, Aug 17, 2019 at 10:13:35AM +0200, Andreas M=C3=BCller wrote:
> > Some cherry-picks for vlc
> >...
> > 2.- 4. Are good enhancements. It is upon warrior maintainers if they ar=
e
> >    important enough to make it into stable branch.
> >
> > Adrian Bunk (3):
> >   vlc: Remove workaround and patches for problems fixed upstream
> >   vlc: notify switched to GTK+3 some time ago
> >   vlc: Remove the obsolete dependency on dbus-glib
> >...
>
> The notify change is an actual bugfix that should be added to warrior.
>
> The other two changes are cleanup patches with no (intentional) changes
> in the build result, I would recommend against backporting them since
> there are no benfits compared to the small regression risk.
>
> cu
> Adrian
>
Ping

