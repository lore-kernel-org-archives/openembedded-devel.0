Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 999066E76D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 18:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6EDD53148AE1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 19:57:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id p0oxMFqwsxu7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 19:57:06 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.255.183])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 1F4EA3148AC6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 19:57:06 +0100 (CET)
Message-ID: <52E01481.6080300@opendreambox.org>
Date: Wed, 22 Jan 2014 19:57:05 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1390230519-21756-1-git-send-email-obi@opendreambox.org>
	<52E0029D.2000507@felipetonello.com>
In-Reply-To: <52E0029D.2000507@felipetonello.com>
Subject: Re: [meta-oe][PATCH] libconnman-qt: update to 1.0.46, add recipe for qte
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
X-List-Received-Date: Wed, 22 Jan 2014 18:57:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Felipe,

On 22.01.2014 18:40, Felipe Ferreri Tonello wrote:
> Hi Andreas,
> 
> On 01/20/2014 07:08 AM, Andreas Oberritter wrote:
>> * Use _git version suffix, because it really is a Git recipe.
>> * Create an inc file to be shared between qt4x11 and qt4e.
>> * Use CONFIG+=notests, because CONFIG+=notest has no effect now.
>> * Reorder some variables according to style guide.
>> * Remove unneeded PROVIDES for ${PN}-plugin, which is already listed
>>    in PACKAGES.
>> * Hardcode branch to master, because no other branch exists upstream.
>> * Simplify do_install.
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>   .../{libconnman-qt_1.0.7.bb => libconnman-qt.inc}  | 61
>> +++++++++-------------
>>   .../recipes-qt/libconnman-qt/libconnman-qt_git.bb  |  3 ++
>>   .../recipes-qt/libconnman-qt/libconnman-qte_git.bb |  3 ++
>>   3 files changed, 30 insertions(+), 37 deletions(-)
>>   rename meta-oe/recipes-qt/libconnman-qt/{libconnman-qt_1.0.7.bb =>
>> libconnman-qt.inc} (65%)
>>   create mode 100644
>> meta-oe/recipes-qt/libconnman-qt/libconnman-qt_git.bb
>>   create mode 100644
>> meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git.bb
>>
>> diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
>> b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
>> similarity index 65%
>> rename from meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
>> rename to meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
>> index 2288c4f..e4f68db 100644
>> --- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb
>> +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
>> @@ -1,66 +1,53 @@
>>   DESCRIPTION = "Qt Library for ConnMan"
>>   HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
>> +SECTION = "qt/lib"
>>   LICENSE = "Apache-2.0"
>>   LIC_FILES_CHKSUM =
>> "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
>>
>> +SRCREV = "ddbeaf72b4d3c49285b0513b28948edacfc40b51"
>> +PV = "1.0.46+git${SRCPV}"
>>
>> -SECTION = "qt/lib"
>> -
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
>> -SRCREV = "6a5e4f981112a90a8c19d82bd671da389d2af993"
>> -
>> -SRC_URI = " \
>> -    git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \
>> -"
>> +SRC_URI = "git://github.com/nemomobile/libconnman-qt.git;branch=master"
>>
>>   S = "${WORKDIR}/git"
>>
>> -QT_IMPORTS_DIR = "${libdir}/qt4/imports"
>> -# the plugin target needs to be the same as 'target.path' and
>> 'qmldir.path' in ${S}/plugin/plugin.pro
>> -PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
>> +inherit pkgconfig
>>
>> -EXTRA_QMAKEVARS_PRE = " \
>> -    CONFIG+=notest \
>> -"
>> +EXTRA_QMAKEVARS_PRE = "CONFIG+=notests"
>>
>>   do_configure_prepend() {
>>       # Hack *.pro variables
>>       find ${S}/plugin/*.pro -exec sed -i -e
>> 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
>>   }
>> -
>>   do_install() {
>> -    export INSTALL_ROOT=${D}
>> -    oe_runmake install
>> +    oe_runmake install INSTALL_ROOT=${D}
> 
> Are you sure this works with dash? Because the reason why I did the
> previous was to work in dash as well.

It's shell-agnostic, because the variable gets interpreted by make.

>>   }
>>
>> +PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
>> +
>> +RDEPENDS_${PN} = "connman"
>> +RDEPENDS_${PN}-plugin = "${PN}"
>> +
>> +RRECOMMENDS_${PN} = "${PN}-plugin"
>> +
>>   FILES_${PN} = " \
>> -    ${libdir}/libconnman-qt4${SOLIBS} \
>> +    ${libdir}/libconnman-qt*${SOLIBS} \
>>   "
>> -
>>   FILES_${PN}-dev = " \
>> -    ${includedir}/connman-qt/* \
>> -    ${libdir}/libconnman-qt4${SOLIBSDEV} \
>> -    ${libdir}/libconnman-qt4.prl \
>> -    ${libdir}/pkgconfig/connman-qt4.pc \
>> -    ${libdir}/connman-qt4.pc \
>> +    ${includedir}/connman-qt*/* \
>> +    ${libdir}/libconnman-qt*${SOLIBSDEV} \
>> +    ${libdir}/libconnman-qt*.prl \
>> +    ${libdir}/pkgconfig/connman-qt*.pc \
>> +    ${libdir}/connman-qt*.pc \
>>   "
>> -
>>   FILES_${PN}-plugin = " \
>>       ${PLUGINS_TARGET}/qmldir \
>>       ${PLUGINS_TARGET}/lib*.so \
>>   "
>> -
>>   FILES_${PN}-plugin-dbg = " \
>>       ${PLUGINS_TARGET}/.debug \
>>       ${PLUGINS_TARGET}/.debug/* \
>>   "
>> +
>> +QT_IMPORTS_DIR = "${libdir}/qt4/imports"
> 
> Doesn't Qt4 Embedded uses ${libdir}/qte/imports?

You're probably right (qtopia). I'll verify and post v2.

I tested this recipe with Qt4/X11 and Qt5 (not submitted yet, overrides
QT_IMPORTS_DIR), but Qt4/Embedded apparently went by the board.

Regards,
Andreas

