Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LjyIU-0002ex-PE
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 17:07:32 +0100
Received: by gxk18 with SMTP id 18so1117065gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 09:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=M6aS/q9trHnG3b/zOMMjJIag6yhbmur1TZlog+ZfimI=;
	b=K5AuVamNlHkYvYEHt1aFF4MeMNxYxqk9kwgqCvn6dtnZgPe00IoGCO8+oKt9A+IfML
	qFhtJU/ZJdnuV8iwWhgxcKhtz7siCCUdrmn9/Z06BiwP0o9DBwH2lKLpAeDBVe9wB05J
	3inBNZfPnVd4lQKwBULIxK9NhHGDhO9ZYuoew=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Fgls9BmMbt+CbHAuYkfnxKGgl5FDJinfVWQK/mlG7TcFFkhL7h2yQnFB6HJsAx1mIp
	2g2RpUviV3mnCuqwg9FalhktFwdoQBLXfAXaSY3r3Wt7CMDTylbOm7vewuGryCZLftPi
	yG0nG8HVJlTWPk3jagpew6M9x/QkhKCC0WCs0=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.103.2 with SMTP id f2mr2505885ybm.107.1237392381243; Wed, 
	18 Mar 2009 09:06:21 -0700 (PDT)
In-Reply-To: <-2193387358217288963@unknownmsgid>
References: <-2193387358217288963@unknownmsgid>
Date: Wed, 18 Mar 2009 09:06:20 -0700
X-Google-Sender-Auth: 20bb0b1a4e809568
Message-ID: <b6ebd0a50903180906v755f082akf8460a3b3307d9fd@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.170
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Loss of all package history following the recipe rename.
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
X-List-Received-Date: Wed, 18 Mar 2009 16:07:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, Mar 18, 2009 at 8:38 AM, John Willis
<John.Willis@distant-earth.com> wrote:
> <snip>
>
> After kergoth took the time to point out that I was just looking at this
> 'the wrong way' and not 'the GIT way' I think the mail can safely be
> disregarded ;-).
>
> It still does not change the fact that the behavior of 'git log' gave me a
> real panic moment but at least nothing is lost if your happy to dig (or
> rather use git log --follow, ok, next time I promise to read the man page
> before panicking ;-), I am just used to --follow functionality being a
> default behavior).

Re: default behavior, I'm not entirely certain, but the 'diff.renames'
git config parameter seems promising.  Try running:
git config diff.renames true

I'm not sure if git log --follow is the same thing as git diff-tree
-M, but it probably is, since git log is essentially git rev-list |
git diff-tree.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


