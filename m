Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RDtN8-00053n-3O
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 09:37:02 +0200
Received: from iph3.telenor.se (iph3.telenor.se [195.54.127.134])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 9EBE3EA522
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 09:31:16 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtIbAB1BlU5T4zkNPGdsb2JhbAAMN5lNjnkBAQEBN4JEQD0WGAMCAQIBMScIAQEFh3y4IodYBJN1kVU
X-IronPort-AV: E=Sophos;i="4.69,333,1315173600"; d="scan'208";a="129692238"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.57.13])
	by iph3.telenor.se with ESMTP; 12 Oct 2011 09:31:16 +0200
Message-ID: <4E954243.4040209@telia.com>
Date: Wed, 12 Oct 2011 09:31:15 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Wiki write access disabled?
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
X-List-Received-Date: Wed, 12 Oct 2011 07:37:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Noticed that the wiki seems to be wrong on the 2011.03 release.

http://www.openembedded.org/wiki/Release-2011.03

The page tells you to:

git checkout release-2011.03

or

git checkout -b release-2011.03 origin/release-2011.03

I tried, and that failed.

$ git checkout -b ulf/release-2011.03-2011-10-12 origin/release-2011.03

and got the error message.

fatal: git checkout: updating paths is incompatible with switching branches.
Did you intend to checkout 'origin/release-2011.03' which can not be 
resolved as commit?

$ git remote show origin
did not show any "release-2011.03", but there is a "2011.03-maintenance"
which I guess is what you want.

Tried to change the "http://www.openembedded.org/wiki/Release-2011.03" 
wiki page
to reflect this, but that was not possible, since I did not have write 
access any longer.

Has the rules changed, or is this a mistake in configuration.

-- 
Best Regards
Ulf Samuelsson



