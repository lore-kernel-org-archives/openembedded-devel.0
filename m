Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4ECD960589
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 09:37:27 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o80so11788915wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 02:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sXIDn6XIQBgBrNoDLho5Wr3FZiCvNMq5AbrbK3xYJgQ=;
	b=BAYznjHENvW0qVhPQ+EQEK1BZ3agwcb2JzdqjVmNUk71td6oXza3u/0divTss9cQri
	aQPLnt5oFTy039lZ2fccn/MdcyPSxfOco1LcB48q6D/FzsTuENV6oGrK3coFTDExgxdz
	3QzAb9V2LtttbcGpTIDqxzGhP7bt1wZKGaeeAqLBiBo+MS238gNvZhYGB3V/NWqDhSL2
	s+TWoV2zMwirM+2q91vIhs0cO5DgCgAMkAsGky1Dd/uNnEAzn17+cOOaI5PsR8q5328X
	xHSJif2DAulamaherBlB68MIhUKWzMJTGu47PNPZPzADhLjLmJDQvY4MmRNXpGxEh4FL
	F0hQ==
X-Gm-Message-State: ALyK8tJZ+E+WLyg2mZaFTXCLAlfOfXMBb/qmi6z24nE/FzyPab2sgNeAN09cN+/JDV4TPw==
X-Received: by 10.28.45.83 with SMTP id t80mr6645180wmt.13.1468834647583;
	Mon, 18 Jul 2016 02:37:27 -0700 (PDT)
Received: from localhost ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id l6sm247952wjf.18.2016.07.18.02.37.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Jul 2016 02:37:26 -0700 (PDT)
Message-ID: <1468834644.4658.4.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jul 2016 10:37:24 +0100
In-Reply-To: <CAMKF1spStNbUubBvO1DLq86wdHRVbGvOVB7LRUVa2be0Mdes3Q@mail.gmail.com>
References: <1468828968-19388-1-git-send-email-git@andred.net>
	<1468828968-19388-2-git-send-email-git@andred.net>
	<CAMKF1spStNbUubBvO1DLq86wdHRVbGvOVB7LRUVa2be0Mdes3Q@mail.gmail.com>
X-Mailer: Evolution 3.20.4-1 
Mime-Version: 1.0
Subject: Re: [meta-networking][PATCH v2 2/2] meta-networking: override SECURITY_CFLAGS for c-ares
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
X-List-Received-Date: Mon, 18 Jul 2016 09:37:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mo, 2016-07-18 at 08:16 +0000, Khem Raj wrote:
> On Mon, Jul 18, 2016 at 1:03 AM <git@andred.net> wrote:
> 
> > 
> > From: André Draszik <adraszik@tycoint.com>
> > 
> > c-ares doesn't build if the distro has enabled usage of the
> > security_flags.inc file as it is picky about what is placed
> > into CPPFLAGS and CFLAGS. It complains and errors out if any
> > preprocessor options appear in CFLAGS.
> > 
> > Fix this by providing an additional include file that is
> > require'd from conf/layer.conf which for c-ares moves the
> > defines added by security_flags.inc from CFLAGS to CPPFLAGS.
> > 
> > Signed-off-by: André Draszik <adraszik@tycoint.com>
> > ---
> >  .../conf/distro/include/meta_networking_security_flags.inc          | 6
> > ++++++
> >  meta-networking/conf/layer.conf                                     | 3
> > +++
> >  2 files changed, 9 insertions(+)
> >  create mode 100644
> > meta-networking/conf/distro/include/meta_networking_security_flags.inc
> > 
> > diff --git
> > a/meta-networking/conf/distro/include/meta_networking_security_flags.inc
> > b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
> > new file mode 100644
> > index 0000000..06802d6
> > --- /dev/null
> > +++
> > b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
> > @@ -0,0 +1,6 @@
> > +# configure righteously complains:
> > +# | configure:3479: using CFLAGS:  -O2 -pipe -g
> > -feliminate-unused-debug-types -fstack-protector-strong -pie -fpie
> > -D_FORTIFY_SOURCE=2
> > +# | configure:3485: CFLAGS error: CFLAGS may only be used to specify C
> > compiler flags, not macro definitions. Use CPPFLAGS for:
> > -D_FORTIFY_SOURCE=2
> > +# | configure:3516: error: Can not continue. Fix errors mentioned
> > immediately above this line.
> > +TARGET_CFLAGS_remove_pn-c-ares = "${lcl_maybe_fortify}"
> > +TARGET_CPPFLAGS_append_pn-c-ares = "${lcl_maybe_fortify}"
> > 
> 
> will
> 
> lcl_maybe_fortify_pn-c-area = ""
> 
> work ?

But that would remove -D_FORTIFY_SOURCE=2 completely...

I don't want to remove it, I just want to move it from CFLAGS to CPPFLAGS,
without adding further knowledge here about  what else is in
SECURITY_CFLAGS.

a.


