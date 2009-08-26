Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <edoiron@edoiron.ott.cti.com>) id 1MgKfc-0003Hf-Of
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 17:44:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 3969654DB26;
	Wed, 26 Aug 2009 11:26:23 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24051-01; Wed, 26 Aug 2009 11:26:23 -0400 (EDT)
Received: from edoiron.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPS id 156C354DAAC;
	Wed, 26 Aug 2009 11:26:23 -0400 (EDT)
Received: by edoiron.ott.cti.com (Postfix, from userid 1000)
	id 5B7737CE208; Wed, 26 Aug 2009 11:25:06 -0400 (EDT)
From: Evan Doiron <edoiron@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2009 11:25:06 -0400
Message-Id: <1251300306-28850-1-git-send-email-edoiron@cbnco.com>
X-Mailer: git-send-email 1.6.0.2
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] add sscep: v0.0.2008.1211
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
X-List-Received-Date: Wed, 26 Aug 2009 15:44:24 -0000

Signed-off-by: Evan Doiron <edoiron@cbnco.com>
---
 conf/checksums.ini                    |    4 ++
 recipes/sscep/files/ca_segfault.patch |   10 +++++
 recipes/sscep/files/httphost.patch    |   66 +++++++++++++++++++++++++++++++++
 recipes/sscep/files/memleak.patch     |   25 ++++++++++++
 recipes/sscep/sscep_0.0.20081211.bb   |   23 +++++++++++
 5 files changed, 128 insertions(+), 0 deletions(-)
 create mode 100644 recipes/sscep/files/ca_segfault.patch
 create mode 100644 recipes/sscep/files/httphost.patch
 create mode 100644 recipes/sscep/files/memleak.patch
 create mode 100644 recipes/sscep/sscep_0.0.20081211.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 7718e1c..2d9e843 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -22874,6 +22874,10 @@ sha256=dcb0c10965430862721b675e2f9f6a30819880e03124b5e9403bfce2c7f3b69a
 md5=4809dcf89e504d4039ed01c9f61c68d5
 sha256=3da4fccc40c7c8ad51dba5bc7ac29a3a53905d5f2de0761353214d7e359d4bfd
 
