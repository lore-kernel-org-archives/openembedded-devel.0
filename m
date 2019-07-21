Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 740917EE94
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 15:25:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45s7pk50wYz56;
	Sun, 21 Jul 2019 17:25:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563722718;
	bh=TZLqZXeV38UnvNf6YlrCcaYt/7SlPXShKGGEloSMvuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=muxcU6yAkCXE0gLR7q+2MYT+190wsuMdZqlBMzOJ6/+E1qe4U+kw6qty/+gyqPEgt
	iLMu9uWeRCBILJAFsd2TR9Zjhu4gwj9GU3AWzAEWrNx9HLxauGPT9FkN2tAH51YbNQ
	qUmyuS9cRGAKXY/j1Kj3VBY9IR6n8sr31r0dx5+KBClH4cCTmDmc9BaIzPyfTzDWe6
	uLvBOdgQq/w1+wHYoR4B1Gf2a54c466SZv0o0vnFHyRCfAjd3KcnMNe8zr1O7LrFD7
	+zSj19/fcE6ITKi8N9dY6CLIGKj0quptHJxX8Hmh8GPrGOgUX2ZQJZ6c12jGbec8FL
	XLkQ6QzzF3usp48HOs49XSyT2cqKhnK+/hUD3J4qStwYgjCAa3Y34UE5aG3PiU6hN4
	QjOrbrzOAXFJ9v3T8OpR0VnYBRwxk9cm/j2CBX0iuwmNTW53fxtZGXxt4zNKKDbWbp
	uILD1p8H+Ex1TJZ1YnR/f4Aq9Ns7XS2mussD9r2+0vva4g9uajamxAgCdB1CEOY46f
	6aOaAvWAIuI3I3e7cbTPFsRAK4BO20OjPBWUEBjCvZwwBWRwwmaqJS64LrGyiosXNZ
	KB1Uhb8gq5Kio24b6f7WzjPBF3BSZ90dF8phHv5iKYjwJZz1D4kqWc304YGlGuHQ/k
	xivSooK8MmUqM5yKikj/yUoI=
Date: Sun, 21 Jul 2019 18:25:17 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190721152517.GB5886@localhost>
References: <cover.1563719996.git.akuster808@gmail.com>
	<26e6bf0f26815b06e4335c6a3bd34f52754faec5.1563719997.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <26e6bf0f26815b06e4335c6a3bd34f52754faec5.1563719997.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior] 2/8] evince: add patch to fix build with recent gobject-introspection
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
X-List-Received-Date: Sun, 21 Jul 2019 15:25:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Jul 21, 2019 at 07:41:30AM -0700, Armin Kuster wrote:
> From: Andreas Müller <schnitzeltony@gmail.com>
> 
> gobject-introspection torned some warnings to errors. That caused:
> 
> | ../../evince-3.28.2/libview/ev-document-model.h:57: Fatal: EvinceView: Namespace conflict for 'document_model_get_type'
>...

Not needed, see
http://lists.openembedded.org/pipermail/openembedded-devel/2019-May/199724.html

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



