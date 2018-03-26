Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6547D71AB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 23:02:01 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id k8-v6so6978985ybd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 16:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0iInpzB+z+grr/6C1Lr+aAXvgo5LoCC5uFVTvVF/+7I=;
	b=NoF5ms8AnSZ576WWocJ38kFyK4/ZYrHXCTF1Zgy/f9vcAKK5oGoWMtgjlELQP4WTc8
	yslzZV9JYkyVNCUQMtYQ3Tvs+0L+/xPtNZbdsBO7Mb0U4AB/8k4bTpXDZp0goI8Jt/fO
	t0SBGhj6VysuX4FotqzpWL0BOwgJaxmdjzjbSlaJQ2Ua+r6Xrk6IDOpDsZJgE/lMHY1U
	JmsxMdoDgd/hWFjJWioG7yelaNO/Yk2OF6cPLcIKJwgiMgndXeAtkJyiua3Rr9TYfQyd
	IrDKxIdQV8RXCFINDzHtucoIO/u87a0Y7dKgbnaaOvyWZ5I6k7ShOmseVOdm3pM1xRHE
	aCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0iInpzB+z+grr/6C1Lr+aAXvgo5LoCC5uFVTvVF/+7I=;
	b=np4ekDhrDMlqHS6povQgpIb+6FiEiHUTLKsa4vpxfCHXClWMDxKog564zLX6PIuD70
	Vsogdv904RrHPnypMKk+15K2JDlifdVPl87k4fYq9YtnojAWOm8k7eG+YXUS05o9TwK9
	mSIUkYuz6+ZBCRBe78fyhupH11e1OMRvpt0jHsGW/Q1Wc6CoXSrX3aMt716A7fUVkiGy
	Q6bIsG9BBhAmJDOYKzc1pxVEogMcPrgIJlEnc9/E5aHAQf7l3slvFE/U4v+v7lLaXD5y
	ndMV8IK6dTWT/Q3jZIWngv19TnG6bQH+nUCQSRMSqlDyJB3kRKNYGzdhK2v6M6xKzndA
	Nasg==
X-Gm-Message-State: AElRT7FyR7WLM9ujk+SkJC2DoKTvsqGJUnZJ/1fulHF2NYgvoGmvNUr4
	feAeCALAjw7Zz9KVT4dTouBiFo3a7p9A2Dq3ZT8=
X-Google-Smtp-Source: AIpwx48oWbJt4IR9BGQ9SJrNgMGmuIcLFIkHp0wtlMN78YCntr650qIo4DUWWl5dUKckat3YWz42gYgBs4tlWenz/dI=
X-Received: by 2002:a25:8c3:: with SMTP id
	186-v6mr2426760ybi.145.1522105323224; 
	Mon, 26 Mar 2018 16:02:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 16:02:02
	-0700 (PDT)
In-Reply-To: <CALbNGRTyS5H=BK4sZ+YeJnT3=4DeyCGtUw6pGJ5zQAWJQfWQVg@mail.gmail.com>
References: <CA+chaQdLz1OuDFa2BMTRz-D=xwFk4PFbASJOsxR=578_jQuP4w@mail.gmail.com>
	<20180326214334.26378-1-Martin.Jansa@gmail.com>
	<CALbNGRTNSvJT-PO1GMSaaVxpdGjuJKxZTotkXj9dFXLJVV7e-w@mail.gmail.com>
	<CA+chaQdxLj2hAqfvK1YKKKAsg0e3PxGor_K0nfamN+NWAw7hcw@mail.gmail.com>
	<CALbNGRTyS5H=BK4sZ+YeJnT3=4DeyCGtUw6pGJ5zQAWJQfWQVg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 27 Mar 2018 01:02:02 +0200
Message-ID: <CALbNGRQFpVkRPVtMv10avhDoVgUStwMKhWsTRprX_57osSjRmg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv3] mozjs: refresh patches
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
X-List-Received-Date: Mon, 26 Mar 2018 23:02:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2018 at 12:27 AM, Andreas M=C3=BCller
<schnitzeltony@gmail.com> wrote:
> On Tue, Mar 27, 2018 at 12:11 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> Mostly because I find the proper patch headers useful.
>>
>> When doing the refresh now, I find it useful to also add original author=
 and
>> patch headers even to patches which currently apply cleanly, so that nex=
t
>> time I can just use "git am foo/*" (or use git as a PATCHTOOL) and get
>> usable results.
>>
>> I understand that it adds unnecessary changes (not needed to fix the
>> WARNING), but IMHO better in separate "refresh patches" commit, than nex=
t
>> time someone uses devtool for actual mozjs upgrade which might refresh t=
he
>> patches even more to make them applicable on new base version.
>>
>> Regards,
>>
> Understood - but by moving the patches devtool has created to the
> original location (often they are already there) and use git add -p
> you can decide for each Hunk if that is necessary or not - but it's
> not that important to start a longer thread for this :)
>
Just said 'don't want a longer thread' - and now this :)

An example from V1 demonstrates what I mean (using 'git add -p' forget
most of the rest) :

-From da3929a96d9c74e11bf37d128890e18fcb745365 Mon Sep 17 00:00:00 2001
+From 08b62f039e0fee50e9399ce2e48b56770f8f71e3 Mon Sep 17 00:00:00 2001
^ This is not necessary
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Mon, 26 Jan 2015 08:53:19 +0900
 Subject: [PATCH] mozjs17.0.0: fix the compile bug of powerpc
@@ -10,14 +10,16 @@ argument '5' to 'JSBool
TryArgumentFormatter(JSContext*, const char**,
 JSBool, jsval**, __va_list_tag (*)[1])'

 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+
+
^ same here
 ---
- jscpucfg.h | 6 ++++++
+ js/src/jscpucfg.h | 6 ++++++
  1 file changed, 6 insertions(+)
^ This is wrong - devtool does not take care for 'S =3D
"${WORKDIR}/${BPN}${PV}/js/src"' in recipe (I should open a bug for
that)

You'd noticed that by checking in each hunk interactively that's all I
wanted to suggest. Devtool is a very strong helper - I use it - but I
just don't agree with all it suggests and try to the patch diffs
small.

Time for zzz..

Andreas