+[http://www.klake.org/~jt/sscep/sscep.tgz]
+md5=89ba368c8455c324d208e5f5965f8f8f
+sha256=e622c344f72c6d95e15db834efbf777392778b2854e58a5d8f5d20b668cf2a9b
+
 [http://downloads.sourceforge.net/fuse/sshfs-fuse-1.3.tar.gz]
 md5=40fe4a353d03b80f8b37e4b0cc6159d3
 sha256=f80f713105fc0747197b6e5d2440cd77205cb1febe25b7b4fe08809ab67ace26
diff --git a/recipes/sscep/files/ca_segfault.patch b/recipes/sscep/files/ca_segfault.patch
new file mode 100644
index 0000000..1a438b9
--- /dev/null
+++ b/recipes/sscep/files/ca_segfault.patch
@@ -0,0 +1,10 @@
+--- a/sscep.c	2009-07-10 11:43:14.000000000 -0400
++++ b/sscep.c	2009-07-10 10:53:37.000000000 -0400
+@@ -469,6 +469,7 @@
+ 				pname, c_char);
+ 			(void)fclose(fp);
+ 			pkistatus = SCEP_PKISTATUS_SUCCESS;
++			scep_t.pki_status = SCEP_PKISTATUS_SUCCESS;
+ 			break;
+ 
+ 		case SCEP_OPERATION_GETCERT:
diff --git a/recipes/sscep/files/httphost.patch b/recipes/sscep/files/httphost.patch
new file mode 100644
index 0000000..313df16
--- /dev/null
+++ b/recipes/sscep/files/httphost.patch
@@ -0,0 +1,66 @@
+commit cb3827e31b14e4830bdfd309c12f5510e0402d8d
+Author: michael <michael@ea9f5d8b-f83d-0410-bf23-ec2180cbb196>
+Date:   Mon Jun 25 21:52:51 2007 +0000
+
+    20040325.1: add HTTP Host: header to work behind Hughes satellite autoproxy
+    
+    
+    git-svn-id: file:///usr/local/httpd/SourceForge/home/users/michael/svn/svnrepos/os/packages/sscep/trunk@37 ea9f5d8b-f83d-0410-bf23-ec2180cbb196
+
+diff --git a/sscep.c b/sscep.c
+index 6ec2a4d..6eefdc9 100644
+--- a/sscep.c
++++ b/sscep.c
+@@ -16,6 +16,7 @@ main(int argc, char **argv) {
+ 	int			c, host_port = 80, count = 1;
+ 	char			*host_name, *p, *dir_name = NULL;
+ 	char			http_string[16384];
++	char			http_host[256];
+ 	struct http_reply	reply;
+ 	unsigned int		n;
+ 	unsigned char		md[EVP_MAX_MD_SIZE];
+@@ -250,6 +251,9 @@ main(int argc, char **argv) {
+ 	if (p_flag) {
+ 		host_name = strdup(p_char);
+ 		dir_name = url_char;
++
++		/* I won't bother with the Host: header for proxy mode. */
++		http_host[0] = '\0';
+ 	}
+ 
+ 	/* Break down the URL */
+@@ -289,6 +293,12 @@ main(int argc, char **argv) {
+ 				host_port);
+ 		exit (SCEP_PKISTATUS_ERROR);
+ 	}
++	if (!p_flag) {
++		if (snprintf(http_host, sizeof(http_host), "Host: %s:%d\r\n",
++			     host_name, host_port) >= sizeof(http_host)) {
++			http_host[0] = '\0';
++		}
++	}
+ 	if (v_flag) {
+ 		fprintf(stdout, "%s: hostname: %s\n", pname, host_name);
+ 		fprintf(stdout, "%s: directory: %s\n", pname, dir_name);
+@@ -349,8 +359,8 @@ main(int argc, char **argv) {
+ 			/* Forge the HTTP message */
+ 			snprintf(http_string, sizeof(http_string),
+ 			 "GET %s%s?operation=GetCACert&message=%s "
+-			 "HTTP/1.0\r\n\r\n", p_flag ? "" : "/", dir_name,
+-					i_char); 
++			 "HTTP/1.0\r\n%s\r\n", p_flag ? "" : "/",
++					dir_name, i_char, http_host);
+ 			printf("%s: requesting CA certificate\n", pname);
+ 			if (d_flag)
+ 				fprintf(stdout, "%s: scep msg: %s", pname,
+@@ -549,8 +559,8 @@ not_enroll:
+ 			snprintf(http_string, sizeof(http_string),
+ 				"GET %s%s?operation="
+ 				"PKIOperation&message="
+-				"%s HTTP/1.0\r\n\r\n",
+-				p_flag ? "" : "/", dir_name, p);
++				"%s HTTP/1.0\r\n%s\r\n",
++				p_flag ? "" : "/", dir_name, p, http_host);
+ 
+ 			free(p);
+ 			p = NULL;
diff --git a/recipes/sscep/files/memleak.patch b/recipes/sscep/files/memleak.patch
new file mode 100644
index 0000000..59256a4
--- /dev/null
+++ b/recipes/sscep/files/memleak.patch
@@ -0,0 +1,25 @@
+commit ec9b27537400def0bee1ebbbdd69f2cf5486a99a
+Author: michael <michael@ea9f5d8b-f83d-0410-bf23-ec2180cbb196>
+Date:   Mon May 9 16:10:54 2005 +0000
+
+    Maybe fix a memory leak
+    
+    
+    git-svn-id: file:///usr/local/httpd/SourceForge/home/users/michael/svn/svnrepos/os/packages/sscep/trunk@15 ea9f5d8b-f83d-0410-bf23-ec2180cbb196
+
+diff --git a/sscep.c b/sscep.c
+index 637f1f0..b8f3289 100644
+--- a/sscep.c
++++ b/sscep.c
+@@ -539,7 +539,10 @@ not_enroll:
+ 				"GET %s%s?operation="
+ 				"PKIOperation&message="
+ 				"%s HTTP/1.0\r\n\r\n",
+-				p_flag ? "" : "/", dir_name, p); 
++				p_flag ? "" : "/", dir_name, p);
++
++			free(p);
++			p = NULL;
+ 
+ 			if (d_flag)
+ 				fprintf(stdout, "%s: scep msg: %s",
diff --git a/recipes/sscep/sscep_0.0.20081211.bb b/recipes/sscep/sscep_0.0.20081211.bb
new file mode 100644
index 0000000..3f072d4
--- /dev/null
+++ b/recipes/sscep/sscep_0.0.20081211.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Simple SCEP Client for Unix"
+SECTION = "base"
+PRIORITY = "required"
+LICENSE = "BSD"
+PR = "r2"
+
+SRC_URI = " \
+	http://www.klake.org/~jt/sscep/sscep.tgz \
+	file://memleak.patch;patch=1 \
+	file://httphost.patch;patch=1 \
+	file://ca_segfault.patch;patch=1 \
+"
+
+S = "${WORKDIR}/${PN}"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 sscep ${D}${bindir}/sscep
+}
-- 
1.6.0.2



