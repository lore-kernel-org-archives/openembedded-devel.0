Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M52xa-0003TH-2P
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 21:20:46 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M52qo-000Hth-1G
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 23:13:46 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 May 2009 23:13:47 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <1242390849-28989-1-git-send-email-khimov@altell.ru>
	<200905151727.34871.khimov@altell.ru>
	<1242401534.4514.50.camel@lenovo.internal.reciva.com>
In-Reply-To: <1242401534.4514.50.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200905152313.47847.khimov@altell.ru>
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
X-List-Received-Date: Fri, 15 May 2009 19:20:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 15 May 2009 19:32:14 Phil Blundell wrote:
> On Fri, 2009-05-15 at 17:27 +0400, Roman I Khimov wrote:
> > BTW, while at glibc-package, is there any reason for
> > BINARY_LOCALE_ARCHES? We're using binary locale generation even for
> > x86_64 and it is useful for us there. There is
> > ENABLE_BINARY_LOCALE_GENERATION switch already to control whether one
> > wants binary locales generated and if one does, why not on all
> > architectures?
>
> BINARY_LOCALE_ARCHES is intended to stop glibc-package from trying to
> generate the locales for targets where this is known in advance to be a
> losing proposition (generally because qemu doesn't support the target
> processor family).  If we didn't do that, since
> ENABLE_BINARY_LOCALE_GENERATION defaults to on, people trying to build
> for non-qemu-enabled targets would just get some cryptic error during
> the packaging process.

OK, then I guess we should extend it at least with "i?86" and "x86_64", 
because that work perfect with QEMU.


