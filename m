Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5D85277ACD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 19:27:51 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id z204so100809463vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qdfsGUZEpdlpZP/0cMY4bptmmMKbjslGA2xiNiZEjPE=;
	b=guWBqULgxkU5LUqvn4E8IiuQ6MQT+2S611q3NOWC1D/Wmz1YrZSjLSs0EIrUzl93nh
	0ZIxB+clSU2opiFSXCIThrRZlSS+iAmiFC94pmlrkUS/ZmTzieKIZjUbqnDy970swJvj
	GoAZLMvMD1vO85kvpo0R+ySSnYx11jITREfFukzndVpA7oebRqnKTwYA9R2MVADgf5+x
	mvDR69ufe/fd0wy9+jQpKnlphaxeSR3rOX8bZ69ZxmmCCkBkRsagipo/QTzUe8yls8sS
	TyXn9E5BFAKsefwSZWt6jeKtYhOTO12JWBzD7QwFcx/DA9k/3Vd/GyVCDsK2TqhSGDfm
	r68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qdfsGUZEpdlpZP/0cMY4bptmmMKbjslGA2xiNiZEjPE=;
	b=oNVLkntmRN9dASOFyGysIanizLhUd+dFvDeDV62l4qro8nrbPm13PjdFnu0ACwLN+v
	d6BnffympGI38sXXx53w1edoGeZnoygkXiMEud2QWliywLfmzOZS6bK+8A2WjZ3VbO24
	wlJABnBmR7AVxWXAuiUMpM89wCNWCKn2/U/NDuPNsoVZNZDhfHuntEe1dZEJHdL/57VK
	q/U1dKPwoddPXfZAN84ZJdTgVS7RObyAonL4PPp5PYpcKejOJHc3R8LhRUqJI/LgPYhe
	F1Wv9yz2GXpxBiIBz1gRCZAWrRujhu05e5e4LdwV54J+JxiCCFoLLMc6YFy/utl+bNc6
	gc/Q==
X-Gm-Message-State: AFeK/H15BXnWITA8zO4uRvLxQ+7UJyLDVkaK/G7NscWzP9cG289w88ec1JQxLQLhpNWcD/+N0k+f5VSnygXS/w==
X-Received: by 10.159.53.98 with SMTP id o89mr737737uao.113.1490729272103;
	Tue, 28 Mar 2017 12:27:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.43.65 with HTTP; Tue, 28 Mar 2017 12:27:51 -0700 (PDT)
In-Reply-To: <db923476-2e79-5d55-a887-3658d00ecc59@balister.org>
References: <CAJTo0LYsTtk9eFD=kdhdrtFUCPr-eOn5dnPxDR+hM9LRbL40ug@mail.gmail.com>
	<CAHUNapRmymF0Z2s1aGhxNAusk35cj6Wg2uqYWDrZTNTMXYkYTQ@mail.gmail.com>
	<db923476-2e79-5d55-a887-3658d00ecc59@balister.org>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 28 Mar 2017 15:27:51 -0400
Message-ID: <CAHUNapRjDLBn+0dm2HsfMs2KwsjEixNsQfyhB61zJsUZE0fOxg@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Meson build system
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
X-List-Received-Date: Tue, 28 Mar 2017 19:27:52 -0000
Content-Type: text/plain; charset=UTF-8

If X is moving to meson, and meson is in oecore, then meson.bbclass
will have to move to oecore as well.

