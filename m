Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id C97B16612D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 12:22:08 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id i68so55128518uad.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 04:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=HvjVFAKHG1s/GmTGHGAJ3gopwickI1C4wY2cOVzmC4o=;
	b=fT1D/W38e2L1Yt6CkDzusgaLFe2wR+BCe7JFCCYS1F87C6TBnwYhhBGppARDj+jXHn
	aGGlYeFfZGJ2j87iWaEGe4qxcx9LrEb1ZPNeGG39tibRjgInSdK93aIrqxuVFSNrbCn4
	agSpPrHXT3RPHx4d5TNzvfLSoRLcOg1f5Uqw0ggBm2ySCcfKYBcdBqElHRXkzC8hEdzr
	2FAfQA1mcLiBdGRG9W/DaFfXLtq1qiN6qU+DMlQn8XpTMz+kDlQkGWNK1Kz5jnC/NDEU
	19BoqVNHMHxQupq/dBy7ndLp3Hyw99d3k5W+kXo2eRtIJkL+orJ3s6IUazn2Gp2iQt0U
	9Q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=HvjVFAKHG1s/GmTGHGAJ3gopwickI1C4wY2cOVzmC4o=;
	b=qHzGfqTiqQfo05AKD0hAoTdnfpqmHz5WBJstR5Eb5YfgLc94V0zTcosJZBf/oNBMK9
	6QdqSoE7tojbf6r3gZ7nbOlYr3B1BeL+px3nJ9tqNp2cZ+Xg+KUwn3nCzBaL1p+tFRqG
	pMnT7aqm1aWXBrUyy5BDQfIxKm3Kqp1IIgyVhILUpkRlGoCgm8u2kSHsqwgckERqZQyx
	4SPla0j5iDTtRvZAc8ttthq52mntCnO3Rybdp49AEEILa5HyPJ5N9CZgksw894bkG9iD
	Ks9yOU4bgGKCK8sZPuXkVA+CeogRFEbsteHZuaB0SGpoa1O16ecZ668SIHTFuIN1kc/d
	HVvw==
X-Gm-Message-State: AIkVDXJmG21RLJs4iJpTWo9nR/AHgZuFLKkJOPjlBxjcl0Ykx6fafoEKUy289RlohVbf/YCklKAmbmjB/DasnA==
X-Received: by 10.176.5.134 with SMTP id e6mr4569422uae.108.1484137328702;
	Wed, 11 Jan 2017 04:22:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Wed, 11 Jan 2017 04:22:08 -0800 (PST)
In-Reply-To: <CAAPZna2vG6pz3_jC=3PSswpBTb4zAaZZRpF9ooKGE-OSioxLEg@mail.gmail.com>
References: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
	<1484074127-21458-2-git-send-email-schnitzeltony@googlemail.com>
	<CAAPZna1k+N+gbqb2n+fOLpmE6=RLasGku9rR7zebHvJRex-Htw@mail.gmail.com>
	<CALbNGRT2CMU03HQzC3-_J7UXR5U_RzkmHNROHyrC3kG2RZxOjw@mail.gmail.com>
	<CAAPZna2vG6pz3_jC=3PSswpBTb4zAaZZRpF9ooKGE-OSioxLEg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 11 Jan 2017 13:22:08 +0100
Message-ID: <CALbNGRQ96mC8=tCLXpauUoDbz9zpD=cvztkaCiezta03V865Sw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH V2 2/3] firefox: use pkg-config to find nspr
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
X-List-Received-Date: Wed, 11 Jan 2017 12:22:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 11, 2017 at 1:03 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> ERROR: firefox-45.6.0esr-r0 do_patch: Command Error: 'quilt --quiltrc
> ../build/tmp/sysroots/x86_64-linux/etc/quiltrc push' exited with 0  Output:
> Applying patch 0002-use-pkg-config-to-find-nspr.patch
> patching file configure
> Hunk #1 FAILED at 15153.
> 1 out of 1 hunk FAILED -- rejects in file configure
> Patch 0002-use-pkg-config-to-find-nspr.patch does not apply (enforce with
> -f)
> ERROR: firefox-45.6.0esr-r0 do_patch: Function failed: patch_do_patch
>
Ahh: The patch in the patch does not apply. I tested that before
sending and tested it again few seconds ago. It is possible that -
since I haven't latest oe-core (or bitbake?) - you have different
result.

As far as I can remember there was an announcement by Alexander
Kanavin to change patching to more restrictive mode so that the full
three lines before/after change must match. Will redo patch creation
based on firefox 45.6..

Andreas

