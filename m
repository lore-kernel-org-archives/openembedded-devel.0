Received: from mail-px0-f188.google.com ([209.85.216.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NuxQU-0003Xw-W6
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 01:29:28 +0100
Received: by pxi26 with SMTP id 26so3853093pxi.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 17:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=TqQ3eHZQu+I3nmHwGeQKAeLrsCF/fd+S8oijjVb5gKY=;
	b=V58E7Cj8mjINmPZU0lFSpyOkZ5eZ0FxlB4kNGQmWpMmOADOudqaNc0XCWCxqc/ct3h
	LDL1RE6CenmZCnmVMgx7l2jNSxzvU4LrkmWo2I91V74O7odlMMuEvJBeClTHvNv10YSc
	cKxOgY3fsM9pSjE6alk+ToFT7ZGr2xZmANH08=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=GnNAECb4FZiurgFzJ3XR+fvK/fQfhwNldaGb3z1wOC2yuENz77gPyB9rS4kiA1yJVi
	btqxAC1JYNtmBjQLNzgH7izwCD/lUPbZz3mrxrs4bDPQG/oAf/GB1AUyeeFfUx7FbznH
	vf10LaTbAe0XN4DP/7YpcCCK/KTgq39NNG+AI=
Received: by 10.114.105.3 with SMTP id d3mr2932306wac.162.1269563175038;
	Thu, 25 Mar 2010 17:26:15 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 22sm248215iwn.4.2010.03.25.17.26.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Mar 2010 17:26:14 -0700 (PDT)
Date: Thu, 25 Mar 2010 17:26:34 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100326002634.GA18231@gmail.com>
References: <1269557553-6295-1-git-send-email-ospite@studenti.unina.it>
MIME-Version: 1.0
In-Reply-To: <1269557553-6295-1-git-send-email-ospite@studenti.unina.it>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.216.188
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] numptyphysics: update SRC_URI
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
X-List-Received-Date: Fri, 26 Mar 2010 00:29:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/03/10 23:52), Antonio Ospite wrote:
> The old SRC_URI doesn't work anymore, use vcs.maemo.org instead of
> garage.maemo.org as stated on https://garage.maemo.org/scm/?group_id=638
> 
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
>  recipes/numptyphysics/numptyphysics_svn.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/numptyphysics/numptyphysics_svn.bb b/recipes/numptyphysics/numptyphysics_svn.bb
> index dec9cf1..66bed53 100644
> --- a/recipes/numptyphysics/numptyphysics_svn.bb
> +++ b/recipes/numptyphysics/numptyphysics_svn.bb
> @@ -7,13 +7,13 @@ HOMEPAGE = "http://numptyphysics.garage.maemo.org/"
>  SECTION = "x11/games"
>  SRCREV = "109"
>  PV = "0.2+svnr${SRCPV}"
> -PR = "r1"
> +PR = "r2"
>  
>  inherit autotools
>  
>  SRC_URI = "\
>  # Maemo garage is sadly only available with https. Can make you trouble while fetching without accepting the certificate.
> -  svn://garage.maemo.org/svn/${PN};module=trunk;proto=https \
> +  svn://vcs.maemo.org/svn/${PN};module=trunk;proto=https \

does this also need updating checksums ?

>    http://wwwpub.zih.tu-dresden.de/~mkluge/numptyphysics_setup.tgz \
>    file://replay_off.patch;patch=1;pnum=0 \
>    file://next.png \
> -- 
> 1.7.0.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


