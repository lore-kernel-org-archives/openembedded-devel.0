Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B26EF71996
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Aug 2017 19:57:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v72JvuJx026192
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Aug 2017 12:57:57 -0700 (PDT)
Received: from [128.224.56.206] (128.224.56.206) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 2 Aug 2017 12:57:56 -0700
To: Koen Kooi <koen@dominion.thruhere.net>
References: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
	<olqm6a$87a$1@blaine.gmane.org>
	<4aaa2c14-284f-71b4-47d2-fc7e8e27beef@windriver.com>
	<BFE10A87-CF18-46BA-88E4-A795FB20506E@dominion.thruhere.net>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <f3b1d5bc-6d6f-4fdd-8076-5d856af4b8cf@windriver.com>
Date: Wed, 2 Aug 2017 15:57:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <BFE10A87-CF18-46BA-88E4-A795FB20506E@dominion.thruhere.net>
X-Originating-IP: [128.224.56.206]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] imagemagick: upgrade from 7.0.5 to 7.0.6p4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Aug 2017 19:57:57 -0000
X-Groupsio-MsgNum: 67943
Content-Type: multipart/mixed; boundary="------------2BFEDCB6B06807F487568B9B"
Content-Language: en-GB

--------------2BFEDCB6B06807F487568B9B
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017-08-02 01:21 PM, Koen Kooi wrote:
> Oops, I could’ve sworn I have submitted it to meta-oe :/ Thanks for looking into this!
> 
>> It's not working for me on qemux86 since python-wand
>> is looking for:
>>    libMagickWand-6.Q16HDRI and
>>    libMagickWand-7.Q16HDRI is the current version.
>> If I soft link to work-around that problem, there's another issue:
>>    ImportError: MagickWand shared library not found.
>>
>> python-wand hasn't released a version newer than 0.4.4.
>> I'm not really interested in trying the git repo.
> I’ll have a look at trying the git repo with your patch to update imagemagick and hopefully get it working well enough to get it into oe-core :)
> 

Err,
The meta-yocto version is actually still on 0.4.3.
I updated to 0.4.4 and that didn't help.

A simple patch to require imagemagick version 7 does
get me one more step to:

AttributeError: /usr/lib/libMagickWand-7.Q16HDRI.so.3: undefined symbol: 
MagickGetImageChannelDepth

At first I thought this was due to the imagemagick .so being
striped when packaged but it's a bunch of function renames from 6 to 7
based on git. I asked if that had be fixed on the wand irc channel
and it hasn't. Known misbehaving wand:
   https://github.com/dahlia/wand/issues/287

../Randy



 >>> from wand.image import Image
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib/python2.7/site-packages/wand/image.py", line 20, in 
<module>
     from .api import MagickPixelPacket, libc, libmagick, library
   File "/usr/lib/python2.7/site-packages/wand/api.py", line 1394, in 
<module>
     traceback.format_exc())
ImportError: MagickWand shared library not found or incompatible
Original exception was raised in:
Traceback (most recent call last):
   File "/usr/lib/python2.7/site-packages/wand/api.py", line 370, in 
<module>
     ctypes.c_int]
   File "/usr/lib/python2.7/ctypes/__init__.py", line 375, in __getattr__
     func = self.__getitem__(name)
   File "/usr/lib/python2.7/ctypes/__init__.py", line 380, in __getitem__
     func = self._FuncPtr((name_or_ordinal, self))
AttributeError: /usr/lib/libMagickWand-7.Q16HDRI.so.3: undefined symbol: 
MagickGetImageChannelDepth

 >>>



[15:46] <vmeson> Hey, I'm trying to get wand to work with 
imagemagick-7.0.6p4 (in Yocto) -- several api have changed such as 
MagickGetImageChannelDepth -> MagickGetImageDepth or maybe just 
GetImageDepth
[15:47] <vmeson> I've got the git repo and I'm working through it but I 
wonder if anyone has done this already and if a new tag is forthcoming 
to support imagemagick-7
[15:47] * vmeson searchs for/in the email list.
[15:47] <hongminh1e> No one did that yet
[15:48] <hongminh1e> Afaik
[15:48] <vmeson> hongminh1e: thanks for the info. I might take a stab at 
it but it's not a high priority for me right now.





-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

--------------2BFEDCB6B06807F487568B9B
Content-Type: text/x-patch;
	name="0002-python-wand-require-imagemagick-version-7.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0002-python-wand-require-imagemagick-version-7.patch"

