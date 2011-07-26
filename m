Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QleB2-0001cP-P2 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 11:43:48 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qle6u-00008P-Kp for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 11:39:32 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 11:39:32 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 11:39:32 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 26 Jul 2011 11:39:21 +0200
Message-ID: <j0m209$qob$1@dough.gmane.org>
References: <1311672076-9599-1-git-send-email-a.sappia@biotechware.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1311672076-9599-1-git-send-email-a.sappia@biotechware.com>
X-Enigmail-Version: 1.2
Subject: Re: [PATCH v4] dbus-glib: corrected native and cross recipe.
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
X-List-Received-Date: Tue, 26 Jul 2011 09:43:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 26-07-11 11:21, Alessandro Sappia schreef:
> * dbus-glib require some source files generated during native build in order to build on target.
> 
> Signed-off-by: Alessandro Sappia <a.sappia@biotechware.com> --- recipes/dbus/dbus-glib.inc     |    8 ++++---- recipes/dbus/dbus-glib_0.86.bb |    7 +------ 2 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/recipes/dbus/dbus-glib.inc b/recipes/dbus/dbus-glib.inc index c1c1813..7208e91 100644 --- a/recipes/dbus/dbus-glib.inc +++ b/recipes/dbus/dbus-glib.inc @@ -21,19 +21,19 @@ inherit autotools pkgconfig gettext
> 
> BBCLASSEXTEND = "native"
> 
> -do_configure_prepend() { +do_configure() { install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml ${S}/tools/ install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-glib-bindings.h ${S}/tools/ - +        autotools_do_configure }
> 
> do_configure_virtclass-native() { autotools_do_configure }
> 
> -do_install_virtclass-native() { -        autotools_do_install +do_install_append_virtclass-native() { install -d ${D}${datadir}/dbus +        install -m 0644 dbus-bus-introspect.xml ${D}${datadir}/dbus install -m 0644 tools/dbus-glib-bindings.h ${D}${datadir}/dbus }

Out of curiousity, why are you mixing the 2 styles (append/prepend vs replacement) in this commit?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOLotJMkyGM64RGpERAtxQAJ9fx8JYvkmBFWQfT2l7psyH1YVZtACgjhtM
PrBwskppuQwnIaNDdwCqFQU=
=G6gv
-----END PGP SIGNATURE-----



