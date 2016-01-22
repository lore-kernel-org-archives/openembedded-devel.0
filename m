Return-Path: <koen.kooi@linaro.org>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id E7BC673179
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 05:57:28 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id c192so40426464lfe.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 21:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dqbBmlxW87e2jcMt9Oo3pP6Mz8wI05JkFH43dtRodc8=;
	b=jnrE+SQ3adlhPTMoR4F9xW7mV9S8nTYQiUvqui3GHOT1nNNS0p8HQZEKRoy629tUHW
	LEpW/WOR+x3IqeFVDpKb0TR6r5ZETUyafVgZ8ArHGTZQnlGCmCAUjm4bJT4KxbKqwDo2
	u528/VOqtKA3kdvXo4xd/tkvK0Gem5WIBd1vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=dqbBmlxW87e2jcMt9Oo3pP6Mz8wI05JkFH43dtRodc8=;
	b=mmspROvIftluXGhwoT1kxalZ1S/RV7X4YH546Pz+jxeF6JlxdkvNueH8zBbY4XOuN/
	h8X0Go4lA1KmtG3WqSK2s96YiS7t8TKIulR0g93fJwN4Hy6/L0xCf3lWOgw4hOWTtO9a
	9Thp3zJZ8G+l9AxjNJbycr2lMrfcG0ICA8gYC76p0+bvPlzh9SQxyAAaTTWysLCai6tg
	eqwzPwAg6i+PdnQTKaVPhTTY9S18EeuKDhV6pPksb6EzvG7lQLsKgZHEvOt4blEQTr5y
	9S4qViRa8OQUzAb2/20R/o62vuqE290InOahWBw1pJ9uTQktuLn+TTEzdlB0JbbfgAJC
	k0gA==
X-Gm-Message-State: AG10YOQwgdO74OUnsFEMmuX8zHMND6hGHcLYaSVyQW7zENXVV3kjeHkqmdFEmnXNh+rgL97m9oydViH/kiBwYMHN
MIME-Version: 1.0
X-Received: by 10.25.208.213 with SMTP id h204mr500124lfg.112.1453442247858;
	Thu, 21 Jan 2016 21:57:27 -0800 (PST)
Received: by 10.112.204.200 with HTTP; Thu, 21 Jan 2016 21:57:27 -0800 (PST)
In-Reply-To: <4721149.thKUQa4jfA@peggleto-mobl.ger.corp.intel.com>
References: <1453376040-25632-1-git-send-email-koen.kooi@linaro.org>
	<4721149.thKUQa4jfA@peggleto-mobl.ger.corp.intel.com>
Date: Fri, 22 Jan 2016 06:57:27 +0100
Message-ID: <CAP0W-RkLN7KfOQdKfFUJ+gc7S5mkrrXuU5i9Bf7ox-COmdgaMg@mail.gmail.com>
From: Koen Kooi <koen.kooi@linaro.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] various: delete leftovers from qt4 recipes that break parsing due to missing classes
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
X-List-Received-Date: Fri, 22 Jan 2016 05:57:30 -0000
Content-Type: text/plain; charset=UTF-8

On 21 January 2016 at 19:25, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thu, 21 Jan 2016 12:34:00 Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>>  ...erinterface.cpp-add-sys-socket.h-as-inclu.patch |  41 ---
>>  .../0002-qconsole-writethread-gcc-4.5-fixes.patch  |  40 ---
>>  .../qcanobserver/qcanobserver/candemo.xml          |  40 ---
>>  .../qt-creator/fix.missing.cpuid.h.patch           | 384
>> --------------------- .../qt-creator/qbs_transformer_product.patch       |
>> 93 -----
>>  meta-oe/recipes-qt/qtserialport/qtserialport.inc   |  48 ---
>>  6 files changed, 646 deletions(-)
>
> Not that we wouldn't want to remove these, but how were you getting parse
> issues just by these files being present? None of them would be noticed by
> BitBake unless they were explicitly included.

I wasn't getting parse errors with the files present, this is just a
result of rebasing my patch against Martins version. The subject line
might need some parens, though it should read as:

     leftovers from (qt4 recipes that break parsing)


-- 
Koen Kooi

Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

