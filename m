Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 141817FCAB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 20:47:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 474Z5N5Wh0z65;
	Fri,  1 Nov 2019 21:47:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572641273;
	bh=9Jb/rR/Trq8Z7JQLhC7QdFsQiAkdBI5ZgPJA2Kr9UgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHyE5pJAC0PrFW5XmgLmcKP16yz6neEp3zhzQG5Tmk21ci9tC2HYiA3uiIBGJr96+
	44VRk/W8R/7+yviLHI6GszoKDh/Ir7+kb47c0s26dPSGUL2CtKQZ9xKGvcaMdfbrX8
	3m/ox2WwhK/xNCKKsUoBUTWPJwynMfPlUV5gdBHtVTuqrxedAv4S1RJxTpYMla491y
	/w5FD1Fxg3tcgx/3y6PbjPVQh+x0U6KwPmxxRb8gSnwtKLuM0P0cNq1tUl+sqPUwHK
	ASpFtv1aeI+BeVj3uc9VrKl0fJx8oDQpdTVaYId7aiCXwA7RojOqEst6ClReyBTZA3
	7jcdGp++N+Un48nGtf4dkyL5ba0QroAeuLdMz11Q+cY0yTnVtUktHNAHNNijBE21kI
	rqhlMW8DzRVsvRr43nfaaft5z6FPEw4DG5wcDdIGOtFmfgupdGgx1FA5ToMsZ54Cv9
	mFefAycAY2omlGAdGIENkECBmgsRvEenD+7MAu4a8m18cgGznXHWd4xSgyL6l1Iga4
	+lhcZj21+PVmK1lfnbxnWgWbHbwMJv/ngYeKGRa5/LqmpdQPKvsJpQZ7v6nsfPLPo3
	hNXGWAhGrMrK8MSZbqJUpiP07uQnFyGCM/mN4UNVe1pTugpefgUlRYqK2VPcQ7f1bs
	3eOTrQGa4yCH0toamnJq+AEY=
Date: Fri, 1 Nov 2019 22:47:50 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20191101204750.GA6557@localhost>
References: <1572600861-65655-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1572600861-65655-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] rtorrent: upgrade 0.9.7 -> 0.9.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Nov 2019 20:47:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Nov 01, 2019 at 05:34:21PM +0800, Zheng Ruoqin wrote:
>...
> index 9bb81c4..6f0e8c1 100644
> --- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
> +++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
> @@ -8,10 +8,10 @@ DEPENDS = "libsigc++-2.0 curl cppunit libtorrent ncurses"
>  SRC_URI = "git://github.com/rakshasa/rtorrent \
>      file://don-t-run-code-while-configuring-package.patch \
>  "
> -# v0.9.7
> -SRCREV = "327164f9d86aafcd2500a317d485374df32ea622"
> +# v0.9.8
> +SRCREV = "6154d1698756e0c4842b1c13a0e56db93f1aa947"
>  
> -PV = "0.9.7+git${SRCPV}"
> +PV = "0.9.8+git${SRCPV}"
>...

This is exactly the 0.9.8 release, please change to
  PV = "0.9.8"


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


