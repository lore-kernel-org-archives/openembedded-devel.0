Received: from na3sys009aog105.obsmtp.com ([74.125.149.75])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bengardiner@nanometrics.ca>) id 1P68k7-0003FZ-7W
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 23:20:13 +0200
Received: from source ([209.85.212.54]) by na3sys009aob105.postini.com
	([74.125.148.12]) with SMTP
	ID DSNKTLYibyiI3i9p1cB3idu/S6XMQ55Qjgj9@postini.com;
	Wed, 13 Oct 2010 14:19:45 PDT
Received: by vws1 with SMTP id 1so3445827vws.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 14:19:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.76.196 with SMTP id d4mr2963152vck.37.1287004783051; Wed,
	13 Oct 2010 14:19:43 -0700 (PDT)
Received: by 10.220.199.2 with HTTP; Wed, 13 Oct 2010 14:19:42 -0700 (PDT)
In-Reply-To: <20101013190930.GH11514@denix.org>
References: <1286988161-20097-1-git-send-email-bengardiner@nanometrics.ca>
	<i94r56$spo$1@dough.gmane.org>
	<AANLkTinY4ObZCkhW_tND0R=p308v6R957YF=7-GTO1=1@mail.gmail.com>
	<20101013190930.GH11514@denix.org>
Date: Wed, 13 Oct 2010 17:19:42 -0400
Message-ID: <AANLkTinwik_7Y8M07jkNhXYG5EQ4ExTAOBGXJ5A5UhpQ@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.149.75
X-SA-Exim-Mail-From: bengardiner@nanometrics.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	WEIRD_PORT autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] [PATCH] distro: make TARGET_VENDOR a weak assignment to enable external-csl
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
X-List-Received-Date: Wed, 13 Oct 2010 21:20:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2010 at 3:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> As I mentioned in the previous discussion, since inclusion of
> toolchain-external.inc happens before the inclusion of angstrom.inc, wher=
e
> TARGET_VENDOR is set unconditionally, it's not possible to control this
> variable from toolchain-external.inc...
>
> We either need to swap those two lines, so inclusion of toolchain-externa=
l.inc
> happens after the angstrom.inc is included (untested):
>
> diff --git a/conf/distro/angstrom-2008.1.conf
> b/conf/distro/angstrom-2008.1.conf
> index ec4f21e..1fd5ab6 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -124,10 +124,6 @@ PREFERRED_VERSION_binutils_avr32 =3D "2.17"
> =A0PREFERRED_VERSION_binutils-cross_avr32 =3D "2.17"
> =A0PREFERRED_VERSION_binutils-cross-sdk_avr32 =3D "2.17"
>
> -# Toolchain virtuals:
> -require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> -require conf/distro/include/arm-thumb.inc
> -
> =A0PREFERRED_PROVIDER_dbus-glib =A0 =A0 =A0 =A0 =A0 =A0 =3D "dbus-glib"
> =A0PREFERRED_PROVIDER_hotplug =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D "udev"
> =A0PREFERRED_PROVIDER_opkg =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "opkg"
> @@ -143,6 +139,10 @@ ANGSTROMLIBC ?=3D "glibc"
>
> =A0require conf/distro/include/angstrom.inc
>
> +# Toolchain virtuals:
> +require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> +require conf/distro/include/arm-thumb.inc
> +
> =A0# Set DISTRO_FEED_CONFIGS to our config var, assigned in the above .in=
c
> =A0DISTRO_FEED_CONFIGS =3D "${ANGSTROM_FEED_CONFIGS}"

I can confirm that this plus the toolchain-external changes proposed
yields the expected variables:

$bitbake -i
/usr/lib/pymodules/python2.6/bb/shell.py:59: DeprecationWarning: The
popen2 module is deprecated.  Use the subprocess module.
  import sys, os, readline, socket, httplib, urllib, commands, popen2,
copy, shlex, Queue, fnmatch
BitBake Shell Version 0.5.3.1 (C) 2005 Michael 'Mickey' Lauer
<mickey@Vanille.de>
Type 'help' for more information, press CTRL-D to exit.
BB>> parse
[snip]
NOTE: Handling BitBake files: | (7131/7131) [100 %]
NOTE: Parsing finished. 0 cached, 6796 parsed, 335 skipped, 2 masked.

BB>> getvar TOOLCHAIN_VENDOR
-none
BB>> getvar TARGET_VENDOR
-none
BB>> getvar TARGET_SYS
arm-none-linux-gnueabi

and that a build of angstrom-2008.1 doesn't yield errors about unfound
arm-angstrom-linux-gnueabi libraries.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


