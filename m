Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC507320F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:05:14 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id n5so142184090wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 09:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=xFjJ+n0FlAlGlru/d9A6jp1FIZofc1grX+Wk/a+H450=;
	b=HScnrgVpvOWhB+DaYGDe44tEc5KeXnAUVlNTtxUf3PTsT9+wYeObWen88+HvuGnXBt
	p6Ur+yKTgoTVUPdgHaaC+1BHBHe74ZcaAPRMwiPK7k+GObvEuK1GqkoLYSTYulrIU8id
	25y4OUw4Wjc2/VBQmWPld3sDvw2zCyaykq325R+UqE+Or31nwE18JSitucktNYawyMG2
	uinTCOiaHBQ+zIYfxJinBkNyNMDug6iLoSqCoQ3Ik6P5ATQXCqc+QeZGDuZ0VBMPcgtv
	8NYGBZP58RiFzOyiejtIz0vkeFq1qr4j3oyE26YLRCGkj5E0S66uRg5Vbp1n4jVj6iaz
	/vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:content-type:mime-version:content-transfer-encoding;
	bh=xFjJ+n0FlAlGlru/d9A6jp1FIZofc1grX+Wk/a+H450=;
	b=JlGCOswjZEBxQDSv1LvZ3yS6WbYgFFhpqJkJhffWF011gnHJpTTKPUIjsJ5PsIv6D1
	c+Y9QTFzxcC7KjxX4wWKn/NyHA/0b30wCBnv/aBhTqYQ9rML9pSKXJV319nRSoWIDww5
	Cg49p044jzzojUGsJqXpdwZeNXezK2PddD8KWDxTSAfWazEyi1SjDMiBPYLS8PZZ9Elc
	LpQLuGJ8+byHa8ADQ031xPAVKtUwZ1bV0rsVgujYihbD1CNk2lDoKRLhUu1ZgNPcgmL6
	d4qcNIDX/DhR62rmGPnI/muCu0zWyXBTkQFuzBYOzYGLefo7Y1evYgZgYinFNr8BHHyz
	31tQ==
X-Gm-Message-State: AG10YOQiuxYeEkA2J03mjv88GGgiwAEEzqqktMe7ND8mpGCd5yCjAWHWT50c0LT7Kkkkag==
X-Received: by 10.194.179.71 with SMTP id de7mr4231042wjc.119.1453482314737;
	Fri, 22 Jan 2016 09:05:14 -0800 (PST)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	di8sm6744393wjc.34.2016.01.22.09.05.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jan 2016 09:05:14 -0800 (PST)
Message-ID: <1453482312.2577.256.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Jan 2016 18:05:12 +0100
In-Reply-To: <20160122152624.GA2617@jama>
References: <1453368103-1800-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1453450077.2577.16.camel@gmail.com>
	<CA+chaQdhrn9CcNXTde4ULwSodhsN+ajFZGXuY_wkSOcq-MUf+Q@mail.gmail.com>
	<1453474488.2577.220.camel@gmail.com> <20160122152624.GA2617@jama>
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
X-List-Received-Date: Fri, 22 Jan 2016 17:05:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Thank you for the explanation. I did everything as you suggested.

I aggree with you, that we should add the PACKAGEOPTION[nmtui] (I prefer nmtui over libnewt, because the user wants to have nmtui, not
liwnewt). I tried it and is exactly as you said. An empty package is properly handled by bitbake.

The second point, which was the reason for the patch, at least according its subject, I still can't follow. I verified that my bitbake has
the right configuration (default jethro) to display this warning and then I did the recompilation as you suggested. There is no warning on
my system. I still cannot understand why there should be a change in the dependencies if we have:

DEPENDS="libnewt"

and then add

PACKAGECONFIG[libnewt] = "--with-nmtui=yes,--with-nmtui=no,libnewt"

In both cases libnewt is a build dependency.

According to my understandig the patch should be renamed to
"networkmanager: make libnewt build dep optional"

and it should look like:


diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb b/meta-oe/recipes-
connectivity/networkmanager/networkmanager_1.0.10.bb
index b47a8c8..8bdfba3 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b \
 "
 
-DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt"
+DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp"
 
 inherit gnomebase gettext systemd bluetooth
 
@@ -32,7 +32,6 @@ EXTRA_OECONF = " \
     --disable-more-warnings \
     --with-iptables=${sbindir}/iptables \
     --with-tests \
-    --with-nmtui=yes \
 "
 
 PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
