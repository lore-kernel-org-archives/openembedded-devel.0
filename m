Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1KyFc1-0006Yb-AI
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Nov 2008 01:54:09 +0100
Received: from gandalf.denix.org ([71.255.226.167]) by vms173001.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K9X00GGYPSTBKA0@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	06 Nov 2008 17:12:30 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 35EF26B83A8; Thu,
	06 Nov 2008 18:12:10 -0500 (EST)
Date: Thu, 06 Nov 2008 18:12:10 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20081104194812.GA18457@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081106231210.GB32229@denix.org>
MIME-version: 1.0
References: <20081104005512.GA12988@denix.org>
	<200811041213.25205.zecke@selfish.org>
	<20081104194812.GA18457@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: hal-0.5.11 fails with external toolchain/SDK
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
X-List-Received-Date: Fri, 07 Nov 2008 00:54:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Nov 04, 2008 at 02:48:12PM -0500, Denys Dmytriyenko wrote:
> On Tue, Nov 04, 2008 at 12:13:24PM +0100, Holger Freyther wrote:
> > On Tuesday 04 November 2008 01:55:12 Denys Dmytriyenko wrote:
> > > Hi,
> > >
> > > New hal-0.5.11 from OpenMoko breaks builds with external-toolchain/SDK, as
> > > it hardcodes linux/input.h like this:
> > 
> > It is Openmoko, and I did add it.
> > 
> > what about something among the lines of?
> > 
> > echo "#include <linux/input.h>" | cpp | less | grep "linux\/input.h"
> 
> Thanks for the hint. I was able to fix it, so it finds the right linux/input.h 
> file even with external-toolchain/SDK.
> 
> The patch is attached to the ticket #4799 and this email. I was not able to 
> call autoreconf, as it was giving too many problems. autotools_do_configure 
> worked fine, but unfortunately, it doesn't take parameters to pass to the 
> oe_runconf, so I had to call it again with the correct --with flag. Let me 
> know if it's Ok or not. Thanks.

What about this patch? Does it look good? Any comments/suggestions? Can we 
push it? Thanks.

-- 
Denys


> diff --git a/packages/hal/hal_0.5.11.bb b/packages/hal/hal_0.5.11.bb
> index e93ad64..432af22 100644
> --- a/packages/hal/hal_0.5.11.bb
> +++ b/packages/hal/hal_0.5.11.bb
> @@ -1,8 +1,15 @@
>  require hal.inc
>  
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI += " file://hal-right-input-h.patch;patch=1 \
>               file://fix-configure.diff;patch=1"
>  
> -EXTRA_OECONF += "--with-linux-input-header=${STAGING_INCDIR}/linux/input.h"
> +# The following code finds the right linux/input.h,
> +# which also works with external-toolchain/SDK
> +do_configure() {
> +	linux_input_h=`echo "#include <linux/input.h>" | ${CPP} - | \
> +		grep "linux\/input.h" | head -n 1 | awk -F '"' '{print $2}'`
> +	autotools_do_configure
> +	oe_runconf --with-linux-input-header=${linux_input_h}
> +}


