Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M4xYf-0007Y6-HR
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 15:34:41 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M4xRu-000NQM-12
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 17:27:42 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 May 2009 17:27:34 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <1242390849-28989-1-git-send-email-khimov@altell.ru>
	<1242390849-28989-2-git-send-email-khimov@altell.ru>
In-Reply-To: <1242390849-28989-2-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <200905151727.34871.khimov@altell.ru>
Subject: Re: [PATCH 2/2] glibc-package: set LD_LIBRARY_PATH on binary locale generation
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
X-List-Received-Date: Fri, 15 May 2009 13:34:41 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

BTW, while at glibc-package, is there any reason for BINARY_LOCALE_ARCHES? 
We're using binary locale generation even for x86_64 and it is useful for us 
there. There is ENABLE_BINARY_LOCALE_GENERATION switch already to control 
whether one wants binary locales generated and if one does, why not on all 
architectures?


