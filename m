Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 92CFE7F333
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:51:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46K6Xt0d6yz2Y;
	Thu, 29 Aug 2019 17:51:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567093886;
	bh=8JGpJZiyWOsgnY4w6zTEAxg9BTfw2effEkBJhgVM9zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1JyMubWb7U1CuOSg/f7CFVDjAiYFXbxwh2pqrG3K522JwRxG3r+Vg8wycF9PYrHY
	wCGRtotMD6JD38NkNHaP5ZMu0nWkC7TYXSVIDcLsLFNHk0NXQegXH3mF7lgMo5YO21
	D7laUrlh9ls743U/Ti+ItBtI9jmVILmHP363sE7shlQBQMZkHZLS4b+hJw8kI39ygg
	/4oRUQpGO3Ls8gkI9TgTq215MUVa1Ud3BA54TciTtvPjTCkxjuUlLlRRgYw8o5V2rr
	weXF58iH679Gp9c3szNLtx/KNlCkme5PKJjY5Hp67HXvDuTL7LKrNhjoCsCQG+hpLL
	TrjcCr8xgfBqIUJTvEIbm3eO2pOWNJiTYYyER3bW3yG3+RDlSIFmVmUNKhwKb5ccKa
	xIZ/KpMRmQWvJvAA6pxbmB5a1z+Dvlpdl76pzD5ZhHcjy8ycSE8SUnbEURIujIHvGp
	vqD2qqPCOf/vYCLky8kxs23Zgf7sv+nL7csrpFJnzsRE707DIpimLXB1Zht2DkJI4T
	aHG1JFdf3J25+afmsd1L/ImkhWFtkgOG7X9ZjVMGK8Ec0a1aEDHfZwvGnKrt1eVgeS
	9Uk2rFXa3yyvX7JyX7N141ypaQZtE/AfxG7qc6Yhl4MnwQmE3Jy9J5Vx75ZUe+/gfd
	6uQqnWuqlDQeSQVAmFG87mRc=
Date: Thu, 29 Aug 2019 18:51:22 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Message-ID: <20190829155122.GA17820@localhost>
References: <20190829143506.19291-1-christophe.priouzeau@st.com>
MIME-Version: 1.0
In-Reply-To: <20190829143506.19291-1-christophe.priouzeau@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] python-script: update license md5sum
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
X-List-Received-Date: Thu, 29 Aug 2019 15:51:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 29, 2019 at 02:35:07PM +0000, Christophe PRIOUZEAU wrote:
> Update md5sum of license file.
>...
> --- a/meta-python/recipes-devtools/python/python-scrypt.inc
> +++ b/meta-python/recipes-devtools/python/python-scrypt.inc
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Bindings for the scrypt key derivation function library"
>  LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f"
>...

The actual problem is that this does not do what LIC_FILES_CHKSUM is 
supposed to do.

LIC_FILES_CHKSUM should verify that the license information in the 
software hasn't changed when upgrading it.

These recipes check the copy of the license text in OE instead,
which wouldn't change if the license of python-scrypt would change.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


