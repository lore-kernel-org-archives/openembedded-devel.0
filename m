Received: from katalix.com ([82.103.140.233] helo=mail.katalix.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <celston@katalix.com>) id 1QRPNM-00043Q-6P
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 15:52:52 +0200
Received: from [192.168.1.100] (188-220-141-241.zone11.bethere.co.uk
	[188.220.141.241])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: chris)
	by mail.katalix.com (Postfix) with ESMTPSA id 252ABA62071
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 14:33:49 +0100 (BST)
From: Chris Elston <celston@katalix.com>
To: openembedded-devel@lists.openembedded.org
Organization: Katalix Systems Ltd
Date: Tue, 31 May 2011 14:33:47 +0100
Message-Id: <1306848827.5488.18.camel@desktop.home>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 (2.26.3-1.fc11) 
Subject: oe-core and mercurial
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
X-List-Received-Date: Tue, 31 May 2011 13:52:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm just getting started with oe (specifically oe-core) and ran into a
confusing problem that took me a minute or two to sort out.

The instructions here (which I think are for oe, not core)
http://www.openembedded.org/index.php/OEandYourDistro don't mention that
you need mercurial, whereas the page here:
http://www.openembedded.org/index.php/Required_software
does.

I believe that this doesn't matter for oe because it has the
mercurial-native recipe, but this isn't the case for oe-core.

Admittedly sanity.bbclass does check for the presence of hg and warn
that it's missing. I initially didn't see this message and as far as I
could tell my bitbake command returned success having only built the
native recipes.

So the question is, does the OEandYourDistro page need updating for
oe-core? In which case, where do I request a wiki account to do so?  Or
alternatively, should oe-core include the mercurial-native recipe to
cover this case?  Discuss :-)

Cheers,

Chris.



