Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 52D09615B0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2013 15:38:49 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Vq2uw-0002Bn-Fs for openembedded-devel@lists.openembedded.org;
	Mon, 09 Dec 2013 16:38:42 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2013 16:38:42 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2013 16:38:42 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 09 Dec 2013 16:38:33 +0100
Message-ID: <l84o5c$go8$1@ger.gmane.org>
References: <1386599847-32823-1-git-send-email-kirgene@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <1386599847-32823-1-git-send-email-kirgene@gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] udisks: updated to v2.1.1.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Dec 2013 15:38:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yevhen Kyriukha schreef op 09-12-13 15:37:
> One patch was removed because changes are already exist in upstream
> version. Added patch to turn libatasmart, polkit, acl and
> libsystemd-login into optional dependencies.
> 
> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com> ---

> +DESCRIPTION = "A storage daemon that implements well-defined D-Bus
> interfaces that can be used to query and manipulate storage devices." 
> +LICENSE = "GPLv2+" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43" + +DEPENDS = "udev
> dbus-glib glib-2.0" + +DEPENDS += "${@base_contains('DISTRO_FEATURES',
> 'systemd', 'systemd', '', d)}" + +SRC_URI =
> "http://udisks.freedesktop.org/releases/${P}.tar.bz2 \ +
> file://optional-depends.patch" + +SRC_URI[md5sum] =
> "80e03f312542b800cf3162254b202725" +SRC_URI[sha256sum] =
> "013b09ff38aa256b89c01525771f4565cb088724d5c8c79b32e9f811e88086fb" + 
> +inherit autotools systemd + +PACKAGECONFIG[atasmart] =
> "--enable-libatasmart,--disable-libatasmart,libatasmart" 
> +PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit" 
> +PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,libacl" 
> +PACKAGECONFIG[systemd-login] =
> "--enable-libsystemd-login,--disable-libsystemd-login,systemd"

This is missing a default PACKAGECONFIG assignment to enable all that to
have feature parity with the 1.x version.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSpeP5MkyGM64RGpERAvDcAJ9jA4d+1ByE2DzERyzX8QMINNwYGQCfQRo1
Q6NwZZ7G5TuBE4S1hJO9v4M=
=KaIN
-----END PGP SIGNATURE-----


