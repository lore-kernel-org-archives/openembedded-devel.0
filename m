Received: from [209.85.200.169] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MJYZo-000724-26
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 21:56:12 +0200
Received: by wf-out-1314.google.com with SMTP id 25so346758wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2009 12:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ZrJrrIAKiLbu0aLbctCl9rq0GFlYqOBWG+cqeKBCyrY=;
	b=fqdbIoFa51sczQwWILnofoLmTL7OmmgxCPB/A+HJ3EZQP8hk5ly/Nz8PocWKF5m32f
	f0hIhLwA6erPOeID4cHdmvzp1uriVbETVCqXuskye04vkYlAoRzEOyFOHCFodwUx47x0
	/ROoz5hBVC2OtxttWhE2XyGLYYfql5mUdzntA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=i3QQwDJrlPAzN7jHUCDbQqsof3sPi57nJIFK9PWmVuJYmjfNG+67rkf61Z/ewTJCrC
	h2ZMpIcRUXSuvX9uqbWuvwSQ7hL6JJUBnTEAndlJyhownnxexSWaFOchj2CosTzqXS6a
	/tJqQiF2Zvn9NdfVpV2PcWqn7MJwDkUte3hr8=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.214.12 with SMTP id m12mr521524wfg.45.1245872699672; Wed, 
	24 Jun 2009 12:44:59 -0700 (PDT)
In-Reply-To: <1245871136.5939.3.camel@utx.utx.cz>
References: <1245871136.5939.3.camel@utx.utx.cz>
Date: Wed, 24 Jun 2009 12:44:59 -0700
X-Google-Sender-Auth: 25e4b8ab80b84c2a
Message-ID: <b6ebd0a50906241244hb9331c6nb22d82f6f04d004c@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] introduction of virtual/libusb0
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
X-List-Received-Date: Wed, 24 Jun 2009 19:56:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2009 at 12:18 PM, Stanislav Brabec<utx@penguin.cz> wrote:
> Hallo.
>
> I plan to submit attached patch to oe.dev to fix clash of libusb-compat
> and libusb in recipes by introduction of virtual/libusb0.
>
> libusb-compat and libusb provide exactly the same API and ABI using a
> different back-end, and applications should work with both of them
> without recompilation.
>
> After the commit, distro maintainers will be encouraged to set:
> PREFERRED_PROVIDER_virtual/libusb0 =3D "libusb-compat"
>
> Following technical problems may happen with libusb0 applications:
>
> - Application does not compile of fail on runtime linking with
> libusb-compat: Badly written application (using internal functions
> etc.), application needs fix.
> gnuradio is known to be affected.
>
> - Application does not work libusb-compat: Application depends on an
> obscure aspect of libusb behavior. Report it and help with debugging.
> With libusb-compat-1.0.2, there are no known defects of this type.
>
> The commit will also remove hack recipes/libusb/libusb_0.0.0.bb.
>
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008=
.1.conf
> index f0b8a04..dff9320 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -140,6 +140,7 @@ PREFERRED_PROVIDER_virtual/db =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ?=3D "db"
> =C2=A0PREFERRED_PROVIDER_virtual/db-native =C2=A0 =C2=A0?=3D "db-native"
> =C2=A0PREFERRED_PROVIDER_virtual/libsdl =C2=A0 =C2=A0 =C2=A0 ?=3D "libsdl=
-x11"
> =C2=A0PREFERRED_PROVIDER_virtual/libx11 =C2=A0 =C2=A0 =C2=A0 ?=3D "libx11=
"
> +PREFERRED_PROVIDER_virtual/libusb0 =C2=A0 =C2=A0 =C2=A0?=3D "libusb-comp=
at"
>
> =C2=A0# Others:
> =C2=A0PREFERRED_PROVIDER_linux-libc-headers =3D "linux-libc-headers"
> @@ -158,6 +159,7 @@ PREFERRED_PROVIDER_bluez-utils-dbus =C2=A0 =C2=A0 =C2=
=A0=3D "bluez-utils"
> =C2=A0PREFERRED_PROVIDER_bluez-libs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D "bluez4"
> =C2=A0PREFERRED_PROVIDER_bluez-utils =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D "bluez4"
>
> +
> =C2=A0# we don't ship gtk-directfb by default
> =C2=A0PREFERRED_PROVIDER_gtk+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ?=3D "gtk+"
> =C2=A0PREFERRED_PROVIDER_gdk-pixbuf-loader-ani =C2=A0?=3D "gtk+"
> diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/dis=
tro/include/preferred-slugos-versions.inc
> index 992235a..0eae85b 100644
> --- a/conf/distro/include/preferred-slugos-versions.inc
> +++ b/conf/distro/include/preferred-slugos-versions.inc
> @@ -63,11 +63,5 @@ PREFERRED_VERSION_udev =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=
=3D "118"
>
> =C2=A0##################### Stuff with special notes, and broken stuff:
>
> -# Hack alert - selecting this version of libusb effectively selects
> -# the use of libusb1 and libusb-compat in the case that something
> -# still depends on libusb. This is required because otherwise
> -# libusb will overwrite libusb-compat in staging.
> -PREFERRED_VERSION_libusb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D "0.0.0"
> -
> =C2=A0# boost 1.36 won't build
> =C2=A0PREFERRED_VERSION_boost =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D "=
1.33.1"
> diff --git a/recipes/0xFFFF/0xffff-native_0.1.bb b/recipes/0xFFFF/0xffff-=
native_0.1.bb
> index 2530388..3e694eb 100644
> --- a/recipes/0xFFFF/0xffff-native_0.1.bb
> +++ b/recipes/0xFFFF/0xffff-native_0.1.bb
> @@ -1,6 +1,6 @@
> =C2=A0require 0xffff.inc
>
> -DEPENDS =3D "libusb-native"
> +DEPENDS =3D "virtual/libusb0-native"
>
> =C2=A0inherit native
>
> diff --git a/recipes/0xFFFF/0xffff-native_0.2.bb b/recipes/0xFFFF/0xffff-=
native_0.2.bb
> index eb82cb4..be15c8e 100644
> --- a/recipes/0xFFFF/0xffff-native_0.2.bb
> +++ b/recipes/0xFFFF/0xffff-native_0.2.bb
> @@ -1,6 +1,6 @@
> =C2=A0require 0xffff.inc
>
> -DEPENDS =3D "libusb-native"
> +DEPENDS =3D "virtual/libusb0-native"
>
> =C2=A0inherit native
>
> diff --git a/recipes/bluez/bluez-utils.inc b/recipes/bluez/bluez-utils.in=
c
> index 298650a..7c84f4e 100644
> --- a/recipes/bluez/bluez-utils.inc
> +++ b/recipes/bluez/bluez-utils.inc
> @@ -1,7 +1,7 @@
> =C2=A0DESCRIPTION =3D "Linux Bluetooth Stack Userland Utilities."
> =C2=A0SECTION =3D "console"
> =C2=A0PRIORITY =3D "optional"
> -DEPENDS =3D "gstreamer gst-plugins-base bluez-libs-${PV} libusb-compat d=
bus cups"
> +DEPENDS =3D "gstreamer gst-plugins-base bluez-libs-${PV} virtual/libusb0=
 dbus cups"
