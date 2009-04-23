Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lx2qi-0000SF-R2
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 19:36:37 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090423173154.TTR22254.fed1rmmtao106.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 13:31:54 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id j5Xv1b0064dMFYL045Xvbu; Thu, 23 Apr 2009 13:31:55 -0400
X-Authority-Analysis: v=1.0 c=1 a=4kMuA4COzK4A:10 a=uwmVMmDI0mQA:10
	a=Q4-j1AaZAAAA:8 a=I9kwCvTHZpj7k0Kd68UA:9
	a=mfnemeLEWg-oZqY_43MSDYZTQdQA:4 a=UcWZWmDdwLsA:10
X-CM-Score: 0.00
Date: Thu, 23 Apr 2009 10:31:55 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090423173155.GB12956@smtp.west.cox.net>
References: <1240504230-9936-1-git-send-email-marcin@juszkiewicz.com.pl>
	<gsq885$h7s$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gsq885$h7s$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [STABLE][PATCH 1/1] task-base: added btusb driver to list	of recommended BT drivers
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
X-List-Received-Date: Thu, 23 Apr 2009 17:36:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2009 at 07:24:21PM +0200, Koen Kooi wrote:
> On 23-04-09 18:30, Marcin Juszkiewicz wrote:
>> From: Marcin Juszkiewicz<hrw@openembedded.org>
>>
>> 'btusb' driver replaced 'hci-usb' one few kernel releases ago. We recommend
>> both as some devices use older kernels.
>>
>> Signed-off-by: Marcin Juszkiewicz<hrw@openembedded.org>
>
> I ran into the same problem as well:
>
> Acked-by: Koen Kooi <koen@openembedded.org>
>
>
>> ---
>>   recipes/tasks/task-base.bb |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
>> index 4003359..66c26af 100644
>> --- a/recipes/tasks/task-base.bb
>> +++ b/recipes/tasks/task-base.bb
>> @@ -1,5 +1,5 @@
>>   DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
>> -PR = "r80"
>> +PR = "r83"

So it's OK to just jump PRs like this?  I assume in .dev there's 3
changes made to task-base from 80 to 83, including this change.

-- 
Tom Rini


