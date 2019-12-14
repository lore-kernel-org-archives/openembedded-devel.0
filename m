Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 086887F68E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 14:21:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47ZqT91990z52;
	Sat, 14 Dec 2019 15:21:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576333262;
	bh=BiHsfPIjZprS2srsXpWTPES0FqS22Wro7/EtKinCLTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJlKPHq/S5pBsBunIgW2swjA0aUr65VQAKq22/p7ix/w5dikVt82ASOlszL0iQzGz
	jr50QKhSKgNmDam1vqqDLTL4Y15UlIWrf+OW00fNU1FurEhalCQW2XqmV9BwhjnpkZ
	6XSp+SjAPE0w85LhdQWirAWieCW8HAUrnz/W/FNex6e2aJw7UQgtL1aE//CrlKP/Mm
	2nsDdNeaeZEwyyygNTOWMTek8m5sa6PAtxGETIRth/smyqymAHzCk9ha5pte9AL/Mr
	WMsflgi8ztXtv0drlPqdgVXut2nahXJjklK6gLJCb8OIG5iqr3EYXA37XXybIp40pt
	ccYWT7NKHJ25Mk//7gbkzEWJGJJHRKBfmEiSdIGkybteCtw0+J1R9qYD+SdKcelnYP
	QEzyOuJfgg6tt7PWd5y5N1JeV4/SK32PFXasBYLgf4iRbPghYuZJZeDGabfvcsACVj
	8dDHInqkAJ11FolR623RNFaKoQewCMpGQ5EQfDr55HJfkpe0km3O6e+rXXJlFYkXpL
	OJ52Ksu3qu2RBFIooj5vAk6neBI7aMNTlkLLnp61Shx7HHzVXxUYNspo3tRCG7mcW5
	6W3NKJjBdhLBRILSd/re8tsPQF+146zQf2ppRelfN6CRmEqMmhD9dbGcnKGyPRQU0n
	OBI6yfQv9xcHnDkBOK9lcT5g=
Date: Sat, 14 Dec 2019 16:20:59 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191214142059.GE8776@localhost>
References: <20191212202252.2786262-1-raj.khem@gmail.com>
	<20191212202252.2786262-3-raj.khem@gmail.com>
	<20191213043716.GA30893@localhost>
	<CAMKF1so-nxHanPu6Nv3arQmSNoMyHwVj43+Myd6ZNeY=qVHU6A@mail.gmail.com>
	<20191213225815.GA8776@localhost>
	<c195b79f-5c33-69d8-ab72-d432254d78ef@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c195b79f-5c33-69d8-ab72-d432254d78ef@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xterm: Fix latent issue found with musl
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
X-List-Received-Date: Sat, 14 Dec 2019 14:21:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Dec 13, 2019 at 09:55:49PM -0800, Khem Raj wrote:
> On 12/13/19 2:58 PM, Adrian Bunk wrote:
> > On Fri, Dec 13, 2019 at 01:55:33PM -0800, Khem Raj wrote:
> > > On Thu, Dec 12, 2019 at 8:37 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > On Thu, Dec 12, 2019 at 12:22:52PM -0800, Khem Raj wrote:
> > > ...
> > > > > +_POSIX_SOURCE is app-defined not system
> > > > 
> > > > This is true for musl, not for glibc.
> > > > 
> > > > The handling of _POSIX_SOURCE and _POSIX_VERSION differs between musl
> > > > and glibc due to glibc supporting older POSIX versions, and glibc also
> > > > supporting developers of portable code to select some specific older
> > > > POSIX version.
> > > > 
> > > No thats not right.
> > > _POSIX_SOURCE (like all FTMs) is
> > > defined by the application to request a feature/standards profile
> > > it's not libc telling you "this is posix" or anything like that.
> > 
> > It is also defined when _POSIX_C_SOURCE is defined, or _GNU_SOURCE,
> > or when the default non-strict gcc mode is used.
> > 
> > The latter means that it is in practice nearly always defined when the
> > libc supports applications written against older versions of POSIX.
> > 
> but these macros are not used in this case so its irrelevant here.

No macro has to be used, with gcc default settings _POSIX_SOURCE
is defined:

$ cat test.c
#include <unistd.h>
int tmp = _POSIX_SOURCE;
$ gcc -O2 -Wall -c test.c 
$

musl is different, since it does not aim at fully supporting 
applications that were written against an older version of
the POSIX standard.

> > > _POSIX_VERSION tells you that
> > > ...
> > 
> > _POSIX_VERSION being defined tells you that you have unistd.h included.
> > 
> > With glibc the value of _POSIX_VERSION depends on what feature/standards
> > profile the application has requested.
> 
> I would not look into how glibc does something and call it standard.

I would not look into how musl does something and call it standard.

I checked what musl and glibc do and what the standard says.

> It guards these definitions by its internal defines ( prefixed with __) which
> is internal to a libc implementation,  applications are not exposed to 
> private namespace.

_POSIX_SOURCE is defined in POSIX.1-1990 and mentioned in later versions 
of POSIX.

_POSIX_VERSION is defined in all(?) versions of POSIX.

cu
Adrian

