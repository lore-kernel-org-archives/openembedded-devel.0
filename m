Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <root@zlo.nu>)
	id 1NALVm-0002Ze-7d for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 11:42:17 +0100
Received: by mzh.zlo.nu (Postfix, from userid 0)
	id 6DD8014068; Tue, 17 Nov 2009 11:34:42 +0100 (CET)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Nov 2009 11:13:54 +0100
In-Reply-To: <200908171521.07317.holger+oe@freyther.de>
References: <20090812095518.GA21131@zlo.nu>
	<200908171521.07317.holger+oe@freyther.de>
Message-Id: <20091117103442.6DD8014068@mzh.zlo.nu>
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: root@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] curl: Fix CVE-2009-2417.
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
X-List-Received-Date: Tue, 17 Nov 2009 10:42:17 -0000

For some reason, my patch never landed and 7.19.6 was added in the mean time,
which fixed this problem, but we still need the patches for previous versions.

The 7.18.1 patch applies cleanly on 7.18.2.

See http://curl.haxx.se/docs/adv_20090812.html for more information.
---
 recipes/curl/curl-native_7.18.2.bb                 |    4 +-
 recipes/curl/curl-sdk_7.18.2.bb                    |    4 +-
 recipes/curl/curl_7.18.2.bb                        |    4 +-
 recipes/curl/curl_7.19.5.bb                        |    6 +-
 recipes/curl/files/curl-7.18.1-CVE-2009-2417.patch |   83 ++++++++++++++++++++
 recipes/curl/files/curl-7.19.5-CVE-2009-2417.patch |   80 +++++++++++++++++++
 6 files changed, 176 insertions(+), 5 deletions(-)
 create mode 100644 recipes/curl/files/curl-7.18.1-CVE-2009-2417.patch
 create mode 100644 recipes/curl/files/curl-7.19.5-CVE-2009-2417.patch

diff --git a/recipes/curl/curl-native_7.18.2.bb b/recipes/curl/curl-native_7.18.2.bb
index 1eef23b..e2e3a48 100644
--- a/recipes/curl/curl-native_7.18.2.bb
+++ b/recipes/curl/curl-native_7.18.2.bb
@@ -1,4 +1,6 @@
 require curl-common.inc
 inherit native
 DEPENDS = "zlib-native"
-PR = "${INC_PR}.1"
+SRC_URI += "file://curl-7.18.1-CVE-2009-2417.patch;patch=1;pnum=0"
+
+PR = "${INC_PR}.2"
diff --git a/recipes/curl/curl-sdk_7.18.2.bb b/recipes/curl/curl-sdk_7.18.2.bb
index f1fd34f..e26c532 100644
--- a/recipes/curl/curl-sdk_7.18.2.bb
+++ b/recipes/curl/curl-sdk_7.18.2.bb
@@ -1,4 +1,6 @@
 require curl-common.inc
 inherit sdk
 DEPENDS = "zlib-sdk"
-PR = "${INC_PR}.1"
+SRC_URI += "file://curl-7.18.1-CVE-2009-2417.patch;patch=1;pnum=0"
+
+PR = "${INC_PR}.2"
diff --git a/recipes/curl/curl_7.18.2.bb b/recipes/curl/curl_7.18.2.bb
index 84c0d07..21eaedc 100644
--- a/recipes/curl/curl_7.18.2.bb
+++ b/recipes/curl/curl_7.18.2.bb
@@ -1,4 +1,6 @@
 require curl-common.inc
 require curl-target.inc
 
