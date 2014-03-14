Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 932D06E43F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 16:57:09 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 27DA7F81202; Fri, 14 Mar 2014 10:57:10 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	T_URIBL_SEM,T_URIBL_SEM_RED autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id E0D5CF81201;
	Fri, 14 Mar 2014 10:57:08 -0600 (MDT)
Message-ID: <532334EB.7010002@mlbassoc.com>
Date: Fri, 14 Mar 2014 10:57:15 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1394599581-26844-1-git-send-email-raj.khem@gmail.com>
	<53219295.9010302@mlbassoc.com>
In-Reply-To: <53219295.9010302@mlbassoc.com>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-browser][RFT][PATCH] chromium: Upgrade 29 -> 35
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Mar 2014 16:57:13 -0000
X-Groupsio-MsgNum: 48678
Content-Type: multipart/mixed; boundary="------------040903060503020404060101"

--------------040903060503020404060101
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2014-03-13 05:12, Gary Thomas wrote:
> On 2014-03-11 22:46, Khem Raj wrote:
>> Removed already applied patches
>>
>> License year changed thats why there is change in checksum
>>
>> -// Copyright 2014 The Chromium Authors. All rights reserved.
>> +// Copyright (c) 2013 The Chromium Authors. All rights reserved.
>>
>> we see
>>
>> rpm/bin/debugedit: canonicalization unexpectedly shrank by one character
>>
>> so we add PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ..._focus_tracker_notify_deprecated_since_ATK_2_9_4.patch |  0
>>  .../{chromium-29.0.1518.2 => chromium}/armv6/include.gypi |  0
>>  .../armv6/oe-defaults.gypi                                |  0
>>  .../armv7a/include.gypi                                   |  0
>>  .../armv7a/oe-defaults.gypi                               |  0
>>  .../{chromium-29.0.1518.2 => chromium}/google-chrome      |  0
>>  .../google-chrome.desktop                                 |  0
>>  .../{chromium-29.0.1518.2 => chromium}/i586/include.gypi  |  0
>>  .../i586/oe-defaults.gypi                                 |  0
>>  .../secitem_array.patch                                   |  0
>>  .../uninitialised-warning.patch                           |  6 +++---
>>  .../{chromium-29.0.1518.2 => chromium}/unistd-2.patch     |  0
>>  .../x86-64/include.gypi                                   |  0
>>  .../x86-64/oe-defaults.gypi                               |  0
>>  .../{chromium_29.0.1518.2.bb => chromium_35.0.1883.0.bb}  | 15 ++++++++-------
>>  15 files changed, 11 insertions(+), 10 deletions(-)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch (100%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/armv6/include.gypi (100%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/armv6/oe-defaults.gypi (100%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/armv7a/include.gypi (100%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/armv7a/oe-defaults.gypi (100%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/google-chrome (100%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/google-chrome.desktop (100%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/i586/include.gypi (100%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/i586/oe-defaults.gypi (100%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/secitem_array.patch (100%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/uninitialised-warning.patch (96%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/unistd-2.patch (100%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/x86-64/include.gypi (100%)
>>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/x86-64/oe-defaults.gypi (100%)
>>  rename recipes-browser/chromium/{chromium_29.0.1518.2.bb => chromium_35.0.1883.0.bb} (84%)
>>
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch b/recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
>> rename to recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi b/recipes-browser/chromium/chromium/armv6/include.gypi
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi
>> rename to recipes-browser/chromium/chromium/armv6/include.gypi
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi b/recipes-browser/chromium/chromium/armv6/oe-defaults.gypi
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi
>> rename to recipes-browser/chromium/chromium/armv6/oe-defaults.gypi
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi b/recipes-browser/chromium/chromium/armv7a/include.gypi
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi
>> rename to recipes-browser/chromium/chromium/armv7a/include.gypi
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi b/recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi
>> rename to recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome b/recipes-browser/chromium/chromium/google-chrome
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/google-chrome
>> rename to recipes-browser/chromium/chromium/google-chrome
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop b/recipes-browser/chromium/chromium/google-chrome.desktop
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop
>> rename to recipes-browser/chromium/chromium/google-chrome.desktop
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi b/recipes-browser/chromium/chromium/i586/include.gypi
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi
>> rename to recipes-browser/chromium/chromium/i586/include.gypi
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi b/recipes-browser/chromium/chromium/i586/oe-defaults.gypi
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi
>> rename to recipes-browser/chromium/chromium/i586/oe-defaults.gypi
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch b/recipes-browser/chromium/chromium/secitem_array.patch
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch
>> rename to recipes-browser/chromium/chromium/secitem_array.patch
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch b/recipes-browser/chromium/chromium/uninitialised-warning.patch
>> similarity index 96%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
>> rename to recipes-browser/chromium/chromium/uninitialised-warning.patch
>> index fac12bb..afdd784 100644
>> --- a/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
>> +++ b/recipes-browser/chromium/chromium/uninitialised-warning.patch
>> @@ -30,10 +30,10 @@ Make gcc 4.8 happy. It complains about uninitialized symbols
>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>  
>>  Upstream-Status: Unknown
>> -Index: chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
>> +Index: chromium-29.0.1518.2/content/renderer/webclipboard_impl.cc
>>  ===================================================================
>> ---- chromium-29.0.1518.2.orig/webkit/glue/webclipboard_impl.cc
>> -+++ chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
>> +--- chromium-29.0.1518.2.orig/content/renderer/webclipboard_impl.cc
>> ++++ chromium-29.0.1518.2/content/renderer/webclipboard_impl.cc
>>  @@ -73,7 +73,7 @@ uint64 WebClipboardImpl::getSequenceNumb
>>   }
>>   
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch b/recipes-browser/chromium/chromium/unistd-2.patch
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch
>> rename to recipes-browser/chromium/chromium/unistd-2.patch
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi b/recipes-browser/chromium/chromium/x86-64/include.gypi
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi
>> rename to recipes-browser/chromium/chromium/x86-64/include.gypi
>> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi b/recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi
>> similarity index 100%
>> rename from recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi
>> rename to recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi
>> diff --git a/recipes-browser/chromium/chromium_29.0.1518.2.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
>> similarity index 84%
>> rename from recipes-browser/chromium/chromium_29.0.1518.2.bb
>> rename to recipes-browser/chromium/chromium_35.0.1883.0.bb
>> index 1c62f1e..6a03d6b 100644
>> --- a/recipes-browser/chromium/chromium_29.0.1518.2.bb
>> +++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
>> @@ -1,6 +1,6 @@
>>  DESCRIPTION = "Chromium browser"
>>  LICENSE = "BSD"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d2d164565cc10f298390174d9cb6d18d"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5"
>>  DEPENDS = "xz-native pciutils pulseaudio xextproto cairo nss gtk+ zlib-native libav libxi libgnome-keyring libxss cups ninja-native gconf"
>>  SRC_URI = "\
>>          http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
>> @@ -9,12 +9,9 @@ SRC_URI = "\
>>          file://unistd-2.patch \
>>          file://google-chrome \
>>          file://google-chrome.desktop \
>> -        file://uninitialised-warning.patch \
>> -	file://001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch \
>> -	file://secitem_array.patch;striplevel=2 \
>>  "
>> -SRC_URI[md5sum] = "2480c3fd109ef000575629acb8a906ca"
>> -SRC_URI[sha256sum] = "7f08624f7d9bd120de0043da7ee09985ae6b6990d22d8c1b1f7c66fd4ed681a1"
>> +SRC_URI[md5sum] = "c0659bc3c6b540e106e043fd27f54358"
>> +SRC_URI[sha256sum] = "666d5948c6508072f9f5d6acff82290fa5939e1da1b94b042a1e05daf3357b61"
>>  
>>  # include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
>>  COMPATIBLE_MACHINE = "(-)"
>> @@ -60,8 +57,9 @@ do_install() {
>>  
>>  	install -d ${D}${bindir}/chrome/
>>  	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
>> -	install -m 0644 ${S}/out/Release/chrome.pak ${D}${bindir}/chrome/
>>  	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
>> +	install -m 0644 ${S}/out/Release/content_resources.pak ${D}${bindir}/chrome/
>> +	install -m 0644 ${S}/out/Release/keyboard_resources.pak ${D}${bindir}/chrome/
>>  	install -m 0644 ${S}/out/Release/chrome_100_percent.pak ${D}${bindir}/chrome/
>>  	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
>>  	install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}/chrome/
>> @@ -72,3 +70,6 @@ do_install() {
>>  
>>  FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications"
>>  FILES_${PN}-dbg = "${bindir}/chrome/.debug/"
>> +
>> +PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
>> +
>>
> 
> I finally got this to build on my beefy machine, but it fails
> when launched:
>   [0313/110152:FATAL:content_main_runner.cc(734)] Check failed: base::i18n::InitializeICU().
> 
> I've built this same system and used the previous version of chrome successfully.
> 
> What could be missing/broken?  My package manifest is attached.

I got this to go, but I had to apply the attached patches.

Can you squash these into your changes and send a V2?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------040903060503020404060101
Content-Type: text/x-patch;
 name="0001-Enable-SUID-sandbox.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Enable-SUID-sandbox.patch"

From 89f30a3637fa40dafe1117c882f65fb4d8ab5bc8 Mon Sep 17 00:00:00 2001
From: Gary Thomas <gary@mlbassoc.com>
Date: Fri, 14 Mar 2014 10:51:24 -0600
Subject: [PATCH 1/2] Enable SUID sandbox

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 recipes-browser/chromium/chromium/google-chrome  |    1 +
 recipes-browser/chromium/chromium_35.0.1883.0.bb |    7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes-browser/chromium/chromium/google-chrome
index 2d17772..2f6ad2e 100644
--- a/recipes-browser/chromium/chromium/google-chrome
+++ b/recipes-browser/chromium/chromium/google-chrome
@@ -1,5 +1,6 @@
 #!/bin/sh
 
+export CHROME_DEVEL_SANDBOX=/usr/sbin/chrome-devel-sandbox
 if [ "${USER}" = "root" ] ; then 
 	/usr/bin/chrome/chrome --user-data-dir=${HOME}/.chromium/ $@
 else
diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
index 1366702..dcf2c67 100644
--- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
+++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
@@ -45,7 +45,7 @@ do_configure() {
 
 do_compile() {
 	# build with ninja
-	ninja -C ${S}/out/Release chrome 
+	ninja -C ${S}/out/Release chrome chrome_sandbox
 }
 
 do_install() {
@@ -64,11 +64,14 @@ do_install() {
 	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
 	install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}/chrome/
 
+	install -d ${D}${sbindir}
+	install -m 4755 ${S}/out/Release/chrome_sandbox ${D}${sbindir}/chrome-devel-sandbox
+
 	install -d ${D}${bindir}/chrome/locales/
 	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome/locales
 }
 
-FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications"
+FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications ${sbindir}"
 FILES_${PN}-dbg = "${bindir}/chrome/.debug/"
 
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-- 
1.7.9.5


--------------040903060503020404060101
Content-Type: text/x-patch;
 name="0002-Install-missing-ICU-configuration-file-which-is-requ.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-Install-missing-ICU-configuration-file-which-is-requ.pa";
 filename*1="tch"

From 5f90223f00d4ad223bdf0d1f9a743ff4c704cee3 Mon Sep 17 00:00:00 2001
From: Gary Thomas <gary@mlbassoc.com>
Date: Fri, 14 Mar 2014 10:52:19 -0600
Subject: [PATCH 2/2] Install missing ICU configuration file which is required

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 recipes-browser/chromium/chromium_35.0.1883.0.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
index dcf2c67..5dc2c7e 100644
--- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
+++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
@@ -58,6 +58,7 @@ do_install() {
 	install -d ${D}${bindir}/chrome/
 	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
 	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/icudtl.dat ${D}${bindir}/chrome/
 	install -m 0644 ${S}/out/Release/content_resources.pak ${D}${bindir}/chrome/
 	install -m 0644 ${S}/out/Release/keyboard_resources.pak ${D}${bindir}/chrome/
 	install -m 0644 ${S}/out/Release/chrome_100_percent.pak ${D}${bindir}/chrome/
@@ -71,7 +72,7 @@ do_install() {
 	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome/locales
 }
 
-FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications ${sbindir}"
+FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications ${sbindir}/"
 FILES_${PN}-dbg = "${bindir}/chrome/.debug/"
 
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-- 
1.7.9.5


--------------040903060503020404060101--
