Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 265777E181
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 07:19:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457RwM0RGfz63;
	Tue, 21 May 2019 09:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558423171;
	bh=XhmqIEu64vybKrfHxMVANkRaWeR60WUf0Ht3OspLMbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NoKcoRumEL1OAjByX3rsbQ0FP87PlOkS8K7fIx2swrwzJZFXisEaMwKHExDzhnoHY
	agkcb5HD+zAr6VIjr5dpDplpW1YGIsa6ZaY7m+rsI7ASyoeRv5cTPRCGuotiVFw1b7
	EBDwZR1/3krdcLJ7yUcWe8nrGleDPZv69NKcETZKYpnvXoiGq2lDMjLk4RqUlWZXV8
	2ld1b0julTrDbuze+QQdd8BU7Q154lUAdBt9u+w3C22ScqZrpql798M3+i+gZwlvHN
	wdrMgOzP9kDCdEV102678sufalKrjvnc8t5jnlay8DfFFehmxpy82vVZfEjo6PHgNU
	yPruMa0nKgCcdvbMg0d5MVilhHPs/ooOy96MWCKcHR5+N5aa1E1RKIMmWlAe158aAC
	546S2zbEQ3gC0oI/wQiS8PPoOg83RQ+rqqFWz+yED85F7YVh2iYJZwrCoEHxBzVTHi
	2VMITjNdnsIZaX4+hpIYivVMVxLmXaY9+U4VjQ2OZf1+1oxPfa16D6GoGVlXG16+Ew
	GYP4GyKKJDwkg44nxVaH+ShzIaKbNziWc8sm4VBPKZ+sgOyoabVqaW25qwketvGwxW
	POtCZvQqpMxyLy13B8sBDHdfXzh7UuXT9/GGaPXKbLmlnmYfyg6lnksM/Od0Oe1c47
	SPFso+05j4X19j3xj7BOKwg4=
Date: Tue, 21 May 2019 10:19:28 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190521071928.GA15108@localhost>
References: <20190521065529.41647-1-raj.khem@gmail.com>
	<20190521065529.41647-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190521065529.41647-2-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] openocd: Fix build on x86_64
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
X-List-Received-Date: Tue, 21 May 2019 07:19:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 20, 2019 at 11:55:29PM -0700, Khem Raj wrote:
>...
> +Fixes
> +| src/flash/nor/esirisc_flash.c:95:9: error: 'PAGE_SIZE' macro redefined [-Werror,-Wmacro-redefined]
> +| #define PAGE_SIZE                       4096
> +|         ^
> +| /mnt/a/yoe/build/tmp/work/core2-64-yoe-linux-musl/openocd/0.10+gitrAUTOINC+7ee618692f-r0/recipe-sysroot/usr/inclu
> +de/limits.h:89:9: note: previous definition is here
> +| #define PAGE_SIZE PAGESIZE
>...
> +--- a/src/flash/nor/esirisc_flash.c
> ++++ b/src/flash/nor/esirisc_flash.c
> +@@ -92,7 +92,9 @@
> + #endif
> + 
> + #define CONTROL_TIMEOUT		5000		/* 5s    */
> ++#ifndef PAGE_SIZE
> + #define PAGE_SIZE			4096
> ++#endif
> + #define PB_MAX				32
>...

Are you sure this is correct?
This looks like two completely unrelated defines that just happen to 
have the same name.
And it worked by chance since they have the same value on x86_64.

Renaming to something like ESIRISC_PAGE_SIZE would be a proper fix.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


