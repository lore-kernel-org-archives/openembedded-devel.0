Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4Arn-0006P3-Fx
	for openembedded-devel@openembedded.org; Fri, 08 Oct 2010 13:12:01 +0200
Received: by gxk25 with SMTP id 25so304395gxk.6
	for <openembedded-devel@openembedded.org>;
	Fri, 08 Oct 2010 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=yW0kropSAvQ4Xm4Z7s78Zg+hoIe1ruyrsVtS9EBpGLc=;
	b=NV4Cz2aI0Q8R8903lmgaCTstBN7Runz5kAe02P5UWH8FD52c5cnCmLWexPvS6xkoOi
	r/8jdtsCCAq0zadSUIUiKSv+PaDoEYHPkNfXbcgSpk9WYPF95jLrz7fmNt64vg1f4z/K
	9rcEQm7sYKNys/b/Oe3vAW6KJGmbQsqpcbPdc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=hK64Y3ddpNaDEHoo8Qk/0MWer/thESVf9DaJETnlbcOfzX3KjHr1UQ7nNjjIjc1qtm
	sM9Fl+naUDD1R6Ly6MBUBkTJLhc7G1j5SQykO3PolylvCqbhFaaL+rYV12Pugif5yHOC
	7FCIzt0z3590n8hemB7VWC6edGeQfvghCY70M=
MIME-Version: 1.0
Received: by 10.42.29.132 with SMTP id r4mr343066icc.345.1286536295535; Fri,
	08 Oct 2010 04:11:35 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 8 Oct 2010 04:11:35 -0700 (PDT)
In-Reply-To: <AANLkTi=gS-FkVTi7fUuzkQQ5uuudAbHGtp6ZPfr=YZSX@mail.gmail.com>
References: <AANLkTi=gS-FkVTi7fUuzkQQ5uuudAbHGtp6ZPfr=YZSX@mail.gmail.com>
Date: Fri, 8 Oct 2010 13:11:35 +0200
Message-ID: <AANLkTinFUpD7NOQPWb6M6HhjegBGOYzySZOxSav4ht-k@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RDEPENDS/RRECOMMENDS/RSUGGESTS/RPROVIDES/RCONFLICTS/RREPLACES
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
X-List-Received-Date: Fri, 08 Oct 2010 11:12:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/7 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Dear all,
>
> It is my understanding that all of
> RDEPENDS/RRECOMMENDS/RSUGGESTS/RPROVIDES/RCONFLICTS/RREPLACES should
> have an _ suffix (most often _${PN} )
>
> I did a quick grep for these and came up with the following
> non-compliant recipes:
>
> frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -w RDEPENDS */*
> devilspie/devilspie_0.22.bb:RDEPENDS="glib-2.0 gtk+ libwnck"
> fakeroot/fakeroot-native_1.9.6.bb:RDEPENDS="util-linux-native"
> jikes/jikes_1.22.bb:RDEPENDS = "classpath"
> libaio/libaio-oracle_0.3.0.bb:RDEPENDS="libaio"
> meta/nylon-feed.bb:RDEPENDS = "${NYLON_FEED} \
> mokomaze/mokomaze_0.5.5.bb:RDEPENDS="ttf-liberation-mono libpng"
> pidgin/msn-pecan_git.bb:RDEPENDS="pidgin"
> supertux/supertux_0.1.3.bb:RDEPENDS += "libmikmod"
> xfce-base/xfce4-mixer_4.6.1.bb:RDEPENDS="xfce4-panel"
> frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -w
> RRECOMMENDS */*
> nogravity/nogravity_2.0.bb:RRECOMMENDS+${PN} = "${PN}-data"
> opie-reader/uqtreader_cvs.bb:RRECOMMENDS="${PN}-filter-html"
> ttf-fonts/ttf.inc:RRECOMMENDS += "font-update-common"
> frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -w RPROVIDES */*
> bootstream/bootstream-chumby-falconwing_1.bb:RPROVIDES = "virtual/bootloader"
> opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_1.2.3.bb:RPROVIDES="opie-mediaplayer2-skin"
> opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_1.2.4.bb:RPROVIDES="opie-mediaplayer2-skin"
> frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -w RCONFLICTS */*
> tzdata/tzdata.inc:RCONFLICTS= "timezones timezone-africa
> timezone-america timezone-antarctica \
> wesnoth/wesnoth-wvga_1.8.4.bb:RCONFLICTS = "wesnoth"
> wesnoth/wesnoth_1.8.4.bb:RCONFLICTS = "wesnoth-wvga"
> frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -w RREPLACES */*
> frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -w RSUGGESTS */*
> frans@frans-desktop:~/workspace/openembedded.git/recipes$
>
> Should these indeed get an _${PN} suffix. If so can someone add?
> (I can make the edit, but can't test them, bu if people have
> sufficient confidence in my editing skills I can also do the patches)
>
> Btw there one special in the list above:
> nogravity/nogravity_2.0.bb:RRECOMMENDS+${PN} = "${PN}-data"
> Guess the + is not ok, but not 100% sure.
>
> Best regards, Frans.
>
Fixed these after discussing it with Martin on irc, except for
ttf-fonts/ttf.inc:RRECOMMENDS += "font-update-common"
Here it was intentional

and for
meta/nylon-feed.bb:RDEPENDS = "${NYLON_FEED} \
As this was a meta package I was not 100% sure on whether it would be
ok to tack a _${PN} to it (and also not sure if it was ok to add a PR
to a meta recipe)

While doing so I also found things like:
mokomaze/mokomaze_0.5.5.bb:RDEPENDS_shr += "fsoraw"
No idea how many things there are with an _distro suffix

Frans


