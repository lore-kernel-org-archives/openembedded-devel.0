Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1M4jR3-0007Zm-5H
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 00:29:53 +0200
Received: from [10.50.1.165] (unknown [10.50.1.165])
	by hermes.mvista.com (Postfix) with ESMTP
	id EC22B1968F; Thu, 14 May 2009 15:22:57 -0700 (PDT)
Message-Id: <8F73E9BD-849C-4149-8BBA-8174B538AD06@mvista.com>
From: Christopher Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Thu, 14 May 2009 15:22:56 -0700
X-Mailer: Apple Mail (2.930.3)
Subject: Event Handlers
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
X-List-Received-Date: Thu, 14 May 2009 22:29:53 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

I have a couple comments on our event handlers.  First, the whole  
NotHandled/Handled thing was a terrible idea, I readily admit that.   
Given that bitbake checks whether or not a handler returns Handled,  
and doesn't check for NotHandled, and given that NotHandled is not  
just the common case, it's probably the *only* case, I vote we remove  
all the unnecessary "return NotHandled" as a cleanup.

I'm also going to argue in favor of the removal of the getName() based  
checks in favor of isinstance() based checks.  Imo, the events should  
either be strings, or they should be objects in a class hierarchy, not  
both, which is sort of what it is right now :)

This:
from bb.event import ConfigParsed
if isinstance(e, ConfigParsed):

Seems cleaner than:
from bb.event import getName
if getName(e) == "ConfigParsed":

In my opinion.
-- 
Chris Larson
Software Engineer
MontaVista Software, Inc.
Work: 480-517-5031
Home: 480-963-2636
Email: clarson AT mvista DOT com
Email: clarson AT kergoth DOT com



