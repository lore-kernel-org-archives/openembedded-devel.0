Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pl3EL-0001hQ-AS
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 18:44:29 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pl3DP-0002Rr-Mf from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 09:43:31 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 3 Feb 2011 09:43:31 -0800
Received: from [172.30.80.88] ([172.30.80.88]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 3 Feb 2011 10:43:30 -0700
Message-ID: <4D4AE93E.2020509@mentor.com>
Date: Thu, 03 Feb 2011 10:43:26 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A440@dlee06.ent.ti.com>	<131E5DFBE7373E4C8D813795A6AA7F08032A16A5BE@dlee06.ent.ti.com>	<4D403D6F.3040800@mentor.com>
	<201101271038.18945.ml@vdm-design.de>	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>	<4D418914.2030703@mentor.com>
	<20110203070901.GA11867@denix.org>
In-Reply-To: <20110203070901.GA11867@denix.org>
X-OriginalArrivalTime: 03 Feb 2011 17:43:30.0535 (UTC)
	FILETIME=[DEE16F70:01CBC3C9]
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
X-List-Received-Date: Thu, 03 Feb 2011 17:44:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2011 12:09 AM, Denys Dmytriyenko wrote:
> On Thu, Jan 27, 2011 at 08:02:44AM -0700, Tom Rini wrote:
>> On 01/27/2011 04:27 AM, Frans Meulenbroeks wrote:
>>> 2011/1/27 Thomas Zimmermann<ml@vdm-design.de>:
>>>> On Wednesday 26 January 2011 16:27:43 Tom Rini wrote:
>>>>> I believe, from talking with Chris Larson about this before, in 1.8.x
>>>>> the error wasn't being populated upwards, but that got fixed.  At heart
>>>>> the problem is that QA errors aren't throwing a "kill the build" type
>>>>> error.  This should be changeable (and would cause 1.8.x to fail too, if
>>>>> someone backported this change to a 1.8.x using OE) to insane.bbclass.
>>>>
>>>> I don't think that a QA error should "kill the build" because then no
>>>> build
>>>> from scratch would be possible.
>>>> We have a QA error in coreutils-native because it doesn't inherit
>>>> gettext. But
>>>> adding this inherit would result in a dependencie loop.
>>>>
>>>> So if a QA error would stop build we would need something for those
>>>> situations.
>>>>
>>>> And additionally i think that most QA errors aren't fatal because most of
>>>> them
>>>> are for non-standard .desktop files.
>>>
>>> If it is not a fatal it should probably be given as a warning
>>> (especially the non-std .desktop things)
>>> If corutils-native has a problem becuase it does not inherit gettext,
>>> then maybe (if possible) it should be added or alternately if this is
>>> not a problem it definitely should not be an error but a warning.
>>>
>>> For me an error indicates something is broken and needs fixing.
>>> Reverting that: if a condition does not break things it is not an
>>> error (and yes, I know this is quite a black and white view, and that
>>> there are situations this is not true).
>>>
>>> Generally masking errors does not make them go away.
>>
>> The problem is that today we have QA Errors that are warnings
>> (coreutils-native) and QA Errors that result in a non-zero exit code but
>> also don't "kill the build" nor make it obvious at the end that there is a
>> non-zero exit code (GNU_HASH, RPATH).  Finally we do have "kill the build"
>> fatal checks in insane.bbclass, namely the do_qa_configure tests.
>
> Actually, I believe there was a simple error in the code which made QA Error
> on RPATH not kill the build[1]. BTW, GNU_HASH QA Error does stop the build.
>
> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/42168

Good spotting.  But.. GNU_HASH QA error will give you a non-zero exit 
code and not kill the build so we're back where we started, albeit with 
a less often hit in the community trigger (but I bet more often hit in 
private / 3rd party collections).

-- 
Tom Rini
Mentor Graphics Corporation


