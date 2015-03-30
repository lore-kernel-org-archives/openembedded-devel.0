Return-Path: <martin.jansa@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 74D2A73C0D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 15:41:47 +0000 (UTC)
Received: by oiag65 with SMTP id g65so132458386oia.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=8PA8LLwNFeXO6P47fdd/BLyGJ8SXNpBIXJtvOrl1uw4=;
	b=m/31mN9uCFhqssDn7sTSdJGOuDshtc42S+tm1X71XqrNp3AmGBOzkGBPjJSyqklLuU
	l98HbVCxj3vHYwwfi54VPL7tNX8pTMl5LNd8dycBMkis7BBMVp6UyUQqR0UZhmwlqhGK
	rtTL22DVuKnElBwCeJQiNsHOY0JOQpJO54YC7GSHJ0nTJF5PcebRRUGn8rX1A0fIq6sx
	EA01yop6OdCQqCiMu7xUGHpwTgFAfA5bQFmUr44a++UyfSA1tjk7WeNZKpWFarBExXwP
	gMp8J/SfcBffFMxX1JRecGgdtbr7KFj9cxClB8Wvj/cXHubOqAX9SIGXKZjiEBXKPKxX
	sK9Q==
MIME-Version: 1.0
X-Received: by 10.182.166.71 with SMTP id ze7mr25527466obb.73.1427730107837;
	Mon, 30 Mar 2015 08:41:47 -0700 (PDT)
Received: by 10.76.177.33 with HTTP; Mon, 30 Mar 2015 08:41:47 -0700 (PDT)
Date: Mon, 30 Mar 2015 17:41:47 +0200
Message-ID: <CA+chaQdFo2M-=_PP7x-KnPEvEAQLX9vkudnaC9VJQxe90AhTbQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Stephan Binner <stephan.binner@basyskom.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Qt 5.5 Alpha Recipes?
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
X-List-Received-Date: Mon, 30 Mar 2015 15:41:53 -0000
Content-Type: text/plain; charset=UTF-8

Hello Stephan,

they usually follow "stable" branch, but that's not a rule, it can be
changed to any branch as long as you update corresponding variable.

For myself I don't know if we'll be more interested in trying newer
revision in 5.4 (e.g. if we find critical bug in 5.4.1 which is supposed to
be fixed in 5.4.2) or trying new features from 5.5.

I think it's safe to say that "fido" branch should only get 5.4.x* in git
recipes and lets leave 5.5-alpha only for master branch. Fido branch will
be created soon (1-2 weeks).

How does this sound?

CCing oe-devel in case someone else wanted to start on it.

On Mon, Mar 30, 2015 at 1:13 PM, Stephan Binner <stephan.binner@basyskom.com
> wrote:

> Hello Martin,
>
> with which Qt development release (Alpha, Beta, RC) are the qt*_git.bb
> recipes
> usually upgraded to next major version? If with Alpha are you working on or
> aware of anybody currently working on upgrading qt*_git.bb to Qt 5.5
> Alpha?
>
> I don't want to promise anything but I may have some time to spend on it...
>
> Regards,
> Stephan
>
>

