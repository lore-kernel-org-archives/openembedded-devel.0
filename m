Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D5B8C7EEB5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 17:21:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45sBNC0xg6z56;
	Sun, 21 Jul 2019 19:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563729660;
	bh=PUR9T+43Tyrjm1l/5sTwFX3jRXsITPUWqsQl32P7NB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhYX4fdXSwpzEGV3QK7dnErKzLkQRWyYcEeo6C+yFOp61xmX2AUCV7bzjOwaC6F1+
	NyWzorx1E79REdddyHhfrq2PGqlIqNw3XVqzdJfKCKZ2VcWXeCSXDVGKrdTd5lW4lV
	D2immcOOJtF4JgTKWDuh5+OvH/BAwoFjQ/yLKsu9S4LEMGN45KsAyA4+ORXCfxvGPB
	40Dlr1R9UXCdwYoNL7ZJTyirl/lD0XU6DskSJ42R0rXPDohZlutZGb37MxsuU25SOH
	yFyYIxQiMzkNn0OoL9YdCJxRr8pqZgP9yQm4bu0zhdoI3XafktHqQlyzyvIEibsJW6
	DpfyChanmqFvTlUisFxbRvv51jlplsKanwdHiWIYyp8HQI6rnV5OBGA4+1PDoMc8qh
	Yf2hqyyLilqCKb2T+Ne0hKLvJtpIReerS4bF4EYmrJX3nT19WHMTX1nS0qKFRsBINZ
	BMi3hDtEGFLkDJvmigqWZlfam28NAE3ZTKmOK8HK4sENj6Vytbsefg862inWceK0UY
	kfnol8do22WSF5hyILh8mYis/4NzpTYiTB4OncwaeVc/J4g3/H+c/O6mWN9pLo0foa
	TJfm2ANkqMhSoyNgNGgfC5SOuY2VTp1zb8eAYr1sZ9lc/Cg1joGX28j+bsjjdImL6M
	EQU+tx+DKj/O/iV3XA8KiepQ=
Date: Sun, 21 Jul 2019 20:20:57 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190721172057.GC8967@localhost>
References: <20190718042123.61092-1-mingli.yu@windriver.com>
	<20190718042123.61092-2-mingli.yu@windriver.com>
	<CAMKF1sqTTzTSgXFHeizk7hgdCJ9=sBjJ56_BtNk1mJWf1FN5Ag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqTTzTSgXFHeizk7hgdCJ9=sBjJ56_BtNk1mJWf1FN5Ag@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] log4cplus: Upgrade to 2.0.4
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
X-List-Received-Date: Sun, 21 Jul 2019 17:21:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jul 21, 2019 at 09:27:33AM -0700, Khem Raj wrote:
> seeing gold linker crash on arm
> 
> https://errors.yoctoproject.org/Errors/Details/253440/
> 
> however, this is a linker problem which is latent until this, I would
> like to see if we can find a solution
> before applying this patch

Doesn't look like a linker problem to me, except that it also returns an 
internal error after the diagnosis for the actual problem.

My untested guess for a fix would be a backport of
https://github.com/log4cplus/log4cplus/commit/e0b046fbc90cee67ccff83dac04635755d7fa754

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


