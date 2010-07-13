Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OYjfK-00032y-13
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 19:53:10 +0200
Received: from [192.168.10.100] (95.232.142.62) by smtp205.alice.it
	(8.5.124.08) (authenticated as editempo)
	id 4C1A264501BBFA59 for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 19:53:07 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jul 2010 19:26:54 +0200
Message-ID: <1279042014.6122.8.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 82.57.200.101
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gnome introspection.m4
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
X-List-Received-Date: Tue, 13 Jul 2010 17:53:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

hi,
libgee-native-1_0.5.0+gitr3+3ce13a7b8644263037f39441d3c10a3b00861301-r0
failed to configure:

| autoreconf: running: automake --foreign --add-missing --copy
--force-missing --warnings=cross
| automake: unknown warning category `cross'
| gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in
AM_CONDITIONAL
| autoreconf: automake failed with exit status: 1
| FATAL: autoreconf execution failed.

looking at autogen.sh shows:
REQUIRED_M4MACROS=introspection.m4 gnome-autogen.sh "$@" || exit 1

trying to find the m4 in libgee's workdir or in sysroot failed.
woglinde helped me a lot and found that:
http://live.gnome.org/GObjectIntrospection

on my side I grepped oe's recipes dir and found:
./dbus/dbus-glib-0.86/no-introspect.patch
it's also there for older version of dbug-glib.

woglinde asked me to send a mail because we have no idea on what's the
best way to handle this correctly.

Denis




