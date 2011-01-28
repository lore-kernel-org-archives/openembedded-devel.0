Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PidfC-0006ry-Vk
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 03:02:16 +0100
Received: by fxm17 with SMTP id 17so2900455fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 18:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=2+ppJt5Q2ZIyxvOK7RVkOol6COLC7FllzbckWKO3Eus=;
	b=fFWr9NxBzjSlp8agBRvR25QIms7iVsA2gvcG5ESViIiucWnB6nP7lxFBwbSqlN/X4p
	8pz7bZZIDUKjBSMBStNBhcTB/YD5bCpQ5x4bTldeIBIMVXlPYAAItwn+54hxwtQcU8TC
	3meRZB46VnGEp2Vu7rY/qVtJs3NSPY2x82TRw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Hcy9P+3Iz841KAuj3ZmoCSsQQeZ0a4mi9xjSW6OS2SSE6jSAMrUvZg87YtFfWCbRAq
	ZovUWAbx7u8jqvbq6MprBOp2yaZ84o705BC/qZAmmuFUovBmgu7R6KWUNYmYfq57rlQj
	yZV0yXtYb+yNtT4JGGNgLWZ/ISj9l8uS2FnZg=
Received: by 10.223.114.209 with SMTP id f17mr1695627faq.136.1296180080035;
	Thu, 27 Jan 2011 18:01:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.27.137 with HTTP; Thu, 27 Jan 2011 18:00:59 -0800 (PST)
In-Reply-To: <ihn8ra$scb$1@dough.gmane.org>
References: <1295983479-15511-1-git-send-email-coolaj86@gmail.com>
	<ihn8ra$scb$1@dough.gmane.org>
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 27 Jan 2011 19:00:59 -0700
Message-ID: <AANLkTinKQ1Gkn2D+ppB1E9pKSe1xxS0jcd3TU6T82zTt@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] nodejs: updated recipe to v0.2.6
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
X-List-Received-Date: Fri, 28 Jan 2011 02:02:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> >  recipes/nodejs/files/libev-cross-cc.patch |   17 +++++---------
> >  recipes/nodejs/files/node-cross-cc.patch  |   19 ++++++++++------
> >  recipes/nodejs/nodejs_0.2.6.bb            |   34
> +++++++++++++++++++++++++++++
>
> You're changing the patches, but don't remove the old version, do they
> still work?


I copied the new patches over the old patches.
Should I have done `git rm this.patch; edit this.patch; git add this.patch`
instead?


>

> +PR = "r4"
>
> New recipes start at r0
>

But it wasn't until the 4th time that I bumped the PR to re-bitbake and test
it that I got it right. :D

Would you like me to resubmit the patch without the +PR = "r4"?

