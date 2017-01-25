Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 941B671E06
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:38:31 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id x49so25549302qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 08:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=L8w16vWN3EjpIcRK1LYjJcYGEHTtkVbC9dYjbgE9dZE=;
	b=ashUs2H/pAf+OJhsjGv+Y5K1rk4kur7JQcQrts2gy9otR//uRd3ZKCbUmssXlSDO03
	2oCmpahwiTlOsXmbnYHCnyhqyTgEEFduexoDZlbQTVY0lmIuX8YGY51c0pg4dDlqCbRA
	2pLkzTE1v0R0G2/nfzQ6yQ93RSfCN3NKgDHbcEegy5Y+bU5dQP/A2vbhvWa+Z2aZvbyn
	ZDHdS8CEB3a5cEDLJtpTWGcnESPtehVR7MXDP8wpOYuKPoZUTYI4VU3EtJiRZY1y30Gi
	qZRum4aB7Bu9ZPkOFcmqgz3w7E5oBMrfKtHUyt7F4G2fMgw8jYZ8CaTlF98dbdu1n3Lw
	qW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=L8w16vWN3EjpIcRK1LYjJcYGEHTtkVbC9dYjbgE9dZE=;
	b=df31oNjTibP+nkFebtOiRYDgm4oN0pKwoxCZ8hn8ft7zdq1g2fKCQeaABw0oWqpX1H
	BsPK8gq2zuwtZX9lh45gln0M5eENfnFeYmaQn51jjZDswKKO4Xx/IOqvZp6QG7PsV1z9
	O8ukorkvc1kQTGWsnVgsHWJcOfOkanbxi9Hu4WVSbgXi6hMbgh9Z5JOEbIydVdeUWTbZ
	sPYp7ehgxZovKJK0CUxG3Cn/85FKQjDWkLw9iErG4aS6e6X8/3a5YfnpEOUYc3GWJwHR
	1wXofq5EJPy9NoGKrjmrG3hYISovQ2SOt7cdjMWZl+MWtjm0s8dr0J/kR5XrnuhHwRGF
	GTuA==
X-Gm-Message-State: AIkVDXIa0XD2tBS6IuN7/FDeWuGwFNqCUTWJ6SguQ4dlMv6ul/nDGJPgyew/d+HbBM6U0YaQHUueuqWQ7MkREEoe
X-Received: by 10.237.54.1 with SMTP id e1mr33537113qtb.68.1485362311428; Wed,
	25 Jan 2017 08:38:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 25 Jan 2017 08:38:11 -0800 (PST)
In-Reply-To: <20170125161855.GG3260@jama>
References: <1484923430-3222-1-git-send-email-ross.burton@intel.com>
	<1484923430-3222-2-git-send-email-ross.burton@intel.com>
	<20170125161855.GG3260@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jan 2017 16:38:11 +0000
Message-ID: <CAJTo0LYG+T4yc1uzDrMW4GirKpdmyU887K4RJWd9pxwULg+qEg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/2] libxcalibrate: add, from oe-core
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
X-List-Received-Date: Wed, 25 Jan 2017 16:38:31 -0000
Content-Type: text/plain; charset=UTF-8

On 25 January 2017 at 16:18, Martin Jansa <martin.jansa@gmail.com> wrote:

> Why do we need this in meta-oe? Just because xtscal was dumped here as
> well?
>

Yes.  xtscal etc are the only users, so they're in oe-core with nothing
using them.  They should have moved to meta-oe along with xtscal, but were
missed.

The alternative is to delete xtscal from meta-oe and then we can just drop
these from oe-core as they're not used at all, but that's not my call.


> Both are broken because of the path to .inc file:
> Parsing recipes...ERROR: ParseError at
> /OE/build/oe-core/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/
> libxcalibrate_git.bb:6:
> Could not include required file xorg-lib-common.inc
>

Damnit, sorry.

Ross

