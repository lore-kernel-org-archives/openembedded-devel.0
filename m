Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 29FA860034
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 07:40:48 +0000 (UTC)
Received: by iow1 with SMTP id 1so116116118iow.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 00:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=evUzhVV9P5uDtXeT94ez6D1cw7wEMocupSzaOoKvToA=;
	b=FufOM8Qg/1OC389Ez/ibAvHWRtVzdpxM9R6FGMoPEaEGI8wXF6k44zsE/6FUi8QwSz
	wQkjjYUb5aM+tcT5l54m2IZXnGIvkVcgZ1Pes7eyILs4fWg2FEClDy3KPqLAdg5yK3/j
	nYfJboit/e0btmxjf0S8ImB6kxnecHmoRvKUqs+iCVyRNDkuvTlsNqx1GEMH3t/m84BT
	G0dhC7rphOSkvVzpy7X2HxMWIAjAxfTJBlfkU0IIlATHRg85Jcn4QYNACbujgXRYcrzQ
	0MNyRnlIucrStH8XygYe9meZ0gbTQHdM8mqeeFEM4Gpg9CyniXVIvDFiXWhxF5fFch4+
	iZPw==
X-Received: by 10.107.3.77 with SMTP id 74mr19250180iod.49.1445586048332; Fri,
	23 Oct 2015 00:40:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Fri, 23 Oct 2015 00:40:18 -0700 (PDT)
In-Reply-To: <20151021165221.GG2556@jama>
References: <1445315359-30016-1-git-send-email-raj.khem@gmail.com>
	<20151021165221.GG2556@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Oct 2015 00:40:18 -0700
Message-ID: <CAMKF1soczpv56dDe7cKEbupzvhhfcXZW_stQvc6cHggoGMGbSw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] luajit: Upgrade to 2.1 beta1
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
X-List-Received-Date: Fri, 23 Oct 2015 07:40:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 21, 2015 at 9:52 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> This seems to break meta-oe/recipes-extended/sysdig/sysdig_git.bb
>
> | -- Could NOT find Lua51 (missing:  LUA_LIBRARIES LUA_INCLUDE_DIR)
> | CMake Error at CMakeLists.txt:116 (message):
> |   Couldn't find system LuaJIT or Lua

Send another patch for sysdig, mostly related to lua 5.2 ABI

