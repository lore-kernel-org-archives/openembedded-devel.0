Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pl8Jr-00083j-Ba
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 00:10:31 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pl8Iv-0007NC-MJ from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 15:09:33 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 3 Feb 2011 15:09:33 -0800
Received: from [172.30.80.88] ([172.30.80.88]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 3 Feb 2011 16:09:32 -0700
Message-ID: <4D4B35A7.4040000@mentor.com>
Date: Thu, 03 Feb 2011 16:09:27 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A440@dlee06.ent.ti.com>	<131E5DFBE7373E4C8D813795A6AA7F08032A16A5BE@dlee06.ent.ti.com>	<4D403D6F.3040800@mentor.com>
	<201101271038.18945.ml@vdm-design.de>	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>	<4D418914.2030703@mentor.com>
	<20110203070901.GA11867@denix.org>	<4D4AE93E.2020509@mentor.com>
	<20110203222035.GA19477@denix.org>
In-Reply-To: <20110203222035.GA19477@denix.org>
X-OriginalArrivalTime: 03 Feb 2011 23:09:32.0701 (UTC)
	FILETIME=[6AD714D0:01CBC3F7]
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Thu, 03 Feb 2011 23:10:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2011 03:20 PM, Denys Dmytriyenko wrote:
> On Thu, Feb 03, 2011 at 10:43:26AM -0700, Tom Rini wrote:
>> On 02/03/2011 12:09 AM, Denys Dmytriyenko wrote:
>>> On Thu, Jan 27, 2011 at 08:02:44AM -0700, Tom Rini wrote:
>>>> On 01/27/2011 04:27 AM, Frans Meulenbroeks wrote:
>>>>
>>>> The problem is that today we have QA Errors that are warnings
>>>> (coreutils-native) and QA Errors that result in a non-zero exit code but
>>>> also don't "kill the build" nor make it obvious at the end that there is
>>>> a
>>>> non-zero exit code (GNU_HASH, RPATH).  Finally we do have "kill the
>>>> build"
>>>> fatal checks in insane.bbclass, namely the do_qa_configure tests.
>>>
>>> Actually, I believe there was a simple error in the code which made QA
>>> Error
>>> on RPATH not kill the build[1]. BTW, GNU_HASH QA Error does stop the
>>> build.
>>>
>>> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/42168
>>
>> Good spotting.  But.. GNU_HASH QA error will give you a non-zero exit code
>> and not kill the build so we're back where we started, albeit with a less
>> often hit in the community trigger (but I bet more often hit in private /
>> 3rd party collections).
>
> So, do you ack the patch, should I push it in? It will break the build for
> anyone still using libtool-2.2, specifically in gettext package...

So, that would break angstrom-2008.1 so I don't think that's a great 
idea until we fix it..

-- 
Tom Rini
Mentor Graphics Corporation