-PR = "${INC_PR}.1"
+SRC_URI += "file://curl-7.18.1-CVE-2009-2417.patch;patch=1;pnum=0"
+
+PR = "${INC_PR}.2"
diff --git a/recipes/curl/curl_7.19.5.bb b/recipes/curl/curl_7.19.5.bb
index d0577b0..e447610 100644
--- a/recipes/curl/curl_7.19.5.bb
+++ b/recipes/curl/curl_7.19.5.bb
@@ -2,5 +2,7 @@ require curl-common.inc
 require curl-target.inc
 
 SRC_URI += "file://off_t_abi_fix.patch;patch=1;pnum=0 \
-            file://curl-add_all_algorithms.patch;patch=1"
-PR = "${INC_PR}.1"
+            file://curl-add_all_algorithms.patch;patch=1 \
+            file://curl-7.19.5-CVE-2009-2417.patch;patch=1;pnum=0"
+
+PR = "${INC_PR}.2"
diff --git a/recipes/curl/files/curl-7.18.1-CVE-2009-2417.patch b/recipes/curl/files/curl-7.18.1-CVE-2009-2417.patch
new file mode 100644
index 0000000..e7c24c0
--- /dev/null
+++ b/recipes/curl/files/curl-7.18.1-CVE-2009-2417.patch
@@ -0,0 +1,83 @@
+---
+ lib/ssluse.c |   40 +++++++++++++++++++++++++++-------------
+ 1 file changed, 27 insertions(+), 13 deletions(-)
+
+--- lib/ssluse.c.orig
++++ lib/ssluse.c
+@@ -1061,7 +1061,7 @@ static CURLcode verifyhost(struct connec
+       if(check->type == target) {
+         /* get data and length */
+         const char *altptr = (char *)ASN1_STRING_data(check->d.ia5);
+-        int altlen;
++        size_t altlen = (size_t) ASN1_STRING_length(check->d.ia5);
+ 
+         switch(target) {
+         case GEN_DNS: /* name/pattern comparison */
+@@ -1075,14 +1075,16 @@ static CURLcode verifyhost(struct connec
+              "I checked the 0.9.6 and 0.9.8 sources before my patch and
+              it always 0-terminates an IA5String."
+           */
+-          if(cert_hostcheck(altptr, conn->host.name))
++          if((altlen == strlen(altptr)) &&
++             /* if this isn't true, there was an embedded zero in the name
++                string and we cannot match it. */
++             cert_hostcheck(altptr, conn->host.name))
+             matched = TRUE;
+           break;
+ 
+         case GEN_IPADD: /* IP address comparison */
+           /* compare alternative IP address if the data chunk is the same size
+              our server IP address is */
+-          altlen = ASN1_STRING_length(check->d.ia5);
+           if((altlen == addrlen) && !memcmp(altptr, &addr, altlen))
+             matched = TRUE;
+           break;
+@@ -1122,18 +1124,27 @@ static CURLcode verifyhost(struct connec
+          string manually to avoid the problem. This code can be made
+          conditional in the future when OpenSSL has been fixed. Work-around
+          brought by Alexis S. L. Carvalho. */
+-      if(tmp && ASN1_STRING_type(tmp) == V_ASN1_UTF8STRING) {
+-        j = ASN1_STRING_length(tmp);
+-        if(j >= 0) {
+-          peer_CN = OPENSSL_malloc(j+1);
+-          if(peer_CN) {
+-            memcpy(peer_CN, ASN1_STRING_data(tmp), j);
+-            peer_CN[j] = '\0';
++      if(tmp) {
++        if(ASN1_STRING_type(tmp) == V_ASN1_UTF8STRING) {
++          j = ASN1_STRING_length(tmp);
++          if(j >= 0) {
++            peer_CN = OPENSSL_malloc(j+1);
++            if(peer_CN) {
++              memcpy(peer_CN, ASN1_STRING_data(tmp), j);
++              peer_CN[j] = '\0';
++            }
+           }
+         }
++        else /* not a UTF8 name */
++          j = ASN1_STRING_to_UTF8(&peer_CN, tmp);
++
++        if(peer_CN && ((int)strlen((char *)peer_CN) != j)) {
++          /* there was a terminating zero before the end of string, this
++             cannot match and we return failure! */
++          failf(data, "SSL: illegal cert name field");
++          res = CURLE_PEER_FAILED_VERIFICATION;
++        }
+       }
+-      else /* not a UTF8 name */
+-        j = ASN1_STRING_to_UTF8(&peer_CN, tmp);
+     }
+ 
+     if(peer_CN == nulstr)
+@@ -1151,7 +1162,10 @@ static CURLcode verifyhost(struct connec
+     }
+ #endif /* CURL_DOES_CONVERSIONS */
+ 
+-    if(!peer_CN) {
++    if(res)
++      /* error already detected, pass through */
++      ;
++    else if(!peer_CN) {
+       failf(data,
+             "SSL: unable to obtain common name from peer certificate");
+       return CURLE_PEER_FAILED_VERIFICATION;
diff --git a/recipes/curl/files/curl-7.19.5-CVE-2009-2417.patch b/recipes/curl/files/curl-7.19.5-CVE-2009-2417.patch
new file mode 100644
index 0000000..f64232c
--- /dev/null
+++ b/recipes/curl/files/curl-7.19.5-CVE-2009-2417.patch
@@ -0,0 +1,80 @@
+--- lib/ssluse.c-7.19.5	2009-08-03 16:01:58.000000000 +0200
++++ lib/ssluse.c	2009-08-03 16:07:17.000000000 +0200
+@@ -1092,7 +1092,8 @@
+       if(check->type == target) {
+         /* get data and length */
+         const char *altptr = (char *)ASN1_STRING_data(check->d.ia5);
+-        size_t altlen;
++        size_t altlen = (size_t) ASN1_STRING_length(check->d.ia5);
++
+ 
+         switch(target) {
+         case GEN_DNS: /* name/pattern comparison */
+@@ -1106,14 +1107,16 @@
+              "I checked the 0.9.6 and 0.9.8 sources before my patch and
+              it always 0-terminates an IA5String."
+           */
+-          if(cert_hostcheck(altptr, conn->host.name))
++          if((altlen == strlen(altptr)) &&
++             /* if this isn't true, there was an embedded zero in the name
++                string and we cannot match it. */
++             cert_hostcheck(altptr, conn->host.name))
+             matched = TRUE;
+           break;
+ 
+         case GEN_IPADD: /* IP address comparison */
+           /* compare alternative IP address if the data chunk is the same size
+              our server IP address is */
+-          altlen = (size_t) ASN1_STRING_length(check->d.ia5);
+           if((altlen == addrlen) && !memcmp(altptr, &addr, altlen))
+             matched = TRUE;
+           break;
+@@ -1153,18 +1156,27 @@
+          string manually to avoid the problem. This code can be made
+          conditional in the future when OpenSSL has been fixed. Work-around
+          brought by Alexis S. L. Carvalho. */
+-      if(tmp && ASN1_STRING_type(tmp) == V_ASN1_UTF8STRING) {
+-        j = ASN1_STRING_length(tmp);
+-        if(j >= 0) {
+-          peer_CN = OPENSSL_malloc(j+1);
+-          if(peer_CN) {
+-            memcpy(peer_CN, ASN1_STRING_data(tmp), j);
+-            peer_CN[j] = '\0';
++      if(tmp) {
++        if(ASN1_STRING_type(tmp) == V_ASN1_UTF8STRING) {
++          j = ASN1_STRING_length(tmp);
++          if(j >= 0) {
++            peer_CN = OPENSSL_malloc(j+1);
++            if(peer_CN) {
++              memcpy(peer_CN, ASN1_STRING_data(tmp), j);
++              peer_CN[j] = '\0';
++            }
+           }
+         }
++        else /* not a UTF8 name */
++          j = ASN1_STRING_to_UTF8(&peer_CN, tmp);
++
++        if(peer_CN && ((int)strlen((char *)peer_CN) != j)) {
++          /* there was a terminating zero before the end of string, this
++             cannot match and we return failure! */
++          failf(data, "SSL: illegal cert name field");
++          res = CURLE_PEER_FAILED_VERIFICATION;
++        }
+       }
+-      else /* not a UTF8 name */
+-        j = ASN1_STRING_to_UTF8(&peer_CN, tmp);
+     }
+ 
+     if(peer_CN == nulstr)
+@@ -1182,7 +1194,10 @@
+     }
+ #endif /* CURL_DOES_CONVERSIONS */
+ 
+-    if(!peer_CN) {
++    if(res)
++      /* error already detected, pass through */
++      ;
++    else if(!peer_CN) {
+       failf(data,
+             "SSL: unable to obtain common name from peer certificate");
+       return CURLE_PEER_FAILED_VERIFICATION;
-- 
1.6.3.1



