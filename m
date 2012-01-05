Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pjohn@mvista.com>) id 1Rimws-0001Kb-2N
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 14:01:39 +0100
Received: by iakh37 with SMTP id h37so894510iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 04:54:15 -0800 (PST)
Received: by 10.42.148.1 with SMTP id p1mr1907198icv.27.1325768054670;
	Thu, 05 Jan 2012 04:54:14 -0800 (PST)
Received: from [10.82.0.127] ([115.115.74.130])
	by mx.google.com with ESMTPS id gf6sm123403383igb.1.2012.01.05.04.54.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 04:54:13 -0800 (PST)
From: philby john <pjohn@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 05 Jan 2012 18:23:04 +0530
Message-ID: <1325767984.22038.4.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-1.fc14) 
Cc: koen@openembedded.org, mwester@dls.net, hrw@openembedded.org
Subject: [PATCH] Fix typo in ctcs that causes build failure
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
X-List-Received-Date: Thu, 05 Jan 2012 13:01:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Philby John <pjohn@mvista.com>
Date: Thu, 5 Jan 2012 18:01:11 +0530
Subject: [PATCH] Fix typo in ctcs that causes build failure

RDEPENDS includes a line perl-module-tcntl, which is
clearly a typo for perl-module-fcntl, without which
you get a build failure.

Signed-off-by: Philby John <pjohn@mvista.com>
---
 recipes/ctorrent/ctcs_1.4.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/ctorrent/ctcs_1.4.1.bb b/recipes/ctorrent/ctcs_1.4.1.bb
index afaee6f..8680b0c 100644
--- a/recipes/ctorrent/ctcs_1.4.1.bb
+++ b/recipes/ctorrent/ctcs_1.4.1.bb
@@ -1,10 +1,11 @@
 require ctorrent.inc
 
 DESCRIPTION += "This is the controller of the enhanced version"
-RDEPENDS_${PN} = "perl perl-module-strict perl-module-socket perl-module-tcntl \
+RDEPENDS_${PN} = "perl perl-module-strict perl-module-socket perl-module-fcntl \
             perl-module-errno perl-module-sys-hostname"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/dtorrent/ctcs-${PV}.tar.gz"
+PR="r1"
 
 do_install () {
   install -d ${D}/usr/bin
-- 
1.6.3.3.338.ge89ce






