Received: from mail-yx0-f193.google.com ([209.85.210.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nx4ZI-0005Jw-Ih
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 22:31:17 +0200
Received: by yxe31 with SMTP id 31so278006yxe.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 13:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=sOzJjjP4I15JzvfE1huHjcefnXQCMy9RI0pXVv5vyT4=;
	b=lLOK99P1Egz0o5zekorseu9ehXeqO8Pzml9zvZfGjnYdvQRiHnDJDCm96C2LN+q6Ax
	LdWdqrjX8k61HQJKoLFT4Km4yrkwNO5+pBBXukXCW5vrfJv32DhNaSV/w0SDozznba16
	UOtnrWOJTvnyBLiM9ThvOjr0oYxpIODkX1zVY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=LxzVR59SBQIjM1hbIQmWcHk0k0oL38Zsp6PwS/Ck43GflWP6hjc+n3ymAVw1jlJxfy
	1URMF2CgGP592Y8GQbpsKOYcI8kLxfhgFWjFZ9yRSCFKnl+lwiq6wISOL9TKiE5lRWzm
	AfI/UO1DeFm3K9HuDlKNi4+YhE0onESCmX5h0=
Received: by 10.91.39.4 with SMTP id r4mr455110agj.107.1270067276341;
	Wed, 31 Mar 2010 13:27:56 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 21sm1605110ywh.32.2010.03.31.13.27.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 31 Mar 2010 13:27:55 -0700 (PDT)
Date: Wed, 31 Mar 2010 13:28:45 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100331202845.GC21433@gmail.com>
References: <1270061972-5564-1-git-send-email-khimov@altell.ru>
	<1270061972-5564-2-git-send-email-khimov@altell.ru>
	<1270061972-5564-3-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1270061972-5564-3-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.193
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] postfix: add 2.7.0 version
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
X-List-Received-Date: Wed, 31 Mar 2010 20:31:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/03/10 22:59), Roman I Khimov wrote:
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/postfix/files/volatiles  |    1 +
>  recipes/postfix/postfix.inc      |    2 +-
>  recipes/postfix/postfix_2.7.0.bb |    6 ++++++
>  3 files changed, 8 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/postfix/postfix_2.7.0.bb
> 
> diff --git a/recipes/postfix/files/volatiles b/recipes/postfix/files/volatiles
> index bc330c9..3df6fb4 100644
> --- a/recipes/postfix/files/volatiles
> +++ b/recipes/postfix/files/volatiles
> @@ -1,4 +1,5 @@
>  d postfix nogroup 2755 /var/spool/mail none
> +d postfix nogroup 0755 /var/lib/postfix none
>  d root postfix 0755 /var/spool/postfix none
>  d postfix root 0700 /var/spool/postfix/active none
>  d postfix root 0700 /var/spool/postfix/bounce none
> diff --git a/recipes/postfix/postfix.inc b/recipes/postfix/postfix.inc
> index 5b18cef..51d5e8f 100644
> --- a/recipes/postfix/postfix.inc
> +++ b/recipes/postfix/postfix.inc
> @@ -5,7 +5,7 @@ LICENSE = "IPL"
>  
>  INC_PR = "r13"
>  
> -SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
> +SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz;name=postfix-${PV} \
>  	   file://makedefs.patch;patch=1 \
>  	   file://install.patch;patch=1 \
>  	   file://main.cf_2.0 \
> diff --git a/recipes/postfix/postfix_2.7.0.bb b/recipes/postfix/postfix_2.7.0.bb
> new file mode 100644
> index 0000000..fc41fad
> --- /dev/null
> +++ b/recipes/postfix/postfix_2.7.0.bb
> @@ -0,0 +1,6 @@
> +require postfix.inc
> +
> +SRC_URI[postfix-2.7.0.md5sum] = "df648f59421604e895cce56325f00bae"
> +SRC_URI[postfix-2.7.0.sha256sum] = "c5b232ae5e396107bc58aed4178cf6cfd0a75b9dcbbedb49d158eb71d6c91b75"
> +
> +PR = "${INC_PR}.0"
> \ No newline at end of file
> -- 
> 1.6.4.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


