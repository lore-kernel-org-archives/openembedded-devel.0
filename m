Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LuAyh-000310-TF
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 21:41:01 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LuAuz-0002cH-KI
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 23:37:09 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 23:37:07 +0400
User-Agent: KMail/1.9.9
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-8-git-send-email-khimov@altell.ru>
	<20090415192845.GD29623@gmail.com>
In-Reply-To: <20090415192845.GD29623@gmail.com>
MIME-Version: 1.0
Message-Id: <200904152337.07252.khimov@altell.ru>
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 08/11] glibc: move get_glibc_fpu_setting to	glibc.inc
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
X-List-Received-Date: Wed, 15 Apr 2009 19:41:01 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 April 2009 23:28:45 Khem Raj wrote:
> On (15/04/09 16:35), Roman I Khimov wrote:
> > ---
> >  recipes/glibc/glibc-package.bbclass |    5 -----
> >  recipes/glibc/glibc.inc             |    5 +++++
> >  2 files changed, 5 insertions(+), 5 deletions(-)
>
> why is this patch required. 

It is required for glibc-multilib as glibc-multilib includes 
glibc-package-multilib and not glibc-package, it got a bit out of order, 
maybe need to squash it with glibc-multilib addition.

> Can you also do multilib stuff for eglibc too

Well, let's handle glibc first and settle on overall multilib approach. :) 
Then adding eglibc and uclibc will be routine.


