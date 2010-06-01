Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OJQFg-0006Uo-4U
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 14:07:26 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 48E2316606A1; Tue,  1 Jun 2010 06:03:10 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id D27251660615;
	Tue,  1 Jun 2010 06:03:09 -0600 (MDT)
Message-ID: <4C04F6FD.4070804@mlbassoc.com>
Date: Tue, 01 Jun 2010 06:03:09 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Is Angstrom dead?
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
X-List-Received-Date: Tue, 01 Jun 2010 12:07:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

It sure feels like it :-(

For a week, I've been trying to build various images in Angstrom
and the problems I've faced have gone totally unanswered on either
the Angstrom or OE mailing lists.  I'm not the only one facing
these problems either.

I'm mostly interested in building beagleboard-linuxtag2010-demo-image
which [at least] implies it should be a great demo to show at
LinuxTag (which starts in only a few days now).  Surely a show
piece would be something that a popular project would want to
support and be available to the masses??

I tried again today, updating to org.openembedded.dev branch,
commit a2834c64fb3ed535fca51c25547754fa907e4ca5  Sadly, new
problems (and probably still the old ones) remain:

| checking for CHEESE... configure: error: Package requirements (  glib-2.0 >= 2.16.0   gobject-2.0 >= 2.12.0   gio-2.0 >= 2.16.0   gtk+-2.0 >= 2.19.1   gdk-2.0 >= 2.14.0 
gnome-desktop-2.0 >= 2.26.0   gconf-2.0 >= 2.16.0   gstreamer-0.10 >= 0.10.23   gstreamer-plugins-base-0.10 >= 0.10.23   cairo >= 1.4.0   dbus-1 >= 1.0   dbus-glib-1 >= 0.7 
pangocairo >= 1.18.0   librsvg-2.0 >= 2.18.0
|   libcanberra-gtk gudev-1.0) were not met:
|
| No package 'gstreamer-plugins-base-0.10' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables CHEESE_CFLAGS
| and CHEESE_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|
NOTE: package cheese-2.30.1-r0: task do_configure: Failed

Nothing special - out of the box config file with
   MACHINE="beagleboard"
   DISTRO="angstrom-2008.1"

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


