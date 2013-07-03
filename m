Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 417406AFDE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2013 18:29:12 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id lf11so345264vcb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jul 2013 11:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=uU4TbLjygO1BTttY4mkvmkcLEl5zTmHP4XicKhkUd14=;
	b=LQSfncLEsPSDlqp/jRyMnRr1WXggtuTHgETx9Ssy4RotIl5Gw707wITu8HH9GgfNdO
	+eZTkvq27RRulr88mFruYeXs06Kl4w2dsXeCj0v2roQvNiGWkvBE69N2GOm9ySfQ7B1J
	c6ENezbRvlQhItpXMn/fAhb4ieH/zJaGsvUoDo4Yyr0Ew3aGXV8tlx8ab89f82iQSNos
	d/LNJtsoclPTkwJ6lyNOad74HnZVtvHo8EmhyYlaw/szFb0kKmdOQMhif63DzBiywbT+
	mHYKdkyui3nLuorgWaZG6AccbYznUwj8197hLMvRffH+LnbEpGx0aJJsSe9sSdEW4+1l
	cTfQ==
X-Received: by 10.58.24.41 with SMTP id r9mr663460vef.44.1372876152872; Wed,
	03 Jul 2013 11:29:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Wed, 3 Jul 2013 11:28:52 -0700 (PDT)
In-Reply-To: <CAP9ODKoyQfZRmikLwxVcxCXdtikVGNKk8DwRsfNaRURqp4+HPA@mail.gmail.com>
References: <1372864933-17240-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LbQA+r7B0RVDy_0CJivi8H+3yktHUZqCFzz1=AcTkXDiw@mail.gmail.com>
	<CAP9ODKoyQfZRmikLwxVcxCXdtikVGNKk8DwRsfNaRURqp4+HPA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Jul 2013 19:28:52 +0100
Message-ID: <CAJTo0Lar2HO_cr6Az31Sqkxp=7ATSg+jG_b5DkD=t9vCUaJa0g@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQmP6n5r2oSaTC3oUOO5mybYotRnZGA/LzQWuSX9FFvXYWIojSu1D6eihq8HA9nk61NdsAVa
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH] lmbench: Add /run onto package
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
X-List-Received-Date: Wed, 03 Jul 2013 18:29:12 -0000
Content-Type: text/plain; charset=UTF-8

On 3 July 2013 17:46, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> This is part of base-files in oe-core master, so you shouldn't need
>> this to create the /run directory.  Obviously any attempt at packaging
>> files inside /run is doomed.
>
> It has a subdir on it.
>
> ...
> lrwxrwxrwx root/root         0 2013-07-03 13:43 ./var/run -> /run
> drwxr-xr-x root/root         0 2013-07-03 13:43 ./run/
> drwxr-xr-x root/root         0 2013-07-03 13:43 ./run/lmbench/

/run is volatile.  Both systemd (directly) and sysvinit (through
fstab) put a tmpfs on /run, so that's not going to achieve much.

Ross

