Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id B68FE77179
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 18:01:08 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so37251629pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 10:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=0/aTFT1taVyjazAM1D4SuJivtnuxkJMfWTPo5jtGPsg=;
	b=Jx5iMPvsiX8UX9lcErQMga4nle/xnbPs+tjEvzriRjQB2TfdNTtdE96gjN6H1Y5Ovg
	RZqG2zmbHc5/7HYJ2Jc2sT5A65GLTFEbRqgZBpxk5lFdRyss0muoWBB7q7c6PWk5iWqh
	LCRmuxm7H4iHO60Xbm4vunoAuassiMd/CQ4cDL/O4Cj4QLR0Cytni50w3yVsM379zWNx
	ucTxQ65OMyXPhCREvTzEbjSHpztPq+zzu3xv+2vBEaKeAMO1yzAPzasUE5UC4hs7SvLU
	XpB8T6xNpxFxxzzK0ELqUiMoCR7Db+fhDaN+3krtmtYiThL9UwTv31Lm6RXbtad8WZSz
	G+8w==
X-Received: by 10.66.122.39 with SMTP id lp7mr16341559pab.74.1447264868875;
	Wed, 11 Nov 2015 10:01:08 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:b99e:8fcb:e922:8a29?
	([2601:202:4000:1239:b99e:8fcb:e922:8a29])
	by smtp.googlemail.com with ESMTPSA id
	cx5sm10467585pbc.50.2015.11.11.10.01.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 10:01:08 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1447208258-28688-1-git-send-email-Randy.MacLeod@windriver.com>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56438262.6010603@gmail.com>
Date: Wed, 11 Nov 2015 10:01:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447208258-28688-1-git-send-email-Randy.MacLeod@windriver.com>
Subject: Re: [meta-networking/jethro][PATCH] lldpd: fix PN -> BPN SRC_URI for multilib build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Nov 2015 18:01:11 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 11/10/2015 06:17 PM, Randy MacLeod wrote:
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

cool. time to fire up the queue.

merged to my staging.

thanks
> ---
>  meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
> index ba7f09e..bd207ad 100644
> --- a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
> +++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/ISC;md5=f3b90e
>  DEPENDS = "libbsd libevent"
>  
>  SRC_URI = "\
> -    http://media.luffy.cx/files/${PN}/${PN}-${PV}.tar.gz \
> +    http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
>      file://lldpd.init.d \
>      file://lldpd.default \
>      file://fix-libevent-configure.patch \
> 

