Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 77D3F757AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 09:20:30 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so74070798igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 02:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ZwV3S3ZpqVJOGda0b2JCfwUsPp0E3aqE/kDIEnN1jHw=;
	b=xgNzujSTRE4WeCplUnNR3gv+rRK+P87BmZHMhfbTAMEfuCBwwIuKAifdxMhCdoe2br
	ABKQogGxBfXTlnyuZhPgSuIjQLjOmfjqvoY/ab0wZQRP52di1UhDIUf8Syv6X6DUqh72
	GIMwY4GYOo4m/mDW6nTcknZqT4hIdOMxiOqGvAPEnYFA5hoAJxuuWuK+NUbxs/9mAG/M
	c/On09YNdSeDVJahT6fSO2/BqZtq6D233rR2prRbBNuXOzNdwRGLFOlDW9ht9zyYQ/lq
	EouZCQs2GaQfibB3r9hue2LTFFER1drRfVlMTcGuhsLn9fc3c54tp0+7nNjXT0wzKZVG
	oR7A==
MIME-Version: 1.0
X-Received: by 10.50.111.113 with SMTP id ih17mr8786881igb.64.1442827231125;
	Mon, 21 Sep 2015 02:20:31 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Mon, 21 Sep 2015 02:20:31 -0700 (PDT)
In-Reply-To: <1442825317-27595-1-git-send-email-jackie.huang@windriver.com>
References: <1442825317-27595-1-git-send-email-jackie.huang@windriver.com>
Date: Mon, 21 Sep 2015 11:20:31 +0200
Message-ID: <CALbNGRQwLPUN6Bs=heHtS6W+k978ztKdG_WqTZdH+SNwr080fw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, jackie.huang@windriver.com
Subject: Re: [meta-xfce][PATCH] xfce4-screenshooter: ensure output directory is created
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
X-List-Received-Date: Mon, 21 Sep 2015 09:20:31 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 21, 2015 at 10:48 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> When build with B != S, the output directory for desktop
> file doesn't exist so it will fail if it's not created
> before generating the file:
> /bin/sh: line 1: src/xfce4-screenshooter.desktop.in: No such file or directory
>
> Add "$(MKDIR_P) $(dir $@)" to the rule to fix this.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
Thanks for taking care!

Andreas

