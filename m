Received: from mail-qc0-f181.google.com ([209.85.216.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U8Lxr-0006MZ-KL
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 03:32:53 +0100
Received: by mail-qc0-f181.google.com with SMTP id a22so3402616qcs.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 18:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=pbru8mgCiiri/YxUygsQDRN0adP+cqcbJ13qZDyC9y0=;
	b=ggoe++kG0NdjrGIFTkhp5+k0EieCVa1j7v5MVrf6h6+BDb+i510f13QHvIf/0Bccm9
	LhqWmVkgXaPxxKHHYKG2g8gEw4ldbXRFvuAXa6uVkacRDk+R5uU0+KB9F0i/sgbPf3pi
	cbNVCb4Z385OR4UgjJRFud5kR3LD5jp7G9JriOEp/NYWm9LyV85pNM7LPl/k5KQAr9lf
	SNLX7QPWywxxmxLMIhd2BGhTYtz2ZEWfcGbvK1BKkocMQlIIfVJOUMs7wS56kJXYSj5z
	jJPbbx/n+aFmfrb5vcxWaEudEkC+hZ1PXhX6SZu8pzxOC+2/TNlnDioZ/BfnyrvkTebK
	sv9g==
X-Received: by 10.224.200.202 with SMTP id ex10mr7442473qab.97.1361412999674; 
	Wed, 20 Feb 2013 18:16:39 -0800 (PST)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id hr3sm32324511qab.4.2013.02.20.18.16.37
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 18:16:37 -0800 (PST)
Message-ID: <51258386.7030706@felipetonello.com>
Date: Wed, 20 Feb 2013 18:16:38 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1361387338-6553-1-git-send-email-ftonello@cercacor.com>
	<20130220231128.GX3300@jama>
In-Reply-To: <20130220231128.GX3300@jama>
X-Gm-Message-State: ALoCoQkIZ0e+UKi4ZedPDDhTD9CrKKw0jQ4HwuP+kjm6Z8nt/U/PsjbDzJJVekxooEH80/2sCO/v
Subject: Re: [meta-oe][PATCH] libconnman-qt: fixed directory typo
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
X-List-Received-Date: Thu, 21 Feb 2013 02:33:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 02/20/2013 03:11 PM, Martin Jansa wrote:
> On Wed, Feb 20, 2013 at 11:08:58AM -0800, eu@felipetonello.com wrote:
>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>
>> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>
> Thanks, I'll apply this later today, but next time please send patches
> with -M for git to detect renames.

That's wired actually, because git recognized it as rename here. But 
still. Sorry for the rework.

Regards,
Felipe


>
>> ---
>>   ...-to-disable-qml-plugin-and-test-program-t.patch |   37 +++++++++++
>>   .../libconnman-qt/libconnman-qt_0.4.0.bb           |   69 ++++++++++++++++++++
>>   ...-to-disable-qml-plugin-and-test-program-t.patch |   37 -----------
>>   .../libconnmna-qt/libconnman-qt_0.4.0.bb           |   69 --------------------
>>   4 files changed, 106 insertions(+), 106 deletions(-)
>>   create mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
>>   create mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
>>   delete mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
>>   delete mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
>>
>> diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
>> new file mode 100644
>> index 0000000..6ec084d
>> --- /dev/null
>> +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
>> @@ -0,0 +1,37 @@
>> +From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
>> +From: "Felipe F. Tonello" <ftonello@cercacor.com>
>> +Date: Mon, 7 Jan 2013 17:13:22 -0800
>> +Subject: [PATCH] added flags to disable qml plugin and test program to
>> + compile
>> +
>> +This is usefull when there is no need to compile test program and qml plugin.
>> +
>> +Upstream-Status: Accepted
>> +
>> +Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>> +---
>> + connman-qt.pro |   11 ++++++++++-
>> + 1 file changed, 10 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/connman-qt.pro b/connman-qt.pro
>> +index 7d9ec99..425c41f 100644
>> +--- a/connman-qt.pro
>> ++++ b/connman-qt.pro
>> +@@ -1,4 +1,13 @@
>> + TEMPLATE = subdirs
>> +-SUBDIRS += libconnman-qt test plugin
>> ++SUBDIRS += libconnman-qt
>> + CONFIG += ordered
>> +
>> ++# CONFIG flag to disable test program
>> ++!notest {
>> ++    SUBDIRS += test
>> ++}
>> ++
>> ++# CONFIG flag to disable qml plugin
>> ++!noplugin {
>> ++    SUBDIRS += plugin
>> ++}
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
>> new file mode 100644
>> index 0000000..d15d8d7
>> --- /dev/null
>> +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
>> @@ -0,0 +1,69 @@
>> +DESCRIPTION = "Qt Library for ConnMan"
>> +HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
>> +
>> +SECTION = "qt/lib"
>> +
>> +PR = "r0"
>> +
>> +inherit qt4x11 pkgconfig
>> +
>> +RDEPENDS_${PN} = "connman"
>> +RDEPENDS_${PN}-plugin = "${PN}"
>> +
>> +PROVIDES += "${PN}-plugin"
>> +
>> +PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
>> +RRECOMMENDS_${PN} = "${PN}-plugin"
>> +
>> +BRANCH = "master"
>> +# this matches 0.4.0 tag
>> +SRCREV = "3af5bd38d82255942f582398160a5d3354346ca3"
>> +
>> +SRC_URI = " \
>> +  git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \
>> +  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \
>> +"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +QT_IMPORTS_DIR = "${libdir}/qt4/imports"
>> +# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
>> +PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
>> +
>> +EXTRA_QMAKEVARS_PRE = " \
>> +  CONFIG+=notest \
>> +"
>> +
>> +do_configure_prepend() {
>> +  # Hack *.pro variables
>> +  find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
>> +}
>> +
>> +do_install() {
>> +  export INSTALL_ROOT=${D}
>> +  oe_runmake install
>> +}
>> +
>> +FILES_${PN} = " \
>> +  ${libdir}/libconnman-qt4${SOLIBS} \
>> +"
>> +
>> +FILES_${PN}-dev = " \
>> +  ${includedir}/connman-qt/* \
>> +  ${libdir}/libconnman-qt4${SOLIBSDEV} \
>> +  ${libdir}/libconnman-qt4.prl \
>> +  ${libdir}/pkgconfig/connman-qt4.pc \
>> +  ${libdir}/connman-qt4.pc \
>> +"
>> +
>> +FILES_${PN}-plugin = " \
>> +  ${PLUGINS_TARGET}/qmldir \
>> +  ${PLUGINS_TARGET}/lib*.so \
>> +"
>> +
>> +FILES_${PN}-plugin-dbg = " \
>> +  ${PLUGINS_TARGET}/.debug \
>> +  ${PLUGINS_TARGET}/.debug/* \
>> +"
>> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
>> deleted file mode 100644
>> index 6ec084d..0000000
>> --- a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
>> +++ /dev/null
>> @@ -1,37 +0,0 @@
>> -From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
>> -From: "Felipe F. Tonello" <ftonello@cercacor.com>
>> -Date: Mon, 7 Jan 2013 17:13:22 -0800
>> -Subject: [PATCH] added flags to disable qml plugin and test program to
>> - compile
>> -
>> -This is usefull when there is no need to compile test program and qml plugin.
>> -
>> -Upstream-Status: Accepted
>> -
>> -Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>> ----
>> - connman-qt.pro |   11 ++++++++++-
>> - 1 file changed, 10 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/connman-qt.pro b/connman-qt.pro
>> -index 7d9ec99..425c41f 100644
>> ---- a/connman-qt.pro
>> -+++ b/connman-qt.pro
>> -@@ -1,4 +1,13 @@
>> - TEMPLATE = subdirs
>> --SUBDIRS += libconnman-qt test plugin
>> -+SUBDIRS += libconnman-qt
>> - CONFIG += ordered
>> -
>> -+# CONFIG flag to disable test program
>> -+!notest {
>> -+    SUBDIRS += test
>> -+}
>> -+
>> -+# CONFIG flag to disable qml plugin
>> -+!noplugin {
>> -+    SUBDIRS += plugin
>> -+}
>> ---
>> -1.7.9.5
>> -
>> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
>> deleted file mode 100644
>> index d15d8d7..0000000
>> --- a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
>> +++ /dev/null
>> @@ -1,69 +0,0 @@
>> -DESCRIPTION = "Qt Library for ConnMan"
>> -HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
>> -LICENSE = "Apache-2.0"
>> -LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
>> -
>> -SECTION = "qt/lib"
>> -
>> -PR = "r0"
>> -
>> -inherit qt4x11 pkgconfig
>> -
>> -RDEPENDS_${PN} = "connman"
>> -RDEPENDS_${PN}-plugin = "${PN}"
>> -
>> -PROVIDES += "${PN}-plugin"
>> -
>> -PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
>> -RRECOMMENDS_${PN} = "${PN}-plugin"
>> -
>> -BRANCH = "master"
>> -# this matches 0.4.0 tag
>> -SRCREV = "3af5bd38d82255942f582398160a5d3354346ca3"
>> -
>> -SRC_URI = " \
>> -  git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \
>> -  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \
>> -"
>> -
>> -S = "${WORKDIR}/git"
>> -
>> -QT_IMPORTS_DIR = "${libdir}/qt4/imports"
>> -# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
>> -PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
>> -
>> -EXTRA_QMAKEVARS_PRE = " \
>> -  CONFIG+=notest \
>> -"
>> -
>> -do_configure_prepend() {
>> -  # Hack *.pro variables
>> -  find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
>> -}
>> -
>> -do_install() {
>> -  export INSTALL_ROOT=${D}
>> -  oe_runmake install
>> -}
>> -
>> -FILES_${PN} = " \
>> -  ${libdir}/libconnman-qt4${SOLIBS} \
>> -"
>> -
>> -FILES_${PN}-dev = " \
>> -  ${includedir}/connman-qt/* \
>> -  ${libdir}/libconnman-qt4${SOLIBSDEV} \
>> -  ${libdir}/libconnman-qt4.prl \
>> -  ${libdir}/pkgconfig/connman-qt4.pc \
>> -  ${libdir}/connman-qt4.pc \
>> -"
>> -
>> -FILES_${PN}-plugin = " \
>> -  ${PLUGINS_TARGET}/qmldir \
>> -  ${PLUGINS_TARGET}/lib*.so \
>> -"
>> -
>> -FILES_${PN}-plugin-dbg = " \
>> -  ${PLUGINS_TARGET}/.debug \
>> -  ${PLUGINS_TARGET}/.debug/* \
>> -"
>> --
>> 1.7.9.5



