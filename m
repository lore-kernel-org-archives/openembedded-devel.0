Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PktKR-0007XK-Qi
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 08:10:07 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LG100LLU571FTP3@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	03 Feb 2011 01:09:07 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4059C14AF6D; Thu,
	03 Feb 2011 02:09:01 -0500 (EST)
Date: Thu, 03 Feb 2011 02:09:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110203070901.GA11867@denix.org>
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A440@dlee06.ent.ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F08032A16A5BE@dlee06.ent.ti.com>
	<4D403D6F.3040800@mentor.com> <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com>
MIME-version: 1.0
In-reply-to: <4D418914.2030703@mentor.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
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
X-List-Received-Date: Thu, 03 Feb 2011 07:10:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 27, 2011 at 08:02:44AM -0700, Tom Rini wrote:
> On 01/27/2011 04:27 AM, Frans Meulenbroeks wrote:
>> 2011/1/27 Thomas Zimmermann<ml@vdm-design.de>:
>>> On Wednesday 26 January 2011 16:27:43 Tom Rini wrote:
>>>> I believe, from talking with Chris Larson about this before, in 1.8.x
>>>> the error wasn't being populated upwards, but that got fixed.  At heart
>>>> the problem is that QA errors aren't throwing a "kill the build" type
>>>> error.  This should be changeable (and would cause 1.8.x to fail too, if
>>>> someone backported this change to a 1.8.x using OE) to insane.bbclass.
>>>
>>> I don't think that a QA error should "kill the build" because then no 
>>> build
>>> from scratch would be possible.
>>> We have a QA error in coreutils-native because it doesn't inherit 
>>> gettext. But
>>> adding this inherit would result in a dependencie loop.
>>>
>>> So if a QA error would stop build we would need something for those
>>> situations.
>>>
>>> And additionally i think that most QA errors aren't fatal because most of 
>>> them
>>> are for non-standard .desktop files.
>>
>> If it is not a fatal it should probably be given as a warning
>> (especially the non-std .desktop things)
>> If corutils-native has a problem becuase it does not inherit gettext,
>> then maybe (if possible) it should be added or alternately if this is
>> not a problem it definitely should not be an error but a warning.
>>
>> For me an error indicates something is broken and needs fixing.
>> Reverting that: if a condition does not break things it is not an
>> error (and yes, I know this is quite a black and white view, and that
>> there are situations this is not true).
>>
>> Generally masking errors does not make them go away.
>
> The problem is that today we have QA Errors that are warnings 
> (coreutils-native) and QA Errors that result in a non-zero exit code but 
> also don't "kill the build" nor make it obvious at the end that there is a 
> non-zero exit code (GNU_HASH, RPATH).  Finally we do have "kill the build" 
> fatal checks in insane.bbclass, namely the do_qa_configure tests.

Actually, I believe there was a simple error in the code which made QA Error 
on RPATH not kill the build[1]. BTW, GNU_HASH QA Error does stop the build.

[1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/42168

-- 
Denys


