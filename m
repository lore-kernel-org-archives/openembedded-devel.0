Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oh1F5-0003O1-BQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 16:16:28 +0200
Received: by eyf5 with SMTP id 5so2418050eyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 07:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=WTJmPuVKApyIYml4OSke2MXt/tPU5ETVTw/8ziGZKf4=;
	b=sB7SClGUYW3Ztwd6jeDpbakS/zaROZlqfnE4SMD/0oP/g6HvCBrpYWh4ItzrjSCpeb
	SDTPmqalMrAkwt8IBn2VV9ngFWbxb4FeRrh05BehmSGO/z+I7dAc7puzTHywcah7ptgy
	wrcoehBDY3H/KtxxfMdGZYI3PnZ2WE/jWL0uE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=iABkk1bdl8vLKSVWGsvNTbPAbSSxh5UmMMyUDoQ6AM0MsSUZ1v6rlpoC2yCS69EDGB
	4oTm7LthOzhfu2BaGpGYUsB4salwG/OWQX5f0hCybl7rdar+aqdQBkKBnUzG+3DQhFKY
	NL723BB6waGUyuyBQ6K+epNT9CGIIvWzF0LV0=
Received: by 10.216.188.1 with SMTP id z1mr9351584wem.57.1281017775430; Thu, 
	05 Aug 2010 07:16:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.16.204 with HTTP; Thu, 5 Aug 2010 07:15:55 -0700 (PDT)
In-Reply-To: <4C5A612E.9040702@gmail.com>
References: <4C5A612E.9040702@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 5 Aug 2010 07:15:55 -0700
X-Google-Sender-Auth: 7lhCrytFfst7IbGR7wd6VmfGJoM
Message-ID: <AANLkTik-B0=_JyGLe1dpz9x+h-HE+H8AWd22uO8ioeaG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Remove redundant dependencies upon opkg and opkg-collateral.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Aug 2010 14:16:28 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 4, 2010 at 11:58 PM, Graham Gower <graham.gower@gmail.com>wrote:

> rootfs_ipk.bbclass already pulls these in, so avoid some confusion.
>
> This is totally untested.
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>

Looks reasonable to me.

Acked-by: Chris Larson <clarson@kergoth.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

