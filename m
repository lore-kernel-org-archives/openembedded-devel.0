Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UApra-0001ZF-HN
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 23:52:49 +0100
Received: by mail-oa0-f46.google.com with SMTP id k1so2373983oag.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2013 14:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=fPTr4vCSk18k7YjhXwOzm4P6qHrG7A+cMOnUSuttuaE=;
	b=h2wSyR9Zk1Mv3RK3wWferDqFN00MtwU9En8frvJx8LVFnq+RBtAcTz3Qr5fKcfvB50
	YvZy9UzBeMyaVtWaOTGbmMJYMMNlRJVIe8eSDC1mYBbcjuQ6mg1D826PIizG/oE2TdVx
	uhB7XiUMnbuNy1w4DusbZILElH2LUcK6LRnPHPUIzboK1n/35Gz+NYCVhAiuvaFzscaz
	jt0eJlOPcjVgddHCOWj0PXnCwpsoTk86bka6FRGeklk541dt6vFLF/KMKjWdjqNQdAsf
	kS8dgEHbn8BdoeeaCFOeYXAb42p1FeTR6PNcwvbnR08CZsAo558OfAiFuXs1BaL2SFRs
	7ZNQ==
X-Received: by 10.182.156.44 with SMTP id wb12mr4099261obb.20.1362004576727;
	Wed, 27 Feb 2013 14:36:16 -0800 (PST)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id be1sm10522349obb.11.2013.02.27.14.36.14
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 14:36:15 -0800 (PST)
Message-ID: <512E8A65.5070904@felipetonello.com>
Date: Wed, 27 Feb 2013 14:36:21 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1361995702-28964-1-git-send-email-ftonello@cercacor.com>
	<20130227203926.GE8208@jama.dyndns-home.com>
In-Reply-To: <20130227203926.GE8208@jama.dyndns-home.com>
X-Gm-Message-State: ALoCoQkzNrSlQV3q5U+C95MD1yZ92JOS1qedyh2sSBUpmwDM8Esj7RkMTrGjo+4LbcpzcLAKf2DX
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
X-List-Received-Date: Wed, 27 Feb 2013 22:52:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 02/27/2013 12:39 PM, Martin Jansa wrote:
> On Wed, Feb 27, 2013 at 12:08:21PM -0800, eu@felipetonello.com wrote:
>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>
>> QExtSerialPort is a serial port library for Qt4/5.
>
> Is there good reason to redefine all those FILES_*?
>
>  From previous mail:
> It also has a lot of QA warnings, it's better to use += for FILES_, so
> that default values are preserved where possible.
>

Ok. Got it. But in this case there is no more QA right. I know that I 
added the /usr/src/..., which is redundant, but still. If you want to me 
to remove, I can do it.

At least, someone that takes this recipe knows exactly what's been 
installed. IMO the default FILES_ might be obscure to some new contributors.

Thanks

Felipe

>>
>> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>> ---
>>   .../qextserialport/qextserialport_1.2rc.bb         |   56 ++++++++++++++++++++
>>   1 file changed, 56 insertions(+)
>>   create mode 100644 meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
>>
>> diff --git a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
>> new file mode 100644
>> index 0000000..4cc9d6c
>> --- /dev/null
>> +++ b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
>> @@ -0,0 +1,56 @@
>> +DESCRIPTION = "Qt Ext Serial Port Library"
>> +HOMEPAGE = "http://http://code.google.com/p/qextserialport/"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b866a28cda707ec714878bd933f46251"
>> +SECTION = "qt/libs"
>> +
>> +PR = "r0"
>> +
>> +# 1.2rc as version will sort lower then 1.2 when it's released
>> +REAL_PV = "1.2rc"
>> +PV = "1.1+${REAL_PV}"
>> +
>> +inherit qt4x11 pkgconfig
>> +
>> +DEPENDS = "udev"
>> +
>> +SRC_URI = " \
>> +  http://qextserialport.googlecode.com/files/qextserialport-${REAL_PV}.zip \
>> +"
>> +
>> +SRC_URI[md5sum] = "ffa061edb9f64666468d18402eee6108"
>> +SRC_URI[sha256sum] = "9cbee267aac9830f9944bb1d13872e51fba400aa9afe158e64f0fe265a0176bc"
>> +
>> +S = "${WORKDIR}/qextserialport-${REAL_PV}"
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
>> +  /usr/src/debug/qextserialport-${PV}-${PR}/qextserialport-${REAL_PV} \
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



