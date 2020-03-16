Return-Path: <SRS0=atcY=5B=stusta.de=bunk@stusta.mhn.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD5C6055F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2020 08:02:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48gpgj0dR8z3D;
	Mon, 16 Mar 2020 09:02:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584345761;
	bh=djAkiRbGMPBncFuE8X4lDODYfvhRcikxMQLkiFKXmuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5794f+HEgTjA9cVV5sLY5eYR49OxIlUCvFTxLk0SMrzayGKmIE3ywsKVn6+wYQzK
	QHYDpQQ1piV/OvadOeHvRR7lxA3zQBfRoK1HnGTSMUQxzTN8r1nw4xLPYinJvT0dWq
	BdbAV7UKk0NeRY+e4Ehqngc2JNaP82uXmoMJXkLgyPkwCwCFsvWzv3fUI3vl/NRijS
	ulVZVmZTr67tgJK2ugR6s9KHAfFkcpqQ9YtghypOjjyulYTzIe5gLeconzzGv4rBgJ
	bNmbj6GCDYm2f4kcZ9JP9+RbjM30ifkz+kubeQxSLnhIC62iovK2AqxahZ7FKCwwiJ
	1uSCaVmM6YCkJQEb4dBaKDiaPojUHcId0Ao+fIezdMuhnrEK/ITtyex6uRByOWcPwk
	QQhKgWBkSZiNocJF+RztMBi3+1FeJ0AGL6PkDpChSdvgNXFMlNYerK15Xmy0b7omAB
	K8zCgsbYqW0TMZMOURhgfiYPKxU4euUpQkiVuw9dHx+DiG+YRgKsjloR2E6dGT8pag
	Kl50W0ZD0FmQjC+CQ8NGtSWajMYePbob6jomYretvZXPtw+/04cZdvnbk+RCsPmYSl
	BXghFWt7Ra40B9jA8/05y+/FdkgAieJDDMqu4UhAxginOAcNQWJl7YklcDLQpAFfTD
	vM/SbdkZSHkrhxkGzuenDlbg=
Date: Mon, 16 Mar 2020 10:02:39 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200316080239.GB14992@localhost>
References: <20200316000654.1093220-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200316000654.1093220-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] flashrom: Fix build with clang
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
X-List-Received-Date: Mon, 16 Mar 2020 08:02:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Mar 15, 2020 at 05:06:54PM -0700, Khem Raj wrote:
>...
> +clang complains like below
> +
> +libflashrom.c:191:43: error: implicit conversion from enumeration type 'const enum test_state' to different enumeration type 'enum flashrom_test_state' [-Werror,-Wenum-conversion]
> +                        supported_boards[i].working = binfo[i].working;
> +                                                    ~ ~~~~~~~~~^~~~~~~
> +libflashrom.c:229:46: error: implicit conversion from enumeration type 'const enum test_state' to different enumeration type 'enum flashrom_test_state' [-Werror,-Wenum-conversion]
> +                        supported_chipsets[i].status = chipset[i].status;

Please patch out the -Werror instead.

>...
> +However these enums are exactly same so they can be typecasted

If they are the same, the correct fix would be to have only one enum.

>...
> +Upstream-Status: Pending
>...
> +-			supported_boards[i].working = binfo[i].working;
> ++			supported_boards[i].working = (enum flashrom_test_state)binfo[i].working;
>...

Working around a compile warning by making the code worse is not
an improvement.

Even worse when this is an OE-only workaround.

cu
Adrian

