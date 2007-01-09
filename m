Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H4PW3-0008PI-VE
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jan 2007 23:32:24 +0100
Received: (qmail invoked by alias); 09 Jan 2007 22:30:37 -0000
Received: from c-134-225-158.d.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.225.158]
	by mail.gmx.net (mp032) with SMTP; 09 Jan 2007 23:30:37 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H4PTy-0001uP-00; Tue, 09 Jan 2007 23:30:14 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: OpenEmbedded <openembedded-devel@lists.openembedded.org>
Date: Tue, 09 Jan 2007 23:30:14 +0100
Message-Id: <1168381814.4166.49.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Sender: Patrick Ohly <patrick@gmx.de>
X-Y-GMX-Trusted: 0
Subject: eds-dbus + dbus-glib-native version conflict
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2007 22:32:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

FYI: the "generic" distro picks up the latest eds-dbus from subversion
and dbus-glib[-native] 0.72. eds-dbus fails to compile because
dbus-binding-tool is called without --prefix parameter, which apparently
became obligatory in 0.72. I went back to 0.71 and then got eds-dbus
compiled:
  PREFERRED_VERSION_dbus-glib ?= "0.71"
  PREFERRED_VERSION_dbus-glib-native ?= "0.71"

Not sure whether anything should be done about this in the OE meta data.
Getting it fixed in eds-dbus seems like the easier solution.

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


