Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MdzNO-00038Y-Qp
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 06:35:52 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KON00AQ6QMXQ1QF@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	19 Aug 2009 23:18:34 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8B95D14AF5F; Thu,
	20 Aug 2009 00:18:33 -0400 (EDT)
Date: Thu, 20 Aug 2009 00:18:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820041833.GG32010@denix.org>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com>
	<1250738680-20274-4-git-send-email-clarson@mvista.com>
	<1250738680-20274-5-git-send-email-clarson@mvista.com>
	<1250738680-20274-6-git-send-email-clarson@mvista.com>
	<1250738680-20274-7-git-send-email-clarson@mvista.com>
	<1250738680-20274-8-git-send-email-clarson@mvista.com>
MIME-version: 1.0
In-reply-to: <1250738680-20274-8-git-send-email-clarson@mvista.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] bitbake.conf: BUILD_LDFLAGS: use $ORIGIN in the	-rpath rather than a full path.
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
X-List-Received-Date: Thu, 20 Aug 2009 04:35:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 19, 2009 at 08:24:39PM -0700, Chris Larson wrote:
> Signed-off-by: Chris Larson <clarson@mvista.com>

Hmm, interesting. I didn't know about $ORIGIN...
But what is the benefit here? To be able to move $TMPDIR?

> ---
>  conf/bitbake.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 371bf8e..9cb6039 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -447,7 +447,7 @@ export SDK_CXXFLAGS = "${SDK_CFLAGS} -fpermissive"
>  
>  export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
>                          -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
> -                        -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
> +                        -Wl,-rpath,\\\$\$ORIGIN/${@base_path_relative(d.getVar('STAGING_BINDIR_NATIVE', 1), d.getVar('STAGING_LIBDIR_NATIVE', 1))} -Wl,-O1"
>  
>  export LDFLAGS = "${TARGET_LDFLAGS}"
>  export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${layout_libdir} \
> -- 
> 1.6.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


