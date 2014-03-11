Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 27C406F8E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 21:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 63745314A215
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 22:28:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hSTWfJB336fV
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 22:28:43 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.254.192])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 78E72314A214
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 22:28:43 +0100 (CET)
Message-ID: <531F800B.6020100@opendreambox.org>
Date: Tue, 11 Mar 2014 22:28:43 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1393548691-24359-1-git-send-email-obi@opendreambox.org>
	<20140311142230.GD2137@jama>
In-Reply-To: <20140311142230.GD2137@jama>
Subject: Re: [meta-oe][PATCH] libconnman-qt: update to 1.0.50+git80ac184
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
X-List-Received-Date: Tue, 11 Mar 2014 21:28:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11.03.2014 15:22, Martin Jansa wrote:
> On Fri, Feb 28, 2014 at 01:51:31AM +0100, Andreas Oberritter wrote:
>> Allows to install versions for Qt4/X11 and Qt4/Embedded into
>> the same filesystem by overriding the target name.
>>
>> This version also removes a superflous .pc file from ${libdir}.
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
>> index 77e70e8..3f91be2 100644
>> --- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
>> +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
>> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
>>  SECTION = "qt/lib"
>>  LICENSE = "Apache-2.0"
>>  LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
>> -SRCREV = "ddbeaf72b4d3c49285b0513b28948edacfc40b51"
>> -PV = "1.0.46+git${SRCPV}"
>> +SRCREV = "80ac184d859ea90c026403f5a520644945a5081a"
>> +PV = "1.0.50+git${SRCPV}"
>>  
>>  SRC_URI = "git://github.com/nemomobile/libconnman-qt.git;branch=master"
>>  
>> @@ -12,7 +12,7 @@ S = "${WORKDIR}/git"
>>  
>>  inherit pkgconfig
>>  
>> -EXTRA_QMAKEVARS_PRE += "CONFIG+=notests"
>> +EXTRA_QMAKEVARS_PRE += "CONFIG+=notests TARGET_SUFFIX=${QT_DIR_NAME}"
>>  
>>  do_configure_prepend() {
>>      # Hack *.pro variables
>> @@ -37,7 +37,6 @@ FILES_${PN}-dev = " \
>>      ${libdir}/libconnman-qt*${SOLIBSDEV} \
>>      ${libdir}/libconnman-qt*.prl \
>>      ${libdir}/pkgconfig/connman-qt*.pc \
>> -    ${libdir}/connman-qt*.pc \
>>  "
>>  FILES_${PN}-plugin = " \
>>      ${PLUGINS_TARGET}/qmldir \
>> -- 
>> 1.8.3.2
> 
> last world build reports failure to build libconnman-qte with this, can
> you please look into it?
> 
> | x86_64-oe-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemux86-64 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-rpath-link,/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib -shared -o libConnmanQtDeclarative.so components.o networkingmodel.o technologymodel.o savedservicemodel.o moc_components.o moc_networkingmodel.o moc_technologymodel.o moc_savedservicemodel.o   -L/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib -L../libconnman-qt -lconnman-qt4 -lQtDeclarativeE -lQtScriptE -lQtSvgE -lQtSqlE -lQtXmlPatternsE -lQtGuiE -lQtNetworkE -lQtDBusE -lQtXmlE -lQtCoreE -lpthread
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/core2-64-oe-linux/gcc/x86_64-oe-linux/4.8.2/ld: error: cannot find -lconnman-qt4
> | collect2: error: ld returned 1 exit status
> | make[1]: *** [libConnmanQtDeclarative.so] Error 1
> | make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libconnman-qte/1.0.50+gitAUTOINC+80ac184d85-r0/git/plugin'
> | make: *** [sub-plugin-make_default-ordered] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libconnman-qte/1.0.50+gitAUTOINC+80ac184d85-r0/temp/log.do_compile.15974)
> 
> (link to full log in last State of bitbake world, Failed tasks 2014-03-11 e-mail)

I've just submitted a pull-request fixing this upstream. Last time
upstream responded quickly, so I think we can just wait a little and
then bump SRCREV once it's merged.

Regards,
Andreas

