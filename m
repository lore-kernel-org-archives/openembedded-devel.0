Received: from [64.28.152.243] (helo=smtp-relay2.palm.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rich.pixley@palm.com>) id 1KLNBy-0004sW-Nz
	for openembedded-devel@openembedded.org; Tue, 22 Jul 2008 21:06:34 +0200
X-IronPort-AV: E=Sophos;i="4.31,232,1215414000"; d="scan'208";a="11419925"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 22 Jul 2008 12:05:24 -0700
Received: from flamingo.palm.com (flamingo.palm.com [148.92.248.64])
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m6MJ5O7v006637; Tue, 22 Jul 2008 12:05:24 -0700 (PDT)
Message-ID: <48862F74.70504@palm.com>
Date: Tue, 22 Jul 2008 12:05:24 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.14 (Macintosh/20080421)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
In-Reply-To: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
Subject: Re: Stable source repository
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
X-List-Received-Date: Tue, 22 Jul 2008 19:06:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Locally, we have a comparable problem.  Not only can we not rely on 
external repositories for archiving code, but given the volume of 
downloads we'd be placing, we can't really even rely on external 
repositories for current versions due to bandwidth constraints, (most 
facilities would resent the load our company would place on their servers).

What's been done locally is to place copies of the tarchives we use into 
our "sources" directory in version control.  So when we check out our 
local copy of OE metadata, we also get a huge, prepopulated sources 
directory.  I've also hacked all of fetching methods in our local copy 
of bitbake such that any attempt to reach outside our company for source 
produces a fatal error.

I don't like our solution because it make "mrproper" a problem and we 
have no "mrproper" of our own.  I think a better solution would have 
been for us to create a local repository aside from our source control 
system.  Then people would check out OE metadata and in the process of 
building, they'd fetch from the local repository.  But that would still 
require hijacking the component URL's, which is ugly.

As a general solution, I think OE needs to support a chain of such 
repositories and I think the OE project itself needs to create and 
maintain one.  The only way to be sure that a tarchive will be available 
is if you own and manage the repository yourself.  There's precedent for 
this - debian source packages encapsulate the upstream source so that 
the source archive is complete on it's own.  This means that the debian 
repositories each contain copies of the upstream tarchives and access to 
the upstream repositories only need to be accessed by debian maintainers 
when creating packaging for a new version.

--rich


