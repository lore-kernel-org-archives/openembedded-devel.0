Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1O1zkC-0001Fi-4O
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 12:22:52 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o3EAJMNl014012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 14 Apr 2010 12:19:22 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1O1zgo-0002BG-HX; Wed, 14 Apr 2010 12:19:22 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Apr 2010 12:19:21 +0200
Message-Id: <1271240361-8354-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] autotools.bbclass: swapped calls of intltoolize + autoreconf
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
X-List-Received-Date: Wed, 14 Apr 2010 10:22:52 -0000

Because 'intltoolize' checks whether aclocal.m4 contains a recent copy
of 'intltool.m4' and it will fail when the found version is too old,
'aclocal' must be called before 'intltoolize'.

I built projects it with intltool-0.40.6-r3, autoconf-2.65-r9,
automake-1.11.1-r3 and gettext-0.17-r6 successfully with this change but
it will require probably tests with older versions.

This patch is a requirement for
http://patchwork.openembedded.org/patch/1858/ because 'autopoint' from
the 'aclocal' call will override 'intltool' files and build will fail
then.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 classes/autotools.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 31d3578..d47630e 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -129,12 +129,12 @@ autotools_do_configure() {
 			  fi
 			fi
 			mkdir -p m4
+			oenote Executing autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
+			autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
 			if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
 			  oenote Executing intltoolize --copy --force --automake
 			  intltoolize --copy --force --automake
 			fi
-			oenote Executing autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
-			autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
 			cd $olddir
 		fi
 	;;
-- 
1.7.0.1