From cb6e77b7eacc70627d29d49375e3bcc802038171 Mon Sep 17 00:00:00 2001
From: Randy MacLeod <Randy.MacLeod@windriver.com>
Date: Wed, 2 Aug 2017 11:41:16 -0700
Subject: [PATCH 2/2] python-wand: require imagemagick version 7

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../0001-Require-imagemagick-version-7.patch       | 26 ++++++++++++++++++++++
 .../recipes-devtools/python/python-wand_0.4.4.bb   |  4 +++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-optee/recipes-devtools/python/python-wand/0001-Require-imagemagick-version-7.patch

diff --git a/meta-optee/recipes-devtools/python/python-wand/0001-Require-imagemagick-version-7.patch b/meta-optee/recipes-devtools/python/python-wand/0001-Require-imagemagick-version-7.patch
new file mode 100644
index 0000000..8c82a58
--- /dev/null
+++ b/meta-optee/recipes-devtools/python/python-wand/0001-Require-imagemagick-version-7.patch
@@ -0,0 +1,26 @@
+From 417dc68e0c370350d2936190e504abb27e287912 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Wed, 2 Aug 2017 13:21:28 -0400
+Subject: [PATCH] Require imagemagick version 7
+
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ wand/api.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wand/api.py b/wand/api.py
+index 2c18513..651fb3f 100644
+--- a/wand/api.py
++++ b/wand/api.py
+@@ -55,7 +55,7 @@ def library_paths():
+     """
+     libwand = None
+     libmagick = None
+-    versions = '', '-6', '-Q16', '-Q8', '-6.Q16'
++    versions = '', '-7', '-Q16', '-Q8', '-7.Q16'
+     options = '', 'HDRI', 'HDRI-2'
+     system = platform.system()
+     magick_home = os.environ.get('MAGICK_HOME')
+-- 
+2.9.3
+
diff --git a/meta-optee/recipes-devtools/python/python-wand_0.4.4.bb b/meta-optee/recipes-devtools/python/python-wand_0.4.4.bb
index 1043987..9687998 100644
--- a/meta-optee/recipes-devtools/python/python-wand_0.4.4.bb
+++ b/meta-optee/recipes-devtools/python/python-wand_0.4.4.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=170eafd687d4a2b950819cd5e067e6d5"
 
 SRCNAME = "wand"
 
-SRC_URI = "git://github.com/dahlia/wand.git;tag=${PV}"
+SRC_URI = "git://github.com/dahlia/wand.git;tag=${PV} \
+          file://0001-Require-imagemagick-version-7.patch \
+          "
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.11.0


--------------2BFEDCB6B06807F487568B9B
Content-Type: text/x-patch;
	name="0001-python-wand-upgrade-from-0.4.3-to-0.4.4.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-python-wand-upgrade-from-0.4.3-to-0.4.4.patch"

From 2b24f26397522c1fdb1c21f30f61a4e09fb6819e Mon Sep 17 00:00:00 2001
From: Randy MacLeod <Randy.MacLeod@windriver.com>
Date: Wed, 2 Aug 2017 11:37:04 -0700
Subject: [PATCH 1/2] python-wand: upgrade from 0.4.3 to 0.4.4

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../python/{python-wand_0.4.3.bb => python-wand_0.4.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-optee/recipes-devtools/python/{python-wand_0.4.3.bb => python-wand_0.4.4.bb} (86%)

diff --git a/meta-optee/recipes-devtools/python/python-wand_0.4.3.bb b/meta-optee/recipes-devtools/python/python-wand_0.4.4.bb
similarity index 86%
rename from meta-optee/recipes-devtools/python/python-wand_0.4.3.bb
rename to meta-optee/recipes-devtools/python/python-wand_0.4.4.bb
index cc91892..1043987 100644
--- a/meta-optee/recipes-devtools/python/python-wand_0.4.3.bb
+++ b/meta-optee/recipes-devtools/python/python-wand_0.4.4.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Magic wand library"
-HOMEPAGE = "http://docs.wand-py.org/en/0.4.3/"
+HOMEPAGE = "http://docs.wand-py.org/en/0.4.4/"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=170eafd687d4a2b950819cd5e067e6d5"
-- 
2.11.0


--------------2BFEDCB6B06807F487568B9B--
