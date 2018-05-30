Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6033260800
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 16:40:56 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id e8-v6so24087438qth.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XzSQn3Sms0uFNBregjLc4Braxc8TB5i4BVlB6KsY+LQ=;
	b=SDN88LjwQBM+QkZF0FMEOzAJUEP+0V10ST+2H1SJVGdTOX/zcjJdK5FfutMbVB8KlT
	8a22Hg7I9BOfP7XFE5gcGyTkH7LlSJN4FSSk+5GWuxCxxvq/hnJefogL6hHpbFIRyTSQ
	O6tQXrhSGB9ZqxZH5hWHCqWRcWCUIxAqqqOBBAgo04+Pbe+tXUJ6gbuvUPEA9yXPDUMW
	4pifBkFoafx/Op2suJiadPJqfZsdl8BWRuhM/5i6Elhrh05BjzYBfsozsfLxfztDQi2l
	UzQmGFHEo4BjuC0JNF9si/R9Geg8kSb+YXkD3uqqng75Jw4xsGE7dXWGUpeiUSBCbL3p
	R14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XzSQn3Sms0uFNBregjLc4Braxc8TB5i4BVlB6KsY+LQ=;
	b=BLjJ+yHOaMZJWFwSF5J4OFK+qjoHrBYDjAnTRt9n8/RtbqUs6Y/NPnEvt/Tm9EV+kW
	hlaj9duYMQvbtkK5ap85Bsa9lAAOCEztoaRpZUAERFgAeWWg4Vxd5PMgbjzMk+khI8Sh
	rjiAJ6nichEvH3Fx5SgS21RfAs30GqfXPhvHOG0WuQKuX0w2n/0ykJlBxBTmuG2p2tsj
	SC8SqoRmDYyMbbhcgb4OQ8T8VIh4vxM1Z53xYPLaz0PLaxhV5e33lkZK2sDr4Z+o2w03
	XrTGZiDiwcu9QpwwrTXFcPVqszJk1nOsPIKBqxHn8xSexuj5wV2URnOzpgd5xm3gING7
	U0Eg==
X-Gm-Message-State: APt69E2HFneeFqMJRkCbzdXmqjHB+zxLKCnrzflunwZsuSoxOAPJ/AJx
	zaIz+xAl9KHbq4NxBoAWVtVodHVyD6uih4coJ6M=
X-Google-Smtp-Source: ADUXVKIxTM2FVO22LCM800H2TVpqYZtI+NHSfyq8rZ0kFHgdFVbVrJnXr0HXsLt7DVMizRuzrc5/2spWxmrNgE7IdSw=
X-Received: by 2002:ac8:296:: with SMTP id
	p22-v6mr3125282qtg.188.1527698457772; 
	Wed, 30 May 2018 09:40:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Wed, 30 May 2018 09:40:27
	-0700 (PDT)
In-Reply-To: <CAFSKS=NhF86xbrGtJAbfxhGMAsNGiaLxWVj-4oAjjk2R4zsFNQ@mail.gmail.com>
References: <20180530134741.29397-1-george.mccollister@gmail.com>
	<CAMKF1sqgQSZE9K36c3MOAEd_HCMoQAL5in8eRXSBdbbSe-+zrg@mail.gmail.com>
	<CAFSKS=NhF86xbrGtJAbfxhGMAsNGiaLxWVj-4oAjjk2R4zsFNQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 May 2018 09:40:27 -0700
Message-ID: <CAMKF1srma2-E4JwpKro-u6USuh+dXi49mnH_YT=ZCOLN3VzrgQ@mail.gmail.com>
To: George McCollister <george.mccollister@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Subject: Re: [meta-oe][rocko][PATCH v2] protobuf: fix SRC_URI by removing branch
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
X-List-Received-Date: Wed, 30 May 2018 16:40:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 30, 2018 at 8:29 AM, George McCollister
<george.mccollister@gmail.com> wrote:
> On Wed, May 30, 2018 at 10:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Can you try this patch with
>>
>> Bitbake -cleanall recipe
>>
>> And bake it again
>
> bitbake -c cleanall protobuf
> bitbake protobuf
>
> Works fine for me with the patch applied. Did you run into a problem
> or have a concern?
>

yes my concern was that your local git repo for protobuf might have some
commits which might not be available in upstream repo. So checking out
a fresh copy from upstreaming and building it is required.

