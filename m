Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Pl7Yf-0005tE-6m
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 23:21:45 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LG200E17BEBAECK@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	03 Feb 2011 16:20:41 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 30AB214AF6D; Thu,
	03 Feb 2011 17:20:35 -0500 (EST)
Date: Thu, 03 Feb 2011 17:20:35 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110203222035.GA19477@denix.org>
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A440@dlee06.ent.ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F08032A16A5BE@dlee06.ent.ti.com>
	<4D403D6F.3040800@mentor.com> <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com>
MIME-version: 1.0
In-reply-to: <4D4AE93E.2020509@mentor.com>
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
X-List-Received-Date: Thu, 03 Feb 2011 22:21:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 03, 2011 at 10:43:26AM -0700, Tom Rini wrote:
> On 02/03/2011 12:09 AM, Denys Dmytriyenko wrote:
>> On Thu, Jan 27, 2011 at 08:02:44AM -0700, Tom Rini wrote:
>>> On 01/27/2011 04:27 AM, Frans Meulenbroeks wrote:
>>>
>>> The problem is that today we have QA Errors that are warnings
>>> (coreutils-native) and QA Errors that result in a non-zero exit code but
>>> also don't "kill the build" nor make it obvious at the end that there is 
>>> a
>>> non-zero exit code (GNU_HASH, RPATH).  Finally we do have "kill the 
>>> build"
>>> fatal checks in insane.bbclass, namely the do_qa_configure tests.
>>
>> Actually, I believe there was a simple error in the code which made QA 
>> Error
>> on RPATH not kill the build[1]. BTW, GNU_HASH QA Error does stop the 
>> build.
>>
>> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/42168
>
> Good spotting.  But.. GNU_HASH QA error will give you a non-zero exit code 
> and not kill the build so we're back where we started, albeit with a less 
> often hit in the community trigger (but I bet more often hit in private / 
> 3rd party collections).

So, do you ack the patch, should I push it in? It will break the build for 
anyone still using libtool-2.2, specifically in gettext package...

-- 
Denys


