Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Px0fQ-0006aO-L9
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 18:25:52 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Px0dt-0001u2-BY from Tom_Rini@mentor.com ;
	Tue, 08 Mar 2011 09:24:17 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 8 Mar 2011 09:24:16 -0800
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Tue, 8 Mar 2011 09:24:16 -0800
Message-ID: <4D766639.4060004@mentor.com>
Date: Tue, 8 Mar 2011 10:24:09 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1299524617-7212-1-git-send-email-tom_rini@mentor.com>
	<AANLkTikS8xArUAz6mGf=uF=aCffOU78AQ07+iB=90N9p@mail.gmail.com>
In-Reply-To: <AANLkTikS8xArUAz6mGf=uF=aCffOU78AQ07+iB=90N9p@mail.gmail.com>
X-OriginalArrivalTime: 08 Mar 2011 17:24:16.0242 (UTC)
	FILETIME=[A6800D20:01CBDDB5]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gettext.bbclass: Drop target gettext from DEPENDS.
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
X-List-Received-Date: Tue, 08 Mar 2011 17:25:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2011 12:38 PM, Khem Raj wrote:
> On Mon, Mar 7, 2011 at 11:03 AM, Tom Rini<tom_rini@mentor.com>  wrote:
>> This should be handled via virtual/libintl already.
>>
>> Signed-off-by: Tom Rini<tom_rini@mentor.com>
>
> you have to do some uclibc x11 image build from scratch to check for fallouts

Did a quick drop back on alsa-utils to get that building (unrelated 
failure, the exp10 thing) and minimal-uclibc+qemuarm+x11-image built, 
pushed.  Thanks!

>
> Acked-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>   classes/gettext.bbclass |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/classes/gettext.bbclass b/classes/gettext.bbclass
>> index 968531b..6c480b5 100644
>> --- a/classes/gettext.bbclass
>> +++ b/classes/gettext.bbclass
>> @@ -11,7 +11,7 @@ python () {
>>      gettext_after_parse(d)
>>   }
>>
>> -DEPENDS_GETTEXT = "gettext gettext-native virtual/libiconv virtual/libintl"
>> +DEPENDS_GETTEXT = "gettext-native virtual/libiconv virtual/libintl"
>>
>>   DEPENDS =+ "${DEPENDS_GETTEXT}"
>>   EXTRA_OECONF += "--enable-nls"
>> --
>> 1.7.0.4
>>
>>


-- 
Tom Rini
Mentor Graphics Corporation


