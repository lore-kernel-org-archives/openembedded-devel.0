Received: from [63.80.53.70] (helo=smtp-relay1.palm.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rich.pixley@palm.com>) id 1K96LA-0007lj-T9
	for openembedded-devel@openembedded.org; Thu, 19 Jun 2008 00:41:21 +0200
X-IronPort-AV: E=Sophos;i="4.27,667,1204531200"; 
   d="scan'208";a="5798721"
Received: from unknown (HELO mailhost01.palm.com) ([148.92.223.30])
	by smtp-relay1.palm.com with ESMTP; 18 Jun 2008 15:40:14 -0700
Received: from flamingo.palm1.palmone.com (flamingo.palm1.palmone.com
	[148.92.248.64])
	by mailhost01.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m5IMeE39018839; Wed, 18 Jun 2008 15:40:14 -0700 (PDT)
Message-ID: <48598ECE.9030604@palm.com>
Date: Wed, 18 Jun 2008 15:40:14 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.14 (Macintosh/20080421)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Subject: bitbake vs incremental builds
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
X-List-Received-Date: Wed, 18 Jun 2008 22:41:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm wondering if there's any reason that bitbake isn't using the time 
stamps on it's stamp files to determine which recipe+task pairs should 
be executed.

If C depends on B depends on A...

A first build will build A, B, C.
A second build will build nothing since nothing has changed.  (this is 
correct behavior).
However, if I change A and rebuild, only A will be rebuilt, not B or C.

This is a nuisance for developers who are using bitbake as a build 
system.  It's a problem for continuous build systems since they must 
necessarily build everything over from source in order to test whether 
builds work.

I'm thinking that it should be fairly easy to adjust which recipe+task 
pairs are scheduled for execution by looking not only at stamp file 
existence, but also at the comparative difference in stamp file times.  
If the stamp file for A is more recent than the stamp file for B, then B 
needs to be scheduled for execution as does C.

Does anyone know of any reason why this cannot or should not be done?

--rich


