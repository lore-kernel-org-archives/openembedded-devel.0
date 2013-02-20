Received: from mail-qe0-f45.google.com ([209.85.128.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U8HpQ-0007pO-J8
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 23:07:52 +0100
Received: by mail-qe0-f45.google.com with SMTP id b4so3923500qen.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 13:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=QtVDODx4rBn6X171rgEBpTcG8D62sItl65yIj5rLqx4=;
	b=CmG/M0UrMCSfY4b0qt64an7pSGa8+oXZTFPu+tDQpnSLgsV+yfxFjRDBrYvEIivWlB
	SfuSGM5C+iWS4kpz8GjPIEcBLEjfJ/drIelZEoqukapM4mzbjN+4UAX9EUdEnxcKS8ce
	tWg9SEpnrG2QfdxpX81SkJIk280z5fJZHsl9lS4TZh1cww3AxjeabLXKnEvdM0kdO/uF
	pfE9gYllHeOkpKYnfcDtViFgyC1iE2hQ0vRR1HDMzz/+JKwZ5NqvLSEBhfDbRTBiJGMe
	Sw02kZ4O6bMK8cEraEIfmPvrR2IOg14WTazyDLNgSYecwIGX5JIKlfZXDPR66fwUBqb0
	gkFA==
X-Received: by 10.224.33.140 with SMTP id h12mr10819525qad.73.1361397101138;
	Wed, 20 Feb 2013 13:51:41 -0800 (PST)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id z9sm1659100qae.5.2013.02.20.13.51.39
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 13:51:40 -0800 (PST)
Message-ID: <5125456C.9060601@felipetonello.com>
Date: Wed, 20 Feb 2013 13:51:40 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1361386023-5046-1-git-send-email-ftonello@cercacor.com>
	<2925141.cvO3V2bK64@helios>
In-Reply-To: <2925141.cvO3V2bK64@helios>
X-Gm-Message-State: ALoCoQnB+VtBm8Xe9rjI7E+bni1sAqlea0zSaVT7OhUfNT+178m29L262ZT1/+vOG8xQ7DbH4zXq
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] macchanger: added 1.5.0 recipe
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
X-List-Received-Date: Wed, 20 Feb 2013 22:07:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/20/2013 01:02 PM, Paul Eggleton wrote:
> On Wednesday 20 February 2013 10:47:03 eu@felipetonello.com wrote:
>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>
>> This is a useful utility to manipulate the mac address of a device.
>>
>> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>> ---
>>   .../recipes-support/macchanger/macchanger_1.5.0.bb |   20
>> ++++++++++++++++++++ 1 file changed, 20 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/macchanger/macchanger_1.5.0.bb
>>
>> diff --git a/meta-oe/recipes-support/macchanger/macchanger_1.5.0.bb
>> b/meta-oe/recipes-support/macchanger/macchanger_1.5.0.bb new file mode
>> 100644
>> index 0000000..21c8425
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/macchanger/macchanger_1.5.0.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY = "macchanger"
>> +DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address
>> of network interfaces."
>> +HOMEPAGE = "http://www.alobbs.com/macchanger"
>> +LICENSE  = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>> +
>> +PR = "r2"
>> +
>> +SRC_URI  = "${GNU_MIRROR}/macchanger/${PN}-${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7"
>> +SRC_URI[sha256sum] =
>> "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe" +
>> +FILES_${PN} = " \
>> +  ${bindir}/${PN} \
>> +  ${datadir}/${PN}/wireless.list \
>> +  ${datadir}/${PN}/OUI.list \
>> +"
>> +
>> +inherit autotools
>> \ No newline at end of file
>
> I think this should go in meta-networking rather than meta-oe. Also you should
> probably just do FILES_${PN} += "${datadir}/${PN}", remove PR, and set SUMMARY
> to something sensible e.g. "Tool to view/change network interface MAC
> addresses".

I will not add ${datadir}/${PN} to FILES_${PN} because this will add 
manuals and stuff that it's not necessary to the main package.

I will add to ${PN}-doc.

Felipe


