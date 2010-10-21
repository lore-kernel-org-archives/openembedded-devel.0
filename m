Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P8w2Z-0003ol-9G
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 16:22:47 +0200
Received: by wwi17 with SMTP id 17so2435736wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=jtMP6RX/pnz47JpwYgm4nnokZlNyrYYF2DXdwH7ZtdY=;
	b=Yyr+/bTx715FcYu8UX1sHd3mg9QR4oSIS2YP+7N5GEh3sI4x5YFnTxFOy3tC0HrqiV
	8X4JdbnEqHG8/qLwjSfuwl6K2ml1G7kMuLcY/GYRUi8xkgj7LLe96Z9kFKXUstBsSkB8
	W6bc0W0roa5dljAPvEJHDPXmKMTsnOrGtEOFM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=eOaG7Cx6so0ELjzK3kJqn9FH3pJnWLLqyR4KGnvucYksfAv30kztcMqLMceRH1nJ3h
	EHXl9skThw4Zu86wp+hxLal38OeQt8HxuxGKjqQN8GJIjVwlFnthL2cWUA8q1DLCaxK8
	6I1RxpHkGHjWIL4oHW20RSJYSVCSdk2HZxbQ8=
Received: by 10.227.134.129 with SMTP id j1mr1235488wbt.67.1287670929710; Thu,
	21 Oct 2010 07:22:09 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Thu, 21 Oct 2010 07:21:49 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F0803110B3520@dlee06.ent.ti.com>
References: <i9p1d0$7q4$1@dough.gmane.org> <4CC00D57.4070601@xora.org.uk>
	<i9p2uf$f40$1@dough.gmane.org> <4CC0104B.4070108@xora.org.uk>
	<AANLkTi=74mwvxLLwCjEhV3OMCyOdpfRZeU0Z-bf6TM+P@mail.gmail.com>
	<1287657524.16386.437.camel@rex>
	<AANLkTimn0RDABjQbJcO3dWHpWPWD6giY1taSVixn0MHp@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3520@dlee06.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 21 Oct 2010 07:21:49 -0700
X-Google-Sender-Auth: CWzztXqolKpVsipI8P1pvjwT6fE
Message-ID: <AANLkTi=ut_LSHfYcy-SsC2VLCW0Mxvwao6xEeMwgM+2+@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Thu, 21 Oct 2010 14:22:47 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 21, 2010 at 6:46 AM, Maupin, Chase <chase.maupin@ti.com> wrote:

> I haven't tried this myself yet, but if you wanted to tie to a particular
> PR of the base recipe wouldn't you just put the amend.inc in your overlay at
> recipes/blah/blah-version-pr directory?


Yes, but bbappend can't do that, its bound to the recipe filename,
unfortunately.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

