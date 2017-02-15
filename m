Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7C81F772D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 13:45:34 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so8282526wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 05:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=aNK27+KO8ezGIw85ECT9SnRD8IiXId7O+bTOEkN/hpY=;
	b=euPrnKdmHZLrn6mTsPLiJmiZBiB/nmMoOUoFwdIEGhFZjvoO/6vFXYhbLCRx3NCo6e
	KgAdQLdRBKOuybZc64HknMbdlF4pP3SAb154PiYlALGkDIxGLyLnxF2EOPQH6e7/EXgo
	KdbDgEJF0AE0MoHPcaSrIdvssxaREhWV5U7dyJAt2dVQZJWKNEsuCAX6BjDosoRSkGXf
	X9ArCWJodEWfR8WEup9TDu68MIg6l+xLsnJm3sMqA4Oxf9XarN95TW4QWzm/qqel4kft
	sfwYIStpl2JHsg0fJ0QnvC+IDYpOZ3d9GJUMaSpo4IB9y+tWZhgrQ0tzx1NWQwM3XQU9
	DitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=aNK27+KO8ezGIw85ECT9SnRD8IiXId7O+bTOEkN/hpY=;
	b=rfO54+gVtP2xHqUo8KR/Xn6Ps8C8uiFymQ0lH7fF648Hrz+d3EsjQJl/jyC46Pj172
	VrOp9oFRg9wmKBv/XZBy4rpyn75PlNSnt6GatjdyJ6osgj7RC8pyC80oWmUF+btkoBoi
	i1Ha/nIyrq3TycHXAfbIwbgkCdhbNFIEd9aVaIbRhQ8wJFzO24p18bW5O8ACgHoNzKfX
	xVOoQsBqXK7BMPxXh67Xy/7VDzw1NjRuV+13lUZH8wsQQx09sHz1+5uu2t+s7SbW0WoG
	6gDsaWZb26cVUNvTYOGY+vR3B20Yf8C/00+5ObEy6QoZNOB6ELzo+ObjpR6NUoZNSrHH
	oqwA==
X-Gm-Message-State: AMke39mhi+Sbj43kJkBTMQr2qea2pNXfqmJiMIi9w/MyGdUVHPgesAClEJOlCPQti4HT6hrW1366/Us/KLwkBw==
X-Received: by 10.28.211.205 with SMTP id k196mr7740871wmg.124.1487166334071; 
	Wed, 15 Feb 2017 05:45:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Wed, 15 Feb 2017 05:45:33 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1702141000250.29338@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702131159380.3464@uk63952.mitel.com>
	<358e792e-f48d-5880-1842-aecb4b54275d@embed.me.uk>
	<alpine.LFD.2.20.1702141000250.29338@uk63952.mitel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Feb 2017 14:45:33 +0100
Message-ID: <CA+chaQeHGf0oeUHRawau7PhnnWAACo9X3gBwXHeDqsf8=u03eQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: building netdata: "No package 'zlib' found"
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
X-List-Received-Date: Wed, 15 Feb 2017 13:45:34 -0000
Content-Type: text/plain; charset=UTF-8

http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111123.html

On Wed, Feb 15, 2017 at 1:23 PM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   i was going to start a new thread for this, then remembered this
> post i was going to respond to:
>
> On Tue, 14 Feb 2017, Jack Mitchell wrote:
>
> > On 13/02/17 17:01, Robert P. J. Day wrote:
> > >
> > >   i'm building a totally stock core-image-minimal for qemuppc with
> > > latest poky checkout, and when i try to add the existing "netdata"
> > > recipe to the mix, i get:
> > >
> > > | configure: error: Package requirements (zlib) were not met:
> > > |
> > > | No package 'zlib' found
> > > |
> > > | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> > > | installed software in a non-standard prefix.
> > > |
> > > | Alternatively, you may set the environment variables ZLIB_CFLAGS
> > > | and ZLIB_LIBS to avoid the need to call pkg-config.
> > > | See the pkg-config man page for more details.
> > >
> > >   apart from fixing this, how could this recipe ever have built
> > > before? i realize the current recipe for netdata is almost a year
> > > old, but should it still not build?
> >
> > Recipe specific sysroots. Zlib is so common that it was probably
> > already available in the shared sysroot to be compiled against, now
> > there is no access to the shared sysroot it can't be found and
> > fails. So this was always a dependency bug but one that was probably
> > never triggered.
>
>   a couple questions. a couple days ago, all i did was add the line:
>
>   DEPENDS = "zlib"
>
> to the netdata_git.bb recipe file, and that trivially solved the
> problem. i just updated my poky checkout, built again, and the build
> failed since, as i notice from monday, a bunch of recipes (including
> netdata) have been blacklisted because of (unsurprisingly) failure to
> build:
>
>   $ git show b7f480c
>
> so what should one do here?
>
>   for that recipe, i can submit a patch which adds the DEPENDS line
> and removes the blacklisting. or is there a more wide-sweeping plan to
> fix recipes that are now missing build-time dependencies based on
> recipe-specific sysroots?
>
>   also, if there's no objection, i can submit a patch that adds a
> recipe for the far more recent netdata-1.5.0.
>
>   thoughts?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

