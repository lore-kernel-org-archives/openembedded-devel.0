Received: from [67.222.38.31] (helo=outbound-mail-141.bluehost.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <chow.ming@linuxbj.com>) id 1M5bjK-0006NW-Gi
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 10:28:23 +0200
Received: (qmail 4656 invoked by uid 0); 17 May 2009 08:21:14 -0000
Received: from unknown (HELO host285.hostmonster.com) (74.220.215.85)
	by outboundproxy5.bluehost.com with SMTP; 17 May 2009 08:21:14 -0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=default; d=linuxbj.com;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:X-Identified-User;
	b=U7InPFJSBmKnI2c0dxL32U6VEWwvvW7SYbbNGaaS1AqK9aIJgva0+Z+I6qskw46NCTjOv+PyKAN40EpJvvDDD1p2q+mvOIoQa+1bDUZzxZfRUqT7EL6wUm2t6eXvTr6S;
Received: from [125.33.187.228] (helo=[192.168.200.199])
	by host285.hostmonster.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <chow.ming@linuxbj.com>)
	id 1M5bcP-00032s-C2 for openembedded-devel@lists.openembedded.org;
	Sun, 17 May 2009 02:21:13 -0600
Message-ID: <4A0FC8F6.6080003@linuxbj.com>
Date: Sun, 17 May 2009 16:21:10 +0800
From: =?UTF-8?B?TWluZyBDaG93IOWRqOaYjg==?= <chow.ming@linuxbj.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Identified-User: {2055:host285.hostmonster.com:linuxbjc:linuxbj.com}
	{sentby:smtp auth 125.33.187.228 authed with
	chow.ming@linuxbj.com}
Subject: wvstreams fix
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
X-List-Received-Date: Sun, 17 May 2009 08:28:23 -0000
Content-Type: multipart/mixed; boundary="------------040101000501060300030500"

--------------040101000501060300030500
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

wvstreams compile failed with gcc-4.3.x.
here is my patch to fix it up.


--------------040101000501060300030500
Content-Type: text/x-patch;
 name="wvstreams.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="wvstreams.patch"

diff --git a/recipes/wvstreams/wvstreams-4.4.1/wvstreams-4.4.1-gcc-4.3-compile.patch b/recipes/wvstreams/wvstreams-4.4.1/wvstreams-4.4.1-gcc-4.3-compile.patch
new file mode 100644
index 0000000..fd6f951
--- /dev/null
+++ b/recipes/wvstreams/wvstreams-4.4.1/wvstreams-4.4.1-gcc-4.3-compile.patch
@@ -0,0 +1,23 @@
+diff -urN wvstreams-4.4.1-orig/include/uniconfkey.h wvstreams-4.4.1/include/uniconfkey.h
+--- wvstreams-4.4.1-orig/include/uniconfkey.h	2009-05-17 15:52:15.761594425 +0800
++++ wvstreams-4.4.1/include/uniconfkey.h	2009-05-17 15:51:49.290819209 +0800
+@@ -9,6 +9,7 @@
+ 
+ #include "wvstring.h"
+ #include "wvlinklist.h"
++#include <limits.h>
+ 
+ 
+ // The Python headers try to #define ANY as void.  If we're building Python
+diff -urN wvstreams-4.4.1-orig/include/wvserialize.h wvstreams-4.4.1/include/wvserialize.h
+--- wvstreams-4.4.1-orig/include/wvserialize.h	2009-05-17 15:52:21.970914867 +0800
++++ wvstreams-4.4.1/include/wvserialize.h	2009-05-17 15:51:49.300819143 +0800
+@@ -349,7 +349,7 @@
+  * except as the last character.
+  */
+ template <>
+-extern WvString _wv_deserialize<WvString>(WvBuf &buf);
++WvString _wv_deserialize<WvString>(WvBuf &buf);
+ 
+ 
+ /** Deserialize a WvBuf. */
diff --git a/recipes/wvstreams/wvstreams_4.4.1.bb b/recipes/wvstreams/wvstreams_4.4.1.bb
index 8cf1d1b..7dcc126 100644
--- a/recipes/wvstreams/wvstreams_4.4.1.bb
+++ b/recipes/wvstreams/wvstreams_4.4.1.bb
@@ -3,10 +3,11 @@ LICENSE = "LGPL"
 DESCRIPTION = "WvStreams is a network programming library in C++"
 DEPENDS = "zlib openssl (>= 0.9.8)"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
-           file://build-fixes-and-sanity.patch;patch=1 "
+           file://build-fixes-and-sanity.patch;patch=1 \
+           file://wvstreams-4.4.1-gcc-4.3-compile.patch;patch=1 "
 
 inherit autotools pkgconfig
 


--------------040101000501060300030500--
