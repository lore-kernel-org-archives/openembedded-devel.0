Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@gmail.com>) id 1QUEBl-0004fA-27
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 10:32:33 +0200
Received: by wye20 with SMTP id 20so186067wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2011 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:date:from:to:cc:subject:message-id
	:in-reply-to:references:organization:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=0tQgA/yWb1KqGk4F7UF6U/m2b0I3cVC0WSWXugnkO0A=;
	b=Vrf4AuaSY1LqEQGybi/L1dGfXex2BlP41fFc+Td1sE74YtSxhfX1ewhq7u977cXcdn
	AP+5WCXHKXKv8VGGcKsm1DejnJDi7zYlnjDaW6I2PBjMRgAxedfb6oPf65/XuJVcxswU
	kRyxhk61iqS2YYeKQpznp7jweBiKM0HXUvb8E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=tlbzCZDjo0SiSGwFvAyHMIQeYQ653ORE7XYu41ix9uRSxqE83TZq9wC/AY9TZ6HMjt
	7tnl8Zq00yFPCaPUxp611DZ3kEkDhesFuwORnu8PkfmTg9JvBBUcKmNcPs/qj123iAkV
	OgRRr/8uzeqLgf671TzpuT+k6/eu1NhlMlmyY=
Received: by 10.216.68.2 with SMTP id k2mr4538746wed.90.1307521754546;
	Wed, 08 Jun 2011 01:29:14 -0700 (PDT)
Received: from guibc (dra38-9-78-249-57-20.fbx.proxad.net [78.249.57.20])
	by mx.google.com with ESMTPS id n20sm133830weq.39.2011.06.08.01.29.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Jun 2011 01:29:14 -0700 (PDT)
Sender: guillaume beraudo <guillaume.beraudo@gmail.com>
Date: Wed, 8 Jun 2011 10:29:10 +0200
From: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20110608102910.50c67a63@guibc>
In-Reply-To: <20110607151843.GD23137@jama.jama.net>
References: <guillaume.beraudo@belledonne-communications.com>
	<1307448812-27299-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
	<20110607124151.GA23137@jama.jama.net>
	<20110607152354.7ff67c49@guibc>
	<20110607133310.GC23137@jama.jama.net>
	<20110607162358.44a38bcf@guibc>
	<20110607151843.GD23137@jama.jama.net>
Organization: Belledonne Communications
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Wed, 08 Jun 2011 08:32:33 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> > > > > > +OVERRIDES_append = ":video:console"
> > > > > 
> > > > > This looks like someone trying to implement USE flags in
> > > > > OE :). But I'm not sure it's right way and I haven't noticed
> > > > > this used in any other recipe. So it would be better to
> > > > > discuss first.
> > > > 
> > > > I am new to openembedded and thus may have missed something in
> > > > the documentations. Can you point me to some elegant way to
> > > > implement recipe flavours?
> > > 
> > > I don't think TSC agreed on some sort of USE-flag solution or
> > > policy yet, but keeping shared EXTRA_OECONF in linphone-3.4.3.inc
> > > and then EXTRA_OECONF_append with nogtk specific options in
> > > separate files like linphone-nogtk_3.4.3.bb would be easier to
> > > understand (at least to me), even when not so "elegant" as your
> > > OVERRIDES solution.

With your advice, a typical linphone recipe would contain a block like
this:

# With video
DEPENDS_append = " libxv ffmpeg libv4l"
EXTRA_OECONF_append = "
--with-ffmpeg=${STAGING_DIR_HOST}${layout_exec_prefix} --enable-video"

# Without video
#EXTRA_OECONF_append = " --disable-video"


# GTK GUI
DEPENDS_append = " gtk+"
PROVIDES_append = " linphone"
PACKAGES_prepend = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-locale "
EXTRA_OECONF_append = " --enable-gtk_ui=yes"

# Without GTK GUI
#EXTRA_OECONF_append = " --enable-gtk_ui=no"


Though it is easier at first glance I feel it error prone.
When creating a new recipe, it is easy to forget uncommenting
directives.

Is it blocking to use my initial solution with OVERRIDES?
If yes, what about using a "@base_conditional"?
Eg:
LINPHONE_FLAVOUR_WITH_GTK = '1'
@base_conditional('LINPHONE_FLAVOUR_WITH_GTK', '1', 'something when
active', 'something when inactive')

This would keep the recipes simple and avoid using any OVERRIDES or
_append.



> > There is also some conditionnals with the DEPENDS.
> > What is the use of all the "DEPENDS_some-package-name" directives?
> > Isn't it identical to only use the global "DEPENDS"?
> 
> Yes it looks weird and broken on quick glance.
> but "shared" DEPENDS = "foo" in linphone-3.4.3.inc and DEPENDS_append
> = "gtk+" in linphone-gtk_1.2.4.bb makes sense
>  
> > I removed all the RDEPENDS stuff. Can you confirm it was
> > unnecessary?
> 
> all linked .so providers should be picked to rdepends automatically by
> package.bbclass so only extra stuff like linphone-gtk-config would be
> needed in extra RDEPENDS_${PN} in linphone-gtk_1.2.4.bb.

Isn't the "inherit pkgconfig" managing it already?

Also, do you thing this line is of any use?
"export PKG_CONFIG=${STAGING_BINDIR_NATIVE}/pkg-config"

Regards
Guillaume


