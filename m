Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD3C7215B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 10:30:50 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id a108so6561096qge.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 02:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=1lTJfeWnWeSaeF2jHR89ccyWHR+g5tdANKxbF1NyRy8=;
	b=mRprAPzG/hC1V6IYsy7CI+ik+Rg4IFrenX6KWwl+eMPD5BOjBi4Y/1SKfxuOhKQxRM
	VYAtpeWYj+KXeEYxNiz3SBWYEPBQB+BDVLuL05l3hqx8ijpxoov7QBGqcb606riLIDMX
	lHP3q8LqqwtgBTCibomgN5bLA1aO9vnLduKuW04b6L1bG4yEEvCdgmHknDRu4U9RnyJM
	w9IAZGy2XkdMwCGtmm5rqns/cdDhp5RXP8CNqbcaJs72JVPMesetiLFzX/UbQTP9ETyt
	kbAnOdl8EMMA5GLuFwJ0WdeEsKAz+yek2uGmbq34IKbvfQL8giuB41xwO8aaUFI80Bfm
	+ggA==
X-Gm-Message-State: ALoCoQn/TiEZ/M1dUfhq6wmEI4TI7AsbRgWkUMHNJlAtapy/rO1Z2Gexbb3TOdaYuMvsNDP1UJLk
X-Received: by 10.140.38.136 with SMTP id t8mr27595996qgt.15.1416825050550;
	Mon, 24 Nov 2014 02:30:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 24 Nov 2014 02:30:30 -0800 (PST)
In-Reply-To: <1416811526-54855-5-git-send-email-biannm@cn.fujitsu.com>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
	<1416811526-54855-5-git-send-email-biannm@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Nov 2014 10:30:30 +0000
Message-ID: <CAJTo0LZeC5tu7fQcKFEhuHVvPjx77V8NwOwTtP9GqFVKDvtG-A@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 4/6] [meta-oe] printproto: Port printproto from openembedded
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
X-List-Received-Date: Mon, 24 Nov 2014 10:30:59 -0000
Content-Type: text/plain; charset=UTF-8

On 24 November 2014 at 06:45, Bian Naimeng <biannm@cn.fujitsu.com> wrote:

>  meta-oe/recipes-graphics/xorg-proto/printproto_1.0.5.bb | 16
> ++++++++++++++++
>

Really?  Are you just trying to add every recipe from oe-classic to
meta-oe, or in this case are you actually using XPrint?  XPrint was removed
from xserver in 2008 because it didn't actually work[1] - that's *six*
years ago.  meta-oe doesn't need pointless recipes that are unmaintained,
and if you're using an ancient X server and enable XPrint, then you can
also carry the XPrint proto/libs.

Ross

[1]
http://cgit.freedesktop.org/xorg/xserver/commit/?id=1c8bd318fbaf65890ef16fe26c76dd5e6f14dfde

