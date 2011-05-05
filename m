Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QHwfj-0000g1-Ey
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 13:24:43 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id F09DE79900E; Thu,  5 May 2011 13:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=6.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.2.5
Received: from [10.1.1.50] (ip-109-44-86-12.web.vodafone.de [109.44.86.12])
	by gravedo.de (Postfix) with ESMTPSA id 321BA79900E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2011 13:22:01 +0200 (CEST)
Message-ID: <4DC28855.1050000@gravedo.de>
Date: Thu, 05 May 2011 13:21:57 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110419 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1304524228-25642-1-git-send-email-morphis@gravedo.de>	<1304525388.15795.386.camel@phil-desktop>
	<4DC17C80.3060001@gravedo.de>	<1304528054.15795.417.camel@phil-desktop>
	<4DC18628.40508@gravedo.de>
	<1304589023.15795.426.camel@phil-desktop>
In-Reply-To: <1304589023.15795.426.camel@phil-desktop>
Subject: Re: [PATCH] cmake.bbclass: set the rpath for binaries build with cmake to ${libdir}
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
X-List-Received-Date: Thu, 05 May 2011 11:24:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05.05.2011 11:50, Phil Blundell wrote:
> On Wed, 2011-05-04 at 19:00 +0200, Simon Busch wrote:
>> I alreay searched through the cmake documentation and it says that the
>> rpath is set with the content of the CMAKE_INSTALL_RPATH variable. The
>> default value of CMAKE_INSTALL_RPATH is ""[1]. As currently nothing sets
>> it to another value the rpath is never set during the build for the
>> resulting binaries. I send another patch which does the solution
>> mentioned above the right way.
> 
> Oh right, I see.  So cmake is actually stripping the rpaths during the
> install step unless you tell it that you want them included?
>
> In that case, yeah, your plan seems reasonable.

Ok, so you are fine with the patch?

regards,
Simon


