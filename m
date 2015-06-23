Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id D347074056
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:47:43 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so5992760qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jun 2015 07:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=QfeYwDoyezlYsquCIZlR07sVVUc3BDuKioFOyxvU+Kg=;
	b=OXu8JVxkRLI3rNFQhVmXXjGvi9eSuvcZMkDVbTQWc4HGPiwsB18Q/5/ewRleWRdxc/
	uf1PXPdrmqkkhd88iH5DrWK2Aa5oX/g6mH/Rou04RRLHSFE5tkBgZnn3HE7r5hT1j79W
	u0Yas+iWmhipQL9bscX7x/Douzd8b2K7aWxmDIG2DSaDcFse1ZxC0dazyvMkQM0miMtw
	vJ56ib+F6TQ6a1Vp3vekii06WIqu/LNkNR2eok58IDxIHISAKRsbm9T6HpKMMkBPhDL1
	hB4jG78lP6+C9GM0hjHJCVpAEvLkb14EbP6A9VFdya8Xt1B5tPPu1NibPnE5rkYJulrT
	FEpQ==
X-Gm-Message-State: ALoCoQloN5DnidTD9CP1Pc56YfKTCyDML3AbfFckVzR8wknC8HlSX7FRK51aDunPbX6fVVrjg5/4
X-Received: by 10.140.43.199 with SMTP id e65mr10616019qga.80.1435070863989;
	Tue, 23 Jun 2015 07:47:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 23 Jun 2015 07:47:23 -0700 (PDT)
In-Reply-To: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
References: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jun 2015 15:47:23 +0100
Message-ID: <CAJTo0LYpcKWFAgDHcQ3FFsFypdHp6J8FBYkUGo3aQoJ6yRy4ng@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [RFC] Move libexecdir to $prefix/libexec
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jun 2015 14:47:45 -0000
Content-Type: text/plain; charset=UTF-8

Forgot to cross-post oe-devel...

On 23 June 2015 at 15:30, Ross Burton <ross.burton@intel.com> wrote:

> Hi,
>
> Yes, I'm bringing this up again. :)
>
> Our default of libexecdir=$libdir/$BPN is contrary to both the FHS[1] and
> GNU
> Coding Standards[2], mainly because the key point is that libexecdir
> should be
> global and not change per-recipe.  The new FHS allows /usr/libexec so this
> series changes the default to that, and fixes up the recipes which need
> fixing.
>
> Several of the recipe fixes are unrelated to the change and will be
> submitted to
> master shortly, but others (eg sudo) are intimately tied to the change.
>
> I've done basic multilib-enabled builds but more testing welcome.  I'd say
> that
> in general multilib problems this exposes are in fact problems with the
> recipe:
> for example GConf should install the binaries once and libraries in each
> libdir.
>
> Ross
>
> [1] http://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s07.html
> [2] https://www.gnu.org/prep/standards/html_node/Directory-Variables.html
>
>

