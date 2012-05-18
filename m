Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SVJit-0004Zx-JC
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 11:43:47 +0200
Received: by ggnp4 with SMTP id p4so2671085ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 02:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=4xtRYru03ahtZEiivliBvefIFXQ51ojgxulti0oyy+Q=;
	b=V+p+H9oQhIDFjwBYM3S6uVLVPFNjwGzYF+sdo1HtG316k+RS2WN0v1Pj6x/msSTJV1
	V1SbV0NKkEB9wV1CyJM57/JxOw/hGHDGSyozGU32RPXjzwzXmQPnZ8sDVOm4+wmBhfeN
	jG25q6Jl3Wd4R0SkjJJNz0QW98UOj+vDMPOL6MXGzIk1/YrRYMB5EOC05Wj8baPeuzWW
	0bbmNmwAH5cS7SM9uHAaPughwCyT6jvGeSD8U99/yyUSYv6/AIHKfLNJwvvtzs5f6vNc
	HN9h0v9TeyCvQkUKJ1poAqAZtIkRnDkg43+ST4vZcIVNtzRqwPlQeThIqIBgRuQp20oz
	lHUA==
MIME-Version: 1.0
Received: by 10.42.51.144 with SMTP id e16mr6665748icg.54.1337333623056; Fri,
	18 May 2012 02:33:43 -0700 (PDT)
Received: by 10.64.28.211 with HTTP; Fri, 18 May 2012 02:33:43 -0700 (PDT)
Date: Fri, 18 May 2012 11:33:43 +0200
Message-ID: <CALbNGRTsKqcvJjYKWbewDYHkYEGz0Y-BarB-_bDUq3fizTB7uw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: libnotify does not work when linking with gold
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
X-List-Received-Date: Fri, 18 May 2012 09:43:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

when using gold - angstrom default now - notifications in xfce do not
work and complain with

| notify-send: symbol lookup error: /usr/lib/libnotify.so.1: undefined
symbol: gdk_screen_make_display_name

To test I build an image without using gold and notifications work as expected.

gdk_screen_make_display_name is part of gtk+. Is it possible that this
is improperly exported? Or is it something like written in [1]

Help appreciated

Andreas

[1] https://fedoraproject.org/wiki/GoldIncompatibilities


