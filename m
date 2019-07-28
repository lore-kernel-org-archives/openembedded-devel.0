Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0381B7E621
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 10:51:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45xKPX5cvgz4M;
	Sun, 28 Jul 2019 12:51:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564311089;
	bh=1dFaVKp0ytS0KYqRQL71JEt5ZEecy1/KY209yfrLqic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oI1S6HFYC2GCq5gHx61Ki2bWwRBQSpTAYCVrgu2+qGQjeR9gzMaJhZIZrxyL1m8vR
	HB+MDUILkN1RZUh9b9hFy/K2DroSIGJIfVYMBZ79XpnS0k2HFuaaxwVGR9JTkAGGJp
	AYIVUX5QTOpr8k3sQVSP5ZySCRysqebm7S/rRC7D7CZrXmo8SzxaCVh9Hxk2njWBnV
	DX9aWfB/F0EFwDovuy9bY80GDCrh1XFsU9xnDsTXsKc6f0wkxkiND3LDuYxSJe+90T
	ReSCp52ywhq49TCV1BRyCRWQ7j8fdJQIatrUb9uIKjgutv8fYmt/iAZYNqIVHlBdPv
	WqyNOfDUhWWI1IaPQXTZVpuriFUwCqVT+bO4PUqM5O76NQj7UHkyg1T9FkUH9byM3x
	4zAMzpDKq5LKCZ94U2qoryUxm0qBi9jOdelYx/uddkAAqQwmJeVxvCrzevIG2KGmn2
	5jOHQBq9yl8CkgdKAvgeyi+0fakxyrH7Ke0hCs5lI4HG9yWQfkcONh/BT/4NVCmFnw
	EVqmhhcbS1fvKeqlwxua4CcD0xJJBRaO6LVokL9arVCCXwpSuraw9MWZCOYXHY6tHf
	TiYLrGD++Ar1JNv6C/ncf117z6+jVrDTiCwpTHSpPAFw3lokpfF6pBdMlJqwpD5UtE
	CkJEDxzHXuiG+FV60y2Kdf7s=
Date: Sun, 28 Jul 2019 13:51:26 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190728105126.GA21223@localhost>
References: <20190723151649.9238-1-bunk@stusta.de>
	<CAMKF1srWP3iFCHveAGELyZzQ0QeB16PG7+2H536au1QAoWOqCA@mail.gmail.com>
	<20190724103835.GA27634@localhost>
	<CAMKF1spNvU2v5n+_a479E5ZEjGD5nti5Wmcv2aaV07nE_kg4mg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spNvU2v5n+_a479E5ZEjGD5nti5Wmcv2aaV07nE_kg4mg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] meta-oe: Inherit gnomebase instead of gnome
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
X-List-Received-Date: Sun, 28 Jul 2019 10:51:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jul 24, 2019 at 06:34:24AM -0700, Khem Raj wrote:
> On Wed, Jul 24, 2019 at 3:38 AM Adrian Bunk <bunk@stusta.de> wrote:
> 
> > On Tue, Jul 23, 2019 at 06:44:49PM -0700, Khem Raj wrote:
> > > This causes
> > > https://errors.yoctoproject.org/Errors/Details/253988/
> > > maybe due to atkmm change is exposing another missing inherit
> > >  gnome-system-monitor -> gtkmm3 -> atkmm
> >
> > Does gnome-system-monitor build for you with musl without my patches
> > applied? It doesn't for me.
> 
> Yes it did and build again after reverting there is a chance of race
> condition but this package has not failed before

My musl build failure was actually an undeclared dependency on polkit,
I'll send a patch for that.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


