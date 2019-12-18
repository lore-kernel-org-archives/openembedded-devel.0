Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2977FFCE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 03:17:58 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c16so388996qko.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2019 19:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6LmX1A68RW9hMZw1Tyn2fPAHfW9YAvoBkYU8mlynnNs=;
	b=UN10ZYdkfZt/ZYjlZruA+RsA0kyAZBLZopmCeg3VfN7sI/ZqOr9ZS9kTIxg0FWWJEo
	ATVWPXP4Zr/s388mWsmPc7WnF7ylfBBxHd9mma0LUka0l1m3BFsCh6C9tf3lvxnJsWl4
	tcadwXU0559C6KXR/YVHaG51oZpmDdDRTa38bUtmBMpiHsjUxeGFCsF2MzrSlRz5fgps
	CibCxc/mA8UfCkVTog8gDfjk4SlvbUKSp+nCJutLh+UTQ05lrZ9A9E7HNGz2yBaQeOye
	vfozPchx4r07buMSmviQzZHY//rf496uORIm/v8eQ1gnmYXKY5XKrffp171TfzBHXjX6
	y+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6LmX1A68RW9hMZw1Tyn2fPAHfW9YAvoBkYU8mlynnNs=;
	b=OvJ6cB6nMYVg9pip6i737PpGJPh/NPFPnMEtMbKnOJiwPHAQ0ySDEG5EPr24ckpSDG
	0mmfvyPLhifsTcYcQOmS0tyOQWdlWWdoz1JjT+flR3uUdMbFqAszRZmf/56OnkCjKsz8
	4MakvKM5xsfClc9goF2swvDujQqgJaSuCjN5c00yySeTrR5Z1TmtTxj/CnL+dpunSJ35
	7bnje/zxZG+9D6QudsOSPMhNls3PfiUvnfJvR8kM/DEBjNeivre1ssi7x+2ENhnbWLTD
	E1ujn6Ud0NBMpZhFBEOG2cd012qqBGW1c3QuB9VYWOqhL1gBVK2JZdgQQvyUJJtv5FSK
	sxPg==
X-Gm-Message-State: APjAAAUKQJlG9QKcJpfQlHl8HPqRRholqBCzvhbdKPFKrRYdJ/JibeL3
	0YPC8TUXWd7E2I38hHWLOHJOrrPSgN2xEo8o10I=
X-Google-Smtp-Source: APXvYqyeQ4CtQZ9p9Q323Ul+eIOpwRPwFMn2A3H9pZnhySXiox+gNJinnRGJuJ2jm17f00ubwS2Q4FNEaUaKDNCj6DA=
X-Received: by 2002:a05:620a:6b8:: with SMTP id i24mr323238qkh.9.1576639078885;
	Tue, 17 Dec 2019 19:17:58 -0800 (PST)
MIME-Version: 1.0
References: <20191218011113.4072000-1-trevor.gamblin@windriver.com>
	<20191218031409.GA1997@localhost>
In-Reply-To: <20191218031409.GA1997@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Dec 2019 19:17:32 -0800
Message-ID: <CAMKF1sp3J1tKBSJT2ATzXmmTmmM0B6iLWTGVb241rSmWbsSTLA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] net-snmp: update default community string
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
X-List-Received-Date: Wed, 18 Dec 2019 03:17:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 17, 2019 at 7:14 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Dec 17, 2019 at 08:11:13PM -0500, Trevor Gamblin wrote:
> > snmpd.conf, by default, lists the string "public" as the community string. As
> > a consequence, any build incorporating net-snmp implicitly enables a
> > vulnerability (CVE-1999-0517) where an attacker could obtain information about
> > (and potential control of) the device and its network. This issue is picked up
> > by common security scan tools, and given the age of the vulnerability, some
> > minimum mitigation steps should be taken. While the conf file itself
> > recommends setting the community string to a value known only within the
> > user's organization, changing this string's default value for Yocto builds is
> > a minimum step to help mitigate this issue.
> >...
> > -com2sec paranoid  default         public
> > +com2sec paranoid  default         yocto-snmp-community
> >...
>
> Instead of mitigation this might do more bad than good.
>
> Attackers and security scan tools will just start to also
> scan for the known alternative "yocto-snmp-community".
>
> The problem is that attackers tend to be faster with that,
> so the actual change would be that security scan tools might
> no longer report a vulnerability attackers will still use.
>

I tend to agree. Perhaps describe mitigation in wiki and let users
chose a string of their choice
and let defaults be as they are.

> cu
> Adrian
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

