Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E38A57DE8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 19:37:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45D3yn62wtz54;
	Tue, 28 May 2019 21:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559072258;
	bh=qYG9oLlvddZ9LBrEVUhUKtjNqOx8n5Rvgpskkdhc85s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VyznLsPXspyPk/6nN502ZTpO3Tulx7A/l36EGsY22uX6keasYv7xtmZvx9AV254ek
	OHs7hIPR3YgtiQvhBnUG5rkTyXru9vMX3e8/WFV2G9STqMkfy0ahExDhXi66B8iGQ1
	UFLy+WocTxkBH3akuK3vGoizkY/N10CMSuPdIWMM6qdfEmmCtaD4AtIKoMQqElq8i3
	nffuQ2WlQfIxtLyn2iPcTjAJridDz8yNVC8IdFZ2KleYRvs8MKVnx73RyChX6XPhOG
	e4sFwmExpK+BCvZIMnsOT9WxwWduTvpIyGDw2wINK5zQtRlRWKxCwQenBSrtMutQmx
	zicXfXtE185YzXNwRAf4DNShaSNSsP5Lw+//jwTDOXj+Is4c/nPIu8ixzMDe9noyVj
	TKPSlK88fkX5z/zLPxceLhpHT97OhiAkswxH5GmSf/b/NlqvYaMUiMxChO6ER4NbfO
	EJwQate5Pjj5AWJRdNq6dshJOT1X/IFr0Wxp90M+RYL5uaCAjQYa9ljF/OZfgA25N7
	Zf6Kgep/30B0z+rR7uqH9NmYb79jmcy+5/ULFHJyjW/6TQnDic6x6Des+9947jyFP+
	G5YGU1mHeZ3j5+6x2rZUg74o6D57F2X/PUPKtDTV4DvwXrv4OvdUQNrCKuWqx9cFSh
	fZIa/ietNxBkvnH2USvdWljU=
Date: Tue, 28 May 2019 22:37:34 +0300
From: Adrian Bunk <bunk@stusta.de>
To: changqing.li@windriver.com
Message-ID: <20190528193734.GA18778@localhost>
References: <1559011919-113581-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1559011919-113581-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] phoronix-test-suite: add rconflict
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
X-List-Received-Date: Tue, 28 May 2019 19:37:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 28, 2019 at 10:51:58AM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> phoronix-test-suite rdepend on lsb, lsb rdepend on lsbinitscripts,
> lsbinitscripts rconflict with initscripts-functions. so also add
> rconflict for this one.
>...

In what situation is this needed?

It sounds wrong if rconflict from lower-level packages have to be 
replicated in higher-level packages, and is likely to break in the
future.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


