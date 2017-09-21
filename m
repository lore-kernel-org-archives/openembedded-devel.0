Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 83F9D782B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 23:06:47 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id q4so7508918qtq.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 16:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oZtZdDrEkXGKToGifsKqKdbKpCfBo6yDFWwb1AYwZBc=;
	b=vc62n2xqCu9m6UD3aFtuOetAOG2j0sA/5Ss73+N2pGKMT86RCkZPRvrm+aKMJWUytw
	VN+lGwkcp72IfTxs4kx0XO7w9EXTrR3oITa2SIgOjmVvYNKQC4Ayk61+3iaZq1S+5A/K
	Rw0ZhvRPqeLpsUP4TV9pWJCdIynYBZxWBO8+kyyYcba5bD9PoDaEXFSxU55+V8pY5PVt
	fyFKXFxfi+L5NUKmw4PujYOwP9BbWWA4/eEiA3XKOF6hjol/UK0ox23dVtQ/QMjFkoHL
	8H3YtG5ltx8VyQHBPvyo8wFAyn0ANM8YMPVUtQf6gNh3GDdnksK8C6ep5A86W4Xc1U6T
	UceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oZtZdDrEkXGKToGifsKqKdbKpCfBo6yDFWwb1AYwZBc=;
	b=ofRfgFzJT1vhTeOLYSstOSu6O9GMARohe0HFWeqaDUGsjB9HqRbU4mpwPoTXHClr1X
	LYDWUJV571OA8JPrAJzlgkWf/s33+LfXhkMjiiKpuGTHbd7/IU5RZICDew3bF0vsMAPH
	Ndh90YLEK44X38SjSH5Bg/eIFMy6XXZ3yDA+SaBJ40JZjDGqbpJ9QlOS0t0nXdnJ0V6C
	ngRXnZWx/rCFvX93QMl40sxGHlZD2A00PlrJToqTkYnnNDjSbO7uB5gDE20opDa7W/ys
	HScySTdTh+MEKKcIou4afplkPo0KwGccgZcz8PA0MhFwNEBWaSi/SoLcKQHETlwbD+gW
	3KHg==
X-Gm-Message-State: AHPjjUisxboA2V6jscDg0KkTvjunoqLcbEkPAt3SfiDJd0uxQXCrAFYn
	oSSX1jNTfNp8bp8nLrTt6Cpy6ITchNGwNouopnE=
X-Google-Smtp-Source: AOwi7QBYwruOcyw1pRTKliSytXxdVLgpjo23XMd/23kwxLMN271Qv709e1h7bdRgkdn1wHR6M5jY1R38fB4a9p6bCJw=
X-Received: by 10.200.50.125 with SMTP id y58mr5565064qta.266.1506035208367;
	Thu, 21 Sep 2017 16:06:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.74 with HTTP; Thu, 21 Sep 2017 16:06:47 -0700 (PDT)
In-Reply-To: <20170920174336.GA19156@linux-uys3>
References: <CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<8d04fa9f-3049-45cf-4255-bd0159b84751@gmail.com>
	<87r2wcajh6.fsf@rkubodac-desk.ger.corp.intel.com>
	<CALbNGRS1ywFbSNAoY976cPgJ4STQLqUEqzwq34XGaMH_CYhAaw@mail.gmail.com>
	<20170816160609.GA29490@linux-uys3>
	<87tvzylpvy.fsf@rkubodac-desk.ger.corp.intel.com>
	<20170920174336.GA19156@linux-uys3>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 21 Sep 2017 19:06:47 -0400
Message-ID: <CAHUNapT7Hj4XjuJM_PzydckY=b+X5ok-p-k2MF3VYhywJ5mh5A@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
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
X-List-Received-Date: Thu, 21 Sep 2017 23:06:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 20, 2017 at 1:43 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> When I compile chromium61 with pyro, I get a strange error. Every time the
> python wrapper (gcc_link_wrapper.py) is called for a native compile (g++), I
> get:
...
> This happens with both qemux86-64 and raspberrypi3. Unfortunately those log
> files are 18M and 19M each, so I won't be attaching them. Why can't my build
> find 'ld'? That seems quite strange. Probably some kind of ld vs gold issue?
> I'm not using gold anywhere and have not enabled it, are you using gold?


Turns out, I had to install binutils-gold on my host for this to work.
Which suggests a hiccup in the build. Maybe the build needs to tweak
the python wrapper? (As if using ninja and gn weren't enough, the
build also wants to use a wrapper to call the compiler?!)

This still leaves the problem with my builds against master. I tried
downgrading the compiler to 6%, but that causes a build issue in mesa,
so the build can't even get close to chromium to see if that compile
can succeed with gcc-6 instead of the default gcc-7.

The regular procedure is to add things to master, then backport them
to various branches if appropriate. If we can't get master to work,
there won't be anything to backport. In any case meta-browser
currently doesn't have a pyro branch.

