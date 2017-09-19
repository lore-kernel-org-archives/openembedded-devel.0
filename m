Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id E3B11781E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 10:57:20 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id g32so8976294ioj.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 03:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WnG5XjWH/b9DgEv+xHSigCrt20S6hslanWzaUh/g8jE=;
	b=kDgPPLd6F1HlxJ8J+P/W6cTHou3Hkq884Hu2Rv/HumRq+3kSxabfaMc11ngMXfTTDl
	/utgLAYAlArHG//HNa/0L3bCzcfhHni8Y6vBjMgj4dFVri5/Dkkvdma8u6ipigfZBQOB
	08V0XuMB3S0c196c48N8OtXgljIUfDpxpg/Qx29u8ninDhOIiv28kuNMWpmGQKpztMtJ
	j1U9A2uAc3rr1622WZtJVwIHVjJPjytwAqUb1wsB1uId/Dy9WzRryEsQoicMzQW/rk4e
	UTeKEjvApPaqzB6Yzksoo7n5S114N+lejv+K9MiNoVxoCQ8jzgosZBvA37XPjIYAf4jE
	oBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WnG5XjWH/b9DgEv+xHSigCrt20S6hslanWzaUh/g8jE=;
	b=sdFa3g29XjD3wBAOddWY2c/hM6kZnZ87PezSi6+eO2sv2b1JpiRW3BFUxUCkGQi0zZ
	KRKP1RhN/t7a6lLoKXh3fDZo7f28T57IovnCSIZG4Xk6rfCtso7BpcIUxFW60q9z1o07
	AyiT48bvs6L/aVXo3hdsfM/TXz6w3zs0AaFKSRdQKiFZETVpQIrutJK4mVJ3T33rzSBu
	HreU+XeH9jLIdqAOXNVnnUrSbhwjzDEPuGkELNwXnvYuvt+2N2jtoVEa1SAthF6KZYug
	xbkhByVDN4PH65zC9iFDHhPavhTdUvjbgT/EJZr3i9W0hixi49vPPxsnDGDGvU3txmZk
	7Idg==
X-Gm-Message-State: AHPjjUiQ1lhEgcgk21ZSCLUj4+yDNdz06qCGDAkIAlxqnl8l2AE+bc9y
	I11cqN4IKPEmnPN0Grmgl6kWpbUQAWIpbjeijMH21g==
X-Google-Smtp-Source: AOwi7QC3w9LN4SKEzO+kJWAB7Ea2x0OJ+0iOD/TelnbLUpaAaUwawxFeCkWZu3b+rP4vdtm/ju3ZIgfQRZK8wPDhQuA=
X-Received: by 10.107.135.72 with SMTP id j69mr1366363iod.210.1505818641580;
	Tue, 19 Sep 2017 03:57:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 03:57:00 -0700 (PDT)
In-Reply-To: <20170919083205.ojully66ojq6l2mq@hiutale>
References: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>
	<20170919083205.ojully66ojq6l2mq@hiutale>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 11:57:00 +0100
Message-ID: <CAJTo0LaPjXPT4SKz+J0Qw8af4eo4t+LaMZfvBdYXgMxpub1xsw@mail.gmail.com>
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Use of github /archive/ tarballs in SRC_URI
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
X-List-Received-Date: Tue, 19 Sep 2017 10:57:21 -0000
Content-Type: text/plain; charset="UTF-8"

On 19 September 2017 at 09:32, <Mikko.Rapeli@bmw.de> wrote:

> Yes, we have been affected by this several times too.
>
> In addition to fixing recipes, a sanity test to warn about the situation
> would be nice to have so that the issue could be detected in other
> meta layers too.
>

So I have a class adding a few tests to package_qa, including this one:

https://github.com/rossburton/meta-ross/blob/0f788385dbe13914e9e07d382793c494c4927ef9/classes/insanitier.bbclass#L93

If I get a moment I'll move it to insane.bbclass.

Ross

