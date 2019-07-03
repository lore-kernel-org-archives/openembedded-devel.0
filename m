Return-Path: <robert.joslyn@redrectangle.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6E97C7A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 05:09:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 147453A2946
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 04:40:21 +0000 (UTC)
X-Originating-IP: 50.37.95.192
Received: from xps13.localdomain (50-37-95-192.mscw.id.frontiernet.net
	[50.37.95.192])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id F18BFE0002;
	Wed,  3 Jul 2019 04:40:15 +0000 (UTC)
Message-ID: <cc036abd9b524d59dbc3aba12846cf6d613d4283.camel@redrectangle.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, akuster808
	<akuster808@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 02 Jul 2019 21:40:10 -0700
In-Reply-To: <45e5da62990f4748b245c0c96c8add8c@xbox06.axis.com>
References: <20190602231221.24148-1-robert.joslyn@redrectangle.org>
	<ed9e6fc4-d91c-7457-34d7-491c153215cb@gmail.com>
	<6624e8f8b1bf2f068d9abd17d2c895517fb96fc8.camel@redrectangle.org>
	<e09a230789494c4087469516707a2016@xbox06.axis.com>
	<d8448c1b0b28e1a502bbd1c8a6cae3f8690d54e9.camel@redrectangle.org>
	<45e5da62990f4748b245c0c96c8add8c@xbox06.axis.com>
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] cryptsetup: Add PACKAGECONFIG options
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
X-List-Received-Date: Wed, 03 Jul 2019 05:09:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-07-01 at 23:53 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Robert Joslyn <robert.joslyn@redrectangle.org>
> > Sent: den 28 juni 2019 05:51
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; akuster808
> > <akuster808@gmail.com>; openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH] cryptsetup: Add PACKAGECONFIG
> > options
> > 
> > On Thu, 2019-06-27 at 10:56 +0000, Peter Kjellerstedt wrote:
> > > It is no longer possible to build cryptsetup-native after this was
> > > merged.
> > > It now fails with:
> > > 
> > > ERROR: Nothing PROVIDES 'udev-native' (but virtual:native:.../meta-
> > > oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb DEPENDS on or
> > > otherwise
> > > requires it). Close matches:
> > >   fuse-native
> > >   unifdef-native
> > >   db-native
> > > ERROR: Required build target 'cryptsetup-native' has no buildable >
> > > providers.
> > > Missing or unbuildable dependency chain was: ['cryptsetup-native',
> > > 'udev-native']
> > > 
> > > This is with systemd in DISTRO_FEATURES.
> > > 
> > > //Peter
> > 
> > Sorry about that. Is there a reasonable set of options useful for the
> > native build? Any preference for an empty native PACKAGECONFIG or
> > should it be the same as the target (minus udev obviously)?
> 
> I have no idea. I don't even know why cryptsetup-native is being built, 
> all I know is that it can't depend on udev-native. Locally, I have
> fixed  
> it by adding a bbappend with PACKAGECONFIG_remove_class-native =
> "udev", 
> so now it builds again. For meta-oe I would instead suggest to add the 
> udev feature using PACKAGECONFIG_append_class-target = " udev".
> 
> One thing that worries me though is that you stated in the commit
> message 
> that the set of enabled PACKAGECONFIGs should match the default when no 
> enable/disable options are specified. However, this does not seem to
> hold 
> true for udev, as there was no dependency on udev before your change.
> So 
> maybe udev should not be enabled by default for target either?

I looked at it again, and the behavior of --enable-udev and --disable-udev 
is a little different than I thought. --enable-udev is adding a check for
devmapper udev sync support at runtime (it adds a call to
dm_udev_get_sync_support()). So it doesn't need udev at build time for
this, just runtime. libdevmapper has udev support enabled by default for target builds, so that would have been pulling it in before.

I'll send a patch adding udev only for the target build and making it an
RDEPENDS only.

Thanks,
Robert


