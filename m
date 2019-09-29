Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 2B42C7F275
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 16:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB36E40BD2;
	Sun, 29 Sep 2019 16:20:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id CWwAIAHuhgkm; Sun, 29 Sep 2019 16:20:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B99DC40BA9;
	Sun, 29 Sep 2019 16:20:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BC24E17421E; Sun, 29 Sep 2019 12:20:07 -0400 (EDT)
Date: Sun, 29 Sep 2019 12:20:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190929162007.GZ30018@denix.org>
References: <1569632199-7446-1-git-send-email-denis@denix.org>
	<20190929124339.GC30130@localhost>
MIME-Version: 1.0
In-Reply-To: <20190929124339.GC30130@localhost>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Sun, 29 Sep 2019 16:20:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 29, 2019 at 03:43:39PM +0300, Adrian Bunk wrote:
> On Fri, Sep 27, 2019 at 08:56:39PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > The old URL now gives 404 Not Found
> >...
> > --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> > +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> > @@ -4,7 +4,7 @@ SECTION = "libs"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> >  
> > -SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
> > +SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
> >...
> 
> This change should first go into master (and also warrior).

Yeah, let me just go downgrade master and warrior to this old version, 
so I can fix the download URL...

-- 
Denys

