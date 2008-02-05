Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JMVsz-0005qv-8y
	for openembedded-devel@openembedded.org; Tue, 05 Feb 2008 23:03:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m15M3a4u007382
	for <openembedded-devel@openembedded.org>; Tue, 5 Feb 2008 22:03:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07019-09-2 for <openembedded-devel@openembedded.org>;
	Tue,  5 Feb 2008 22:03:28 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m15M3Cjb007281
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 5 Feb 2008 22:03:12 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47A7CBE6.70401@palm.com>
References: <47A78C40.8000308@palm.com>
	<1202166317.4788.105.camel@localhost.localdomain>
	<47A7CBE6.70401@palm.com>
Date: Tue, 05 Feb 2008 22:03:11 +0000
Message-Id: <1202248991.4619.5.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 05 Feb 2008 22:03:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-02-04 at 18:37 -0800, Rich Pixley wrote:
> Let me try this again.
> 
> I have a class.  My class is listed in the INHERIT in my local.conf.
> 
> My class intends to set a variable, SUBMISSION_busybox, which will be 
> used by a bb file as "PR = ${SUBMISSION_busybox}".
> 
> I'm setting the variable via setVar, and pretty printing "d" shows me 
> that it's in p.dict.
> 
> However, attempting to bitbake yields:
> 
> NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning single-quoted 
> string (<string>, line 1) while evaluating:
> ${@base_set_filespath([ 
> "/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/busybox-1.7.2-${SUBMISSION_busybox}", 
> "/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/busybox-1.7.2", 
> "/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/busybox", 
> "/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/files", 
> "/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox" ], d)}
> ERROR: Error in executing:
> ERROR: Exception:<type 'exceptions.SyntaxError'> Message:EOL while 
> scanning single-quoted string (<string>, line 1)
> ERROR: Printing the environment of the function

The problem is the point at which some variables are accessed. How,
where and when your class sets this variable SUBMISSION_busybox is very
important. 

In this case bitbake is trying to evaluate FILESPATH set in
base.bbclass. To do this it references the ${PF} variable which in turn
contains ${PR} which in turn contains ${SUBMISSION_busybox}. At this
point ${SUBMISSION_busybox} isn't set so it errors.

> And I'm totally confused.  It would appear to me as though 
> SUBMISSION_busybox isn't being found and thus isn't being expanded.  I'm 
> assuming that my understanding of the various "d"'s is my conceptual 
> weakness here.

At the point in time where bitbake is trying to evaluate FILESPATH which
indirectly includes SUBMISSION_busybox, SUBMISSION_busybox isn't in d.

Regards,

Richard



