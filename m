Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 92FDC6BACD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 12:43:31 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id v1so2344651lbd.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 05:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=1ZUh+gMueWaMhjkcDBbrIXfjeF1jl2NANrfW8I2BmPo=;
	b=YesaZn+iOmRkWlI9n+CjhvtVkgBvqmh6uDAuiRn61e5FJ0fpILYQNqJz8XTnMesDv1
	oyvT518A4GRrZ/D+QUeyO3k+Fs8jnRL54D/PMJ1p3jbai+bdxtX01f3wR5go/K8rvISX
	XTiZROvCPKQ6rxLRsMZuYtu0HH5X1Me8ocIy3fcH/neF15GIM+8Rt7HgbCy2Jc3sYK0n
	IQI85bmHc1laTUPgqn3c3QELmURapRTSZE7tBuNqcGrA3sZV7rpmbUwnecju0gygtVPW
	0LsU5vmjgL5az0/NlTI6zrgC913lIHfPPIjuyIqa3C68yvf2ASULV+Zua9DdMcOKcCQO
	kDsg==
X-Gm-Message-State: ALoCoQnUbi1nUFGSwmDtU62rZfIMI5as5WdRovVjoR7Bbi9x2Ex+BrQ5lDNHPXqO9caw9B/J4y1D
MIME-Version: 1.0
X-Received: by 10.112.200.228 with SMTP id jv4mr912645lbc.44.1377521011660;
	Mon, 26 Aug 2013 05:43:31 -0700 (PDT)
Received: by 10.112.160.73 with HTTP; Mon, 26 Aug 2013 05:43:31 -0700 (PDT)
In-Reply-To: <20130826111749.GQ3544@jama>
References: <1377513195-21664-1-git-send-email-fathi.boudra@linaro.org>
	<20130826111749.GQ3544@jama>
Date: Mon, 26 Aug 2013 15:43:31 +0300
Message-ID: <CAGNsrLCspqAs3BkAXY7cR1gL4PecPMKUK_4k-DXswd5Xb+ju+g@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/3] ACPICA updates
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
X-List-Received-Date: Mon, 26 Aug 2013 12:43:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 26 August 2013 14:17, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Aug 26, 2013 at 01:33:12PM +0300, Fathi Boudra wrote:
>> Fathi Boudra (3):
>>   acpica: fix parallel build
>>   acpica: fix recipe to be OE compliant with spacing
>>   acpica: bump to version 20130823
>
> Looks good, thanks.

Thanks.

> Only last commit would look even better when sent with -M, but I'm OK
> with comparing them locally.

Added to my git config. It shouldn't happen in the future.

>>
>>  meta-oe/recipes-extended/acpica/acpica_20130626.bb | 37 ----------
>>  meta-oe/recipes-extended/acpica/acpica_20130823.bb | 37 ++++++++++
>>  .../acpica/files/fix-parallel-build.patch          | 80 ++++++++++++++++++++++
>>  3 files changed, 117 insertions(+), 37 deletions(-)
>>  delete mode 100644 meta-oe/recipes-extended/acpica/acpica_20130626.bb
>>  create mode 100644 meta-oe/recipes-extended/acpica/acpica_20130823.bb
>>  create mode 100644 meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch
>>
>> --
>> 1.8.1.2
>>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

