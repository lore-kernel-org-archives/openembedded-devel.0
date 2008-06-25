Received: from [64.28.152.243] (helo=smtp-relay2.palm.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rich.pixley@palm.com>) id 1KBdVr-0005N4-W8
	for openembedded-devel@openembedded.org; Thu, 26 Jun 2008 00:30:52 +0200
X-IronPort-AV: E=Sophos;i="4.27,704,1204531200"; d="scan'208";a="10457610"
Received: from unknown (HELO mailhost01.palm.com) ([148.92.223.30])
	by smtp-relay2.palm.com with ESMTP; 25 Jun 2008 15:28:39 -0700
Received: from nara.local ([10.100.2.4])
	by mailhost01.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m5PMScxr017166; Wed, 25 Jun 2008 15:28:39 -0700 (PDT)
Message-ID: <4862C697.1010500@palm.com>
Date: Wed, 25 Jun 2008 15:28:39 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.14 (Macintosh/20080421)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <48598ECE.9030604@palm.com> <1213862302.5018.2.camel@dax.rpnet.com>
In-Reply-To: <1213862302.5018.2.camel@dax.rpnet.com>
Subject: Re: bitbake vs incremental builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 25 Jun 2008 22:30:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Looks like I got something wrong or got confused by the stamps earlier.  
I am seeing top-of-tree org.embedded.stable build more things after 
changes with BB_STAMP_POLICY = "full" than it was previously.

I'm also seeing that behavior in our environment now, although I'm not 
convinced we're doing all that people expect yet.  I'm planning to 
switch us over tomorrow morning.  We'll whether anything hits the fan then.

For this to be accurate, we need to eliminate all cases of "NOSTAMP", 
don't we?  Isn't the only reason to use NOSTAMP to force something to be 
redone every pass?

--rich


