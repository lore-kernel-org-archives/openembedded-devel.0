Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@emagii.com>) id 1SKHY2-00036H-9s
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 01:10:58 +0200
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 827E9DF5C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 00:35:29 +0200 (CEST)
X-SENDER-IP: [83.227.58.214]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApsrAL3ujU9T4zrWPGdsb2JhbAANN4oopSCCDgEBAQE3gnx9NAIyJwYCAQHBcY0/gyQElW+BEZIO
X-IronPort-AV: E=Sophos;i="4.75,438,1330902000"; d="scan'208";a="314088211"
Received: from c-d63ae353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.243]) ([83.227.58.214])
	by ipb2.telenor.se with ESMTP; 18 Apr 2012 00:35:28 +0200
Message-ID: <4F8DF031.60109@emagii.com>
Date: Wed, 18 Apr 2012 00:35:29 +0200
From: Ulf Samuelsson <openembedded@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.28) Gecko/20120313 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: RFC: Support for R/W git in bitbake
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
X-List-Received-Date: Tue, 17 Apr 2012 23:10:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Today bitbake supports read only git access in recipes.
For various reasons, I would like to be able to do recipes
which would check out in a read/write mode.

I.E: have bitbake do "git clone git@emagii.com:myproject"

Did a prototype extension to bitbake that assumes the following URI
     wgit://emagii.com/myproject

Any objections to such an extension?
Suggestions for an alternative implementation?

-- 
Best Regards
Ulf Samuelsson
ulf@emagii.com




