Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UFoq8-0007Vi-D6
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:47:55 +0100
Received: by mail-ob0-f175.google.com with SMTP id uz6so1239191obc.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=U+21WtUfn6YUB45fjZ3oUiXk7rID2eXXkQB83MQTPcg=;
	b=Yfpo+3Y0kXH5iIHoghijM41eodWodj4SXgVTDKFoUXJG6yzUUQ3aQaOVMTT8/6khQX
	xmXg4zoPc8rGNMfAdVGphQ73TpnxtY566zVs2XtuT7qlbGSw0c8qPDan+DMdZNivk1j9
	g82r+rUIznoe+DsaSz99J1WlrVUd+FEbsD89J1xfwa+Ksu1Qh3ITXs1ehGXqT1skomci
	4BvvQFUkxL6wsqtI7Eznx37lLBasB6OZOnN+gUB2ADZVD86P9pYwJcoPiSwpmnm8790Z
	WbND62SzsrDXdra+r0Pch+F1Kbt+O7c09fp28omZmeKwDTBiXoRO3v7Safu3f6l3L6vm
	222g==
X-Received: by 10.182.161.39 with SMTP id xp7mr16512352obb.71.1363192262923;
	Wed, 13 Mar 2013 09:31:02 -0700 (PDT)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id v3sm27033791oev.5.2013.03.13.09.31.01
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:31:02 -0700 (PDT)
Message-ID: <5140A9D7.7080506@felipetonello.com>
Date: Wed, 13 Mar 2013 09:31:19 -0700
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1362163066-376-1-git-send-email-ftonello@cercacor.com>
	<20130313110926.GA3260@jama>
In-Reply-To: <20130313110926.GA3260@jama>
X-Gm-Message-State: ALoCoQk561qTA/OJ1IcJ+mIs/y9YJEPqYG2d+FjbGr4fTTatLG1zNN9vd3AvpYGneEIUwI/zlt5U
Subject: Re: [meta-oe][PATCH v2] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Wed, 13 Mar 2013 16:47:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 03/13/2013 04:09 AM, Martin Jansa wrote:
> On Fri, Mar 01, 2013 at 10:37:46AM -0800, eu@felipetonello.com wrote:
>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>
>> Fingerterm is a terminal emulator for Nokia Harmattan, but it works in any Qt4
>> environment.
>>
>> This recipe can be extended by a .bbappend to add .desktop, icon and others to
>> the target device.
>>
>> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>> ---
>>   meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb |   30 +++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>   create mode 100644 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
>>
>> diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
>> new file mode 100644
>> index 0000000..e828672
>> --- /dev/null
>> +++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
>> @@ -0,0 +1,30 @@
>> +DESCRIPTION = "A terminal emulator for Harmattan (Nokia N9/N950) with a custom \
>> +virtual keyboard and usability-enhancing features such as URL grabber, pan \
>> +gestures and customizable shortcut menu. Designed especially to be used with \
>> +screen and irssi."
>> +HOMEPAGE = "http://hqh.unlink.org/harmattan"
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> Hi,
>
> in v2 you have changed LIC_FILES_CHKSUM, old one was correct, new one is
> not:
>
> NOTE: recipe fingerterm-1.0.2-r0: task do_configure: Started
> ERROR: fingerterm: md5 data is not matching for file://COPYING;md5=d32239bcb673463ab874e80d47fae504
> ERROR: fingerterm: The new md5 checksum is b234ee4d69f5fce4486a80fdaf4a4263
> ERROR: fingerterm: Check if the license information has changed in
> ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix
> ERROR: Function failed: do_qa_configure
>
> Please send tested v3.

Yes, I don't know why they changed the COPYING file.

I had the v3 here but forgot to send.

Sorry about that.

Felipe
>
>> +SECTION = "qt/app"
>> +
>> +PR = "r0"
>> +
>> +inherit qt4x11 pkgconfig
>> +
>> +SRC_URI = " \
>> +  http://hqh.unlink.org/harmattan/fingerterm-${PV}.tar.gz \
>> +"
>> +
>> +SRC_URI[md5sum] = "d53b0f463c025583cd52accf95715448"
>> +SRC_URI[sha256sum] = "c21a07cc411d09739bd7fa248eba2bf96427b3f032382a044b6674dd82d95150"
>> +
>> +S = "${WORKDIR}/${PN}"
>> +
>> +FILES_${PN} = " \
>> +  ${bindir}/${PN} \
>> +"
>> +
>> +do_install() {
>> +  install -d ${D}${bindir}
>> +  install -m 0744 ${S}/${PN} ${D}${bindir}
>> +}
>> \ No newline at end of file
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



