Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NBUOc-0005H7-K2
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 15:23:37 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NBUNC-0004dX-V9 for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 09:22:07 -0500
Date: Fri, 20 Nov 2009 09:22:04 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B068A46.8090701@balister.org>
Message-ID: <alpine.LFD.2.00.0911200916270.11844@localhost>
References: <alpine.LFD.2.00.0911200514430.18485@localhost>
	<4B068A46.8090701@balister.org>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Upgrade guile from 1.8.6 to 1.8.7.
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
X-List-Received-Date: Fri, 20 Nov 2009 14:23:37 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 20 Nov 2009, Philip Balister wrote:

> I applied this. A couple of comments for the future:
>
> 1) Make the commit message "guile: Upgrade from 1.8.6 to 1.8.7" for
> consistency.
>
> 2) You can include the checksums in the recipe now. See:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/curl/curl_7.19.7.bb
>
> look in the curl-common.inc file for the "tarball" naming.

  ok, there's some curious stuff going on there.  first, while the
newest curl .bb file is version 7.19.7, there is no equivalent
curl-native .bb file, even though earlier version have them.  is there
a reason for that?

  also, it's only that latest .bb file -- curl_7.19.7.bb -- that has
the tarball checksums.  if there *was* a corresponding -native .bb
file, would it *also* need those identical checksums?  i would like to
think not since that would be redundant.  a grep of recipes shows only
two recipes that appear to be taking advantage of this feature --
busybox and curl.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


