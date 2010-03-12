Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1NpvbG-00034m-EE
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 04:31:51 +0100
Received: from [192.168.1.12] (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 6215F301DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 22:28:46 -0500 (EST)
Message-ID: <4B99B4EE.5020304@zenlinux.com>
Date: Thu, 11 Mar 2010 19:28:46 -0800
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.8) Gecko/20100227 Lightning/1.0b1 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B99791E.1020102@zenlinux.com>
	<19c1b8a91003111618u5db39b2ft1b614484f5814442@mail.gmail.com>
	<4B99B467.2090807@zenlinux.com>
In-Reply-To: <4B99B467.2090807@zenlinux.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 6215F301DD.99D8E
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
Subject: Re: [PATCH/RFC] zlib: convert to BBCLASSEXTEND
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
X-List-Received-Date: Fri, 12 Mar 2010 03:31:51 -0000
X-Groupsio-MsgNum: 17533
Content-Type: multipart/mixed; boundary="------------030203080608010804030409"

--------------030203080608010804030409
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/11/2010 07:26 PM, Scott Garman wrote:
> Gotcha, thanks for the feedback. Let's try this then. In the future I
> assume the format-patch email should be sent directly to the list and
> not as an attachment - correct me if I'm mistaken.

...and it would be helpful if I actually included the patch this time.

Scott

-- 
Scott Garman
sgarman at zenlinux dot com

--------------030203080608010804030409
Content-Type: text/x-patch;
 name="0001-zlib-convert-to-new-style-staging-and-BBCLASSEXTEND.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-zlib-convert-to-new-style-staging-and-BBCLASSEXTEND.pat";
 filename*1="ch"

From 322589252447f6bb4a96b79b5495001f6cb64f12 Mon Sep 17 00:00:00 2001
From: Scott Garman <sgarman@zenlinux.com>
Date: Thu, 11 Mar 2010 19:15:29 -0800
Subject: [PATCH] zlib: convert to new style staging and BBCLASSEXTEND

---
 recipes/zlib/zlib-native_1.2.3.bb |    5 -----
 recipes/zlib/zlib-sdk_1.2.3.bb    |    4 ----
 recipes/zlib/zlib_1.2.3.bb        |    6 ++----
 3 files changed, 2 insertions(+), 13 deletions(-)
 delete mode 100644 recipes/zlib/zlib-native_1.2.3.bb
 delete mode 100644 recipes/zlib/zlib-sdk_1.2.3.bb

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
-- 
1.6.3.3


--------------030203080608010804030409--
