Received: from [81.255.54.11] (helo=mx.laposte.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <c.romain@laposte.net>) id 1GNakB-0006z3-RU
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Sep 2006 21:50:00 +0200
Received: from [192.168.2.2] (86.213.111.240) by mx.laposte.net (7.2.060.1)
	(authenticated as c.romain)
	id 44F4DE1600B13F9F for openembedded-devel@lists.openembedded.org;
	Wed, 13 Sep 2006 21:45:50 +0200
Message-ID: <450851E5.5060800@laposte.net>
Date: Wed, 13 Sep 2006 20:45:57 +0200
From: cyril Romain <c.romain@laposte.net>
User-Agent: Mail/News 1.5 (X11/20060114)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Improve consistency with bittest content checker + sanitize.py
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2006 19:50:00 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Following the advice of Holger, I integrated the sanitize.py script into 
the bittest content checker module (at least locally on my machine).
As a reminder:
- bittest is a test suite for bitbake (see the "Bittest advertisement" 
mail). Bittest comes with a "content checker" module able to check the 
*content* of bitbake recipes (the variables and routines used, if theirs 
content is correct and not deprecated, etc.) .
- sanitize.py is aimed to check the *form* of one bitbake recipe, 
according to the rules specified in the format and style guide: 
http://www.openembedded.org/wiki/StyleGuide.

So I think the two complement each other and now provide a "form and 
content" checker for bitbake recipes, a valuable tool to improve the 
metadata consistency.
In addition to the possibility to report test results to Tinderbox 
(http://www.openembedded.org/wiki/TinderBox), bittest is now able to 
send a mail to recipe maintainer when inconsistencies or errors are 
detected, with the sanitized recipe in attachment (that of course may 
still need manual edition).


If you are interested, please let me know.

Thanks Holger for having insisted for me to integrate the script into 
bittest. Thank you, Koen, for the 'send mail' idea.

Best regards,

 Cyril

PS: I also updated the section list in the content checker according to 
the recent discussion.


