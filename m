Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 28E9F7EF4D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 08:32:10 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 009A95C0D8D;
	Wed, 11 Sep 2019 10:32:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1568190729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=KMPVv0o3zgdMVGzNcP/BZ4gKBJras2klrwl0qLTEehs=;
	b=Ww4n9P+jsKwFT2XOMmotBW7Sg8DEUPlOr326GbUZmU5Gd+Qv50LjvaZ1rc10RMPlHh8bKR
	zg9F+nee5CVWDhN8BqOgoCiP2pdGgMS5w1szbJ+F5frfzvW4/tKK9g8tt54N3qGp1C95A1
	fsdCt7IGdVtWWQ3MJVH4Nx4prM/8fs0=
MIME-Version: 1.0
Date: Wed, 11 Sep 2019 10:32:08 +0200
From: Stefan Agner <stefan@agner.ch>
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
In-Reply-To: <9ca2559a-1b60-367a-ce6e-5f85b4763c4f@gmail.com>
References: <20190910214919.9171-1-stefan@agner.ch>
	<c30d914c-da23-70f0-cde3-6bb32a5b8f98@gmail.com>
	<9ca2559a-1b60-367a-ce6e-5f85b4763c4f@gmail.com>
Message-ID: <02f8b7fb3398361ba2e1e7e33349da27@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: openembedded-devel@lists.openembedded.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-filesystems][PATCH] fuse3: add libfuse3 recipe
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
X-List-Received-Date: Wed, 11 Sep 2019 08:32:10 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-09-11 03:40, Khem Raj wrote:
> Hi Armin
> 
> On 9/10/19 3:06 PM, akuster808 wrote:
>> Stefan,
>>
>> On 9/10/19 2:49 PM, Stefan Agner wrote:
>>> From: Stefan Agner <stefan.agner@toradex.com>
>>>
>>> Add recipe for libfuse version 3 series. Follow the scheme other
>>> distributions use and create a new recipe with 3 in its name.
>>> To avoid conflict with the fuse (2) recipe this recipe does not
>>> provide init scripts/configuration files which automatically load
>>> the fuse kernel driver.
>>>
>>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>>
>> This recipe appears to already exist in meta-filesystem
>>
>> https://git.openembedded.org/meta-openembedded/tree/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
>>
>> Is this a all together a different Major version that is not compatible
>> with the one above? or should we just update the old one?
>>
> 
> These are different revisions which can be installed together see [1]
> I think best solution is as proposed where both revisions can live
> together, we don't want to force fuse2 users to fuse3 since it could
> mean quite a bit of unplanned work. Eventually we might drop fuse2
> maybe in 3.1+ releases if all users of fuse in OE have moved over to
> fuse3

Yes, fuse3 seems to be a non backward compatible release. Lots of
project still require fuse2. E.g. in ArchLinux you can see that actually
most packages still depend on fuse2:
https://www.archlinux.org/packages/extra/x86_64/fuse2/
https://www.archlinux.org/packages/extra/x86_64/fuse3/

Given that so many projects still rely on fuse2, I guess dropping fuse2
will be even further out.

--
Stefan

> 
> [1]
> https://github.com/libfuse/libfuse/blob/master/ChangeLog.rst#libfuse-300-2016-12-08

