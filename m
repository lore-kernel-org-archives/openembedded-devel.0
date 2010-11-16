Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PIK6b-0000Fr-RQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 12:53:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 9786E314AC42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 12:52:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id XHWmWpftui1v
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 12:52:36 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 8AB3F314AC0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 12:52:36 +0100 (CET)
Message-ID: <4CE27084.8080409@opendreambox.org>
Date: Tue, 16 Nov 2010 12:52:36 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CBEC95F.1000807@opendreambox.org>	<1288016445-30478-1-git-send-email-obi@opendreambox.org>	<4CDEBCC5.7050401@opendreambox.org>	<4CDEE328.6060307@mentor.com>	<4CE0759F.70000@opendreambox.org>	<4CE14CAD.403@mentor.com>	<4CE155E2.5030502@opendreambox.org>
	<4CE177E4.7090108@mentor.com>
In-Reply-To: <4CE177E4.7090108@mentor.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Tue, 16 Nov 2010 11:53:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/15/2010 07:11 PM, Tom Rini wrote:
> On 11/15/2010 08:46 AM, Andreas Oberritter wrote:
>> On 11/15/2010 04:07 PM, Tom Rini wrote:
>>> On 11/14/2010 04:49 PM, Andreas Oberritter wrote:
>>>> On 11/13/2010 08:12 PM, Tom Rini wrote:
>>>>> On 11/13/2010 09:28 AM, Andreas Oberritter wrote:
>>>>>>> * Although it packaged ${bindir}/*-config into FILES_${PN}-dev,
>>>>>>> it did
>>>>>>>      not include the required mangling applied by binconfig.bbclass.
>>>>>
>>>>> Not sure here.  Not all lib packages need binconfig mangling so
>>>>> it's up
>>>>> to the recipe to say "I need this", usually at least.
>>>>
>>>> OK, Koen's proposal included "inherit binconfig", too, so I left it in.
>>>> I'll send an updated patch without it.
>>>
>>> Just missed the proposal.  Can you link it easily?  Thanks!
>>
>> http://article.gmane.org/gmane.comp.handhelds.openembedded/38554
> 
> OK, with that I'm happy with the v1 (that I assume you archived in
> patchwork).
> 
> Acked-by: Tom Rini <tom_rini@mentor.com>
> 

Thanks! Yes, it was archived. Can you please push it?

http://patchwork.openembedded.org/patch/3428/

Regards,
Andreas


