Received: from mail-gw0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <myopiate@gmail.com>) id 1PvJUX-0003C1-7F
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 02:07:37 +0100
Received: by gwaa20 with SMTP id a20so902066gwa.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2011 17:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=AeASb9Yq7b+KXbhx05B/oyFnfTAQx+QovcLwi7G6Lqk=;
	b=m7Gy0nGGhOun+D6+nwvvzWMDw013a+ld3Img2J3WtIOIm42n0iAzB1TlRt+eJpfrkZ
	XZ6iBHRyQu0qU2oTOOYqDRIAzt63tPYwJZRD+MilNwKZJ1VcbN4KeglSjNEDrJmIzA+3
	weEQDTaALX2FjG8nu1bt1psrYR5JJ6c3Rpa58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=S+mMTR0wtlfVL60CqX68GZIutcHhEmBrHWM9qsMfvXX1mfyaohFN3q4Qr/6B2zZ6Zq
	4PBFaKEpS1R+9zjUXTJ0Wsi2pQskQCD8cKbIq4xufanLjbTzDNO/bHUWuDiaYmWsCv/U
	VWlS8dHLe0pACGQKs6dW1smLANS5/Aseknav4=
Received: by 10.151.106.7 with SMTP id i7mr251695ybm.193.1299200767829;
	Thu, 03 Mar 2011 17:06:07 -0800 (PST)
Received: from localhost.localdomain
	(CPE-121-215-173-108.lns6.way.bigpond.net.au [121.215.173.108])
	by mx.google.com with ESMTPS id u4sm315875ybe.9.2011.03.03.17.06.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 17:06:06 -0800 (PST)
From: Roderick Taylor <myopiate@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Mar 2011 11:34:53 +1030
Message-Id: <1299200693-2983-1-git-send-email-myopiate@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] system-tools-backends: don't use build machine's automake-1.7
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
X-List-Received-Date: Fri, 04 Mar 2011 01:07:37 -0000

* package patch to pretend that automake is missing.

Signed-off-by: Roderick Taylor <myopiate@gmail.com>
---
 .../dont-automake.patch                            |   21 ++++++++++++++++++++
 recipes/gnome/system-tools-backends_2.10.1.bb      |    1 +
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gnome/system-tools-backends-2.10.1/dont-automake.patch

diff --git a/recipes/gnome/system-tools-backends-2.10.1/dont-automake.patch b/recipes/gnome/system-tools-backends-2.10.1/dont-automake.patch
new file mode 100644
index 0000000..a9cea79
--- /dev/null
+++ b/recipes/gnome/system-tools-backends-2.10.1/dont-automake.patch
@@ -0,0 +1,21 @@
+Index: system-tools-backends-2.10.1/missing
+===================================================================
+--- system-tools-backends-2.10.1.orig/missing
++++ system-tools-backends-2.10.1/missing
+@@ -140,16 +140,6 @@ WARNING: \`$1' is missing on your system
+     ;;
+ 
+   automake*)
+-    if test -z "$run" && ($1 --version) > /dev/null 2>&1; then
+-       # We have it, but it failed.
+-       exit 1
+-    fi
+-
+-    echo 1>&2 "\
+-WARNING: \`$1' is missing on your system.  You should only need it if
+-         you modified \`Makefile.am', \`acinclude.m4' or \`${configure_ac}'.
+-         You might want to install the \`Automake' and \`Perl' packages.
+-         Grab them from any GNU archive site."
+     find . -type f -name Makefile.am -print |
+ 	   sed 's/\.am$/.in/' |
+ 	   while read f; do touch "$f"; done
diff --git a/recipes/gnome/system-tools-backends_2.10.1.bb b/recipes/gnome/system-tools-backends_2.10.1.bb
index 75dfda9..bac0a9c 100644
--- a/recipes/gnome/system-tools-backends_2.10.1.bb
+++ b/recipes/gnome/system-tools-backends_2.10.1.bb
@@ -16,6 +16,7 @@ SRC_URI[archive.sha256sum] = "0c1cfdf5f0550c0ccacbbc4f00ed059ab9ea483d48138132db
 
 SRC_URI += " \
             file://system-tools-backends \
+	    file://dont-automake.patch \
            "
 
 SRC_URI_append_angstrom = " \
-- 
1.7.3.4



