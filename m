Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 58EA27DAD9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 12:43:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46h4vx3gMXz65;
	Sun, 29 Sep 2019 14:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569761022;
	bh=6m84RTbGDj3B4hHgDGnebsEll7nBzOnTHKxthd0/WbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PE076gT42f0Yj67ONQ5GfEX8Xw5J/Y36idjLx37simEU46TrZO1DChfkIgEFfcdLN
	jLbcsytKw6UBGWwIbTSwvF0fzOt3KZMYPYsrH5yxbUx5oNE/q0BDw8QDhAwYH80nax
	9qaPTGsJCE74rStrG8nng96hh/OE22qK/jqALu4bW1wUTS9dLMvGSzfe364e7XKPam
	v7qe1HkSKgTVrwHe4lPxBe6NAOedsAj3eEG/JnffEUt8h6o4aF+NchG4b/ukqnGt/f
	qCX0iuJ4u3atWNfmBHn8NbHG9VNAzVzGA8F4lb3zlr6hOadxwK/UTvDQ7X29B74gsP
	8QPJHy5LU0Gjj5zG9jW8ZjU2/e+c+XNVRB76nULgLNsY6OjvNviGMYj2+ZWd+R7n9R
	A1azkR/TSK5B/PSt3tEltgG6rZrzExqAn9omHIiEkLn+D1mPsSr1cWvx1hC61B8sY1
	EiWgtFFh9ls7hAY9fqqfjMgaZLWa1GMDzU6A8WRSj9ebFLPGBLtQGSZdygnSdnfYzF
	GgICq/l+4GD/5YpW6j/R9zCDqZ8lByMe1PVm7qgUY/F4HFBzOtO7JcvRRpIJF3EPW2
	zLSRMj3TJQEKA+n8COZOBtV1p7k7kyNcn850vSRuZOGQhZfYXrzkY7pGgU8Ct5mraf
	dvH3I8QQ8kogpzU38YMTI/gA=
Date: Sun, 29 Sep 2019 15:43:39 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20190929124339.GC30130@localhost>
References: <1569632199-7446-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1569632199-7446-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [thud][PATCH] mariadb: update SRC_URI, as 5.5.64 has moved to archive
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
X-List-Received-Date: Sun, 29 Sep 2019 12:43:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Sep 27, 2019 at 08:56:39PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> The old URL now gives 404 Not Found
>...
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -4,7 +4,7 @@ SECTION = "libs"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  
> -SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
> +SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>...

This change should first go into master (and also warrior).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


