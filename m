Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q6oIC-0002AM-GY
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 20:14:24 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q6oGC-0002xu-OI from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 11:12:20 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 4 Apr 2011 11:12:20 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Mon, 4 Apr 2011 11:12:19 -0700
Message-ID: <4D9A09FE.8030507@mentor.com>
Date: Mon, 4 Apr 2011 11:12:14 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1300981024-9111-2-git-send-email-obi@opendreambox.org>	<1300983264-16652-1-git-send-email-obi@opendreambox.org>	<4D99C0EA.5070902@opendreambox.org>	<inciqg$3vi$2@dough.gmane.org>	<4D99E05E.9020100@opendreambox.org>
	<ind0l0$io$1@dough.gmane.org>
In-Reply-To: <ind0l0$io$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 04 Apr 2011 18:12:20.0558 (UTC)
	FILETIME=[D6D6FEE0:01CBF2F3]
Subject: Re: [PATCHv2] kernel/module-base: Append PR to	MACHINE_KERNEL_PR
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
X-List-Received-Date: Mon, 04 Apr 2011 18:14:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/04/2011 10:54 AM, Koen Kooi wrote:
> On 04-04-11 17:14, Andreas Oberritter wrote:
>> On 04/04/2011 03:58 PM, Koen Kooi wrote:
>>> On 04-04-11 15:00, Andreas Oberritter wrote:
>>>> Ping. Any votes for or against this patch with either appended or
>>>> prepended PR?
>>>
>>> I don't like this patch *at all*. Recipes can already do
>>> MACHINE_KERNEL_PR_append = "something" if they need to.
> 
>> The use of MACHINE_KERNEL_PR is optional, so it feels really wrong to
>> append something to it in a recipe.
> 
>>> Can you should me a specific example on how this would be an improvement?
> 
>> With the version below. a distro can start to use MACHINE_KERNEL_PR any
>> time without breaking updates.
> 
>> The vast majority of modules do not use MACHINE_KERNEL_PR
> 
> It seems you don't understand how MACHINE_KERNEL_PR works. The *machine*
> sets it. The distro has *no* say in it. Therefore the module recipes
> don't need to set it, since it's automatic.

If I read the original thread right, Andreas' problem is that changing
the module recipe (ie fix a bug in the version, not a new version) means
you need to change all the machine PRs to get it bumped.  This seems
wrong to me.

-- 
Tom Rini
Mentor Graphics Corporation


