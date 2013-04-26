Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVqTE-00036J-6K
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 23:46:20 +0200
Received: by mail-wi0-f179.google.com with SMTP id l13so1088424wie.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 14:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=Gv1LKqCOC11EWPYaPVJaVQqo3LGD7IHonVfTXU/9Tjs=;
	b=QIXlCle54qO6jxmwKLil1YRfEikFO00Js0YOxsvlgSG2H4GDpkgHspco+302Grl/zj
	yt80co28qyV9bkpqJqYslXMNEHPkZodVYoC38JYFvs8yOuwuMjkj6Bg0tpwCaRie2BqY
	Q2ryWG5boKJay680asv0g7Wlcyu4aZDxf2a/Stqd4CEjWwYZIKCej+MSEpPxR3Ulrxrf
	oogTamkKQo9yxFgUTS1v9SVYYAm8+cM22YkG6AdQB7oCOeo9pP/g6F5h4QPRrPaNnL5d
	GV2JR8xqbynAx34/25+/map/9RvSYIWhEwyhayxreMATtWFQlWjyCuzwdtU4FpC59Ma2
	QkOw==
MIME-Version: 1.0
X-Received: by 10.180.12.235 with SMTP id b11mr6493588wic.13.1367011714945;
	Fri, 26 Apr 2013 14:28:34 -0700 (PDT)
Received: by 10.194.19.42 with HTTP; Fri, 26 Apr 2013 14:28:34 -0700 (PDT)
In-Reply-To: <517AF0C7.2060201@pseudoterminal.org>
References: <517AF0C7.2060201@pseudoterminal.org>
Date: Fri, 26 Apr 2013 23:28:34 +0200
Message-ID: <CA+chaQesXc0tvUwMhr88KSZHixUW7FRFXpL67=RPx8RuGE0tkA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Question about multiple recipe versions for the same package
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
X-List-Received-Date: Fri, 26 Apr 2013 21:46:23 -0000
Content-Type: text/plain; charset=UTF-8

Put DEFAULT_PREFERENCE = "-1" in foo_git.bb to prefer foo_1.0 even when git
recipe has higher PV.

Use PREFERRED_VERSION_foo = "1.0+git%" to select foo_git.bb.


On Fri, Apr 26, 2013 at 11:25 PM, Carlos Rafael Giani <dv@pseudoterminal.org
> wrote:

> Hello,
>
> if I have a package foo, I wrote a recipe for foo release 1.0 , and
> another for building directly from its git repository
> (in other terms, there are two .bb files, foo_1.0.bb and foo_git.bb ),
> which one is preferred? I would like for the 1.0 one to be used by default.
>
> And if 1.0 is preferred, how can I explicitely select the git version? Is
> adding this line to local.conf:
>   PREFERRED_VERSION_foo = "git"
>
> correct? It would be nice if "git" were enough, instead of something like
> "1.0+gitr${SRCREV}" .
>
> cheers
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>

