Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1QeR1L-0001PL-0O
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 14:15:59 +0200
Received: (qmail 11824 invoked from network); 6 Jul 2011 14:12:07 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 6 Jul 2011 14:12:07 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id rG+bU4JEi2aW
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jul 2011 14:11:56 +0200 (CEST)
Received: (Qmail 11734 invoked from network); 6 Jul 2011 14:11:56 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 6 Jul 2011 12:11:56 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.72 #1
	(Debian)) id 1QeQxQ-00086x-NM
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 14:11:56 +0200
Date: Wed, 6 Jul 2011 14:11:56 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110706121156.GB8641@mi.fu-berlin.de>
References: <1309951927.4583.2.camel@mattotaupa>
	<1309953417-8572-1-git-send-email-a.sappia@biotechware.com>
MIME-Version: 1.0
In-Reply-To: <1309953417-8572-1-git-send-email-a.sappia@biotechware.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Heinold <heinold@mi.fu-berlin.de>
Subject: Re: [PATCH v2] dbus-glib: install required files for target	on native build
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
X-List-Received-Date: Wed, 06 Jul 2011 12:15:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 06, 2011 at 01:56:57PM +0200, Alessandro Sappia wrote:
> dbus-glib-native and dbus-glib were not compiling. This patch corrects
> dbus-glib-native to install required files in order to let dbus-glib
> to compile on target.
> 
> Signed-off-by: Alessandro Sappia <a.sappia@biotechware.com>
> ---
>  recipes/dbus/dbus-glib.inc     |    4 ++--
>  recipes/dbus/dbus-glib_0.86.bb |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/dbus/dbus-glib.inc b/recipes/dbus/dbus-glib.inc
> index c1c1813..d3db9f0 100644
> --- a/recipes/dbus/dbus-glib.inc
> +++ b/recipes/dbus/dbus-glib.inc
> @@ -21,10 +21,10 @@ inherit autotools pkgconfig gettext
>  
>  BBCLASSEXTEND = "native"
>  
> -do_configure_prepend() {
> +do_configure() {
>          install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml ${S}/tools/
>          install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-glib-bindings.h ${S}/tools/
> -
> +        autotools_do_configure
>  }
^^^^^^^^^^^^^

Why you changed this? The code in resulting shellfile should be looking the same,
but using the prepend is normaly the better way.

>  
>  do_configure_virtclass-native() {
> diff --git a/recipes/dbus/dbus-glib_0.86.bb b/recipes/dbus/dbus-glib_0.86.bb
> index ce87d5d..1cef831 100644
> --- a/recipes/dbus/dbus-glib_0.86.bb
> +++ b/recipes/dbus/dbus-glib_0.86.bb
> @@ -1,10 +1,10 @@
>  require dbus-glib.inc
>  
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>  
>  SRC_URI_virtclass-native += "file://run-with-tmp-session-bus.patch"
>  
> -do_install_virtclass-native_prepend() {
> +do_install_append_virtclass-native() {
>          install -d ${D}${datadir}/dbus
>          install -m 0644 dbus-bus-introspect.xml ${D}${datadir}/dbus
>  }

I hope this works, there was some problems with the whole introspection stuff.

Bye henning


