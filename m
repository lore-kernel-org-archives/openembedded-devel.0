Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LuAnk-0002NO-OW
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 21:29:44 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LuAk1-000LpY-Kv
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 23:25:49 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 23:25:46 +0400
User-Agent: KMail/1.9.9
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-3-git-send-email-khimov@altell.ru>
	<20090415190913.GA29623@gmail.com>
In-Reply-To: <20090415190913.GA29623@gmail.com>
MIME-Version: 1.0
Message-Id: <200904152325.47053.khimov@altell.ru>
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 03/11] linux-libc-headers 2.6.23: fix amd64 headers
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
X-List-Received-Date: Wed, 15 Apr 2009 19:29:44 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 April 2009 23:09:13 Khem Raj wrote:
> On (15/04/09 16:35), Roman I Khimov wrote:
> > --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> > +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> > @@ -63,4 +63,16 @@ do_stage () {
>
> is there any reason not to use sanitized header like we do in do_install
> even for do_stage

I think this is the way to go for newer kernels and it can be generalized in 
some .inc for future. This approach is used now in 
linux-libc-headers_2.6.29.bb, but 2.6.23 historically uses this kind of 
do_stage and I don't think we should change that now.

BTW, we have locally a patch modifying kernel.bbclass to also use 
headers_install in kernel_do_stage for newer kernels. One of many things I 
still need to prepare and push.


