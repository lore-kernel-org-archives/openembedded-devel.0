Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PI0fg-0003XO-VG
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 16:08:43 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PI0ee-0002QF-Cj from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 07:07:36 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 15 Nov 2010 07:07:29 -0800
Received: from [172.30.80.225] ([172.30.80.225]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 15 Nov 2010 08:07:28 -0700
Message-ID: <4CE14CAD.403@mentor.com>
Date: Mon, 15 Nov 2010 08:07:25 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CBEC95F.1000807@opendreambox.org>	<1288016445-30478-1-git-send-email-obi@opendreambox.org>	<4CDEBCC5.7050401@opendreambox.org>	<4CDEE328.6060307@mentor.com>
	<4CE0759F.70000@opendreambox.org>
In-Reply-To: <4CE0759F.70000@opendreambox.org>
X-OriginalArrivalTime: 15 Nov 2010 15:07:29.0020 (UTC)
	FILETIME=[D1EF9BC0:01CB84D6]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Mon, 15 Nov 2010 15:08:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2010 04:49 PM, Andreas Oberritter wrote:
> On 11/13/2010 08:12 PM, Tom Rini wrote:
>> On 11/13/2010 09:28 AM, Andreas Oberritter wrote:
>>> Ping
>>>
>>> On 10/25/2010 04:20 PM, Andreas Oberritter wrote:
>>>> * Package ${libdir}/*.a and /lib/*.a into ${PN}-static instead of
>>>> ${PN}-dev
>>
>> Where is the FILES_${PN}-static line below?
>
> The default value from bitbake.conf is used.

OK, thanks.

>>>> * Although it packaged ${bindir}/*-config into FILES_${PN}-dev, it did
>>>>     not include the required mangling applied by binconfig.bbclass.
>>
>> Not sure here.  Not all lib packages need binconfig mangling so it's up
>> to the recipe to say "I need this", usually at least.
>
> OK, Koen's proposal included "inherit binconfig", too, so I left it in.
> I'll send an updated patch without it.

Just missed the proposal.  Can you link it easily?  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


