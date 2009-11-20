Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NBQZM-00045N-NC
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 11:18:27 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NBQXz-0004h2-BG for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 05:17:00 -0500
Date: Fri, 20 Nov 2009 05:16:50 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911200514430.18485@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Upgrade guile from 1.8.6 to 1.8.7.
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
X-List-Received-Date: Fri, 20 Nov 2009 10:18:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  bitbake tested on x86_64.

diff --git a/conf/checksums.ini b/conf/checksums.ini
index b2bc05b..5529b73 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -11426,6 +11426,10 @@ sha256=e2f63d2d445ffeb072638eab885b1a629e372d1db711c8afb26a62bc56096289
 md5=9e23d3dbea0e89bab8a9acc6880150de
 sha256=69a2f9491480ff756d1cc4c8ea2bdc13d40ea8ddc8f93f26957bade8219a1d86

+[http://ftp.gnu.org/pub/gnu/guile/guile-1.8.7.tar.gz]
+md5=991b5b3efcbbc3f7507d05bc42f80a5e
+sha256=bfee6339d91955a637e7f541d96f5b1d53271b42bb4a37b8867d186a6c66f0b3
+
 [http://gupnp.org/sources/gupnp/gupnp-0.12.2.tar.gz]
 md5=5350f5f28fb3742779702a496ab75d72
 sha256=9e4edb3ca6d11e397d9f98537fa8954851dc044d13ecafd4f4547117cefbdd28
diff --git a/recipes/guile/guile-native_1.8.7.bb b/recipes/guile/guile-native_1.8.7.bb
new file mode 100644
index 0000000..2f87c48
--- /dev/null
+++ b/recipes/guile/guile-native_1.8.7.bb
@@ -0,0 +1,5 @@
+require guile-native.inc
+SRC_URI = "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \
+           file://configure-fix.patch;patch=1 \
+           file://cpp-linemarkers.patch;patch=1 \
+          "
diff --git a/recipes/guile/guile_1.8.7.bb b/recipes/guile/guile_1.8.7.bb
new file mode 100644
index 0000000..6889f33
--- /dev/null
+++ b/recipes/guile/guile_1.8.7.bb
@@ -0,0 +1,6 @@
+require guile.inc
+
+SRC_URI = "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \
+           file://configure-fix.patch;patch=1 \
+          "
+

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


