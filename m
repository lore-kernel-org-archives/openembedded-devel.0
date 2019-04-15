Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EC9127D96D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 11:44:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44jRVN6VsHzFl;
	Mon, 15 Apr 2019 13:44:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555328653;
	bh=MUbJ6OwywvXDsszO/d3q3VRF8JXnXxLgklVwf4vgty4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCbfQYQQVPBzC75g988iENUP20wU8XvLGxjnYSFUS+WfSJnERBci1+j47qT+ldbQ4
	x1cMt+xQEq9nOcg6G/kcrC5oWo5F2qQcnwSJBq7kcHvPRKfi5J/oSAUntNvXgupp/N
	fD2ZRDTf/zb25bSM0VCpy3UunTnmiRdQw9Wg9oM/RsfZHIVPPzxt1wknRLSqaaon7L
	AcfDGLmrgQ7blP79KViVyed+ek6o7aq9vdOzS+w8tQRJOPVn7N3AvdQ/HXrrV1LZyg
	trtc8dadyf72yaRcHF6qdMb0UTCwZNIWVJxwuzO4AefEe8R9gXgzMFfchNRP632Azv
	3akCPi4gdYc40hoMTy+RmGiQOS6hChXGRaw40QklhIrB/uRzy58T/2LYlns74VYWu0
	G8XBykelRvNwrPlickz/po7aTzgmHu986VDBGJhZ78ogEg/7upIrknCfvBiYStj7nI
	BmxOmxLx3hbKUPvG48NHkOzR1g8pQEFviwjNpO0QCD80DmIUOU9tF3ndKG5TiMhnKk
	gvjhX0B6JhXRIeSxNvKPK7QkhHAUvkkkFpWmFDh65FKs4JJ39qtLL8UzLs+1/JbNlP
	BqDgu1nPztOIlopjYeNzmbatXHcVvw08QZdXegL+A7aPucdTBcWgmi0yM5Q7X/HQLm
	5KdPeosHJz/oYv0TVx0hmaQ8=
Date: Mon, 15 Apr 2019 14:44:10 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190415114410.GA9707@localhost>
References: <20190410043244.12131-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190410043244.12131-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2] ledmon: control hard disk led for RAID arrays
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
X-List-Received-Date: Mon, 15 Apr 2019 11:44:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 09, 2019 at 09:32:44PM -0700, Khem Raj wrote:
>...
> +musl does not support on_exit which is used in clean up.
> +Instead use atexit with is supported by musl and glibc.

The functions have different signatures, and this patch introduces bugs 
for cases that use the parameters of on_exit.

int on_exit(void (*function)(int , void *), void *arg);
int atexit(void (*function)(void));

Example:

>...
> +-	if (on_exit(_ledmon_status, &terminate))
> ++	if (atexit(_ledmon_status))
>...

static void _ledmon_status(int status, void *ignore)
{
        if (*((int *)ignore) != 0)
                log_info("exit status is %s.", strstatus(status));
        else if (status != STATUS_SUCCESS)
                log_error("parent exit status is %s.", strstatus(status));
}

With the bogus atexit change no parameters are passed to _ledmon_status,
and the function uses (and dereferenes) whatever garbage is currently
in the stack/registers where function parameters are expected.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


