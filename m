Return-Path: <kergoth@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 05712732F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 16:25:24 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id f10so1550575yha.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 08:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=gwzMOML2X1+pLhNHeAiaPyQao5fYYpNuszbfjTAPH/4=;
	b=cPzETIcPKimheraGTiyQyJQzjRndSJgKpotd/lGZkmwO0jlHRR0fLMXMswCKZazTbd
	GirtW2W9n/hCxcZIgr3aywa0UIHwm5shwKTnvnZRvJxyO2RvKkR+CGxkKv2vxnzl1PE8
	AtoG94p8MRvzqxhEK69m8D0uNRAd68k2oOtpvwoQQsBhKf778G6Gh577QG4B43BAWgWl
	yM8xgXo1AC8DHBKon+wy9JcPc9a1rHSjgEJDEIv9zzAwSMutDi5jhX+oxT88rYv9ZpkY
	oVKMyE7iErdleQ70X/qCxi6BR50/r1gOv1tzDeXa81DPSPWV5leU1qZdW6p5NXR+yOzv
	a8Kw==
X-Received: by 10.170.52.14 with SMTP id 14mr999209yku.77.1423671925528; Wed,
	11 Feb 2015 08:25:25 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.170.205.88 with HTTP; Wed, 11 Feb 2015 08:25:05 -0800 (PST)
In-Reply-To: <1423669983.23617.78.camel@tycho.nsa.gov>
References: <1423669983.23617.78.camel@tycho.nsa.gov>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 11 Feb 2015 09:25:05 -0700
X-Google-Sender-Auth: O9c3MIpP2UKec6U1B-b_QUlYVUA
Message-ID: <CABcZANn4cy3YzOYgpSh6hC=vAA=NpyEPghs_jPNY433OeYWKSA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: meta-selinux
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
X-List-Received-Date: Wed, 11 Feb 2015 16:25:28 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 11, 2015 at 8:53 AM, dpquigl <dpquigl@tycho.nsa.gov> wrote:

> I'm working on OpenXT and it makes use of the meta-selinux repo hosted
> by the yocto project. I'm trying to use it with a base openembedded core
> and its not in sync with oe-core because its based on pokey. This made
> me think of two questions. 1) Why is this not in OE core since so many
> packages in core can potentially have SELinux support enabled and 2) if
> its not supposed to be in core where should turning on SELinux support
> in a recipe go? For example coreutils can have SELinux support enabled.
> Currently this is in meta-selinux as a bbappend to the coreutils
> package. This works out because its always going to be there. However
> there is also a bbappend for an LXC recipe. LXC isn't in core which
> means it has a dependency on a layer not in core.
>

This is a bug in the layer. It's fairly trivial to construct a layer in
such a way that you can have per-layer bbappends that are only applied when
that layer exists. This is likely the approach meta-selinux should take to
address this implicit dependency upon meta-virtualization.

That said, I think most folks would be open to PACKAGECONFIGs for selinux
capability going into the main recipes, as that's not an invasive change,
nor a patch, but just a tweak in configuration.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

