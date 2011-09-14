Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Imran_Mehmood@mentor.com>) id 1R3oNg-00079V-Ct
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 14:15:56 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1R3oIg-000028-Ui from Imran_Mehmood@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 05:10:47 -0700
Received: from [137.202.157.139] ([137.202.157.139]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 14 Sep 2011 14:10:45 +0200
Message-ID: <4E709985.2000001@mentor.com>
Date: Wed, 14 Sep 2011 17:09:41 +0500
From: Imran Mehmood <imran_mehmood@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1315914262.git.Imran_Mehmood@mentor.com>	<4f19ed0177ac717d462981b37219a062fa46dffd.1315914262.git.Imran_Mehmood@mentor.com>
	<1315919517.4195.37.camel@mattotaupa>
In-Reply-To: <1315919517.4195.37.camel@mattotaupa>
X-OriginalArrivalTime: 14 Sep 2011 12:10:45.0940 (UTC)
	FILETIME=[552C3F40:01CC72D7]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 1/1] twm: add recipe version 1.0.6 (initial recipe)
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
X-List-Received-Date: Wed, 14 Sep 2011 12:15:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Paul,

On 09/13/2011 06:11 PM, Paul Menzel wrote:

> Dear Imram,
>
>
> Am Dienstag, den 13.09.2011, 17:49 +0500 schrieb Mehmood, Imran:
>> From: Imran Mehmood<Imran_Mehmood@mentor.com>
> in the commit summary the word »recipe« is useless in my opinion since
> it is clear when prefixing the line with twm.
>
>>   * Imported from oe.dev commit id d90ee2735e9aa9d1a8dd7d0eb6a5917030a233d3
> How did you test this recipe?
I picked the recipe from oe, placed it in meta-oe and just built it. My machine is qemuppc.

>> Signed-off-by: Imran Mehmood<Imran_Mehmood@mentor.com>
>> ---
>>   meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb |   18 ++++++++++++++++++
>>   1 files changed, 18 insertions(+), 0 deletions(-)
>>   create mode 100644 meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
>>
>> diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
>> new file mode 100644
>> index 0000000..d5105c0
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
>> @@ -0,0 +1,18 @@
>> +require xorg-app-common.inc
>> +DESCRIPTION = "tiny window manager"
>> +DEPENDS += " libxext libxt libxmu"
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=4c6d42ef60e8166aa26606524c0b9586"
>> +
>> +PE = "1"
> `PE = "1"` is not needed anymore when importing the recipe.
>
>> +PR = "${INC_PR}.0"
>> +
>> +SRC_URI[archive.md5sum] = "952d06a0c2ec34687b536c7b619fc671"
>> +SRC_URI[archive.sha256sum] = "e7dccad7879a7570442f0cd9df0b9064e926466b5a52b710fca8cfb167f294e9"
>> +
>> +FILES_${PN} += "${datadir}/X11/twm/system.twmrc"
>> +ALTERNATIVE_NAME = "x-window-manager"
>> +ALTERNATIVE_PATH = "${bindir}/twm"
>> +ALTERNATIVE_LINK = "${bindir}/x-window-manager"
>> +ALTERNATIVE_PRIORITY = "1"
>
> Thanks,
>
> Paul
Thanks for your other suggestions I will resend the patch later.

Regards,
Imran Mehmood

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

