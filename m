Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1S11s7-0001XV-FC
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 21:36:07 +0100
Received: by daln34 with SMTP id n34so2486984dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:27:43 -0800 (PST)
Received-SPF: pass (google.com: domain of tom.rini@gmail.com designates
	10.68.73.97 as permitted sender) client-ip=10.68.73.97; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of tom.rini@gmail.com
	designates 10.68.73.97 as permitted sender)
	smtp.mail=tom.rini@gmail.com;
	dkim=pass header.i=tom.rini@gmail.com
Received: from mr.google.com ([10.68.73.97])
	by 10.68.73.97 with SMTP id k1mr11892207pbv.61.1330115263923 (num_hops
	= 1); Fri, 24 Feb 2012 12:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=I27DiwB/1mUl1iTEHEUD+Sfmk9pL6FmafhZ8m0Zs3MA=;
	b=XRJs3Uj532ND+GnrZuAQrzjhuQATzvyKxEPEgRjWhLxKDLXlq3Z6WLhYryv3pEjrpl
	5ZXW203H3j61OhdVuEkZoZFoosXyOyhvemGHannobNBEEQhT42Z1g7oViq70Je9toRkw
	NzVwZhJ2RjE5eblm8FNulaoky2esZzmFwUVUU=
Received: by 10.68.73.97 with SMTP id k1mr9839707pbv.61.1330115263782;
	Fri, 24 Feb 2012 12:27:43 -0800 (PST)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id x3sm5215105pbn.5.2012.02.24.12.27.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 12:27:43 -0800 (PST)
Date: Fri, 24 Feb 2012 13:27:45 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20120224202745.GB14969@bill-the-cat>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
	<d82e988dbc2e27158a95ed67e17d80a4cb1781b6.1330097955.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <d82e988dbc2e27158a95ed67e17d80a4cb1781b6.1330097955.git.sledz@dresearch-fe.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 6/7] liblockfile: fix SRC_URI for version 1.06
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
X-List-Received-Date: Fri, 24 Feb 2012 20:36:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 24, 2012 at 04:47:23PM +0100, Steffen Sledz wrote:
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/liblockfile/liblockfile_1.06.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/liblockfile/liblockfile_1.06.bb b/recipes/liblockfile/liblockfile_1.06.bb
> index 0235dbd..5d540cb 100644
> --- a/recipes/liblockfile/liblockfile_1.06.bb
> +++ b/recipes/liblockfile/liblockfile_1.06.bb
> @@ -3,7 +3,7 @@ SECTION = "libs"
>  LICENSE = "LGPL"
>  PR ="r1"
>  
> -SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_${PV}.tar.gz \
> +SRC_URI = "http://archive.debian.org/debian/pool/main/libl/liblockfile/liblockfile_${PV}.tar.gz \

This is because it's no longer on the main mirror, yes?  If so, please
also switch this to a date-stringed snapshot.debain.org URL so we won't
have to deal with this yet again in the future.  Thanks!

-- 
Tom


