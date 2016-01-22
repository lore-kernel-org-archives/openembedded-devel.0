Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 946B460043
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 14:54:51 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id b14so136186004wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 06:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=EEdXILlUoU/i+WoqbYgdXX71vPMVNQv+jNN6Tqaeb8Q=;
	b=gTYpakeHYBzV2KTVNhIt5Sz4ctdRUH9dr7rxu69h4BVagSj5qpgtVrSU50svYDao6o
	A5k0phpT/WWf71O887r0+OiJlgBcDxDING2kF7/cJbf/NoZrcS8sqpwmdEtvmOcMkuEA
	JEFpHKb+Hs+RI+yNojUYln9h988dnBixIDWIa0bWx04i7LoEcL+tJkW2Nype3V962hVA
	nBLeJ7H4GJX/N6H4nboYqbSJUau3xyprx25PjxDZVzH2RvbA1TEa9LGKPLVsaQ8u8YD/
	hbhIyMam26v5CB/O9nJP8wEBw/a9hgvNeG86WR8m+t6ZToX2x2poz1UvDGdFuKQr4iWf
	cbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:content-type:mime-version:content-transfer-encoding;
	bh=EEdXILlUoU/i+WoqbYgdXX71vPMVNQv+jNN6Tqaeb8Q=;
	b=jnIvcufnp0pWTB3ZHAKjA1MmFawMysWjLvp3adyNni+xs7Zc1viHl6yxdL6f2/CX1p
	4pb7FgaoNSLP0wMBn1eWYDaLnrINMeGALAkdOvnrITUYEv43UTz/QB8LDzOqpkiN61qd
	B+5Vu+48bDt7CMZ4Lf/aWG90mt1CadiThNmOQwg8ODaj2vp0rykLta3unvAhuulAyr8C
	n7WIlqaVcnYOSE/+GUZHfcP99EW2Dr6uh5i4GXixG9GPHmQ4z0h/9lnnpwzly50OMQnG
	NHMOHgZt77QpyUmGHM7G4uzAklaXsFDgL9YoINoMuyNHalhcFqlZdVRKZk+Bp780TKGk
	zk0A==
X-Gm-Message-State: AG10YOQPGjlGkTLIlx4GYZ+WoZYD/gHTdXvKp8dWpnpqXux+3Ft1dQtOFD8C1OBnxa7AKA==
X-Received: by 10.28.215.136 with SMTP id o130mr3935003wmg.33.1453474491064;
	Fri, 22 Jan 2016 06:54:51 -0800 (PST)
Received: from minint-s4ms3ka.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	gb9sm6266542wjb.26.2016.01.22.06.54.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jan 2016 06:54:50 -0800 (PST)
Message-ID: <1453474488.2577.220.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: martin.jansa@gmail.com
Date: Fri, 22 Jan 2016 15:54:48 +0100
In-Reply-To: <CA+chaQdhrn9CcNXTde4ULwSodhsN+ajFZGXuY_wkSOcq-MUf+Q@mail.gmail.com>
References: <1453368103-1800-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1453450077.2577.16.camel@gmail.com>
	<CA+chaQdhrn9CcNXTde4ULwSodhsN+ajFZGXuY_wkSOcq-MUf+Q@mail.gmail.com>
X-Mailer: Evolution 3.18.3 (3.18.3-1.fc23) 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] networkmanager: Warning Fix
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
X-List-Received-Date: Fri, 22 Jan 2016 14:54:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Martin,

Thank you for the response. But it is confusing to me...
Networkmanager is always built with nmtui enabled, and we split it into package networkmanager-nmtui:
EXTRA_OECONF = \
    ...
    --with-nmtui=yes \
"
PACKAGES =+ "... ${PN}-nmtui"
FILES_${PN}-nmtui = " ...

I guess an additional package option for --with-nmtui does not fit. Either we have a compile time option or a package split.

Regarding rdepends:
Since libnewt is already listed as a build dependency pkgconfig automatically creates the correct rdepends:
 - libnewt is a runntime dependency of networkmanager-nmtui
 - networkmanager itself does not rdepend on it.
This is exatly what I expect. There is no need to force rdepends at all.

Again: I'm on jethro and I cannot see this warning.
What are we going to fix with this patch?

Please give me a hint, I cannot understand it.
Regards,
Adrian



On Fri, 2016-01-22 at 09:26 +0100, Martin Jansa wrote:
> It is correct approach to fix it.
> 
> This isn't:
> RDEPENDS_${PN}-nmtui += "libnewt"
> 
> On Fri, Jan 22, 2016 at 9:07 AM, Adrian Freihofer <
> adrian.freihofer@gmail.com> wrote:
> 
> > Hi
> > 
> > This is not the right approach to fix this warning.
> > Please try something like this:
> > RDEPENDS_${PN}-nmtui += "libnewt"
> > 
> > Notes:
> > - I never saw this warning.
> > - I would expect that pkgconfig does this automatically.
> > 
> > Regards,
> > Adrian
> > 
> > On Thu, 2016-01-21 at 12:21 +0300, Li Xin wrote:
> > > WARNING: QA Issue: networkmanager rdepends on libnewt, but it isn't a
> > build dependency? [build-deps]
> > > 
> > > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > > ---
> > >  meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb |
> > 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta-oe/recipes-connectivity/networkmanager/
> > networkmanager_1.0.6.bb b/meta-oe/recipes-
> > > connectivity/networkmanager/networkmanager_1.0.6.bb
> > > index 1ddb66f..72b4e46 100644
> > > --- a/meta-oe/recipes-connectivity/networkmanager/
> > networkmanager_1.0.6.bb
> > > +++ b/meta-oe/recipes-connectivity/networkmanager/
> > networkmanager_1.0.6.bb
> > > @@ -56,6 +56,7 @@ PACKAGECONFIG[wifi] =
> > "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-sup
> > >  PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
> > >  PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
> > >  PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
> > > +PACKAGECONFIG[libnewt] = "--with-nmtui=yes,--with-nmtui=no,libnewt"
> > > 
> > >  PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests
> > ${PN}-bash-completion \
> > >    ${PN}-nmtui ${PN}-nmtui-doc \
> > > --
> > > 1.8.4.2
> > > 
> > > 
> > > 
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > 

