Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.4139.1585251261421937839
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 12:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hCC2WTZ7;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id a9so8611852wmj.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 12:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QWVcxQEn2YXMyV710K8Lhwi8KPH0FP6G+b2gFzIEWnA=;
        b=hCC2WTZ7WS7Mq5mxMwFl7G/ky6F4XYu67//wiJTD8CVdTcYkPJ16pb/t1T6Wl8GrfP
         K/uNSVYhAmL85NG4r3OpedzuaAh4dEXPSkbtvOO5niZvXdvbaYA2hG21+gOeeCyUQEmG
         a/Lc3g3OvSDTUbDfmGqadOu7XWmEs3HAsGcJ/X4W5SakCUlTT815rHDLvqnP6vecJCIC
         bO1PcRX7NkbtkzrL3yjNe3YpTWzCMG889+MY55pfNVaHc1r2f2mOO/Wh0R3uSIcj6kAS
         6OHr/uE43hSNNORCToPir1B9WITONRZ/ImVB7KnSK1XBGddQ0AbEXxJu8+E43x6qQ7e1
         SUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QWVcxQEn2YXMyV710K8Lhwi8KPH0FP6G+b2gFzIEWnA=;
        b=OViHQ+Aza2iiAI4nURyWPIK/o8RnWkzE12eHo8HilJkQblHsG0VHPx8XZEF0sp3aiE
         bQaQCb5o+raN6C5ol7FuTAzPWTbit1rFw84pRO1KMokmVAYQ3OeqfhKk1dd5yaRiC+RD
         /MySjvrAxeA8TAuN+rArNxZ/FyEf+I4QS+4m5TcliYCn3d6UhJazlEpHLHdUah+M1wp/
         Us5tnAm7JHTCCOf+WKomLJsEHzvlCcTdph7cIQNHhrM56JNfHbjYq4sj6EQDbQTuqTjB
         /efXjWTal5tGwvM8RE7XuAS7dhqyZzsajDV83XKRfnVOnq/W6795L4xsOPOwkVEMhAg7
         zEKw==
X-Gm-Message-State: ANhLgQ0FlG+6/LWadDXeIDrlh8fFlJLbLR20KGhnNS+G+LXNkl/PgytS
	eHiYzaK0AY/wJzypGqqmlb4=
X-Google-Smtp-Source: ADFU+vuFuZWCB7Cd2gy4avn2Cr6hXL/utKSlm8LxtTL2/51THfgP1ECuQeGrj1ag9G7JUSfShZTHfQ==
X-Received: by 2002:adf:a4d2:: with SMTP id h18mr11418731wrb.90.1585251259865;
        Thu, 26 Mar 2020 12:34:19 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l4sm3641748wru.1.2020.03.26.12.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:34:18 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 26 Mar 2020 20:34:18 +0100
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-qt5] qtwebkit 5.15 update failure
Message-ID: <20200326193418.fiehd5wti6gd7yfw@jama>
References: <20200326000257.GF1578@denix.org>
 <20200326005529.c77siajyzfgxdc4a@jama>
 <20200326170721.GH1578@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200326170721.GH1578@denix.org>
User-Agent: NeoMutt/20180716
X-Groupsio-MsgNum: 83526
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tzbc4r2wphvfbtol"
Content-Disposition: inline

--tzbc4r2wphvfbtol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2020 at 01:07:21PM -0400, Denys Dmytriyenko wrote:
> On Thu, Mar 26, 2020 at 01:55:29AM +0100, Martin Jansa wrote:
> > On Wed, Mar 25, 2020 at 08:02:57PM -0400, Denys Dmytriyenko wrote:
> > > | Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScree=
nVideoHandler.cpp:116: error: undefined reference to 'QWebFullScreenVideoHa=
ndler::qt_metacast(char const*)'
> > > | Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScree=
nVideoHandler.cpp:121: error: undefined reference to 'QWebFullScreenVideoHa=
ndler::qt_metacall(QMetaObject::Call, int, void**)'
> > > | Source/WebKit/CMakeFiles/WebKitWidgets.dir/WebKitWidgets_autogen/mo=
cs_compilation.cpp.o:mocs_compilation.cpp:WebKit::DefaultFullScreenVideoHan=
dler::staticMetaObject: error: undefined reference to 'QWebFullScreenVideoH=
andler::staticMetaObject'
> > > | /usr/src/debug/qtwebkit/5.14.99+gitAUTOINC+ab1bd15209-r0.arago8/git=
/Source/WebKit/qt/WidgetSupport/DefaultFullScreenVideoHandler.cpp:45: error=
: undefined reference to 'vtable for QWebFullScreenVideoHandler'
> > >=20
> > > FWIW, it was building just fine before the update...
> >=20
> > If you care about qtwebkit, then please send patches for this.
>=20
> On the other hand - if you don't care about qtwebkit, why would you updat=
e it=20
> from a working version to a broken one?

I didn't update qtwebkit.

qtwebkit isn't part of regular Qt upgrades since 5.9, I've already
removed it a while ago and then restored it based on Andreas's request,
see last few commits:

c8cd55b0 qtwebkit: build with python3
23914740 Revert "qtwebkit: remove"
a35403dc qtwebkit: remove
a797f85c python-pyqt5, qtwebengine, qtwebkit, qt-kiosk-browser: skip withou=
t meta-python2
b1f4f1fd Revert "recipes: Use python3 during build"
47fb26de recipes: Use python3 during build

I have not intention to support it myself, either send patches or maybe
Andreas will do.

> The issue is that with the upcoming 3.1 LTS around the corner, many of us=
 are=20
> trying to finalize and stabilize our own code bases in master. I was very=
=20
> close to resolving most of the breakages for my builds just couple days a=
go,=20
> and now I got few more unexpected failures from meta-qt5...

Yes, that's why there is dunfell branch as mentioned in the PR, see:
https://github.com/meta-qt5/meta-qt5/pull/294

--tzbc4r2wphvfbtol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXn0DuQAKCRA3VSO3ZXaA
HCzWAJ9WxBIn+Bfc4Zs2nfqJ674JPLR0eQCbBySpai6OiyuBAKqOi+AcJB6JdW8=
=hI0q
-----END PGP SIGNATURE-----

--tzbc4r2wphvfbtol--
