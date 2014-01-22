Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6A38660017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:21:49 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wp4so455210obc.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=4x0vu+NPIEkySLc3arusLrBYsM/glXpLcJeZXpDhfPU=;
	b=ku+wG/byOHf6/jjIOz9WycqvONxiuYZXeneMfv+oymb1y23rs6AlD79lDimBGE6nu1
	Ui2Q1ZCBB5jp7IvSi7zYywH4UgDyMlEqQ/3UemFa6+UZ6zXYLvRWJxwuu/MuXIYarzHg
	Ax2qSkmHgqnvsrCnL/Cl6gqe9hMladuXy5H68QPNdniayV34RUCaP5vLmScSpz3XCYX6
	f4Rq5I0Bh7ddytPLdOqmWdm6rreYrDP+ukO6MjmA1wKG71orVi+qiqqy7+gOUEWIi9w3
	s54jOweQJ6+rpicwEbK9oZk+ZX86WEZquxwvvySn/QGFqFowETxQ97ecs3m2oK3xl+tJ
	06+g==
MIME-Version: 1.0
X-Received: by 10.60.99.8 with SMTP id em8mr1548435oeb.8.1390400510400; Wed,
	22 Jan 2014 06:21:50 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:21:50 -0800 (PST)
In-Reply-To: <1390222355-9757-1-git-send-email-liezhi.yang@windriver.com>
References: <1390222355-9757-1-git-send-email-liezhi.yang@windriver.com>
Date: Wed, 22 Jan 2014 12:21:50 -0200
X-Google-Sender-Auth: NyUiLwFherTGdzC5c-07SFNOP1A
Message-ID: <CAP9ODKr5h8uX9yp+b9n8MpniGGosZ+MW_YEk9dKPR8QHj-XO7A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] traceroute: filter-out patches dir
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
X-List-Received-Date: Wed, 22 Jan 2014 14:21:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 20, 2014 at 10:52 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> The $(subdirs) contains all the dirs under the ${B}, and this one:
>
> do_unpack[cleandirs] = "${S}/patches"
>
> will create a "patches" dir, then there will be compile errors, filter
> out the patches will fix the problem.
>
> Note: poky doesn't have this problem since it separates the ${S} and
> ${B}
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Couldn't we change it for OE-Core as well? So we avoid having to patch
the build system.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

