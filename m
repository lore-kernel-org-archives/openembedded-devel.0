Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M4zVE-0004zt-BZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 17:39:16 +0200
Received: from 88-109-251-122.dynamic.dsl.as9105.com ([88.109.251.122]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M4zOT-0005US-4A
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 16:32:17 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200905151727.34871.khimov@altell.ru>
References: <1242390849-28989-1-git-send-email-khimov@altell.ru>
	<1242390849-28989-2-git-send-email-khimov@altell.ru>
	<200905151727.34871.khimov@altell.ru>
Date: Fri, 15 May 2009 16:32:14 +0100
Message-Id: <1242401534.4514.50.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH 2/2] glibc-package: set LD_LIBRARY_PATH on binary	locale generation
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
X-List-Received-Date: Fri, 15 May 2009 15:39:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-05-15 at 17:27 +0400, Roman I Khimov wrote:
> BTW, while at glibc-package, is there any reason for BINARY_LOCALE_ARCHES? 
> We're using binary locale generation even for x86_64 and it is useful for us 
> there. There is ENABLE_BINARY_LOCALE_GENERATION switch already to control 
> whether one wants binary locales generated and if one does, why not on all 
> architectures?

BINARY_LOCALE_ARCHES is intended to stop glibc-package from trying to
generate the locales for targets where this is known in advance to be a
losing proposition (generally because qemu doesn't support the target
processor family).  If we didn't do that, since
ENABLE_BINARY_LOCALE_GENERATION defaults to on, people trying to build
for non-qemu-enabled targets would just get some cryptic error during
the packaging process.

p.




