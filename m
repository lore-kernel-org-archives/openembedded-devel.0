Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ls81m-0003TC-Uz
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Apr 2009 06:07:45 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHV00DE69YVIB8J@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	09 Apr 2009 23:04:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A1AC26B83A8; Fri,
	10 Apr 2009 00:04:06 -0400 (EDT)
Date: Fri, 10 Apr 2009 00:04:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090410040406.GA28306@denix.org>
References: <1239335608-11080-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1239335608-11080-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] gegl: fix CR+LF newlines in the patch, as it	fails to apply
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
X-List-Received-Date: Fri, 10 Apr 2009 04:07:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 09, 2009 at 11:53:28PM -0400, Denys Dmytriyenko wrote:
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>

Ah, as I thought - CR+LF newlines were lost somewhere in the MTA/MUA 
transfer...

But, if anybody cares, you can download the patch by wget and examine it in 
hexview :)

$ wget 'http://cgit.openembedded.net/cgit.cgi?url=openembedded/patch/&id=51893f23d9ec8ba94d9a29be7da3914bf2259eaf' -O gegl-newlines.patch

Not sure why my quilt/patch fails to apply the patch with CR+LF newlines 
though, as it appears to work fine for others.


> ---
>  recipes/gimp/gegl/gegl-resilience.patch |   22 +++++++++++-----------
>  1 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/recipes/gimp/gegl/gegl-resilience.patch b/recipes/gimp/gegl/gegl-resilience.patch
> index 0e35dd5..70424ec 100644
> --- a/recipes/gimp/gegl/gegl-resilience.patch
> +++ b/recipes/gimp/gegl/gegl-resilience.patch
> @@ -1,11 +1,11 @@
> ---- trunk/operations/external/ff-load.c	2008-12-20 13:37:05.000000000 -0800
> -+++ trunk/operations/external/ff-load.c	2008-12-20 13:37:22.000000000 -0800
> -@@ -278,7 +278,7 @@
> -       p->enc = p->video_st->codec;
> -       p->codec = avcodec_find_decoder (p->enc->codec_id);
> - 
> --      p->enc->error_resilience = 2;
> -+      p->enc->error_recognition = 2;
> -       p->enc->error_concealment = 3;
> -       p->enc->workaround_bugs = FF_BUG_AUTODETECT;
> - 
> +--- trunk/operations/external/ff-load.c	2008-12-20 13:37:05.000000000 -0800
> ++++ trunk/operations/external/ff-load.c	2008-12-20 13:37:22.000000000 -0800
> +@@ -278,7 +278,7 @@
> +       p->enc = p->video_st->codec;
> +       p->codec = avcodec_find_decoder (p->enc->codec_id);
> + 
> +-      p->enc->error_resilience = 2;
> ++      p->enc->error_recognition = 2;
> +       p->enc->error_concealment = 3;
> +       p->enc->workaround_bugs = FF_BUG_AUTODETECT;
> + 
> -- 
> 1.6.0.6


