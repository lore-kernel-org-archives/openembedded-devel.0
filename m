Return-Path: <kergoth@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 13CE67214E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 20:14:26 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id va2so3011914obc.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 12:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=OTO1vS3CEThmnsgNuYlI9zIVZmA4lBXGyeD6KVQ5mek=;
	b=iE7CMzv8oDfpSH0zEkgO4+6D1MNC1NUowf69fljwNa4bMzENJH4NHWAty4R+A2MLz9
	HhnKNeLfxvW/93hZDC8u5Ncl878sffhBttVIHjInyT+OCFwj8fowHbOmsG+4FgBSq3VQ
	xMRuihbICtV/I6RF0BFZc+8o7g5OSi8QvXx1n2ID/mOvi9kCqd5H9SHDsZnNz9uxmEja
	u0WGxgeBIlt46BtaSULT9ffT6xI5dOf14zs7SFEUn3otE3g1igM+m9UMfRaJcS3yWqMl
	eCAJjLSq7jGhPtQhqOS6Rp1qlj4lyAKp4tPe5QZ1XIvuZLDPygI/QGISsqxoMQCFmqqW
	/bQg==
X-Received: by 10.202.196.206 with SMTP id u197mr20093825oif.21.1416341666273; 
	Tue, 18 Nov 2014 12:14:26 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.76.82.35 with HTTP; Tue, 18 Nov 2014 12:14:05 -0800 (PST)
In-Reply-To: <1416304558-12255-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <546AA9C5.7080303@windriver.com>
	<1416304558-12255-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 18 Nov 2014 13:14:05 -0700
X-Google-Sender-Auth: ElEFX6UeAG_amqzdcPOgl4xypbA
Message-ID: <CABcZANkrGdCy7Qf0fxA_C6aAoS5OLb7=ohh2wpiRv-szoxgFgg@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] rarpd : add new recipe
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
X-List-Received-Date: Tue, 18 Nov 2014 20:14:38 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 18, 2014 at 2:55 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:

> RARP (Reverse Address Resolution Protocol) is a protocol which allows
> individual devices on an IP network to get their own IP addresses from
> the RARP server. Some machines (e.g. SPARC boxes) use this protocol
> instead of e.g. DHCP to query their IP addresses during network bootup.
>
> Linux kernels up to 2.2 used to provide a kernel daemon for this
> service,but since 2.3 kernels it is served by this userland daemon.
> You should install rarpd if you want to set up a RARP server on your
> network.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>

Should this go in meta-networking?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

