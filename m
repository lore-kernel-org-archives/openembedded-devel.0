Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QHepi-0000pG-5w
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 18:21:50 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id A3D4E79900F; Wed,  4 May 2011 18:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-071-187-171.pools.arcor-ip.net
	[88.71.187.171]) by gravedo.de (Postfix) with ESMTPSA id C14DC79900D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2011 18:19:12 +0200 (CEST)
Message-ID: <4DC17C80.3060001@gravedo.de>
Date: Wed, 04 May 2011 18:19:12 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110419 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1304524228-25642-1-git-send-email-morphis@gravedo.de>
	<1304525388.15795.386.camel@phil-desktop>
In-Reply-To: <1304525388.15795.386.camel@phil-desktop>
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
X-List-Received-Date: Wed, 04 May 2011 16:21:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04.05.2011 18:09, Phil Blundell wrote:
> On Wed, 2011-05-04 at 17:50 +0200, Simon Busch wrote:
>> +# We need to set the rpath to the correct directory as cmake does not provide any
>> +# directory as rpath by default
>> +  echo "set( CMAKE_INSTALL_RPATH ${libdir} )" >> ${WORKDIR}/toolchain.cmake
> 
> Shouldn't this be inside some kind of guard for native?  You don't want
> rpath in target binaries, do you?

Thanks for the hint!

You mean something like:

if not bb.data.inherits_class('native', d)
   and not bb.data.inherits_class('cross', d):

[...]

?

regards,
Simon


