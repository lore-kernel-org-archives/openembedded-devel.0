Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.sappia@biotechware.com>) id 1QeROd-0001qa-Jm
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 14:40:03 +0200
X-Originating-IP: 217.70.178.137
Received: from mfilter8-d.gandi.net (mfilter8-d.gandi.net [217.70.178.137])
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id 6EB30A809F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jul 2011 14:36:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter8-d.gandi.net
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by mfilter8-d.gandi.net (mfilter8-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024) with ESMTP id dk5vuNlKfcuJ
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jul 2011 14:36:08 +0200 (CEST)
X-Originating-IP: 87.241.57.98
Received: from [192.168.8.53] (fireone.i3p.it [87.241.57.98])
	(Authenticated sender: a.sappia@biotechware.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9ADC8A8091
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jul 2011 14:36:08 +0200 (CEST)
From: Alessandro Sappia <a.sappia@biotechware.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110706121156.GB8641@mi.fu-berlin.de>
References: <1309951927.4583.2.camel@mattotaupa>
	<1309953417-8572-1-git-send-email-a.sappia@biotechware.com>
	<20110706121156.GB8641@mi.fu-berlin.de>
Organization: Biotechware srl
Date: Wed, 06 Jul 2011 14:36:07 +0200
Message-ID: <1309955767.8748.8.camel@BTW1>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
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
X-List-Received-Date: Wed, 06 Jul 2011 12:40:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Il giorno mer, 06/07/2011 alle 14.11 +0200, Henning Heinold ha scritto:
> On Wed, Jul 06, 2011 at 01:56:57PM +0200, Alessandro Sappia wrote:
> > dbus-glib-native and dbus-glib were not compiling. This patch corrects
> > dbus-glib-native to install required files in order to let dbus-glib
> > to compile on target.
> > 
> > Signed-off-by: Alessandro Sappia <a.sappia@biotechware.com>
> > ---
> >  recipes/dbus/dbus-glib.inc     |    4 ++--
> >  recipes/dbus/dbus-glib_0.86.bb |    4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/recipes/dbus/dbus-glib.inc b/recipes/dbus/dbus-glib.inc
> > index c1c1813..d3db9f0 100644
> > --- a/recipes/dbus/dbus-glib.inc
> > +++ b/recipes/dbus/dbus-glib.inc
> > @@ -21,10 +21,10 @@ inherit autotools pkgconfig gettext
> >  
> >  BBCLASSEXTEND = "native"
> >  
> > -do_configure_prepend() {
> > +do_configure() {
> >          install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml ${S}/tools/
> >          install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-glib-bindings.h ${S}/tools/
> > -
> > +        autotools_do_configure
> >  }
> ^^^^^^^^^^^^^
> 
> Why you changed this? The code in resulting shellfile should be looking the same,
> but using the prepend is normaly the better way.
> 
Because later in the file there is do_configure_virtclass-native()
function.
The whole things is:
do_comfigure() is for cross compilation targets, while
do_configure_virtclass-native() is for native
OE enviroment.

This is because the do_configure_prepend() was executed also on native
target, which we need to avoid.

If there was a virtclass-cross available (is it there ?) the patch may
be simplified in

do_configure_prepend_virtclass-cross(){
  install -m 0644 {STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml
${S}/tools/
  install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-glib-bindings.h ${S}/tools/
}

I'd like more to do this way, but this requires the definition of
virtclass-cross (or whatever the name it is if such a class exists
already): I wasn't able to find the correct virtclass for writing the
patch this way.

> >  
> >  do_configure_virtclass-native() {
> > diff --git a/recipes/dbus/dbus-glib_0.86.bb b/recipes/dbus/dbus-glib_0.86.bb
> > index ce87d5d..1cef831 100644
> > --- a/recipes/dbus/dbus-glib_0.86.bb
> > +++ b/recipes/dbus/dbus-glib_0.86.bb
> > @@ -1,10 +1,10 @@
> >  require dbus-glib.inc
> >  
> > -PR = "${INC_PR}.1"
> > +PR = "${INC_PR}.2"
> >  
> >  SRC_URI_virtclass-native += "file://run-with-tmp-session-bus.patch"
> >  
> > -do_install_virtclass-native_prepend() {
> > +do_install_append_virtclass-native() {
> >          install -d ${D}${datadir}/dbus
> >          install -m 0644 dbus-bus-introspect.xml ${D}${datadir}/dbus
> >  }
> 
> I hope this works, there was some problems with the whole introspection stuff.
> 
> Bye henning
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




