Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 916476E9A3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 12:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 235BC3148F53
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 13:33:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id bzbXH9luw3rr
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 13:33:19 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.244.237])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id BB1323148F52
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 13:33:19 +0100 (CET)
Message-ID: <52ECE98F.80600@opendreambox.org>
Date: Sat, 01 Feb 2014 13:33:19 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20140128143329.GK3718@jama>	<1390923283-17138-1-git-send-email-obi@opendreambox.org>
	<20140201075048.GB3718@jama>
In-Reply-To: <20140201075048.GB3718@jama>
Subject: Re: [meta-oe][PATCH] libconnman-qt: fix linking and packaging with Qt4/Embedded
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
X-List-Received-Date: Sat, 01 Feb 2014 12:33:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01.02.2014 08:50, Martin Jansa wrote:
> On Tue, Jan 28, 2014 at 04:34:43PM +0100, Andreas Oberritter wrote:
>> * Don't overwrite EXTRA_QMAKEVARS_PRE, because qt4e.bbclass uses
>>   it to pass on QT_LIBINFX.
>> * Generalize QT_IMPORTS_DIR to make it valid for qte.
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
>> index e4f68db..77e70e8 100644
>> --- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
>> +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
>> @@ -12,7 +12,7 @@ S = "${WORKDIR}/git"
>>  
>>  inherit pkgconfig
>>  
>> -EXTRA_QMAKEVARS_PRE = "CONFIG+=notests"
>> +EXTRA_QMAKEVARS_PRE += "CONFIG+=notests"
>>  
>>  do_configure_prepend() {
>>      # Hack *.pro variables
>> @@ -48,6 +48,6 @@ FILES_${PN}-plugin-dbg = " \
>>      ${PLUGINS_TARGET}/.debug/* \
>>  "
>>  
>> -QT_IMPORTS_DIR = "${libdir}/qt4/imports"
>> +QT_IMPORTS_DIR = "${libdir}/${QT_DIR_NAME}/imports"
>>  # the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
>>  PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
> 
> Can qte version install files in sysroot with different names? Currently
> they conflict with qt version:

Not by default. This would require patches for libconnman-qt and also
for applications using it, because the pkgconfig name would diverge from
upstream. Not a problem for my use case, though.

I'll try to work something out.

Regards,
Andreas

> NOTE: recipe libconnman-qt-1.0.46+gitAUTOINC+ddbeaf72b4-r0: task do_populate_sysroot: Started
> NOTE: recipe libconnman-qt-1.0.46+gitAUTOINC+ddbeaf72b4-r0: task do_package: Started
> WARNING: The recipe libconnman-qt is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/libconnman-qt4.so.1.0.46
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/libconnman-qt4.so
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/libconnman-qt4.so.1
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/libconnman-qt4.so.1.0
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/libconnman-qt4.prl
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/connman-qt4.pc
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/pkgconfig/connman-qt4.pc
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/connman-qt/networkmanager.h
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/connman-qt/networktechnology.h
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/connman-qt/networkservice.h
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/connman-qt/commondbustypes.h
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/connman-qt/connmannetworkproxyfactory.h
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/connman-qt/clockmodel.h
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/connman-qt/useragent.h
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/connman-qt/sessionagent.h
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/connman-qt/networksession.h
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
>    /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/connman-qt/counter.h
>    Matched in manifest-qemuarm-libconnman-qte.populate_sysroot
> Please verify which package should provide the above files.
> 
>> -- 
>> 1.8.3.2
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 


