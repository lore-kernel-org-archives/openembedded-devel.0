Received: from mail-qe0-f53.google.com ([209.85.128.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U7VqX-0000Do-UZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 19:53:50 +0100
Received: by mail-qe0-f53.google.com with SMTP id 1so2640951qee.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 10:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=PSbo7/mM2P1nMsUc1C+nzEqBtRWE/fJRnx2ioahmZFk=;
	b=DjEvtuY9pg97ktJqHUDgpvidWLMnZY2zP1h17JV2XyfGdjeEvJiMEWBBHe7BR1COSc
	7a1x+RXv386oxsLoAJYhmUPk6+jkT6xIOvPjKMfazCzKOjHWju9EGaYEVLKkIoyOp7oR
	WJebO6Svqj2A00V1Jj3xTCXiHz724Qc6WgkVR6OyOXtyjs+k6C9JBgZyVWgg4tBJsYnj
	NxkZtJ2MCZp+Zm4P8ESdLmOJw3E/XpXKnWpxMGUk4NFHsPwSd5TTYQEhyUFE0oPN/7kI
	RzS5CMJMz4zmtSKnbN/btcWEsbIKuX4PuUFnXj4cd3Pmh+HVNAKxlA9JWj7fmxphbB4K
	pBdA==
X-Received: by 10.224.203.131 with SMTP id fi3mr902907qab.77.1361212661189;
	Mon, 18 Feb 2013 10:37:41 -0800 (PST)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id hn9sm25879391qab.8.2013.02.18.10.37.39
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 10:37:39 -0800 (PST)
Message-ID: <512274F6.4090002@felipetonello.com>
Date: Mon, 18 Feb 2013 10:37:42 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1360603554-31515-1-git-send-email-ftonello@cercacor.com>
	<20130216183711.GA3300@jama>
In-Reply-To: <20130216183711.GA3300@jama>
X-Gm-Message-State: ALoCoQmbl514hHvVrZbcRX/nsHkSqPSQZAb0hPsCjxT924UgZ0TkZHpPOG9+QmTC81m5jRedNyQ4
Subject: Re: [meta-oe][PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Mon, 18 Feb 2013 18:53:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 02/16/2013 10:37 AM, Martin Jansa wrote:
> On Mon, Feb 11, 2013 at 09:25:53AM -0800, eu@felipetonello.com wrote:
>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>
>> This recipe provides the Qt library and QML plugins for connman.
>
> Fails in do_install (possibly issue with dash)
>
> ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libconnman-qt/0.4.0-r0/temp/log.do_install.20933
> Log data follows:
> | DEBUG: Executing shell function do_install
> | NOTE: make -j 8 MAKEFLAGS= install
> | cd libconnman-qt/ && make -f Makefile install
> | make[1]: Entering directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libconnman-qt/0.4.0-r0/git/libconnman-qt'
> | install -m 755 -p "libconnman-qt4.so.0.3.0" "/usr/lib/libconnman-qt4.so.0.3.0"
> | install: cannot create regular file `/usr/lib/libconnman-qt4.so.0.3.0': Permission denied
> | make[1]: [install_target] Error 1 (ignored)
> | ln -f -s "libconnman-qt4.so.0.3.0" "/usr/lib/libconnman-qt4.so"
> | ln: failed to create symbolic link `/usr/lib/libconnman-qt4.so': Permission denied
> | make[1]: [install_target] Error 1 (ignored)
> | ln -f -s "libconnman-qt4.so.0.3.0" "/usr/lib/libconnman-qt4.so.0"
> | ln: failed to create symbolic link `/usr/lib/libconnman-qt4.so.0': Permission denied
> | make[1]: [install_target] Error 1 (ignored)
> | ln -f -s "libconnman-qt4.so.0.3.0" "/usr/lib/libconnman-qt4.so.0.3"
> | ln: failed to create symbolic link `/usr/lib/libconnman-qt4.so.0.3': Permission denied
> | make[1]: [install_target] Error 1 (ignored)
> | install -m 644 -p "libconnman-qt4.prl" "/usr/lib/libconnman-qt4.prl"
> | install: cannot create regular file `/usr/lib/libconnman-qt4.prl': Permission denied
> | make[1]: [install_target] Error 1 (ignored)
> | install -m 644 -p "connman-qt4.pc" "/usr/lib/connman-qt4.pc"
> | install: cannot create regular file `/usr/lib/connman-qt4.pc': Permission denied
> | make[1]: [install_target] Error 1 (ignored)
> | mkdir: cannot create directory `/usr/include/connman-qt/': Permission denied
> | make[1]: *** [install_headers] Error 1
> | make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libconnman-qt/0.4.0-r0/git/libconnman-qt'
> | make: *** [sub-libconnman-qt-install_subtargets-ordered] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_install (see /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libconnman-qt/0.4.0-r0/temp/log.do_install.20933 for further information)
> NOTE: recipe libconnman-qt-0.4.0-r0: task do_install: Failed
>
> COmplete log:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130215_060633.log/

It seems that the INSTALL_ROOT wasn't set to ${D}.

Can I have the run.do_install log?

Felipe

>
>>
>> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>> ---
>>   ...-to-disable-qml-plugin-and-test-program-t.patch |   37 +++++++++++
>>   .../libconnmna-qt/libconnman-qt_0.4.0.bb           |   69 ++++++++++++++++++++
>>   2 files changed, 106 insertions(+)
>>   create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
>>   create mode 100644 meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
>>
>> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
>> new file mode 100644
>> index 0000000..6ec084d
>> --- /dev/null
>> +++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
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
>> diff --git a/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
>> new file mode 100644
>> index 0000000..2c33b49
>> --- /dev/null
>> +++ b/meta-oe/recipes-qt/libconnmna-qt/libconnman-qt_0.4.0.bb
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
>> +# this is for users to bbappend this recipe and change it
>> +BRANCH = "master"
>> +TAG = "${PV}"
>> +SRCREV = "${AUTOREV}"
>> +
>> +SRC_URI = " \
>> +  git://github.com/nemomobile/${PN}.git;branch=${BRANCH};tag=${TAG} \
>> +  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \
>> +"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +QT_IMPORTS_DIR = "${libdir}/qt4/imports"
>> +# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
>> +PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
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
>> +  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
>> +}
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



