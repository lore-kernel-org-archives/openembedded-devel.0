Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8644C772A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 03:20:21 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so7145336igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 19:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=+0+0Ob0kuIpTwDTzY+cddWZrEdtQaBLZScYVVDilz1Q=;
	b=E8QekKDoY+RSy23owN6zZyWjrqqmjBmt0Z7321+SOcNi9RLbcW7t+mpLzjBswRO0jY
	Bo4jpMM/l9dTqL28U9TxTr3g+vBoLnUtGOJ8BIzKHwxenY7N4OcMN/Y0HYgWR5+BOGN3
	eOK8QEzWx1NKH/yknuVZYIYy5xSIvryuH7QqzsBdiBQMZM1qX2XmavrbI2ZmpOzr0KrS
	bugblNxXkGLiTAbJguD5s1RnwKdus2Vc+XcwbDF7lJjUTadfLek9hWnnuhJVVO3lkNA0
	0WvJ0LuTzZ89pm7l6xAghGbks2i3Q0x0hEgeZZOQ2bqcU0SdTdN3CWjrcVuA6KMtuC/i
	t1QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=+0+0Ob0kuIpTwDTzY+cddWZrEdtQaBLZScYVVDilz1Q=;
	b=yRZBAmDlEJSn2uSn1PZIouWpNFIc5kmQuzsmBXinlzoiHOdbVhvsYubhGe7yJnaq5t
	wEOw1kI2Itl12zp+RKAVovVFvgZgbaN6pAzodskerBX68VdJIkMA7QXlKFuwSM/Mo9OI
	iOF+S8YHQNhWbnB3yg+OGlu+ir5yB87d+2TwtQE0Q27wREp/tIgYD/DQqZuFQvxMKO2b
	Kcg1zWeF85e8eC7ESlXT7xH0x21mI2M239brxf3VDQQhBOGWORideh4MKd9jnDeHRuWe
	UIXAAK5cNO3pCEuri/VEGXnsWzJAwJUwVMVrPSLbxuEPgOedFVmF9jycRHbV9cVqnQr6
	BCWQ==
X-Received: by 10.50.150.37 with SMTP id uf5mr1140759igb.10.1447384821403;
	Thu, 12 Nov 2015 19:20:21 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Thu, 12 Nov 2015 19:20:01 -0800 (PST)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C724338@ALA-MBA.corp.ad.wrs.com>
References: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
	<1447359445-27258-2-git-send-email-kergoth@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C724338@ALA-MBA.corp.ad.wrs.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Thu, 12 Nov 2015 20:20:01 -0700
X-Google-Sender-Auth: 8LMIJ36gn3eFfrj4QR9vBb9t8K4
Message-ID: <CABcZANmkpaSxOJ9Gf=TH7Q1JKdLyVEk-WRSwHWhWhL-C1ATjMw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/5] talloc, libtevent, libtdb: depend on attr
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
X-List-Received-Date: Fri, 13 Nov 2015 03:20:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2015 at 7:48 PM, Huang, Jie (Jackie) <
Jackie.Huang@windriver.com> wrote:

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> openembedded-devel-
> > bounces@lists.openembedded.org] On Behalf Of Christopher Larson
> > Sent: Friday, November 13, 2015 4:17 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Christopher Larson
> > Subject: [oe] [meta-oe][PATCH 2/5] talloc,libtevent,libtdb: depend on
> attr
> >
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > These will depend on libattr if it's available, and we need deterministic
> > builds. This fixes a build-deps failure which occurs when attr is built
> before
> > them. There's currently no configuration option to explicitly control
> this
> > dependency, and I don't know enough about waf to add such an option, so
> > unconditionally dep on it for now.
>
> I added depends on libcap  for libtevent for the same reason days ago, but
> it really concern
> me now, the 'libreplace' in these waf based packages check many packages(I
> see
> libbsd, libcap, libacl for now) existence then build with them if found,
> and there
> is no configure option to disable them, does anyone has a better idea how
> to
> make waf build in deterministic way? Maybe we should disable the built-in
> libraries 'libreplace' or add a PACKAGECONFIG for it?


I don't think PACKAGECONFIG will help unless we have a way to explicitly
disable or enable the dependency with waf, otherwise it'd still be
non-deterministic. But I think that would be ideal, that's how we handle
these things in autoconf, add an argument to let us explicitly
enable/disable it. Hopefully someone else on the list knows enough about
waf to be able to do so.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

