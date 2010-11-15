Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PI3YL-0000GU-3Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 19:13:40 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PI3XI-0007X4-Lc from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 10:12:12 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 15 Nov 2010 10:11:52 -0800
Received: from [172.30.80.225] ([172.30.80.225]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 15 Nov 2010 11:11:52 -0700
Message-ID: <4CE177E4.7090108@mentor.com>
Date: Mon, 15 Nov 2010 11:11:48 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CBEC95F.1000807@opendreambox.org>	<1288016445-30478-1-git-send-email-obi@opendreambox.org>	<4CDEBCC5.7050401@opendreambox.org>	<4CDEE328.6060307@mentor.com>	<4CE0759F.70000@opendreambox.org>	<4CE14CAD.403@mentor.com>
	<4CE155E2.5030502@opendreambox.org>
In-Reply-To: <4CE155E2.5030502@opendreambox.org>
X-OriginalArrivalTime: 15 Nov 2010 18:11:53.0125 (UTC)
	FILETIME=[94A80D50:01CB84F0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] lib_package.bbclass: fix packaging of static libs, inherit binconfig
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
X-List-Received-Date: Mon, 15 Nov 2010 18:13:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2010 08:46 AM, Andreas Oberritter wrote:
> On 11/15/2010 04:07 PM, Tom Rini wrote:
>> On 11/14/2010 04:49 PM, Andreas Oberritter wrote:
>>> On 11/13/2010 08:12 PM, Tom Rini wrote:
>>>> On 11/13/2010 09:28 AM, Andreas Oberritter wrote:
>>>>>> * Although it packaged ${bindir}/*-config into FILES_${PN}-dev, it did
>>>>>>      not include the required mangling applied by binconfig.bbclass.
>>>>
>>>> Not sure here.  Not all lib packages need binconfig mangling so it's up
>>>> to the recipe to say "I need this", usually at least.
>>>
>>> OK, Koen's proposal included "inherit binconfig", too, so I left it in.
>>> I'll send an updated patch without it.
>>
>> Just missed the proposal.  Can you link it easily?  Thanks!
>
> http://article.gmane.org/gmane.comp.handhelds.openembedded/38554

OK, with that I'm happy with the v1 (that I assume you archived in 
patchwork).

Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


