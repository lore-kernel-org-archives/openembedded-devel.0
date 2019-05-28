Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CFD346C4F2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 21:20:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45D6Fp1Rlcz54;
	Tue, 28 May 2019 23:20:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559078446;
	bh=UEzfqtiIHBfCaAXvVDEcTIclO9pg5kH5QWbPgYchRGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbxsDUbDO/s7lGtGr+IJ5ZiWoklM8NL9Q/2EkS6W/Gxy8Nw8CjBc26FneDit1oWDm
	ll5I8s5AGal0HMSOKFUU+r1a3dkL6JLoJtly2+sPjo0Ye4fQdPb2JuMgoxpB0OlZRZ
	2OAjE2ZmuHu6TGlGC0j2n70YU6h7NT9h7mGFip0LxLfihhcYU4DJm/iNwdB0rLn63F
	qsQgzdjiyI6MUiDwLer/QBVk6uxw0Bp+A1lwi8QHSrrC+V8OReUDXnty9IrF/g7JOS
	hv+JzG2D+ftbhGula8V96yHSII2yq15VVBSApOW9x+0D0y998UpjgaNN381qfq8kDp
	CZ7bBpGTnrAyGp5i9K+w+/caGLk4OrYHZRIylYYiAMIuUK92bGaw0eGScbXmRye0TT
	URt6M6ieeJYwe1PWCAidgFMbwjORi5b8TcwAxFun3JvDildlJcImeCoIPK0gp0cG+0
	NhG/N0Z9sRjjGwrvB+2HvRPV94JMnOmOUzzwq2X/FVbo2XzgtVc5JGfLJ2PrIf5L1G
	LJKiP91xHQOWZNY+oijGpLIYkLO7mR2y/dD6+w1qhbtBTu4h58PMrUPiJLutHlpkbM
	0mhCgOu4o9cyw9Y9l7aUE1dF4bCNBU944I6XQVyuWIp8Xo9cGhk9vWtp2lLs2R8vg9
	AqJvn2mWiiFmj90m44O7LAso=
Date: Wed, 29 May 2019 00:20:43 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190528212043.GA23804@localhost>
References: <20190522131345.10392-1-andrei@gherzan.ro>
	<CAMKF1srfV74+4jODJtnOtgKwSBtBgznGENOZFOvkp+vZ7BdAoQ@mail.gmail.com>
	<119819b9-eee8-442e-f4bd-b4005b0a1a6d@gherzan.ro>
	<CAMKF1srx8acL-pQu6HWt3KutcvTNu=X-Fweos2XZ6vO-mLyK7Q@mail.gmail.com>
	<20190528180655.GA14708@localhost>
	<CAMKF1sqAzXc+iMFqqWU_-p_3e5aifuQtZWMPwxcBghwrPm9vmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqAzXc+iMFqqWU_-p_3e5aifuQtZWMPwxcBghwrPm9vmA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Update to 1.18.0
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
X-List-Received-Date: Tue, 28 May 2019 21:20:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 28, 2019 at 01:37:21PM -0700, Khem Raj wrote:
>...
> That could be improved. Probably adding this function to musl is not a bad idea
> 
> something like
> 
> char *secure_getenv(const char *name)
> {
>  return issetugid() ? NULL : getenv(name);
>...

I didn't know that musl adds non-standard functions like issetugid()
that are not in glibc.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


