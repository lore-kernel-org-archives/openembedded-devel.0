Received: from [64.28.152.243] (helo=smtp-relay2.palm.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rich.pixley@palm.com>) id 1JMWyc-0003MV-5P
	for openembedded-devel@openembedded.org; Wed, 06 Feb 2008 00:13:18 +0100
X-IronPort-AV: E=Sophos;i="4.25,309,1199692800"; d="scan'208,217";a="4644206"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 05 Feb 2008 15:13:26 -0800
Received: from flamingo.palm1.palmone.com (flamingo.palm1.palmone.com
	[148.92.248.89] (may be forged))
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m15NDGvY005689; Tue, 5 Feb 2008 15:13:16 -0800 (PST)
Message-ID: <47A8ED8C.5040708@palm.com>
Date: Tue, 05 Feb 2008 15:13:16 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <47A78C40.8000308@palm.com>	<1202166317.4788.105.camel@localhost.localdomain>	<47A7CBE6.70401@palm.com>
	<1202248991.4619.5.camel@localhost.localdomain>
In-Reply-To: <1202248991.4619.5.camel@localhost.localdomain>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: getVar. setVar, "d", etc.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2008 23:13:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Mon, 2008-02-04 at 18:37 -0800, Rich Pixley wrote:
>   
>> Let me try this again.
>>
>> I have a class.  My class is listed in the INHERIT in my local.conf.
>>
>> My class intends to set a variable, SUBMISSION_busybox, which will be
>> used by a bb file as "PR = ${SUBMISSION_busybox}".
>>
>> I'm setting the variable via setVar, and pretty printing "d" shows me
>> that it's in p.dict.
>>
>> However, attempting to bitbake yields:
>>
>> NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning single-quoted
>> string (<string>, line 1) while evaluating:
>> ${@base_set_filespath([
>> "/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/busybox-1.7.2-${SUBMISSION_busybox}",
>> "/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/busybox-1.7.2",
>> "/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/busybox",
>> "/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/files",
>> "/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox" ], d)}
>> ERROR: Error in executing:
>> ERROR: Exception:<type 'exceptions.SyntaxError'> Message:EOL while
>> scanning single-quoted string (<string>, line 1)
>> ERROR: Printing the environment of the function
>>     
> The problem is the point at which some variables are accessed. How,
> where and when your class sets this variable SUBMISSION_busybox is very
> important.
>
> In this case bitbake is trying to evaluate FILESPATH set in
> base.bbclass. To do this it references the ${PF} variable which in turn
> contains ${PR} which in turn contains ${SUBMISSION_busybox}. At this
> point ${SUBMISSION_busybox} isn't set so it errors
>> And I'm totally confused.  It would appear to me as though
>> SUBMISSION_busybox isn't being found and thus isn't being expanded.  I'm
>> assuming that my understanding of the various "d"'s is my conceptual
>> weakness here.
>>     
> At the point in time where bitbake is trying to evaluate FILESPATH which
> indirectly includes SUBMISSION_busybox, SUBMISSION_busybox isn't in d.
Thank you for your analysis.  That's about the conclusion that I'd come 
to as well.

However, with judicious use of print commands I can see that 
SUBMISSION_busybox is indeed set in d at that time, even in d which has 
"${PN}" set to "busybox" but apparently either that's not the right d, 
or it's not set soon enough, or something else it going on that I don't 
understand.

Using:

def set_submissions(d):
    import bb
    import pprint   
    bb.data.setVar('SUBMISSION_busybox', '%s' % 1, d)
    print "d.dict is"
    pp = pprint.PrettyPrinter(indent=4);
    pp.pprint(d.dict)
    print "\n"
    return "garbage"

garbage := "${@set_submissions(d)}"

Before the FILESPATH assignment in base.bbclass, I can see that 
SUBMISSION_busybox is being set, and it's being set in the current d, 
but it's still not being expanded.

Any hints?

--rich

