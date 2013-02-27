Received: from mail-ie0-f177.google.com ([209.85.223.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UAl6d-00014H-A3
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 18:47:52 +0100
Received: by mail-ie0-f177.google.com with SMTP id 16so924947iea.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2013 09:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=yvuB68uwqqgvyn7J2Ou6qAP8zzwuBJ7mV2x9R9uKIIc=;
	b=nd0ZPonE2bfIesv/rQjjWjq0+Bn0Xq6B+iscyxE7uoTe6oysvcvWh9A5KnmAl9/lN5
	Zs3mCUZ+SLpzmuSVC2+ImU68mr6j12SIU7vJxy+pc/+Qn7C2Sl/1/jhyvZtpLemMwYyI
	a/EDKy3J2FKNF4Y/Wt2fgFM78sE13QD570tbJd2TXGBZEc/1sLEMRmIH9D06+QxN553U
	4+0WFu9Fhl7eGWm5bi8IIxK/ZH+aah40uGUhHIETkJmAF0ByhW0CyvXImMgFsAxzq7Q+
	30MInWGuhRStCYAhPDEnHhK4q1oZ+La1bSj9ieu9FACoY5ssH6wBmArrNRgqyYhEOikf
	XiRg==
X-Received: by 10.50.47.200 with SMTP id f8mr7772377ign.98.1361986289824;
	Wed, 27 Feb 2013 09:31:29 -0800 (PST)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id s8sm2546009igs.0.2013.02.27.09.31.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 09:31:28 -0800 (PST)
Message-ID: <512E42F6.9090901@felipetonello.com>
Date: Wed, 27 Feb 2013 09:31:34 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1361389201-30878-1-git-send-email-ftonello@cercacor.com>
	<20130226233633.GA2975@jama.dyndns-home.com>
In-Reply-To: <20130226233633.GA2975@jama.dyndns-home.com>
X-Gm-Message-State: ALoCoQmT0mHWv4h+63WXAe/kJA+f3nlPxaQl6CMnpDkuORyZc81bvJ99FUmS42CZV6xMsQf15m9H
Subject: Re: [meta-oe][PATCH] qextserialport: Added 1.2rc recipe
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
X-List-Received-Date: Wed, 27 Feb 2013 17:47:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 02/26/2013 03:36 PM, Martin Jansa wrote:
> On Wed, Feb 20, 2013 at 11:40:01AM -0800, eu@felipetonello.com wrote:
>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>
>> QExtSerialPort is a serial port library for Qt4/5.
>
> 1.2rc as version will sort lower then 1.2 when it's released, use something like:
> REAL_PV="1.2rc"
> PV = "1.1+${REAL_PV}"
> to provide upgrade path when 1.2 is released and recipe is updated to use it.
>

Ok. I didn't notice that. Thank you.

> It also has a lot of QA warnings, it's better to use += for FILES_, so that
> default values are preserved where possible.
>
> qextserialport-1.2rc: qextserialport: Files/directories were installed but not shipped
>    /usr/src
>    /usr/src/debug
>    /usr/src/debug/qextserialport
>    /usr/src/debug/qextserialport/1.2rc-r0
>    /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc
>    /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/moc_qextserialport.cpp
>    /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/moc_qextserialenumerator.cpp
>    /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src
>    /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextserialport_unix.cpp
>    /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextserialport_p.h
>    /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextserialport.h
>    /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextserialport.cpp
>    /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextserialenumerator_p.h
>    /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextserialenumerator_linux.cpp
>    /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextserialenumerator.h
>    /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextserialenumerator.cpp
>

I will fix it. I don't know why I didn't get these warnings.

Felipe


>>
>> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>> ---
>>   .../qextserialport/qextserialport_1.2rc.bb         |   53 ++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>   create mode 100644 meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
>>
>> diff --git a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
>> new file mode 100644
>> index 0000000..da83404
>> --- /dev/null
>> +++ b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
>> @@ -0,0 +1,53 @@
>> +DESCRIPTION = "Qt Ext Serial Port Library"
>> +HOMEPAGE = "http://http://code.google.com/p/qextserialport/"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b866a28cda707ec714878bd933f46251"
>> +SECTION = "qt/libs"
>> +
>> +PR = "r0"
>> +
>> +inherit qt4x11 pkgconfig
>> +
>> +DEPENDS = "udev"
>> +
>> +SRC_URI = " \
>> +  http://qextserialport.googlecode.com/files/qextserialport-${PV}.zip \
>> +"
>> +
>> +SRC_URI[md5sum] = "ffa061edb9f64666468d18402eee6108"
>> +SRC_URI[sha256sum] = "9cbee267aac9830f9944bb1d13872e51fba400aa9afe158e64f0fe265a0176bc"
>> +
>> +
>> +S = "${WORKDIR}/qextserialport-${PV}"
>> +
>> +FILES_${PN} = "${libdir}/libqextserialport${SOLIBS}"
>> +
>> +FILES_${PN}-dev = " \
>> +  ${libdir}/libqextserialport${SOLIBSDEV} \
>> +  ${libdir}/libqextserialport.prl \
>> +  ${includedir}/QtExtSerialPort/*.h \
>> +  ${datadir}/qt4/mkspecs/features/extserialport.prf \
>> +"
>> +
>> +FILES_${PN}-dbg = " \
>> +  ${libdir}/.debug/libqextserialport.so* \
>> +  /usr/src/debug/qextserialport-${PV}-${PR}/qextserialport-${PV}/* \
>> +"
>> +
>> +do_configure_prepend() {
>> +  # based on the documentation, this line make sure we use udev in linux
>> +  cd ${S} && echo "linux*:CONFIG += qesp_linux_udev" > .qmake.cache
>> +
>> +  # Hacking hardcoded qmake variables
>> +  find *.pro -exec sed -i -e 's,$$\[QT_INSTALL_HEADERS\],${includedir},g' '{}' ';'
>> +  find *.pro -exec sed -i -e 's,$$\[QT_INSTALL_LIBS\],${libdir},g' '{}' ';'
>> +  find *.pro -exec sed -i -e 's,$$\[QMAKE_MKSPECS\],${datadir}/qt4/mkspecs/,g' '{}' ';'
>> +}
>> +
>> +do_install() {
>> +  export INSTALL_ROOT=${D}
>> +  oe_runmake install
>> +
>> +  # This is necessary to make it work with the qt based SDK
>> +  cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e "s|${STAGING_INCDIR_NATIVE}/qt4|\$(OE_QMAKE_INCDIR_QT)/..|" ./extserialport.prf
>> +}
>> --
>> 1.7.9.5
>>
>>



