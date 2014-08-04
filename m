Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 51F1F65CAD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:45:59 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id q9so4368774ykb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Aug 2014 11:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ApdB9kzSl4o/XkY3vEroVLqBqEiqsRL0GTtWWkFeWK8=;
	b=rAi4EYPGwwZ47IpcO51hJEGgRbZpdOwcxTb+EepMC8P7d5y6JV2C9Aj07pcB+U5tpK
	Z7+NQre0k7cvQO+46TVhFGYfdzd9LYcK7sErwsG55KgOrkGtgjKLfEOWjfvP5eW3ELWl
	oYAsY8cM1Xz6fNVgn7b/xEhUkX41PuaUmeeKXo5DeAbE2LD39ooG3zc2cm3BVQSASOxJ
	OsotqI0kFj8QTFIzNW+p5NKjdo8VMtk1npXiMBEBR4qrwrMLEJU5mJ1ycZ4MvWcKdHlA
	cZtVR7Fe8fCVOh7S3Oj2OvsnqAsAj2fS/Y/flhVMEneP4SNA0D4tqd13XDLtTpmzsC7x
	1uQA==
MIME-Version: 1.0
X-Received: by 10.236.198.204 with SMTP id v52mr41272081yhn.105.1407177960774; 
	Mon, 04 Aug 2014 11:46:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 11:46:00 -0700 (PDT)
In-Reply-To: <1407177515-15086-1-git-send-email-otavio@ossystems.com.br>
References: <1407177515-15086-1-git-send-email-otavio@ossystems.com.br>
Date: Mon, 4 Aug 2014 15:46:00 -0300
X-Google-Sender-Auth: TfF8ox3s2F5JMu2dZZhZee2-sCY
Message-ID: <CAP9ODKrhpyVAXkrCeEk2yqjvwm1G34aqF-sP__fQvQ8yyMCJyA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: Re: [meta-oe][PATCH 1/2] evtest: Stop using Cgit based archive
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
X-List-Received-Date: Mon, 04 Aug 2014 18:46:01 -0000
Content-Type: text/plain; charset=UTF-8

Hello Martin,

On Mon, Aug 4, 2014 at 3:38 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> The Cgit based archive may change depending on the order of images,
> timestamp and like causing checksum to change.
>
> This patch uses the same 1.25 version but fetching it using Git, so no
> code changes are done.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Please queue this update for Daisy as well, as this is failing to
fetch currently (cced other Daisy maintainers).

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

