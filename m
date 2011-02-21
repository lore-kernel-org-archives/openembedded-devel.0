Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Prbt8-0007XJ-IL
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 20:57:42 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Prbrs-0003jQ-3n from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 11:56:24 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 21 Feb 2011 11:56:23 -0800
Received: from [172.30.80.151] ([172.30.80.151]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 21 Feb 2011 12:56:23 -0700
Message-ID: <4D62C35D.2040505@mentor.com>
Date: Mon, 21 Feb 2011 12:56:13 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=rTuT81+QVpNo4oL_J53nKbs5tnEh+=asqgE6a@mail.gmail.com>
	<20110221192955.GF10070@sakrah.homelinux.org>
In-Reply-To: <20110221192955.GF10070@sakrah.homelinux.org>
X-OriginalArrivalTime: 21 Feb 2011 19:56:23.0175 (UTC)
	FILETIME=[6A614170:01CBD201]
Subject: Re: minimal-image starts dragging in GTK
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
X-List-Received-Date: Mon, 21 Feb 2011 19:57:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/21/2011 12:29 PM, Khem Raj wrote:
> On (21/02/11 18:53), Leon Woestenberg wrote:
>> Hello all,
>>
>>
>> since recently, minimal-image starts dragging in GTK. I have tracked
>> it down to this commit:
>>
>> avahi: integrate python into main recipe
>> * this doesn't introduce spurious rdepends like enabling gtk did in the past
>>
>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=70e46e545095a2b2dac634d484eb1c331a1bff34
>>
>>
>> This seems a hard-dependency, indepent of "+AVAHI_GTK ?= "-disable-gtk""
>>
>> +RDEPENDS_avahi-discover = "python-avahi python-pygtk"
>>
>>
>> Is that intended?
>
> I have been thinking of doing a time to time scan of .dot files
> and check the dependencies and skin down the useless dependencies

If the TSC didn't have such a large backlog right this moment I'd almost 
say it's time once again for a USE flags related discussion.

-- 
Tom Rini
Mentor Graphics Corporation


