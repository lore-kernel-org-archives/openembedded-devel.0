Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9253E6F479
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 22:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1227B3149DA4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 23:29:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id brPde6q-s23a
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 23:29:54 +0100 (CET)
Received: from [172.22.22.61] (55d45c10.access.ecotel.net [85.212.92.16])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 09E5F3149DA3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 23:29:54 +0100 (CET)
Message-ID: <53110DE0.1040402@opendreambox.org>
Date: Fri, 28 Feb 2014 23:29:52 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1393618507-29414-1-git-send-email-obi@opendreambox.org>
	<5310FF64.4050804@mlbassoc.com>
In-Reply-To: <5310FF64.4050804@mlbassoc.com>
Subject: Re: [meta-qt5][PATCH 1/3] qtbase/qtwebkit: drop ICU variable
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
X-List-Received-Date: Fri, 28 Feb 2014 22:29:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 28.02.2014 22:28, Gary Thomas wrote:
> On 2014-02-28 13:15, Andreas Oberritter wrote:
>> Pango doesn't seem to be a drop-in replacement for ICU, so
>> using it as a dependency for the -icu option won't work.
>>
>> QtWebKit has a hard dependency on icu.
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> 
> So, does this make QT5 a no-go for PowerPC or any other BigEndian
> platform?  Or is there another solution for ICU on PowerPC, etc?

I read about the cross-endian problem in Git history, but I don't know
whether it's been fixed in the meantime or not.

However, ICU is a hard dependency for qtwebkit only. So you can build
qtbase and other Qt modules without it simply by not adding 'icu' to
PACKAGECONFIG.

Pango doesn't seem to be used for anything related to unicode in qtbase.
The only file including pango.h is
src/plugins/platformthemes/gtk2/qgtk2dialoghelpers.cpp.

Likewise, WebKit uses pango only for the Gtk port, so adding it as a
dependency to QtWebKit doesn't change anything.

Regards,
Andreas

>> ---
>>  recipes-qt/qt5/qt5.inc      | 4 ----
>>  recipes-qt/qt5/qtbase.inc   | 2 +-
>>  recipes-qt/qt5/qtwebkit.inc | 2 +-
>>  3 files changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
>> index e2a1662..dfc1c76 100644
>> --- a/recipes-qt/qt5/qt5.inc
>> +++ b/recipes-qt/qt5/qt5.inc
>> @@ -3,10 +3,6 @@
>>  
>>  inherit qmake5
>>  
>> -# Qt5 is dependent on icu for localization
>> -ICU = "icu "
>> -ICU_powerpc = "pango"
>> -
>>  PACKAGECONFIG_OPENSSL ?= "openssl"
>>  
>>  QT_MODULE ?= "${BPN}"
>> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
>> index 378f229..4fe6bd5 100644
>> --- a/recipes-qt/qt5/qtbase.inc
>> +++ b/recipes-qt/qt5/qtbase.inc
>> @@ -116,7 +116,7 @@ PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
>>  PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
>>  PACKAGECONFIG[kms] = "-kms,-no-kms,kms"
>>  # needed for qtdeclarative (qtdeclarative.do_configure fails to find quick module without)
>> -PACKAGECONFIG[icu] = "-icu,-no-icu,${ICU}"
>> +PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
>>  PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
>>  # use -openssl-linked here to ensure that RDEPENDS for libcrypto and libssl are detected
>>  PACKAGECONFIG[openssl] = "-openssl-linked,-no-openssl,openssl"
>> diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
>> index aea9dad..c35504e 100644
>> --- a/recipes-qt/qt5/qtwebkit.inc
>> +++ b/recipes-qt/qt5/qtwebkit.inc
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
>>                      file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
>>                      file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee"
>>  
>> -DEPENDS += "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqlite3 glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base libxslt"
>> +DEPENDS += "qtdeclarative qtlocation qtsensors icu ruby-native sqlite3 glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base libxslt"
>>  
>>  # qtwebkit gets terribly big when linking with all debug info, disable by default
>>  QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
>>
> 