@@ -59,6 +58,7 @@ PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt"
 PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-supplicant wireless-tools"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
+PACKAGECONFIG[nmtui] = "--with-nmtui=yes,--with-nmtui=no,libnewt"
 
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion \
   ${PN}-nmtui ${PN}-nmtui-doc \



Do you agree? May I send the patch again with git send-email?

Thank you and regards,
Adrian



On Fri, 2016-01-22 at 16:26 +0100, Martin Jansa wrote:
> On Fri, Jan 22, 2016 at 03:54:48PM +0100, Adrian Freihofer wrote:
> > Hi Martin,
> > 
> > Thank you for the response. But it is confusing to me...
> > Networkmanager is always built with nmtui enabled, and we split it into package networkmanager-nmtui:
> > EXTRA_OECONF = \
> >     ...
> >     --with-nmtui=yes \
> > "
> > PACKAGES =+ "... ${PN}-nmtui"
> > FILES_${PN}-nmtui = " ...
> > 
> > I guess an additional package option for --with-nmtui does not fit. Either we have a compile time option or a package split.
> 
> It does fit, you can still have deterministic build time dependencies
> and options and then optionally create separate package if it isn't
> empty.
> 
> > Regarding rdepends:
> > Since libnewt is already listed as a build dependency pkgconfig automatically creates the correct rdepends:
> >  - libnewt is a runntime dependency of networkmanager-nmtui
> >  - networkmanager itself does not rdepend on it.
> > This is exatly what I expect. There is no need to force rdepends at all.
> 
> 3rd parameter is build time dependency not runtime dependency.
> 
> The whole QA warning is about something being autodetected from sysroot
> without having the build time dependency, and the QA check is using
> runtime dependencies to check it -> so yes, the runtime dependency is
> there in ${PN}-nmtui package, but build time dependency isn't.
> 
> > Again: I'm on jethro and I cannot see this warning.
> > What are we going to fix with this patch?
> 
> Try:
> 
> bitbake libnewt && bitbake -c cleansstate networkmanager && bitbake networkmanager
> 
> it can autodetect (and QA warn) only about dependencies which happened
> to be built before the recipe.
> 
> > On Fri, 2016-01-22 at 09:26 +0100, Martin Jansa wrote:
> > > It is correct approach to fix it.
> > > 
> > > This isn't:
> > > RDEPENDS_${PN}-nmtui += "libnewt"
> > > 
> > > On Fri, Jan 22, 2016 at 9:07 AM, Adrian Freihofer <
> > > adrian.freihofer@gmail.com> wrote:
> > > 
> > > > Hi
> > > > 
> > > > This is not the right approach to fix this warning.
> > > > Please try something like this:
> > > > RDEPENDS_${PN}-nmtui += "libnewt"
> > > > 
> > > > Notes:
> > > > - I never saw this warning.
> > > > - I would expect that pkgconfig does this automatically.
> > > > 
> > > > Regards,
> > > > Adrian
> > > > 
> > > > On Thu, 2016-01-21 at 12:21 +0300, Li Xin wrote:
> > > > > WARNING: QA Issue: networkmanager rdepends on libnewt, but it isn't a
> > > > build dependency? [build-deps]
> > > > > 
> > > > > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > > > > ---
> > > > >  meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb |
> > > > 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/meta-oe/recipes-connectivity/networkmanager/
> > > > networkmanager_1.0.6.bb b/meta-oe/recipes-
> > > > > connectivity/networkmanager/networkmanager_1.0.6.bb
> > > > > index 1ddb66f..72b4e46 100644
> > > > > --- a/meta-oe/recipes-connectivity/networkmanager/
> > > > networkmanager_1.0.6.bb
> > > > > +++ b/meta-oe/recipes-connectivity/networkmanager/
> > > > networkmanager_1.0.6.bb
> > > > > @@ -56,6 +56,7 @@ PACKAGECONFIG[wifi] =
> > > > "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-sup
> > > > >  PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
> > > > >  PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
> > > > >  PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
> > > > > +PACKAGECONFIG[libnewt] = "--with-nmtui=yes,--with-nmtui=no,libnewt"
> > > > > 
> > > > >  PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests
> > > > ${PN}-bash-completion \
> > > > >    ${PN}-nmtui ${PN}-nmtui-doc \
> > > > > --
> > > > > 1.8.4.2
> > > > > 
> > > > > 
> > > > > 
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > 
> 