> =C2=A0PROVIDES =3D "bluez-utils-dbus"
> =C2=A0RPROVIDES_${PN} =3D "bluez-pan bluez-sdp bluez-utils-dbus"
> =C2=A0RREPLACES =3D "bluez-utils-dbus"
> diff --git a/recipes/bluez/bluez-utils3.inc b/recipes/bluez/bluez-utils3.=
inc
> index 5fab6e7..df071b7 100644
> --- a/recipes/bluez/bluez-utils3.inc
> +++ b/recipes/bluez/bluez-utils3.inc
> @@ -1,7 +1,7 @@
> =C2=A0DESCRIPTION =3D "Linux Bluetooth Stack Userland Utilities."
> =C2=A0SECTION =3D "console"
> =C2=A0PRIORITY =3D "optional"
> -DEPENDS =3D "gstreamer gst-plugins-base bluez-libs-${PV} libusb-compat d=
bus glib-2.0"
> +DEPENDS =3D "gstreamer gst-plugins-base bluez-libs-${PV} virtual/libusb0=
 dbus glib-2.0"
> =C2=A0PROVIDES =3D "bluez-utils-dbus"
> =C2=A0RPROVIDES_${PN} =3D "bluez-pan bluez-sdp bluez-utils-dbus"
> =C2=A0RREPLACES =3D "bluez-utils-dbus"
> diff --git a/recipes/bluez/bluez.inc b/recipes/bluez/bluez.inc
> index 711ac38..66c7d31 100644
> --- a/recipes/bluez/bluez.inc
> +++ b/recipes/bluez/bluez.inc
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://www.bluez.org"
> =C2=A0LICENSE =3D "GPL"
> =C2=A0PR =3D "r0"
>
> -DEPENDS =3D "gstreamer gst-plugins-base libusb1 dbus glib-2.0"
> +DEPENDS =3D "gstreamer gst-plugins-base virtual/libusb0 dbus glib-2.0"
> =C2=A0PROVIDES =3D "bluez-utils-dbus"
> =C2=A0RPROVIDES_${PN} =3D "bluez-pan bluez-sdp bluez-utils-dbus"
> =C2=A0RREPLACES =3D "bluez-utils-dbus"

This is wrong.  libusb0 does not replace libusb1.

It's worth noting that this could be done in a much less intrusive way.

In libusb-compat:
PROVIDES +=3D "libusb"

In libusb:
DEFAULT_PREFERENCE =3D "-1", or just set the PREFERRED_PROVIDER_libusb =3D
"libusb-compat" in the distros.  Could also PROVIDES +=3D "libusb0" or
PROVIDES +=3D "libusb-old" or something, to let recipes explicitly
depend on the old one, though that's a bad thing to be doing.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


