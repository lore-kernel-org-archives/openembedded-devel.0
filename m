Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.sappia@biotechware.com>) id 1Qlr8n-0004GB-IG
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 01:34:21 +0200
X-Originating-IP: 217.70.178.137
Received: from mfilter8-d.gandi.net (mfilter8-d.gandi.net [217.70.178.137])
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id 0992DA8070;
	Wed, 27 Jul 2011 01:30:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter8-d.gandi.net
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by mfilter8-d.gandi.net (mfilter8-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id UokdSYNkvxd7; Wed, 27 Jul 2011 01:30:08 +0200 (CEST)
X-Originating-IP: 87.0.212.22
Received: from [192.168.1.13]
	(host22-212-dynamic.0-87-r.retail.telecomitalia.it [87.0.212.22])
	(Authenticated sender: a.sappia@biotechware.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 20D62A8073;
	Wed, 27 Jul 2011 01:30:07 +0200 (CEST)
From: Alessandro Sappia <a.sappia@biotechware.com>
To: openembedded-devel@lists.openembedded.org, koen@dominion.thruhere.net
In-Reply-To: <1311672076-9599-1-git-send-email-a.sappia@biotechware.com>
References: <1311672076-9599-1-git-send-email-a.sappia@biotechware.com>
Organization: Biotechware srl
Date: Wed, 27 Jul 2011 01:30:06 +0200
Message-ID: <1311723006.1924.6.camel@BlackBox-LX>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Tue, 26 Jul 2011 23:34:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Koen Kooi - 2011-07-26 09:39:21
> 
> 
> Op 26-07-11 11:21, Alessandro Sappia schreef:
> > * dbus-glib require some source files generated during native build in order to build on target.
> > 
> > Signed-off-by: Alessandro Sappia <a.sappia@biotechware.com> --- recipes/dbus/dbus-glib.inc     |    8 ++++---- recipes/dbus/dbus-glib_0.86.bb |    7 +------ 2 files changed, 5 insertions(+), 10 deletions(-)
> > 
> > diff --git a/recipes/dbus/dbus-glib.inc b/recipes/dbus/dbus-glib.inc index c1c1813..7208e91 100644 --- a/recipes/dbus/dbus-glib.inc +++ b/recipes/dbus/dbus-glib.inc @@ -21,19 +21,19 @@ inherit autotools pkgconfig gettext
> > 
> > BBCLASSEXTEND = "native"
> > 
> > -do_configure_prepend() { +do_configure() { install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml ${S}/tools/ install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-glib-bindings.h ${S}/tools/ - +        autotools_do_configure }
> > 
> > do_configure_virtclass-native() { autotools_do_configure }
> > 
> > -do_install_virtclass-native() { -        autotools_do_install +do_install_append_virtclass-native() { install -d ${D}${datadir}/dbus +        install -m 0644 dbus-bus-introspect.xml ${D}${datadir}/dbus install -m 0644 tools/dbus-glib-bindings.h ${D}${datadir}/dbus }
> 
> Out of curiousity, why are you mixing the 2 styles (append/prepend vs replacement) in this commit?
> 

This is because, didn't checked why, do_configure_prepend() didn't worked seamless, while do_install_append works fine for me.
Before further investigation occurs, as this build is needed for those starting now to build I wrote this way.
A better solution would be available if a virtclass-cross would exists, while now we have just virtclass-sdk and virtclass-native.

Are you OK with the patch ?

Regards,

Alessandro

