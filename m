Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 604EA737F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 11:11:16 +0000 (UTC)
Received: by paza2 with SMTP id a2so21273919paz.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 04:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=JxT6Shz4bPdpN21E+YOPFAdQVXe+Fnxzwfu+G4ngkuM=;
	b=wMgOG5fmaVc4seS5ODDXTI7WsbtREoObuCJ9fqaaG52IoIfiK/RgJBM+blszomh9bs
	tkDdDll73TzxMGJYNXmwv1UwkIvBnPk1lrrZ606pYbmWrAG5yxxSq9cY5019S4Fmh661
	N+v4PHDIKYpCHUK264TU/ANHp3f3CsZ0J9q0m/hDFqZ2vq996EEqyNTZBGsYVVXLERVQ
	49hV0SF2nhwODVxabJcajPBoPFAjHwu5g14sENhooUJ3AjT8zk9EkbICsoOSMHb01M/H
	99dpIEO3Fv+cJCLOY+7LVyIj58bx6GracTCYE/hdbs90SUGxtD1oYBKz3hSoZ1wSwfiJ
	KJUw==
MIME-Version: 1.0
X-Received: by 10.68.108.65 with SMTP id hi1mr4350283pbb.129.1432811477275;
	Thu, 28 May 2015 04:11:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Thu, 28 May 2015 04:11:17 -0700 (PDT)
In-Reply-To: <20150528103631.GF2383@jama>
References: <20150528103631.GF2383@jama>
Date: Thu, 28 May 2015 08:11:17 -0300
X-Google-Sender-Auth: vEvRTZmaaw5fPGWFnWDF7KF4wvQ
Message-ID: <CAP9ODKq55T9jjeTjSmu16cbqfAERFy7CxvMtB-R=rM=B8T6DmA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Dropping tarball recipes from meta-qt5
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
X-List-Received-Date: Thu, 28 May 2015 11:11:17 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 28, 2015 at 7:36 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I'm still working on finishing 5.5-beta1 recipes for qt5, I'm getting
> tired of maintaining 2 sets of patches and 2 versions of recipes in the
> same layer branch.
>
> 1) Would people mind dropping 5.4 support in master branch (who wants to
> use 5.4 can continue to use "fido" branch of meta-qt5, there are patches
> for 5.4.2 git recipes as well).

I second the drop of 5.4 ones. I also think we could move to the beta
recipes as soon as possible so we can iron out issues. People desiring
stable releases can use Fido instead as master is our way for 1.9.

> 2) Would people mind having only git recipes? It will be easier to
> update them. Only disadvantages I can think of are the need to clone
> from git and not being aligned with exact release for long time (git
> recipes usually track newer revisions in e.g. 5.4 branch than 5.4.0 or
> 5.4.1 tarbal recipes.
>
> If we all use the same version from the same recipes then we can test it
> better and it will be much easier to maintain.

I second the git use as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

