Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id D239360670
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2015 15:45:21 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so38578500igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2015 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=AW7cAjkNyEcEZRnHacqNvtEFwvE957Ve1RQT6/t3R7U=;
	b=qVOv/s6634GqLBqjoyEd05YbwWFx9oMf1dt+3Y8veSryTzIwTcjq6UVYBXiVBgfGNZ
	7A0vgrD4CcfN+OMIWqPQ0W68+SWhJSBoVtr7TD3Yb86Ucej30Kjkdvd6a8duG5Fu44/J
	h4r/G5CP7NeYSAwIOIUBxtElq7mVT3MXSE9HVh1KkxLdPgA6lV5nK0wHM/LiabpU3GkH
	24sBqwA8va4xJt+Y+pTl47o9WzMfqNARI+uT4l2mzGanva5VxOtltGfKDbYLXAZTB64c
	na7D34hZ8Oncu33kCkCNj+SkXONKiOzLTY5FZBYLbVi3ZqxMlYMg7+yNSeuVhGOjRvNm
	RXUA==
X-Received: by 10.107.6.28 with SMTP id 28mr5209464iog.54.1433951122778; Wed,
	10 Jun 2015 08:45:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Wed, 10 Jun 2015 08:44:52 -0700 (PDT)
In-Reply-To: <1433885941-13650-1-git-send-email-armccurdy@gmail.com>
References: <1433885941-13650-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Jun 2015 11:44:52 -0400
Message-ID: <CAMKF1soVSS2nk071dCeORmfue1sGhqUY4q0Akzfz+1yOeUQ2MQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] libupnp: add initial recipe, libupnp v1.6.19
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
X-List-Received-Date: Wed, 10 Jun 2015 15:45:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 9, 2015 at 5:39 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> +-echo "configure: copying \"autoconfig.h\"          to \"build/inc/autoconfig.h\""
> +-cp autoconfig.h build/inc/autoconfig.h
> +-echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"build/inc/upnpconfig.h\""
> +-cp upnp/inc/upnpconfig.h build/inc/upnpconfig.h
> ++echo "configure: copying \"autoconfig.h\"          to \"\$srcdir/build/inc/autoconfig.h\""
> ++cp autoconfig.h $srcdir/build/inc/autoconfig.h
> ++echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"\$srcdir/build/inc/upnpconfig.h\""

shouldnt this be relative to builddir or top_builddir ?

