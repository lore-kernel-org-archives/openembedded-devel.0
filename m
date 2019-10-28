Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF607FAB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 10:18:25 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id w9so8464730wmm.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 03:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=bep+batYIxOYXawMR6JDjiNpHhuH/q9ogu8VMK/l89s=;
	b=l/6xhivMFzv3vRVOoX4Mh6CemMZISv/QnsG0Wsvy9/+Scy3+kSkkaM9p3oO4sLWV6b
	I9NeSmUgFlvf3BI6preU6z+lGBFOrobQ3JuPs+I2DLJO/c2QeQxEweUf3bVs42DwyPuq
	+qEQm2z3ymZshuTsgW2Ys6b2jHq9BYIpAQPFC8c81JtWJKLtY6dvt12lrFZH+S8g3XX2
	r5PCsTkMcRJ6DVDVkhdlBBIKUbktCAwOUPQSot1IworwdPPYYKXiRtIhVaCh8ekVIV7/
	Xzn/OR4NxF9qNe+W4UgzbTS0GV4tCT6PLTD9QStZUhqIZ+aL0qYkJx5V6sHLyPYlLbkL
	70uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bep+batYIxOYXawMR6JDjiNpHhuH/q9ogu8VMK/l89s=;
	b=m9367Xfcsc6WWqVq5UPfSuLDLn3eJs0emavf+9m4Cew3MYJsEUOUeGpnonEubUKhG4
	7ShdeFLcr7IJIox8GHZoYEzivPW+vvGIR4RfFt2+Tywie3MKWmP9zMQLMyFp7VvSfr6c
	AFKRuBxE+LgXpDC88LlGUm86oM3v8OkXqxdhnh6sMswJ9sbgonf3X/mpIgjK+83vP5PQ
	Sq8R8clECZS0r4cSEHFsCDf0dpEEXQbISe88iTM2JsI1X2n102K+ExUz6abTvrcJJUcW
	xsJOY2ujLvsLujyovKdCJUWIYu3QP3E7spl3juse9BlAzEXnt1AoREX3U5wTNJR/dkhw
	OzSw==
X-Gm-Message-State: APjAAAXBpvcFM4faXVFQdvptzsh2BoAvpClxqOHWAL30pEg63Pnf9ZV3
	rN93VaDc5Od/IXuuh3DGMoE=
X-Google-Smtp-Source: APXvYqxA/o/Tc8d6Wv6MGgpLIWaVRAmBcFD7k38xBtPAzdJTTn/cz/H6a1xZYFQYGXRGxF+OTklSFw==
X-Received: by 2002:a7b:c846:: with SMTP id c6mr15596260wml.68.1572257905853; 
	Mon, 28 Oct 2019 03:18:25 -0700 (PDT)
Received: from bluca-lenovo ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	s19sm7236260wmc.22.2019.10.28.03.18.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 03:18:25 -0700 (PDT)
Message-ID: <be99ce25317107acf435c25343bae65401d3a45c.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2019 10:18:24 +0000
In-Reply-To: <CAMKF1srMp1ep=VDXEM9+KDuumdHmRb48H19zucXH3UdNx3ou0w@mail.gmail.com>
References: <20191025191221.17914-1-luca.boccassi@gmail.com>
	<CAMKF1srMp1ep=VDXEM9+KDuumdHmRb48H19zucXH3UdNx3ou0w@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] dbus-broker: 19 -> 21
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
X-List-Received-Date: Mon, 28 Oct 2019 10:18:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-10-26 at 08:09 +0100, Khem Raj wrote:
> Luca
> 
> This fails to build on musl/x86
> 
> > ../dbus-broker-21/src/launch/launcher.c: In function
> > 'launcher_fork':
> > ../dbus-broker-21/src/launch/launcher.c:378:60: error: 'WEXITED'
> 
> undeclared (first use in this function); did you mean 'WIFEXITED'?
> >   378 |         r = sd_event_add_child(launcher->event, NULL, pid,
> 
> WEXITED, launcher_on_child_exit, launcher);
> >       |                                                            
> > ^~~~~~~
> >       |                                                            
> > WIFEXITED
> 
> 
> II think the source file needs to include <sys/wait.h>

Thank you for the test and the hint - my distro builds with glibc so I
missed this. I'll test it locally and send a v2.

> On Fri, Oct 25, 2019 at 8:13 PM <
> luca.boccassi@gmail.com
> > wrote:
> > From: Luca Boccassi <
> > luca.boccassi@microsoft.com
> > >
> > 
> > Add /lib/systemd/catalog to the package, as snippets for the
> > journal are
> > now shipped.
> > 
> > Signed-off-by: Luca Boccassi <
> > luca.boccassi@microsoft.com
> > >
> > ---
> >  .../recipes-core/dbus/{dbus-broker_19.bb => dbus-broker_21.bb} | 3
> > ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >  rename meta-oe/recipes-core/dbus/{dbus-broker_19.bb => dbus-
> > broker_21.bb} (80%)
> > 
> > diff --git a/meta-oe/recipes-core/dbus/dbus-broker_19.bb b/meta-
> > oe/recipes-core/dbus/dbus-broker_21.bb
> > similarity index 80%
> > rename from meta-oe/recipes-core/dbus/dbus-broker_19.bb
> > rename to meta-oe/recipes-core/dbus/dbus-broker_21.bb
> > index 82d8b8ba6..0b0301fe0 100644
> > --- a/meta-oe/recipes-core/dbus/dbus-broker_19.bb
> > +++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
> > @@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "
> > file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
> > 
> > 
> >  SRC_URI = "
> > https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz
> > "
> > -SRC_URI[sha256sum] =
> > "1648227f5a347d4f38d8a29bb9295a73a25c3feb4f3e79e3f04cc847343da3ed"
> > +SRC_URI[sha256sum] =
> > "6fff9a831a514659e2c7d704e76867ce31ebcf43e8d7a62e080c6656f64cd39e"
> > 
> >  inherit meson pkgconfig systemd distro_features_check
> > 
> > @@ -19,3 +19,4 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
> > 
> >  FILES_${PN} += "${systemd_system_unitdir}"
> >  FILES_${PN} += "${systemd_user_unitdir}"
> > +FILES_${PN} += "${libdir}/systemd/catalog"
> > --
> > 2.20.1
> > 
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > 
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > 
-- 
Kind regards,
Luca Boccassi


