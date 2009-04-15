Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu6aL-00057E-So
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 16:59:36 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.115])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Lu6We-000Bpq-7d
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 18:55:44 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 18:55:34 +0400
User-Agent: KMail/1.9.9
References: <200904151633.49146.khimov@altell.ru>
	<200904151752.13116.khimov@altell.ru>
	<1239805434.21612.128.camel@hammer.suse.cz>
In-Reply-To: <1239805434.21612.128.camel@hammer.suse.cz>
MIME-Version: 1.0
Message-Id: <200904151855.34947.khimov@altell.ru>
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_05,RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] AMD64 and multilib support
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
X-List-Received-Date: Wed, 15 Apr 2009 14:59:36 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 April 2009 18:23:54 Stanislav Brabec wrote:
> Just for your info. openSUSE makes bi-arch in following way:
>
> - Compile everything for i586 (in i586 build environment)
>
> - Compile everything for x86_64 (in x86_64 build environment)

Well, that's nice when you have x86_64 and i586 environments. But here we're 
bootstraping toolchain from nothing, so it would involve

- compile everything for i586
- extract libraries from i586
- compile gcc-initial for x86_64
- throw in libs from i586
- proceed with bootstrapping the multilib toolchain

Which would require some management for multiple build trees and then some 
cross-build-trees dependency things. Certainly possible, but not sure any 
easier. Or am I missing something?


