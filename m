Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1O1z6l-0000Zy-Df
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 11:42:21 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o3E9cXaN000844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 14 Apr 2010 11:38:33 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1O1z3I-0001eT-R6; Wed, 14 Apr 2010 11:38:32 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Apr 2010 11:38:22 +0200
Message-Id: <1271237902-6295-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] dbus: use $(LIBTOOL) to install 'dbus-daemon'
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
X-List-Received-Date: Wed, 14 Apr 2010 09:43:11 -0000

Depending on autotools/libtool version and configure flags, dbus-daemon
will be built sometimes below .libs/ and sometimes in base directory.

Using 'libtool --mode=install' is a portable way to deal with this.

Changing Makefile.am to use native automake methods to install this
files would be a better but more invasive fix.
---
 recipes/dbus/dbus-1.2.24/fix-install-daemon.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/dbus/dbus-1.2.24/fix-install-daemon.patch b/recipes/dbus/dbus-1.2.24/fix-install-daemon.patch
index c317863..5e25d12 100644
--- a/recipes/dbus/dbus-1.2.24/fix-install-daemon.patch
+++ b/recipes/dbus/dbus-1.2.24/fix-install-daemon.patch
@@ -7,7 +7,7 @@ Index: dbus-0.94/bus/Makefile.am
  		chmod 755 $(DESTDIR)$(DBUS_DAEMONDIR); \
  	fi
 -	$(INSTALL_PROGRAM) dbus-daemon $(DESTDIR)$(DBUS_DAEMONDIR)
-+	$(INSTALL_PROGRAM) .libs/dbus-daemon $(DESTDIR)$(DBUS_DAEMONDIR)
++	$(LIBTOOL) --mode=install $(INSTALL_PROGRAM) dbus-daemon $(DESTDIR)$(DBUS_DAEMONDIR)
  	$(mkinstalldirs) $(DESTDIR)$(localstatedir)/run/dbus
  	$(mkinstalldirs) $(DESTDIR)$(configdir)/system.d
  	$(mkinstalldirs) $(DESTDIR)$(datadir)/dbus-1/services
-- 
1.7.0.1



