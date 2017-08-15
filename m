Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id A359D77B39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 16:19:08 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id v189so8377644pgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 09:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JGf6EzIuIR7egxaBbXt+YCixPdhpnYNuGvV6RNXUcco=;
	b=qYlzQ2u6ApjKDl4KqvOFqVukrTTpjtv35VxUvReuabDTqWEyvzP2EfPQPEzNJyZ9Xj
	Lfwmtt9RD5HCf1kSY2LLn6AlJDQ1/egxTeijrmuehcSG2HgdwNpV/PACvuuR3oerPYc5
	oW1cnlgu5rI2vgVQubyGfldLiI45ZJc1KYb1+ewV8lcM8bOVoF0m/v/1YIrtyj65b1sb
	UtqPWuBfH+kumKNSlE0bvJ5truVuVeGdAt9VYNCm4o1sDHt06prjwJ6XrpuO4GTGk/h2
	fdJqY/jHfXA/uiDXmNW8+qT4jAvphTMmB592gi0k28OfWKtC1tuSK5UJE50D1LrE7KV6
	0UKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=JGf6EzIuIR7egxaBbXt+YCixPdhpnYNuGvV6RNXUcco=;
	b=Z+GPqFaArHO26d9nDt8EgW45foGfhKDl9NJbzP+9/OyR9K2qWda41LhZdAvF3/C/qo
	HLbLhSekuqc7MXBWRa7/cX1A90cBsmaJVMBf6d1pq8f2wpxzhNfkYAq5hDN0OPKnzo1L
	MhYHWMY+exEYFEt8FmcqqGES5hMUidgTDmF458NAMiS0hq5urq7JVSgyIJMQMpJhyrEc
	r96E1hgOFvvfleYgwEdsgQIVgGGi3VHqMIv1uYgdK/iXI6nXxxN6V+0EzSfOSz8DGBqJ
	8h0sRRfn4T2nzeM4iEcpHL6KolY2n1OkSl2OdmssQe7nEU8139W0MLkNaw3kqJwVEYp9
	rOoA==
X-Gm-Message-State: AHYfb5go2It9d+YRLpjCjbAQjIk35zgy0A2jnuBQ573XPp/26DQesIcD
	5G/c2ybnw2NSCxBeYtQ=
X-Received: by 10.84.169.36 with SMTP id g33mr32724165plb.52.1502813949913;
	Tue, 15 Aug 2017 09:19:09 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:941a:4883:1e44:34f1])
	by smtp.gmail.com with ESMTPSA id
	133sm17232239pge.29.2017.08.15.09.19.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Aug 2017 09:19:08 -0700 (PDT)
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8d04fa9f-3049-45cf-4255-bd0159b84751@gmail.com>
Date: Tue, 15 Aug 2017 09:19:07 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Tue, 15 Aug 2017 16:19:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/15/17 6:05 AM, Raphael Kubo da Costa wrote:
> Otavio Salvador <otavio.salvador@ossystems.com.br> writes:
> 
>>>> On Mon, Aug 14, 2017 at 12:22 PM, Jussi Kukkonen
>>>> <jussi.kukkonen@intel.com> wrote:
>>>>> On a related note, this good work is currently a bit hidden in
>>>>> meta-crosswalk -- is there a chance we could get this combined with
>>>>> meta-browser (or whatever place makes sense)? I know next to nothing about
>>>>> chromium packaging so CCing Raphael and the meta-browser maintainers for
>>>>> comments.
>>
>> Indeed it does sound like the proper workaround for now. That said,
>> I'd love to receive more help from meta-crosswalk people and avoid
>> duplication of work in packaging Chromium so I am adding Raphael on Cc
>> here so he can comment about how we can try to work together on this.
> 
> The main reason why we haven't worked together yet is procrastination
> from my side :-)
> 
> My recipe's working fine and is up-to-date with Chromium's stable
> releases, but I'd love to find a more permanent home for it and stop
> duplicating the efforts, especially as I spend most of my time working
> on Chromium itself, not its Yocto recipe or even Yocto in general.
> 
> The main reason why I opted to start my recipe from scratch at the time
> was simplicity: the meta-browser repository used the same recipe for
> Chromium, CEF and Chromium with Ozone-Wayland, offered many different
> options and shipped quite a few patches that made updates quite
> difficult. My recipe is a lot less customizable, but OTOH that makes it
> quite easy to move to new Chromium milestones. If we're able to find a
> balance there, I definitely think we'd be able to get a lot more done
> together.

what are main architectures targetted with crosswalk ? I think scope is
important, since meta-browser supports, almost all oe-core supported
architectures. including x86/arm/mips/ppc, any cross build patches are
required in anycase, but architecture patches will be additional if you
were only considering a subset of architectures.

> 

