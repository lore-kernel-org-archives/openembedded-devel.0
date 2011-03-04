Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pva7e-0004mQ-Dg
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 19:53:06 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pva6E-00056P-7z from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 10:51:38 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 4 Mar 2011 10:51:37 -0800
Received: from [172.30.80.235] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Fri, 4 Mar 2011 10:51:37 -0800
Message-ID: <4D7134B7.7070209@mentor.com>
Date: Fri, 4 Mar 2011 11:51:35 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D705C07.20508@freescale.com>	<1299244359-5345-1-git-send-email-obi@opendreambox.org>	<4D7107F9.90008@gmail.com>	<1299255257.3830.37.camel@mattotaupa>
	<4D7122B1.3080609@opendreambox.org>
In-Reply-To: <4D7122B1.3080609@opendreambox.org>
X-OriginalArrivalTime: 04 Mar 2011 18:51:37.0341 (UTC)
	FILETIME=[30C94AD0:01CBDA9D]
Subject: Re: [PATCH] mrouted-3.9.4: intitial recipe
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
X-List-Received-Date: Fri, 04 Mar 2011 18:53:06 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 03/04/2011 10:34 AM, Andreas Oberritter wrote:
> On 03/04/2011 05:14 PM, Paul Menzel wrote:
>> Am Freitag, den 04.03.2011, 07:40 -0800 schrieb Khem Raj:
>>> On 3/4/2011 5:12 AM, Andreas Oberritter wrote:
>>>> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
>>>> ---
>>>> This was only compile-tested. It would be nice to get some feedback.
>>>
>>> Looks ok to me. Does it need any deps? May be building it from scratch
>>> will detect it if not otherwise
>>>
>>> Acked-by: Khem Raj<raj.khem@gmail.com>
>>
>> With the dependencies addressed and …
>
> Other than using bison, there are no dependencies that I know of.
> Binutils already depends on bison, so it's always available to cross
> recipes. Should it be mentioned in mrouted explicitly, or is this a case
> like binutils, gcc and libc, which never need to be mentioned in DEPENDS?

You should always spell out bison-native and flex-native.

-- 
Tom Rini
Mentor Graphics Corporation


