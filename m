Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1NprcO-0004Wf-Ix
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 00:16:49 +0100
Received: from [192.168.1.12] (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 89555301C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 18:13:34 -0500 (EST)
Message-ID: <4B99791E.1020102@zenlinux.com>
Date: Thu, 11 Mar 2010 15:13:34 -0800
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.8) Gecko/20100227 Lightning/1.0b1 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 89555301C0.6DF73
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH/RFC] zlib: convert to BBCLASSEXTEND
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
X-List-Received-Date: Thu, 11 Mar 2010 23:16:50 -0000
X-Groupsio-MsgNum: 17529
Content-Type: multipart/mixed; boundary="------------020907000602090603080001"

--------------020907000602090603080001
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Attached is my first OE patch submission, to convert the zlib recipe to 
use BBCLASSEXTEND and cleanup the do_stage() task.

I would like to start making regular contributions to OE, and am 
starting with the basics. Any guidance from the more experienced folks 
is gratefully accepted.

Scott

-- 
Scott Garman
sgarman at zenlinux dot com

--------------020907000602090603080001
Content-Type: text/x-patch;
 name="zlib_bbclassextend.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="zlib_bbclassextend.patch"

commit 803f864960dcf58abc03003b2e3e62f2f26230f3
Author: Scott Garman <sgarman@zenlinux.com>
Date:   Thu Mar 11 15:01:59 2010 -0800

    Convert zlib recipe to use BBCLASSEXTEND and remove do_stage task.

diff --git a/recipes/zlib/zlib-native_1.2.3.bb b/recipes/zlib/zlib-native_1.2.3.bb
deleted file mode 100644
index d7e0777..0000000
--- a/recipes/zlib/zlib-native_1.2.3.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require zlib_${PV}.bb
-ZLIB_EXTRA = ""
-DEPENDS = "libtool-native"
-
-inherit native
diff --git a/recipes/zlib/zlib-sdk_1.2.3.bb b/recipes/zlib/zlib-sdk_1.2.3.bb
deleted file mode 100644
index 4863395..0000000
--- a/recipes/zlib/zlib-sdk_1.2.3.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require zlib_${PV}.bb
-LIB_EXTRA = ""
-
-inherit sdk
diff --git a/recipes/zlib/zlib_1.2.3.bb b/recipes/zlib/zlib_1.2.3.bb
index d995869..db4b16b 100644
--- a/recipes/zlib/zlib_1.2.3.bb
+++ b/recipes/zlib/zlib_1.2.3.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 PRIORITY = "required"
 HOMEPAGE = "http://www.gzip.org/zlib/"
 LICENSE = "zlib"
-PR ="r5"
+PR ="r6"
 
 SRC_URI = "http://www.zlib.net/zlib-1.2.3.tar.bz2 \
 		file://visibility.patch;patch=1 \
@@ -15,6 +15,4 @@ DEPENDS = "libtool-cross"
 
 inherit autotools
 
-do_stage() {
-	autotools_stage_all
-}
+BBCLASSEXTEND = "native sdk"

--------------020907000602090603080001--
