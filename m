Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L9R5F-0008JZ-0D
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 22:22:34 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081207211841.UEDU131.fed1rmmtao107.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sun, 7 Dec 2008 16:18:41 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id oMJe1a0091E665w03MJfCS; Sun, 07 Dec 2008 16:18:41 -0500
X-Authority-Analysis: v=1.0 c=1 a=eathNvbEbwLy83x956IA:9
	a=3y5q-ovrvUtyiaETR1nHec9NG7YA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 7 Dec 2008 14:18:48 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081207211848.GG15204@smtp.west.cox.net>
References: <20081207001050.GA1796@gmail.com>
	<20081207005017.GK16628@smtp.west.cox.net>
	<20081207205430.GA4642@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20081207205430.GA4642@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: mips site files update
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
X-List-Received-Date: Sun, 07 Dec 2008 21:22:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 07, 2008 at 12:54:30PM -0800, Khem Raj wrote:
> On (06/12/08 17:50), Tom Rini wrote:
> > On Sat, Dec 06, 2008 at 04:10:50PM -0800, Khem Raj wrote:
> > 
> > > Hi 
> > > 
> > > Trying to build for mips based machines. I needed this patch to get the
> > > console-image building. 
> > > 
> > > OK for .dev
> > 
> > Can we please please please start splitting things up into common-linux
> > and common-glibc/uclibc instead?  That way we fix more than mips.
> 
> Good. I figured that I only needed this change to get it going.
> 
> Thanks
> -Khem

> diff --git a/site/common-linux b/site/common-linux
> index 8d915d0..17d7a8d 100644
> --- a/site/common-linux
> +++ b/site/common-linux
> @@ -10,3 +10,7 @@ samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=${samba_cv_HAVE_IRIX_SPECIFIC_CAPABILIT
>  # coreutils
>  fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
>  
> +# popt
> +ac_cv_va_copy=${ac_cv_va_copy=yes}
> +ac_cv___va_copy=${ac_cv___va_copy=yes}
> +

I've been thinking about this (but not found much time to act, sorry),
but we should, at least for common-linux/glibc/uclibc stop grouping by
package and start grouping by function.  And in this case, perhaps we
should do:
# va_copy
ac_cv_va_copy=${ac_cv_va_copy=yes}
ac_cv___va_copy=${ac_cv___va_copy=yes}

And similar for *{get,set}*uid* and so on.

In both -glibc and -uclibc, as that's a glibc feature.  For a Linux
feature, I know there's something like ac_cv__dev_is_files or so (about
to head out the door and already late) and that would be a common-linux
feature.

-- 
Tom Rini


