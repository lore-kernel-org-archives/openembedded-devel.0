Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 461266028A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 11:48:28 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id a41so810947yho.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2014 03:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=oxp5eAHcBIZTpHYJYL5DF7L78y295jI5leMU8PrKCNY=;
	b=xcW9IitS0bW6xB8vAjZMo/5hqTRM9SeWzRGZI15kc/n3SA2v9fvDmDbB9hofPU8NnS
	4Xyt8Acd4W9p32zsEb7byoy7h9pAaA2ZIDCX8XSzDlJyWlp6aN6uGOzC/crCMAe1LCqh
	MjQumuWsHYMqia3tcjv0c2chIHt5tZE0RYnGNDdG4+MwPdOzbxuuCe2qDmLAOB8VL/AB
	slQddqzoogcMSG+qzoVBiNL+cTMUaX/B1D/exJeA6BDKSFREi/0OYrRGms6IKwweqoCO
	ZzcjqqGku5NYUsoVmQAFiBcPA5AVjlorlzdLt80B1MEhlWD6RGdfErNBDVdMfzsfEVnI
	n3hQ==
MIME-Version: 1.0
X-Received: by 10.236.128.111 with SMTP id e75mr6239752yhi.70.1394020109297;
	Wed, 05 Mar 2014 03:48:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 5 Mar 2014 03:48:29 -0800 (PST)
In-Reply-To: <20140304195147.GC22890@denix.org>
References: <1393640395-9737-1-git-send-email-net147@gmail.com>
	<1393640395-9737-2-git-send-email-net147@gmail.com>
	<CAP9ODKoiySoue8v5eQ4=MtV9gWXaGkmXndH3MxAXOfjPu7DbVg@mail.gmail.com>
	<20140304195147.GC22890@denix.org>
Date: Wed, 5 Mar 2014 08:48:29 -0300
X-Google-Sender-Auth: 6ohCauY8GI0QRajoDmBNv9oNE1Q
Message-ID: <CAP9ODKqDUC=uecx+Zpi4h3OXscKy9hcAV69s6-0w=__Jy0fzKA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Wed, 05 Mar 2014 11:48:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 4, 2014 at 4:51 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sat, Mar 01, 2014 at 05:34:22PM -0300, Otavio Salvador wrote:
>> On Fri, Feb 28, 2014 at 11:19 PM, Jonathan Liu <net147@gmail.com> wrote:
>>
>> > This adds the necessary target packages for development with all of the
>> > Qt 5 modules.
>> >
>> > Signed-off-by: Jonathan Liu <net147@gmail.com>
>> >
>>
>> I like it :)
>
> I like the X11 conditional, but what about the rest? We need some way to
> conditionally include things in the SDK...

I don't see a reasonable way for doing that, for now.

My goal is to make the SDK more flexible and allow it to be dynamic,
you can see a message I sent to OE-Core mailing list[1].

1. http://article.gmane.org/gmane.comp.handhelds.openembedded.core/48084

But I didn't get much feedback from this message.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

