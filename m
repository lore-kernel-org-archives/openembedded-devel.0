Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 30FA375573
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 07:44:39 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id s9-v6so5402771qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 00:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I5szYRbWsRbUrV8RdKoHA1jktXZ49POv+OLyQOymsFw=;
	b=RifD6+WvtmJgU2kthSDiMo7PSHlOwGcKSDc7jKnwDP6xksQDMkqj/5AsdhHDgPsqZd
	oCfBn1BBExfGxjKY7OaVEUdx0sjNbMKHeKxsdiCyEHzWniaGH1NEft0JKeYEQy3Dm+f6
	4PIV8MWZ3IC9aspBlZ3lEFCLUJpbmLDfcBTGYunJu3ZpFWx9+O5wcU91y0lUP3hv9stJ
	SszRA6yHgJ4QCgA9/15c/LZZp2yPOpq+fPqGUTlCDS2qCK0twlCjUnJH2pDOuJ6RFh4V
	mkBwEEOeOgfvgPEUUZ69qf0bOephL38hdadLYoTs1nSHnCAXreYbHGaH2uSraT21bM6B
	Qumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I5szYRbWsRbUrV8RdKoHA1jktXZ49POv+OLyQOymsFw=;
	b=U4x5DaV+CywunVtz/ACBNbNdAW/0xDqyCMuHJ+jS0WVtCI4t2Dl0uUMk+yMGzb4t0b
	zoIgElHWEYy6h9tfvKv4meX9+gqIHv+cvHRJklqL99hsiojRIhkd9gsNYtnHz2P+Ucym
	9ChKEu8j/djb4HFhD1EeM5OvHG4RvuZ2IGJxbqpHrRyVktM++EBJDM2QtLaZ3F/9cq+a
	oATUNjbpSeC6I2HrMGHPtg9c5wVN+e1Wkuq6hee9hY8r0tmWVgaj0PSN7KjHN9PlUK4m
	khxBNw6qZKC0FeK8pPqB9e2BRSjGsi6JZfjnnrHAGio0BYID38PEZQ7Qg6nU5PVuK88A
	ogkA==
X-Gm-Message-State: APt69E0EcDI0igL+BYuNWgilaWfWZtufM0UCThncYGhjWtZDpM11aBFY
	n2tkPzAT5gYTVwPjZdeu89ZyJ5lIvK92Lj40+w8=
X-Google-Smtp-Source: ADUXVKJZ8FSIQTKX8aasDyU/Lh8JJE5pRYiMLE+QtvY6X6fw8F7bP29vT2SLYWDyIxHC9nt/TFl+HBXOLTPDDOtqIRI=
X-Received: by 2002:ac8:296:: with SMTP id
	p22-v6mr1730119qtg.188.1528271079965; 
	Wed, 06 Jun 2018 00:44:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 00:44:09 -0700 (PDT)
In-Reply-To: <CAJKOXPdiH7PhJc=PdOC+ryGExFc=P0dHyY3XLPHFK+Fh1Jh+MA@mail.gmail.com>
References: <1528107496-14737-1-git-send-email-krzk@kernel.org>
	<CAMKF1spWoahwg8+kiEdYQ086q651=+67DCb9Cwx7gkjuwjcBug@mail.gmail.com>
	<CAJKOXPdiH7PhJc=PdOC+ryGExFc=P0dHyY3XLPHFK+Fh1Jh+MA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jun 2018 00:44:09 -0700
Message-ID: <CAMKF1sojdCjABYS_hEJ32FEQnLwRssmy=VkfN_LXDpZuY95S9Q@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] lshw: Add new recipe with B.02.18 version
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
X-List-Received-Date: Wed, 06 Jun 2018 07:44:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 6, 2018 at 12:10 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Jun 6, 2018 at 3:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi Krzysztof
>>
>> This fails on musl due to basename() API not being available
>> you might want to fix it on the same lines as
>>
>> http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/poppler/poppler/basename-include.patch
>
> Thanks for hint. How did you build it (how can I reproduce it)?
>

TCLIBC=musl bitbake lshw

> Best regards,
> Krzysztof

