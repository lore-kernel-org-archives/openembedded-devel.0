Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 951856011B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 13:08:14 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id f92so671287qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 06:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7ElFDLHkxmrRWgAwWPD+RHeygZXYTA3Kkyspdel2uA0=;
	b=zPNpXNi+AUstYG7Xi/yq3aelaQio5CStg79N2TUXBLmYS9PrKVBYRn3hJY3ZRVyU3H
	uDEpFnYrZphQHiz0EdZmJAkEW9yHKPuSSSiiBqUMTuvpCXjqtoYTU4EdUKJXqBIfeo44
	g09+oTlIN71iktWtn1I1obn7vCthKcI80221MLFMHtFUcltaDYv+jMcySBYM141l+PIu
	1e47UuBinnbRAGr3//uEPyqb73B/2Pyzw5YF7JLM4Kb3Wx1rPlHENc+DCsUc2/imZav3
	MjM5GVy/XcvGTjxKAGX+PSg5Y/bmXX+yKDT27L2mJOffvF2xVaNvZ6/gR25Q9tU5iA6l
	w5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7ElFDLHkxmrRWgAwWPD+RHeygZXYTA3Kkyspdel2uA0=;
	b=OLXW88t2IT0BcuuvSgfov5mAdCzuiDae3cwQ1wxVh1I8ZuJUQ6/XEyQ6aq9Tn3ww9Q
	67/k6NGXqdRTIu+CeFRA7AGwig4sTBLFl7cEeF2tHZ0ndpBQ4xIWXp1f7ZlfurEehnWX
	dU+ZlYWhGYwgO2ooDEFe2qPVdiHj23fx+/i9uY7E1Cpz1UKPuxtzncI3yDsBCoK/gpCO
	HQ6aQ1ElnPJCBaEA3rhNVTPGSGzswgRPxvyjrJyEO6UfqyjkXMzBK+5T6fLthmvTPHJ9
	Tmn2tnZtEm5XBmnluwMCer3n9CSMa5AYMXxajRHkCM8GM1yo8JvuT884VH6RIWVWecLQ
	o9SA==
X-Gm-Message-State: AKS2vOxSY1GKkWZpl86yAZ2G3EL0T5Cv0/cN+cABTXsCfyUiE/x8o+eF
	ZMlsLQx5CEvNr3ZKBesy72V8kb3On73y
X-Received: by 10.200.43.105 with SMTP id 38mr208970qtv.6.1498482495457; Mon,
	26 Jun 2017 06:08:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Mon, 26 Jun 2017 06:07:55 -0700 (PDT)
In-Reply-To: <d864b1f3-4db3-79ae-b0b9-3b2baee79a81@axis.com>
References: <20170605172321.12557-1-acfoltzer@galois.com>
	<20170605172321.12557-2-acfoltzer@galois.com>
	<d864b1f3-4db3-79ae-b0b9-3b2baee79a81@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Jun 2017 14:07:55 +0100
Message-ID: <CAJTo0LY9VuqPKdky_ee9gq7bAW74j2tJbWi==yRQMmh+RwUsZQ@mail.gmail.com>
To: Linus Svensson <linus.svensson@axis.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] meson: fix build/host confusion for bbclass
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
X-List-Received-Date: Mon, 26 Jun 2017 13:08:14 -0000
Content-Type: text/plain; charset="UTF-8"

On 16 June 2017 at 12:19, Linus Svensson <linus.svensson@axis.com> wrote:

> What is the difference?
>
> As far as I understand, bitbake and meson use the same terminology. meson
> is supposed to get the build machine info from the environment, not the
> cross file.
>

Linus is right.  Quoting the documentation:

autotools:
--build: In which system the program will be built.
--host: In which system the generated program will run.

Meson:
build machine is the computer that is doing the actual compiling
host machine is the machine on which the compiled binary will run

So changing host_machine to use BUILD_* variables is wrong.

Ross

