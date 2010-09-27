Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P07MX-00073W-BD
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 08:38:58 +0200
Received: by iwn2 with SMTP id 2so2698511iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Sep 2010 23:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=32M+Gvbr3TII6Z8JEEdxDwaeTTveazNYQVTAB0en7yw=;
	b=iuIsOV+TBZfX0d/YFGWewCB5rcxPNBoWm9O7P9ThE4RfhKnAvh+n8LYsEudt76zr67
	BtBn2rS3PtaoRXP6q+a7MPp9fOQ0M8fCh5zMU082C7h5iZhDOQWXjwl28L84u4udPcAx
	+2DqQra8OyQRzmGAe+TsJBjTezwyXZbzr1nmw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WM9q2Dtaj3Z0BpXaFoI3bPIKol59U5Di2CnI1BD4yTYzFKoNOiJYnmUPg6js9wxePn
	/0d78vC/cXA+4gGAbx07w3hwT1LyW9mwYazkwn8bcx7fTYVvlzQ45E4qMe7C0qPj4klF
	w+VSWj+eEErm9/tzHP51W/SI5mxrlvyqKQCrM=
MIME-Version: 1.0
Received: by 10.231.60.4 with SMTP id n4mr8765537ibh.18.1285569526180; Sun, 26
	Sep 2010 23:38:46 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 26 Sep 2010 23:38:46 -0700 (PDT)
In-Reply-To: <20100926124317.GR28423@ibawizard.net>
References: <20100926124317.GR28423@ibawizard.net>
Date: Mon, 27 Sep 2010 08:38:46 +0200
Message-ID: <AANLkTi=_gXRqO6Se0it=rG3rRoCF1rUVejp=TFqNOpXo@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Strange bluez dependency for ppp
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
X-List-Received-Date: Mon, 27 Sep 2010 06:38:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/9/26 Petr =C5=A0tetiar <ynezz@true.cz>:
> Hi,
>
> I've added ppp to my image based on minimal-image. To my surprise it drag=
ged
> in over 2000 more packages. It's caused by libpcap which depends on
> bluez-libs. My minimal-image with ppp =3D 3541 tasks/packages and same
> minimal-image with ppp, but with removed bluez-utils dependency from libc=
ap =3D
> 1300 tasks/packages. I wonder how to fix it correctly in OE, since I've f=
ound
> this patch[1]. Thanks for the suggestions.
>
> 1. http://patchwork.openembedded.org/patch/329/
>
> -- ynezz

never peeked at bluez-utils, but bluez itself drags in a lot of stuff
because it depends on alsa and gst, so even if you only need bt
serial, you get a lot of stuff you probably do not want.

Actually the bluez dir seems to be in a state of requiring some attention:
here's the dir listing:
bcm2035-tool			bluez-hcidump_1.42.bb	  bluez-utils.inc      bluez4_4.59.bb
bcm2035-tool_0.0.bb		bluez-libs		  bluez-utils3.inc     bluez4_4.66.bb
bluez-cups-backend_3.33.bb	bluez-libs.inc		  bluez-utils_3.33.bb  files
bluez-cups-backend_3.36.bb	bluez-libs_3.33.bb	  bluez-utils_3.36.bb
obexd_0.10.bb
bluez-dtl1-workaround		bluez-libs_3.36.bb	  bluez.inc	       obexd_0.13.bb
bluez-dtl1-workaround_1.0.bb	bluez-libs_4.42.bb	  bluez4	       obexd_0.15.=
bb
bluez-gnome-1.8			bluez-utils		  bluez4-libs.inc      obexd_0.19.bb
bluez-gnome_1.8.bb		bluez-utils-3.33	  bluez4.inc	       obexd_0.21.bb
bluez-gnome_cvs.bb		bluez-utils-3.x		  bluez4_4.31.bb       obexd_0.22.bb
bluez-gnome_git.bb		bluez-utils-alsa_3.33.bb  bluez4_4.41.bb
ussp-push-0.11
bluez-gstreamer-plugin_3.33.bb	bluez-utils-alsa_3.36.bb
bluez4_4.42.bb       ussp-push_0.11.bb
bluez-gstreamer-plugin_3.36.bb	bluez-utils-dbus	  bluez4_4.56.bb

I guess the _3 things refer to bluez3, but bluez3 apparently does not exist=
.
bluez.inc is not included by anyone
there are recipes for .56 .59 and .66 (although with DP =3D "-1" except
for shr), but no corresponding utils or libs


