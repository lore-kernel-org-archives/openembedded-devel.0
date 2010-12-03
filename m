Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1POJvu-0003L5-GC
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 01:55:32 +0100
Received: by pzk12 with SMTP id 12so1319056pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Dec 2010 16:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=P1zxp5nW9IZ/+g9xlQ2hUWopFs2OVzWV+ZB31yr1/Do=;
	b=pCedyii6145XdgoDIhqVWi0DZgG4RQRtAR5oNvmsyt8eIHOMj4MQLJH7Ls0R2dnVxC
	vzYrwBjG8cV1Ce5ZvIBpAumvvSWhVB/lsrGLCCQAqI8HMgbTuyvjFNa0SsEHsA4D8QXk
	ioghhXezc1REuYiO+zB1qsjt/ktQbz11ZMClM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=misb0DV+/Va/vYwU9EE31qv7ZpApMJ2y+TqxlHM+ptHZEjRpxiReEiNqbr5uTPNfE5
	3qcnDfEGlqVvqM+L6XmEUUreF9RhSm2oADWkBX1cP286hKP7hpS6rjxbb3dCnQzRFRaI
	OYIToHQK8hEIQ0dHleyOgmOPi+OYKLPMmGUOE=
Received: by 10.142.136.10 with SMTP id j10mr1236591wfd.36.1291337636802;
	Thu, 02 Dec 2010 16:53:56 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id w22sm1467385wfd.7.2010.12.02.16.53.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 02 Dec 2010 16:53:55 -0800 (PST)
Message-ID: <4CF83F9E.5080806@gmail.com>
Date: Fri, 03 Dec 2010 11:23:50 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] automake_1.11.1.bb: Don't try to execute perl.
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
X-List-Received-Date: Fri, 03 Dec 2010 00:55:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

checking for perl... (cached) /bin/perl
/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/automake-1.11.1-r3.1/automake-1.11.1/configure: line 2306: /bin/perl: No such file or directory
configure: error: perl 5.6 or better is required; perl 5.8.2 or better
is recommended.  If you have several perl versions
installed, select the one Automake should use using
  ./configure PERL=/path/to/perl

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../automake-dont-execute-perl.patch               |   19 +++++++++++++++++++
 recipes/automake/automake_1.11.1.bb                |    5 +++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 recipes/automake/automake-1.11.1/automake-dont-execute-perl.patch

diff --git a/recipes/automake/automake-1.11.1/automake-dont-execute-perl.patch b/recipes/automake/automake-1.11.1/automake-dont-execute-perl.patch
new file mode 100644
index 0000000..52f0441
--- /dev/null
+++ b/recipes/automake/automake-1.11.1/automake-dont-execute-perl.patch
@@ -0,0 +1,19 @@
+We don't patch configure.ac as aclocal.m4 has a dependency upon it, which
+breaks compilation.
+
+diff -ur automake-1.11.1.orig/configure automake-1.11.1/configure
+--- automake-1.11.1.orig/configure	2009-12-09 04:45:46.000000000 +1030
++++ automake-1.11.1/configure	2010-12-01 14:01:54.000000000 +1030
+@@ -2303,12 +2303,6 @@
+ if test -z "$PERL"; then
+    as_fn_error "perl not found" "$LINENO" 5
+ fi
+-$PERL -e 'require 5.006;' || {
+-   as_fn_error "perl 5.6 or better is required; perl 5.8.2 or better
+-is recommended.  If you have several perl versions
+-installed, select the one Automake should use using
+-  ./configure PERL=/path/to/perl" "$LINENO" 5
+-}
+ 
+ # We require ithreads support, and version 5.7.2 for CLONE.
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether $PERL supports ithreads" >&5
diff --git a/recipes/automake/automake_1.11.1.bb b/recipes/automake/automake_1.11.1.bb
index 0579875..2f4af3a 100644
--- a/recipes/automake/automake_1.11.1.bb
+++ b/recipes/automake/automake_1.11.1.bb
@@ -1,7 +1,8 @@
 require automake.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
-SRC_URI += "file://0001-py-compile-compile-only-optimized-byte-code.patch"
+SRC_URI += "file://0001-py-compile-compile-only-optimized-byte-code.patch \
+		file://automake-dont-execute-perl.patch"
 
 SRC_URI[automake.md5sum] = "c2972c4d9b3e29c03d5f2af86249876f"
 SRC_URI[automake.sha256sum] = "5b159d3c0e0a1f87de71b68bcb9f1a1c49e9e71749c9b723f17e2e1e0295c7ae"
-- 
1.7.1



