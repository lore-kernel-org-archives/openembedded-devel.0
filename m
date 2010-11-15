Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PI1cd-0008B6-3I
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 17:09:39 +0100
Received: by yxd5 with SMTP id 5so1137199yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 08:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=tXXOwZfyE0CCgHP78po6qH1TKXLNiMekLMUxBfSUKuo=;
	b=EpLR3aOmoQaWB/lXzp+dFEgm/6D6MyBI3efeIb8I1XHUP/y5yciCX1Ti54JhLBKIN7
	J62BtUMwz4BD/zkkfBf4m4riZs3LZyoY1vupdkGylInZzu9V78znJwuo+zexv9oJMVZy
	zQkh5HCfIvSdxYo8hFGGxbg837dZBxELiEqRw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=bZNYCR39mAfj3IDvjCDM3l98+7lOnQHhD+yRXeVB/H3f73AtamPqCzDbDGSS9fyufh
	YvXV9NxtcgTPDtp+ryQzacRtwXYmDWYdh+U0Ktrg3pnRiuDpgTymhkX+m9ylg2I97YCr
	sL1plzBBl4Ug7U/lNhln1MmM23uS507Cfp01E=
Received: by 10.204.15.146 with SMTP id k18mr6025575bka.98.1289837305897;
	Mon, 15 Nov 2010 08:08:25 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v25sm74863bkt.6.2010.11.15.08.08.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 15 Nov 2010 08:08:24 -0800 (PST)
Date: Mon, 15 Nov 2010 17:08:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101115160825.GB20958@jama>
References: <E1PI1cx-0004NG-U8@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1PI1cx-0004NG-U8@melo.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Alex Ferguson : dzen2: Modularize dzen-launcher, update recipe.
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
X-List-Received-Date: Mon, 15 Nov 2010 16:09:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 15, 2010 at 04:09:55PM +0000, git version control wrote:
> diff --git a/recipes/dzen2/dzen2_svn.bb b/recipes/dzen2/dzen2_svn.bb
> index 5ba54dd..893a577 100644
> --- a/recipes/dzen2/dzen2_svn.bb
> +++ b/recipes/dzen2/dzen2_svn.bb
> @@ -1,10 +1,11 @@
>  DESCRIPTION = "dzen is a general purpose messaging, notification and menu program."
>  LICENSE = "MIT"
>  DEPENDS = "virtual/libx11 libxft"
> +RDEPENDS = "ttf-dejavu-sans xrandr"

Please use RDEPENDS_${PN}

And actually learn something about practical differences between RDEPENDS and DEPENDS

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


