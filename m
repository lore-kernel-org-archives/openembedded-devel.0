Received: from [64.28.152.243] (helo=smtp-relay2.palm.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rich.pixley@palm.com>) id 1JMpQ1-0006mX-3z
	for openembedded-devel@openembedded.org; Wed, 06 Feb 2008 19:54:49 +0100
X-IronPort-AV: E=Sophos;i="4.25,313,1199692800"; 
   d="scan'208";a="4690548"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 06 Feb 2008 10:55:00 -0800
Received: from nara.local ([10.100.2.180])
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m16IskEd006814; Wed, 6 Feb 2008 10:54:57 -0800 (PST)
Message-ID: <47AA0276.6020100@palm.com>
Date: Wed, 06 Feb 2008 10:54:46 -0800
From: "K. Richard Pixley" <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <47A78C40.8000308@palm.com>	<1202166317.4788.105.camel@localhost.localdomain>	<47A7CBE6.70401@palm.com>	<1202248991.4619.5.camel@localhost.localdomain>	<47A91B74.9040605@palm.com>
	<1202300290.8393.6.camel@dax.rpnet.com>
In-Reply-To: <1202300290.8393.6.camel@dax.rpnet.com>
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
X-List-Received-Date: Wed, 06 Feb 2008 18:54:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> Once again I should remind people that := is usually a bad idea (see
> recent discussions).
That's counterintuitive and backwards from other build systems.  I've 
often pulled significant savings out of makefile based systems by 
switching from = to :=.  The problem being that "x = ${@ 
a_long_running_function() }" is a killer, especially when 
a_long_running_function is deterministic.  In that case, := requires 
exactly one call during assignment while = requires a fresh call for 
each and every reference.  The only down side of := assignments is that 
one needs to be savvy about sequencing assignments.  Luckily, with 
conditionals, any sequence of assignments can be expressed.

I used := in this situation specifically because of the sequence 
ordering.   The assignments in my example are dummies whose sole purpose 
is to force the side effects to happen at a predictable and early point 
in the run - specifically, before the assignment to SRC_URI.  If I don't 
force the side effects to happen at := time, then there's no reason to 
believe that they will have occurred prior to the expansion of ${PR} in 
${SRC_URI}.  (And, in fact, changing this doesn't affect my results).

I have discovered that converting the constructions into "python 
setting() {" seem to give them consistent contexts.  I don't understand 
why ${@ ... } lacks that context, but at least I have a way to proceed.  
Event handlers also seem to have consistent context so if I can reverse 
engineer what events actually exist, or force one to occur at the right 
time, then I should be able to get my assignments done early enough.

Neither these differences nor event handlers are very well described in 
the manual, btw.

Thanks for your help.  I think I'm over my hump now.  "python setting()" 
and event handlers should get me where I want to go now.

--rich




