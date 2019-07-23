Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CBD7A7DE37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 07:53:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45t9hl6R7Qz1n;
	Tue, 23 Jul 2019 09:53:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563868424;
	bh=vYkbZxuZV6SHRtu4POqgwm1lWfd0uMIgom6rhxF4mZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gv3pPTn+mRiRFkEy71w3p/gmJHknEdKO/f2QPj99i/b/X+h60PRrrVIAPpgIbEIF4
	a+MMlPnbS9aQ8nMS3o7KLRRSl4MPyySLmuP8Y1ePsmPCIzqjVN4JnL8udJHb2bA5fa
	fpbE4P//bOCAzfrb8QfbqbxQV2OXhmTQ6elSLHlHPI+J2RQb78JOL+AvBnusjs+uA8
	TEJxhKPs2/3Am0bTJvM9zkVrZr7KYxtp4T3lrnlZxEINq5tP+9xC0/3UV4fawWcw2I
	NswEZNbj0SmkHUz6T9pvd3B1CfR81oCe0lViPlbOOkJRH64eVRR2ZUaYKdNut+y63P
	qx3iu4C18Kh+uB1Nusd1t2jHJfleimJLgNXYLWeEx86DRB1UDh3+tRkaTQDz7EzA9e
	s8CQkjvQ1m8RGU6vgjzOXu7Sismy5h4ewwpsoPcHKLYISSmdXB0SC0/o6CFTu6drdI
	fWOt4rwHt+cdin7F7kvETPek9a/Hly7YOuG/eCdhk/Z0mKyz31ghFb22ojQfpEW9fT
	99kkrW8rA1RyEVJDV0VbJLdK+hK+c9RULh03pMImBENJW9kqYRCirmh9Jdira+3CwA
	xOCuxML5mYRGLjtxWGZdGwrcHEWPEy+XgJog2PX/92Nu56Oj4HETaqblWHwZnrUnQ9
	Hi/mCbluLbJTV/6cmQoSDC0w=
Date: Tue, 23 Jul 2019 10:53:41 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190723075341.GB27144@localhost>
References: <20190722211814.14237-1-raj.khem@gmail.com>
	<20190722211814.14237-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190722211814.14237-2-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] log4cplus: Fix build with gold linker
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
X-List-Received-Date: Tue, 23 Jul 2019 07:53:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jul 22, 2019 at 02:18:14PM -0700, Khem Raj wrote:
> Fixes a potential linker error and eventual linker crash when using gold
> linker [1]
> 
> [1] https://errors.yoctoproject.org/Errors/Details/253440/
>...

AFAIR these build logs are not permanently stored, so quoting the error 
message might be more useful than a soon defunct URL in the git history.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


