Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 765757CDE4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 11:29:37 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id x5so24298959ila.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 03:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3VkL+IEH8qcEEHUTneqjg+7Z435FBLHPye7l+cqlTho=;
	b=sSH+LFmnfb5Udqz8IF14/gLSqtkBdg1+0wT76Jg7BC/mayTxtrWEzsofECdwwi96Kv
	C0oL9/V0GAIyLCPG7ro+yJACJIgBRcViodYGz39APwIVGdSDbCUAgjuSlVBtc9uv2YX/
	d0Am0TulgkwxaMt3lP26K4bs6TIX+yYaCkwRABgyeWeq4pVe2+mrsSqtuGwW+7s7HJP4
	mAb9UfyXOH+GQhglr3fKsdu/9QuezPBTWfug81w3Lo8pMTBLFYp5ISMEn2Fdu+lHzKxg
	N594eKKeczlH9MTVscQ+le6IXBqgxBFIFyYQXNdBUOEc7hob6COoSXipPMzzE6wICAz3
	eQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3VkL+IEH8qcEEHUTneqjg+7Z435FBLHPye7l+cqlTho=;
	b=pnu2KfIlb7UThHG6mDB+mWG6Pc619bSYGGbzfFUowC0Ka2OwxzlVI6+V/cxlIUX6Lh
	j4qvU6yaZh+xaQsh58ip/nBbxctevwdFAsHzxN3sEMgHhSi5foubuoFikqBzUwd6mKy1
	gGCAzhrV5dLx/y5rZWdal2ctOzHl6JyLSOVc/+3ES8q85PsTZ7WYktWfJjPRFXyAqxFA
	cYgtbDK9XMC0dz3mngtqvR6eg0a6p5mUQ/CIGQDSmcXiYZ7p9LdAS93F37PQG4cgKXrs
	g9dMYNUmmCT/J88drzdlDIrL9RRcF547qa5RDs2QqIG1jo9ObWKqPmceAQMJVYODLdQI
	FqxA==
X-Gm-Message-State: APjAAAUa0nueaQUDwnxZKDGxgaKAViyqcQurvB33nynjnHcz2rsXMULP
	f+G/w4gLssi5UkIyi0p7d/m1cnaK3raBIXnFRMY=
X-Google-Smtp-Source: APXvYqwxSwDLzByLCCoULqXw50RfYGVhKkBSCI76ukhPDfXKsFu9r1JnS+WzLJVMnHUJ2l8+3OZf1RD68ljdoiiohM4=
X-Received: by 2002:a92:cb09:: with SMTP id s9mr51480432ilo.224.1577532578558; 
	Sat, 28 Dec 2019 03:29:38 -0800 (PST)
MIME-Version: 1.0
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
	<20191227213120.3930-9-schnitzeltony@gmail.com>
	<CAMKF1srAOXoEzu=0i0yyM8dZn3rLt4B1d-_9FRPTTEfexDZDqw@mail.gmail.com>
	<CALbNGRTeSi6X-osFwzjm1y8fj46Bmsmayemdscn8-f=+=-srqQ@mail.gmail.com>
	<CAMKF1srcYxzH3J960mj8ggfQoZOyj=aO=ky9QjSTpNrEW5Asiw@mail.gmail.com>
In-Reply-To: <CAMKF1srcYxzH3J960mj8ggfQoZOyj=aO=ky9QjSTpNrEW5Asiw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 28 Dec 2019 12:29:27 +0100
Message-ID: <CALbNGRR7mdJT8fbnB5AONcRtPmxVn_v+bw7Jz6S-aKfPsO6D3g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 09/23] evolution-data-server: upgrade 3.34.1 -> 3.34.2
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
X-List-Received-Date: Sat, 28 Dec 2019 11:29:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 28, 2019 at 4:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Dec 27, 2019 at 3:48 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Sat, Dec 28, 2019 at 12:19 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > I think version specific information should be in bb file not inc
> > we have a native build and it just builds some tools required. Both
> > native/target share same version which is set in
> > evolution-data-server.inc. So maybe I missed something but what kind
> > of change do you suggest?
> >
>
> hmm if it shares with native/nativesdk that might be fine
> why dont we use bbclassextend for the native version ?
>
* Native and target recipes do not share much in common (see
evolution-data-server.inc): As said: Native recipe just builds few
necessary tools with a set of dependencies reduced to minimum.
* Most pieces would require a specific entry
(DEPENDS/do_configure/do_compile/do_install/RDEPENDS) for native and
target. Since target recipe is already more complex than most recipes,
extending to native would confuse more and cause recipe less readable.
* There is no nativesdk yet. If someone needs it: extending target
recipe should do.
* This discussion is unrelated to this patch - right?

Andreas

