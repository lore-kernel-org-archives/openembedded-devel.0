Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id B97C1772CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 14:58:59 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id c13so55827640lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=ejxakL/i3vz9Z5x+QJ32Vmg1MEDwxyy2HZ8rGWfHC+M=;
	b=lW6TvvIQRXnKF2NzwUoIpWv8TKAMBWG2lL2us72XQcVP5+/8Rce2HrXnEp3VepPL4y
	UL38p+j0i1HTetkmGYM6LDpo/KwvuUnUTBlKRBv3ucrflSbbZ8YhKb2+fp5XytWRDAsr
	8sG2kAMe7eVH9BIMtVl+StEq88SzTrQPzUl0KtmsU5R1V6GrFcSmlVpGdSYGDOtYWvxv
	4aH57uhIFDsGJKXFWnFpwXErzygqgYdwgepc6LjMF/MNoVqAvhB09UwWZVwboQUZluv9
	AoHY1jLyWcE7rleEQeURD1E8JnpyWcsABgex1T9Hpw4nvV0s4bE+Pnojk/u8GRwFnzuI
	3VcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=ejxakL/i3vz9Z5x+QJ32Vmg1MEDwxyy2HZ8rGWfHC+M=;
	b=OsPYi2I7aVCJl4virbIIRU8em1RFEmEcK9piN09MzEuwbu91mHpIQpJfud8/XiCwIP
	Dh5ZETEOKg0aksUxr8Q0CLJf7UAP04EcI16xHnmFKKy0DvZeKi+tZeUFgk+iHkhQVGJJ
	T72RNUsvUdV8xQzUqWfz8L1k2pXzUEKTGT/z86THKwR3jr5m2xyPzd1zwQ4mLbuXsDZN
	XXFnyWAjlvU8yJH7MuLS7URU16jJFkUjY8fUAtUVcajcArQVapdmeuSljr0mpYHkFp3M
	GLrrVh12XXOYQZdVY/nAgMuPuw6KYmijPCSIQfdm6A6BMgJyiHjsTLQETS0xiHPNzQzI
	yB1w==
X-Gm-Message-State: AKaTC03Nc8HmhCLyAGgdCexzWb2L+EgcQ8ZkPXqpM2VirbrwN0hhV/2mCGMVsQnQ1kjuIQ==
X-Received: by 10.25.190.79 with SMTP id o76mr5564554lff.56.1482159540064;
	Mon, 19 Dec 2016 06:59:00 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id z9sm3877006lja.1.2016.12.19.06.58.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Dec 2016 06:58:59 -0800 (PST)
Date: Mon, 19 Dec 2016 15:58:57 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161219145857.hg35ivv5vidlzdmf@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1482148888-3127-1-git-send-email-armccurdy@gmail.com>
	<CA+chaQeBUTnQQnVEGDhae8opjobSAPF=BU2R-772ECPf8KA4Pg@mail.gmail.com>
	<CAJ86T=UB6T+LpTNRy6_pZ5f0P7FzyJ+qMdgS=8FvDE5HcaG41w@mail.gmail.com>
	<CAJ86T=XDvJk93+Jc4-v5H+3nTSFJ1KcQbyeUt8yvhJwfTA=pnA@mail.gmail.com>
	<20161219142620.4hpmfdo3w3kk2zlu@ad.chargestorm.se>
	<CAJ86T=WzTb-z-WzdHc6Ke4uck_M9zOWWq35bo3qGyc59hQuUmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WzTb-z-WzdHc6Ke4uck_M9zOWWq35bo3qGyc59hQuUmg@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20161126 (1.7.1)
Subject: Re: [meta-oe][PATCH] rapidjson: add initial recipe
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
X-List-Received-Date: Mon, 19 Dec 2016 14:59:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Andre McCurdy <armccurdy@gmail.com> [161219 15:46]:

> On Mon, Dec 19, 2016 at 6:26 AM, Anders Darander <anders@chargestorm.se> wrote:
> > * Andre McCurdy <armccurdy@gmail.com> [161219 15:12]:

> >> On Mon, Dec 19, 2016 at 6:08 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> >> > On Mon, Dec 19, 2016 at 5:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> >> Please don't use github archives.

> >> What's the recommended way to fetch from a git tag which doesn't sit
> >> on a branch?

> > Use nobranch=1, see eg
> > meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb.

> That seems to query the server on every do_fetch, so doesn't work so
> well with BB_NO_NETWORK.

It shouldn't do that. The problem with android-tools_5.1.1.r37.bb is
that they're not checking out a SHA1, but a tag...

ANDROID_TAG = "android-5.1.1_r37"

That's not working without querying the server, due to how bitbake's git
fetcher is implemented.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

