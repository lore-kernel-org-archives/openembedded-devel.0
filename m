Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PL1rn-0000eH-3j
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 00:01:39 +0100
Received: by pzk34 with SMTP id 34so2344602pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 15:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=ue5GUCi8ezccYXNfHk4zUbMtgF19IctvI2c2l+NMbO0=;
	b=jmJYj0BwEa/+O9/vF9lECUmEO4AhAmXX288p8135y9l1n6Ib/bQEl4FB6j50i6k4ic
	ESZUABlevS9ZEPLCST5fIEUYv1J5QaqAfAaRikgLW9KKX/quRX6Z45WnNy/4rGpBU5RG
	ivTW3MJc8twr+fY7GRCVwvmp+m6yAli0Bfa90=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=H6ACcLj1CDyQo4slNnMUin6CSsEu4V2/5X0ARBIA94Ds9Wkz+1RTuau4j757IpQPIP
	erTu64i39xv/2Gc4zOeiQ0A4mf2JKGa9uPfgFKJjh6IwePXsvuKuMYI7dLin/YilrQLd
	KMdP3osi0pnUvU4E4s3dlhyDyF690egJ1LR4M=
Received: by 10.142.143.21 with SMTP id q21mr7526979wfd.182.1290553215296;
	Tue, 23 Nov 2010 15:00:15 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id v19sm8530758wfh.0.2010.11.23.15.00.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Nov 2010 15:00:13 -0800 (PST)
Message-ID: <4CEC4778.6070108@gmail.com>
Date: Wed, 24 Nov 2010 09:30:08 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gnutls_2.10.2.bb: Fix parallel build failure.
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
X-List-Received-Date: Tue, 23 Nov 2010 23:01:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


In file included from core.c:32:
enums.h:3:1: error: unterminated #ifndef
In file included from core.c:40:
enum-map.i.c:867:1: error: unterminated argument list invoking macro "SCM_SMOB_PRINT"
In file included from errors.c:28:
enums.h:3:1: error: unterminated #ifndef

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gnutls/gnutls-2.10.2/parallel-build.patch |   15 +++++++++++++++
 recipes/gnutls/gnutls_2.10.2.bb                   |    3 ++-
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gnutls/gnutls-2.10.2/parallel-build.patch

diff --git a/recipes/gnutls/gnutls-2.10.2/parallel-build.patch b/recipes/gnutls/gnutls-2.10.2/parallel-build.patch
new file mode 100644
index 0000000..d170c4f
--- /dev/null
+++ b/recipes/gnutls/gnutls-2.10.2/parallel-build.patch
@@ -0,0 +1,15 @@
+Upstream: http://git.savannah.gnu.org/gitweb/?p=gnutls.git;a=commit;h=23f761290ca6f905f062d2de217acb012e5a38b2
+
+diff --git a/guile/src/Makefile.am.orig b/guile/src/Makefile.am
+index e8e81b1..2ee1297 100644
+--- a/guile/src/Makefile.am.orig
++++ b/guile/src/Makefile.am
+@@ -122,7 +122,7 @@ extra-smob-types.i.c: $(srcdir)/make-smob-types.scm
+ snarfcppopts = $(DEFS) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) \
+ 	       $(CFLAGS) $(AM_CFLAGS) $(GUILE_CFLAGS)
+ 
+-.c.x:
++.c.x: $(BUILT_SOURCES)
+ 	$(guile_snarf) -o $@ $< $(snarfcppopts)
+ 
+ # Target used by doc/Makefile, to create all built sources necessary
diff --git a/recipes/gnutls/gnutls_2.10.2.bb b/recipes/gnutls/gnutls_2.10.2.bb
index 97a3c11..8af70ec 100644
--- a/recipes/gnutls/gnutls_2.10.2.bb
+++ b/recipes/gnutls/gnutls_2.10.2.bb
@@ -1,6 +1,6 @@
 require gnutls.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 LICENSE_${PN}-extra = "GPLv3"
 
@@ -9,6 +9,7 @@ EXTRA_OECONF += " --without-libgcrypt-prefix "
 SRC_URI += "file://gettextize-with-gettext-0.18.patch \
             file://gnutls-openssl.patch \
             file://gnutls-replace-siginterrupt.patch \
+            file://parallel-build.patch \
            "
 
 do_configure_prepend() {
-- 
1.7.1



