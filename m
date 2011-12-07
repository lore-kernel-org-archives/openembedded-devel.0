Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYPQT-0002yK-5J
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 22:53:17 +0100
Received: by iadj38 with SMTP id j38so1504660iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 13:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=4+Hm6z+7caW8D7cxwAgUGZlxmV0mbUbzQ2dUnQGXNfY=;
	b=hpXoCcfnQUwqqeU7vZviCRTOQoJWOzWDzOwDVsMZY3SGl6Cyh9lBcqpXxbVIKH0JVx
	lLOXu4kkcC0VUrwUKzEBKwK3SmxJESMuV3abjm7JIs9tOjxlZBTfu4+DQKsqP+xEjbRR
	t72HYebsX/p+sgPPqQJcEq9+79+ZxhpG48rpM=
Received: by 10.43.43.130 with SMTP id uc2mr695564icb.35.1323294387617;
	Wed, 07 Dec 2011 13:46:27 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id cz1sm11049340ibb.11.2011.12.07.13.46.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 13:46:26 -0800 (PST)
Date: Wed, 7 Dec 2011 13:46:03 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111207214603.GD6351@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>
References: <1323262428-856-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1323262428-856-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-efl] places: add autopoint
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
X-List-Received-Date: Wed, 07 Dec 2011 21:53:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/12/11 13:53), Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-efl/recipes-efl/e17/places_svn.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-efl/recipes-efl/e17/places_svn.bb b/meta-efl/recipes-efl/e17/places_svn.bb
> index 0abe138..103d720 100644
> --- a/meta-efl/recipes-efl/e17/places_svn.bb
> +++ b/meta-efl/recipes-efl/e17/places_svn.bb
> @@ -2,9 +2,13 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
>  
>  PV = "0.1.0+svnr${SRCPV}"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  require e-module.inc
>  
> +do_configure_prepend() {
> +	autopoint || touch config.rpath
> +}
> +
>  # Calls /usr/bin/eject for media
>  RRECOMMENDS_${PN} += "eject"
> -- 
> 1.7.2.5

you could also do

EXTRA_AUTORECONF = ""

which would remove --exclude=autopoint being passed down to autoreconf 

-- 
-Khem


