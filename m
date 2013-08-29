Return-Path: <cazfi74@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2867F6BDF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:27:54 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id m17so487570vca.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=XrcxJsbM4BBrW6WAS67q4gLbBCeWPLBlYb3nh91OfNM=;
	b=e1+MM+EcdzDmpfVHx6UcWfp1Asm+9aNGfyV/FnhL1nHBuaHbX7w8+izZ/hbl7IwoOI
	eM1J9OleEC200/0IOq+MXPlGHQHN3S1jFFA3Owy2GAqUwxVCvaGHaMwzCVQ1U9RyhSIl
	jNobt3Et/PPok201Y9eqMY+tJO6SKNUyoMfgdqoLnysmeMiY3VR64h6Zq8UdCxknlrwa
	7PLdlwK0/c8RjzV6lO7/LGWmTnrdvAU5VG3Jvjiy9E2WGE9oMYB23OLPiGAq/imr4LLf
	FMsv2rMA6D+VczoB3g/oMm43TxHp6FDAudyj20+GUnYrFK3idwImAG+VR/+/DMRfBVlm
	PWdw==
MIME-Version: 1.0
X-Received: by 10.52.99.66 with SMTP id eo2mr2695001vdb.18.1377793674721; Thu,
	29 Aug 2013 09:27:54 -0700 (PDT)
Received: by 10.58.238.37 with HTTP; Thu, 29 Aug 2013 09:27:54 -0700 (PDT)
In-Reply-To: <ce667a200941cb8764ff7ce563650571fc3b3378.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
	<ce667a200941cb8764ff7ce563650571fc3b3378.1377791377.git.Martin.Jansa@gmail.com>
Date: Thu, 29 Aug 2013 19:27:54 +0300
Message-ID: <CAF6bG8e1DwCb-59==JnD5jgwWbND2SRiSo=WPXC-673jvLQ00Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [WIP][PATCH 02/66] libmikmod: upgrade to 3.2.0
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
X-List-Received-Date: Thu, 29 Aug 2013 16:27:54 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2013 18:50, Martin Jansa <martin.jansa@gmail.com> wrote:
> * 3.3 is only beta
> * 3.1.12 was failing to build with texinfo-5, see
>   http://sourceforge.net/p/mikmod/mercurial/ci/1fd17189f82561a3a0e343aef05e5cf0b39b8f26/

 As libSDL-mixer dependency, and thus recursive dependency for many
recipes in meta-games, this is important for me. In my local tree I've
solved the build issue by simply patching doc building part away. Let
me know if you want that patch (say, to go in to stable branch instead
of full version upgrade)


 - ML

