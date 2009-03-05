Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1LfAPd-0002SR-3l
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 11:02:45 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 92349DB22E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2009 10:58:26 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BAF1BDB15BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2009 10:58:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178114187.adsl.alicedsl.de
	[85.178.114.187]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2009 10:58:25 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 1A76C3C18C; Thu,  5 Mar 2009 10:58:25 +0100 (CET)
Date: Thu, 5 Mar 2009 10:58:25 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090305095824.GA5717@rhein.zuhause.netz>
References: <20090305005013.GB9605@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20090305005013.GB9605@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH] Replace siginterrupt () in gnutls
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
X-List-Received-Date: Thu, 05 Mar 2009 10:02:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 04:50:13PM -0800, Khem Raj wrote:
> Hi 
> 
> This patch replace use of siginterrupt () by sigaction as reccommended
> on opengroup docs
> 
> http://www.opengroup.org/onlinepubs/000095399/functions/siginterrupt.html
> 
> uclibc have conditionalized this function as SUSV4_LEGACY. I could have
> enabled this option but I chose to fix gnutls
> 
> OK for .dev
> 
> Thx
> 
> -Khem
> 

> Index: gnutls-2.4.2/src/tests.c
> ===================================================================
> --- gnutls-2.4.2.orig/src/tests.c	2008-09-15 13:04:19.000000000 -0700
> +++ gnutls-2.4.2/src/tests.c	2009-03-04 15:25:09.000000000 -0800
> @@ -491,6 +491,7 @@
>    int old, secs = 6;
>  
>  #ifndef _WIN32
> +  struct sigaction act;
>    signal (SIGALRM, got_alarm);
>  #endif
>  
> @@ -511,7 +512,9 @@
>      return TEST_FAILED;
>  
>  #ifndef _WIN32
> -  old = siginterrupt (SIGALRM, 1);
> +  (void) sigaction(SIGALRM, NULL, &act);
> +  act.sa_flags &= ~SA_RESTART;
> +  old = sigaction(SIGALRM, &act, NULL);
>    alarm (secs);
>  #else
>    setsockopt ((int)gnutls_transport_get_ptr (session), SOL_SOCKET, SO_RCVTIMEO,
> @@ -525,7 +528,12 @@
>    while (ret > 0);
>  
>  #ifndef _WIN32
> -  siginterrupt (SIGALRM, old);
> +  (void) sigaction(SIGALRM, NULL, &act);
> +  if (old)
> +    act.sa_flags &= ~SA_RESTART;
> +  else
> +    act.sa_flags |= SA_RESTART;
> +  sigaction(SIGALRM, &act, NULL);
>  #else
>    if (WSAGetLastError () == WSAETIMEDOUT ||
>        WSAGetLastError () == WSAECONNABORTED)

+1

Bye Henning


