Received: from mail-qa0-f49.google.com ([209.85.216.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U8Hj2-0007gj-Uv
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 23:01:23 +0100
Received: by mail-qa0-f49.google.com with SMTP id o13so2648134qaj.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 13:45:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=WALhcZN/DVu1WPRRgDk1RaUnqny7rEuqYdJCTxyX6tI=;
	b=go99t222vvth3kY9ecLclY8wulvdbiqusBS8XqXLDbWoARTxkIBmZZNSltu0WNGLDh
	0r/Kw6cFyMqG3uH7C5SsZvFm1WL0f8f9kPjwF+7pY5qu16BckuEGUG3TSnn7qJPQYQzb
	PvvwrxrXXUm3WHzZ3mQEpI4599md9lM4R62UwVQSEN9kDJ0fpJ2k7zI2bPJ2KvT6Mgpb
	LylQlzeLfQfFYpcgSKcuHh4t/LxIDZmoGrINQZPCZ1jI7cbA6s2gEw3RRp3cKA6Q0gN2
	6kGKKdqVvO0a49tX9Hk5Z6fIueb+wFTGyJbJsLl42r2+iJuf/whe0F2JG93U6QBDEYW9
	p50g==
X-Received: by 10.224.32.11 with SMTP id a11mr10383690qad.87.1361396705288;
	Wed, 20 Feb 2013 13:45:05 -0800 (PST)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id hr3sm31543868qab.4.2013.02.20.13.45.03
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 13:45:04 -0800 (PST)
Message-ID: <512543DF.1090806@felipetonello.com>
Date: Wed, 20 Feb 2013 13:45:03 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1361386023-5046-1-git-send-email-ftonello@cercacor.com>
	<2925141.cvO3V2bK64@helios>
In-Reply-To: <2925141.cvO3V2bK64@helios>
X-Gm-Message-State: ALoCoQkcYwiSQoCa8kyVRsS8vg9eCow2zDASCReq2RV/gr8Y4lXQ4lkHu07ed0s6GT963AdJJeFX
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
X-List-Received-Date: Wed, 20 Feb 2013 22:01:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

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

Yes, this meta-* is something I'm always confused about. Don't know 
exactly where to add new recipes.

Ok. Will do.

Thanks,

Felipe



