Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 11D0F7029B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jul 2014 12:08:44 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so4463987oag.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jul 2014 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=tjUJO5CKQlJpz5N/CyWs0gqxIWDJaEr2H7YmlNl/bps=;
	b=icFsLA6kHGE43zxEjEHOjC5PQ8DJALPTVAWpjXO9ZWYWXRVWIIF63nW/S9ch7xD3ej
	ohy5Q8ITzedJqjhwEQFlbHCPqmMLARGfBBM9GjXTiNbNleO0HKwERcW/HIIaSzykolAU
	sP/lLQCDRhcum/nPqeE0gl414T6IUG42a0RcG3Va+/FnqC2n5QY6TCEfwZx8caf8bA2W
	crWwGdUYQOqlnUMaAXUNursb3E754SHL4ZcyQcKEV5wheRH9/LcDqCYIQT7icxKyamhs
	z5xd2b3TpIB/5MOS33Etb0uJ8Q+5RkG/fOCkxStGZTQLh40KSQkR3r/14o7ynfTRuLSp
	H2sw==
MIME-Version: 1.0
X-Received: by 10.182.19.196 with SMTP id h4mr31093802obe.20.1404734925800;
	Mon, 07 Jul 2014 05:08:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.84.164 with HTTP; Mon, 7 Jul 2014 05:08:45 -0700 (PDT)
In-Reply-To: <20140706161534.GA2446@jama>
References: <1403706635-12134-1-git-send-email-Martin.Jansa@gmail.com>
	<CAP9ODKpqRO9Gc7uakKrY8Us8XLE2N4uV061dQiN7WLGBtHYc2A@mail.gmail.com>
	<20140706161534.GA2446@jama>
Date: Mon, 7 Jul 2014 09:08:45 -0300
X-Google-Sender-Auth: oG-V4AJYQglDhiW0UWzGhZRoXEs
Message-ID: <CAP9ODKrLQ6aWSSMm8xvdGACUJgXkajOJPDjLG7pmqvybzFxH_A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [meta-browser][PATCHv2] firefox-{l10n, addon}: Drop runtime dependency on TUNE_PKGARCH firefox and keep allarch
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
X-List-Received-Date: Mon, 07 Jul 2014 12:08:48 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 6, 2014 at 1:15 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Jul 05, 2014 at 07:08:10PM -0300, Otavio Salvador wrote:
>> On Wed, Jun 25, 2014 at 11:30 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>> I think we need to have a better way to address this kind of thing in
>> OE. Couldn't the package to 'tell' it is ABI safe?
>
> Yes if you list them all in layer.conf

Well but maybe we could have this in recipe level? So we wouldn't need
to keep a long list in the layer.conf file (which is ugly and hard to
keep clean).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

