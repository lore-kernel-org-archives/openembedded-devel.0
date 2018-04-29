Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id DD69C605BF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 15:22:37 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id z129-v6so537720pgz.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2018 08:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ar73pZcDnt4r1b0THBeVQVd5hUeRH7ZhkpJiiFEW6I0=;
	b=r72yc74eqBqIvlzkGpX5jQ/CBXI7xk2FB/dxhIJQWKqHSd2cdcoX3t6psgKLoHOdwH
	7SeAIuyR4Z5+5cyXNFgO8O7+fUF+r/uRwjXUJwYNF2K3UEyv9dnaJKwL9VZLDFg4TC89
	j2DS5Nl9RuJGc0IoqMK1n0i1vxQu0+Cass5lknn1vGswYfl4sjAhR+BQu14JeG0nn6Qd
	d76VC3Qe1Z3VO8vTqTcqArBpLW2N10U9bRln61WjXGxoaqKmftT6Sd63JjlGo+AJgpev
	/f2t4+DvO+oieZw1vNuW8p/T4aC7n9aGD06OCox4rVg6c2hy6RrQF+YqkxZoXhhzkZaL
	I+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ar73pZcDnt4r1b0THBeVQVd5hUeRH7ZhkpJiiFEW6I0=;
	b=TnCIeZw/wG8bWzIsrQ6EePNcM8VmjLZa8qqKFhrXMzZZ4bCx/PAC4Nj9hJA4cgqfZj
	Oto6gRuv50k+qJLmDoJhGDfRs0Eji/eszDunuNEVbCkrvKaSvIHAFZBcv3nnU381uYyX
	+uqeyRdRXwTMI7rL7CBbv5qmqh8KeZkkiQDZtJbPPCxONbfA11CLb400qWeXEA4zRJKR
	ehy0lUH4PJA2ryG8etIdao26WnmbYn0aTwqXW0ojjVSCMrIyAyYkFTZwiMKlqfwVYj9r
	2He/FbtM/sA4nguOzUHKMFIs9oi0Whl4Z521/AvJ8BFIq0coW00jXrXbv3PhK/FGT+2G
	loyw==
X-Gm-Message-State: ALQs6tA0DxAAFPR9RWrBfV1osZczlwBjJEy2DBi8CBH3XIf6frm2PSmd
	XtInu/LSvz3JhQGc8oum600Jkl9tIruy/drSGL0=
X-Google-Smtp-Source: AB8JxZqQKzMHh5esUD1kNBFIJRtR0uAlCInl8O74igTVyTFFzVIX1e0yXIaB95bLJBDGkmX6RGCi6s1D3c/tNylnPzc=
X-Received: by 2002:a65:4b4a:: with SMTP id
	k10-v6mr7903975pgt.227.1525015358358; 
	Sun, 29 Apr 2018 08:22:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.182.141 with HTTP; Sun, 29 Apr 2018 08:22:07 -0700 (PDT)
In-Reply-To: <CAC+thW0hX39De-zuRBmE30=BSwE0KxN7s9sE4Mb5BViT0f-HLA@mail.gmail.com>
References: <CAC+thW3RAbh6_2b8_Lzqx-UnE8xzFsW=1z0E9C1KXBukD02ecg@mail.gmail.com>
	<CAMKF1spLgyayuJG0LMoEbWNw9=D2zmXE0aiK8p2n-iwV5sxBUg@mail.gmail.com>
	<CAC+thW0hX39De-zuRBmE30=BSwE0KxN7s9sE4Mb5BViT0f-HLA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Apr 2018 08:22:07 -0700
Message-ID: <CAMKF1spYD5R9QoLaZR+TjHx9AzWkoTbrAwxQXURD5SvfNTAQRw@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] README: contradictory indications?
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
X-List-Received-Date: Sun, 29 Apr 2018 15:22:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 29, 2018 at 7:59 AM, Andrea Galbusera <gizero@gmail.com> wrote:
> On Sat, Apr 28, 2018 at 10:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Thu, Apr 26, 2018 at 12:10 AM Andrea Galbusera <gizero@gmail.com> wrote:
>>>
>>> Hi,
>>>
>>> I see that README in meta-python contains conflicting information
>>> about layer's dependencies. The introductory paragraph states that
>>> "modules in this layer need to be independent of openembedded-core and
>>> meta-openembedded/meta-oe", then a few lines below both of these
>>> layers are listed within meta-python's dependencies.
>>>
>>> To me, looks like the sentence in the introduction does not hold true
>>> and can be removed. If you can help clarify what the correct
>>> information is, I can send a patch to fix the documentation bits.
>>
>>
>> Usually it shoudl be just core layer
>
> That's not the case, at least out of the box. Without meta-oe in
> bblayers bitbake complains with:
>
> ERROR: Layer 'meta-python' depends on layer 'openembedded-layer', but
> this layer is not enabled in your configuration
>
> Then, would be ok to drop 'openembedded-layer' from
> LAYERDEPENDS_meta-python in conf/layer.conf? Parsing-wise it seems of
> no hurt...

I think if there is a dependency on meta-oe that could be beyond
parsing e.g. compiling
a recipe might assume another recipe from meta-oe during compile,
ideally packageconfig
for such features would be ideal. We can validate the dependencies via
building each recipe
from meta-python without meta-oe in layermix.

It would be better to document whats actually happening in code even
though it is less
than ideal.

