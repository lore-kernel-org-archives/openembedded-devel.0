Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LyRoa-0002aQ-1v
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 16:28:12 +0200
Received: (qmail 6922 invoked from network); 27 Apr 2009 14:23:08 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 27 Apr 2009 07:23:08 -0700
Date: Mon, 27 Apr 2009 07:23:08 -0700
From: Tom Rini <trini@embeddedalley.com>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090427142307.GJ18788@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<20090427142200.GI18788@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090427142200.GI18788@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [RFC][PATCH] Add distro inc files for eglibc, glibc and uclibc.
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
X-List-Received-Date: Mon, 27 Apr 2009 14:28:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

 Add distro inc files for eglibc, glibc and uclibc.
 This gives us the libc into OVERRIDES, of glibc for glibc/eglibc and uclibc
 for uclibc. We also ?= for libintl/libiconv and = set the rest of the virtuals.

---
 conf/distro/include/eglibc.inc |    9 +++++++++
 conf/distro/include/glibc.inc  |    9 +++++++++
 conf/distro/include/uclibc.inc |    9 +++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 conf/distro/include/eglibc.inc
 create mode 100644 conf/distro/include/glibc.inc
 create mode 100644 conf/distro/include/uclibc.inc

diff --git a/conf/distro/include/eglibc.inc b/conf/distro/include/eglibc.inc
new file mode 100644
index 0000000..ed3e0ec
--- /dev/null
+++ b/conf/distro/include/eglibc.inc
@@ -0,0 +1,9 @@
+# Add glibc overrides to the overrides for eglibc.
+OVERRIDES .= ":glibc"
+
+# The things eglibc can provide.  We default to wanting eglibc to provide them.
+PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
+PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
+PREFERRED_PROVIDER_virtual/libc = "eglibc"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "eglibc-initial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "eglibc"
diff --git a/conf/distro/include/glibc.inc b/conf/distro/include/glibc.inc
new file mode 100644
index 0000000..1d6b22d
--- /dev/null
+++ b/conf/distro/include/glibc.inc
@@ -0,0 +1,9 @@
+# Add glibc to the overrides.
+OVERRIDES .= ":glibc"
+
+# The things glibc can provide.  We default to wanting glibc to provide them.
+PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
+PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
+PREFERRED_PROVIDER_virtual/libc = "glibc"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "glibc-initial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
diff --git a/conf/distro/include/uclibc.inc b/conf/distro/include/uclibc.inc
new file mode 100644
index 0000000..bb2e2be
--- /dev/null
+++ b/conf/distro/include/uclibc.inc
@@ -0,0 +1,9 @@
+# Add uclibc overrides to the overrides.
+OVERRIDES .= ":uclibc"
+
+# The things uclibc can provide.  We default to wanting uclibc to provide them.
+PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
+PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
+PREFERRED_PROVIDER_virtual/libc = "uclibc"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "uclibc-initial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "uclibc"
-- 
1.6.2.1.469.gdffc

-- 
Tom Rini


