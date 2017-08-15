Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id A4885784D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 16:10:33 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id u5so8324175pgn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 09:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lWoCiSvJWfZZ7ZPJLJDXqp8yh1Yjk6OtUZ9zB6Y+YVQ=;
	b=ezRXI9rwOW+yG9EWYUtOuGcqfqomPUJL5mtwn08brTsrd5w1QrpO5sJB7jQBzOqEcj
	rij01jCz+g/QQGd7SyWWKZsUQIqMbRKdW3SpU6VYbm/Dnc8EufX/DZqrqThOvDsIAMY7
	I1vEXPg4ivxrIy8ufcY23xwT3SUMs6wdGxABkBiCyu6peQ5iycF5a9LGHqbEWt21L7Mj
	1ne5p9QA2XlIFiDTO43VJdJwmOdvSMYn8weG8vSSXbvdkLvcIZt8uJOTPexrJQ8L+cGT
	wK84izPDrJbMmCTBx2j6ehIPy4m4Tfh3PIDbBxtvskgLjgIK7zAI4IqhM3ooRR6I9mYs
	6fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=lWoCiSvJWfZZ7ZPJLJDXqp8yh1Yjk6OtUZ9zB6Y+YVQ=;
	b=RqoQh6wqqA8ls6p+s0fhypb3n2HHH4Vtzw5kunFi8q0wKVhf1fFqxjfYdFG4NyUFmU
	rCqxayK8bZxDL1ru82J/GcigBFZbLRwKYCgmwgdMDd3XUopXHsg2Cj1xSuKiEjJZxfcy
	WWAWHFEktuIGyBF2cAqvwISiZEauesILi53Nk3D5QFXp2vYd3xfY5abTnSrOFUs88598
	/8ALqClQV1BLKgsFlJUOXP8T5/E4U01sm/5kZnUW353fYm4vvwOy5oGi+qVFxH0p27KW
	+sobeNqMWdJfw2tLpYLyrBzUTuF/kqGHygYcuxT29OxCgZt3iO5si+X9PCZuO+ci6i4+
	uK5A==
X-Gm-Message-State: AHYfb5ij7ruVn7oUAFQbvDsBtuWUOBVF/qymWYb+VD4c96C+drA33cxW
	+HB1LW3O6JQJhuKCRc4=
X-Received: by 10.99.126.87 with SMTP id o23mr28431634pgn.443.1502813434457;
	Tue, 15 Aug 2017 09:10:34 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:941a:4883:1e44:34f1])
	by smtp.gmail.com with ESMTPSA id
	67sm15349216pgg.42.2017.08.15.09.10.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Aug 2017 09:10:33 -0700 (PDT)
To: Trevor Woerner <twoerner@gmail.com>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapQ8zxvaEdn51D0kN5C7JVRpQJq34tCuqamMEM0fm20LRw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c9543f77-d921-5353-2a90-b0b94d79efd4@gmail.com>
Date: Tue, 15 Aug 2017 09:10:32 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapQ8zxvaEdn51D0kN5C7JVRpQJq34tCuqamMEM0fm20LRw@mail.gmail.com>
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
X-List-Received-Date: Tue, 15 Aug 2017 16:10:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/15/17 7:43 AM, Trevor Woerner wrote:
> On Tue, Aug 15, 2017 at 9:05 AM, Raphael Kubo da Costa
> <raphael.kubo.da.costa@intel.com> wrote:
>> The main reason why I opted to start my recipe from scratch at the time
>> was simplicity: the meta-browser repository used the same recipe for
>> Chromium, CEF and Chromium with Ozone-Wayland, offered many different
>> options and shipped quite a few patches that made updates quite
>> difficult.
> 
> I agree 100% (or more). This is why, earlier this year, I removed CEF
> (which wasn't working, hadn't been working in over a year, and
> (apparently) nobody was using). This is also why I also split out
> "pure" chromium and chromium-wayland recipes. Trying to do everything
> in one recipe was getting too onerous.
> 
> In my own (failed and therefore put on the back-burner) efforts to
> update the chromium (x11) recipe to 59 and 60 I too created a recipe
> from scratch without all the baggage of debug vs non-debug, no
> packageconfigs, multiple architectures, component build, and without
> pulling in any *.inc files. Just a small, self-contained recipe.
> 
>> My recipe is a lot less customizable, but OTOH that makes it
>> quite easy to move to new Chromium milestones. If we're able to find a
>> balance there, I definitely think we'd be able to get a lot more done
>> together.
> 
> I think it was a mistake for meta-browser to have recently added a
> huge number of patches supporting musl. One commit alone added almost
> 700 lines of diff for musl support (not to mention the subsequent
> fixup patches)! Musl support should be kept and maintained in
> meta-musl, isn't that the purpose of meta-musl? If users want musl
> support they're going to need to add meta-musl anyway, so it's no
> change from a user's point of view. But 700 lines of patches provides
> a heavy burden for anyone trying to maintain or update meta-browser's
> chromium, especially if they don't use or care about musl support.
> 

musl is supported in oe-core, meta-musl is practically dead since then
and you do not need meta-musl for musl anymore, I guess a README update
for meta-musl will be a good thing to reflect that. We have fixed
packages in libc agnostic ways where possible. Most of time musl patches
have landed upstream into respective packages and process is still on
chromium will be no different moreover there are many distros beyond OE
ones which use musl as default C library, many of these patches are
shared with them. When we support a common package, and it enables
certain OE-core feature then it belongs to that package itself.

I understand your reluctance since you might not be using musl, however
commonly maintained patchset is far less burden with little extra effort
thats the mantra we follow, otherwise oe-core would never work on so
many arches and libcs.

