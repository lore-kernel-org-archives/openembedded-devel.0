Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Sbgze-00072D-Ee
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 01:47:26 +0200
Received: by pbbrq2 with SMTP id rq2so6876969pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 16:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=B6uh5W4aQgJIayG48Esp5W8xhYzDTPR01aCzj9bMKyo=;
	b=JUc7xJuRAeWQ7xgwZxURfjXBfc/nfD9HLo7T8t3U/OV1s2arHK9feWiJnzD5GPDkrN
	5O2g+irvaWRQ8OocBUsFwsSZLFkxKND7wbtjbJbTne9vLiR0G4FHcMjL9Ejy3r8TT1L2
	+55nV84nOsH7lS2bbUDpO8tiV6DLClLtkFUt7zLvTbgmBSSrMo5lE7hvh48rIaGmqCt/
	pY2dd8TDqoCC2SGF4x4yJocKi3/XWU9zenpx+bhuR7l8h2IYOrrW2JpNyvdJiwPy1Isu
	6hmiFgkTRa7zjhzC/IpKPcz7pNJnucDp4KfwwBL9plt/8UB97VWyqs5zSPpLhhrEc6ux
	KyOQ==
Received: by 10.68.219.166 with SMTP id pp6mr43074106pbc.35.1338853020320;
	Mon, 04 Jun 2012 16:37:00 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id kt1sm214091pbc.32.2012.06.04.16.36.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 16:36:59 -0700 (PDT)
Date: Mon, 4 Jun 2012 16:37:00 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120604233700.GE19651@bill-the-cat>
References: <1338514403-9477-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1338514403-9477-1-git-send-email-raj.khem@gmail.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH V2] classes/mirrors.bbclass: update debian snapshot mirror url
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
X-List-Received-Date: Mon, 04 Jun 2012 23:47:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 31, 2012 at 06:33:23PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  classes/mirrors.bbclass |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/classes/mirrors.bbclass b/classes/mirrors.bbclass
> index 71ee5f6..1f509df 100644
> --- a/classes/mirrors.bbclass
> +++ b/classes/mirrors.bbclass
> @@ -1,6 +1,8 @@
>  MIRRORS[func] = "0"
>  MIRRORS () {
> -${DEBIAN_MIRROR}/main	http://snapshot.debian.net/archive/pool
> +${DEBIAN_MIRROR}/main   http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool
> +${DEBIAN_MIRROR}/main   http://snapshot.debian.org/archive/debian-archive/20110127T084257Z/debian/pool
> +${DEBIAN_MIRROR}/main   http://snapshot.debian.org/archive/debian-archive/20090802T004153Z/debian/pool

Isn't that backwards for say kernel.org mismatches?  Or am I forgetting
that we already fixed that and switched to new checksums?

-- 
Tom


