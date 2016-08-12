Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9A47722A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 08:07:04 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so1457309wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 01:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=QBccNVp//hroMYA/GQ05iG8z/Ai0Kt5YFnybCCAhvmg=;
	b=kESv2Xj0NLCTzwb999VJEwsly1Fa3ZyoNuDEMvnXLchHpcIE7Xyx1Jp5Sq+kR5fHQb
	LA/u4CinILfO//yC5afl+Ql7jEhUFuQ6V33Z4NwJIJ4EllxDVzChO7zQYfT0FRR9pAgj
	f33FYN2Y5/cjjPT81eXeYJfYuZizwRpwSlArqmrVsPzvUAh/dIINHJuF0guULthp1yuJ
	kqHCnvwOelJBC4mJCHm56WCsrsXe97NdOLt/aEX+CIuJh0PAb4vEbprbt3Q8p//yCiXC
	i9hRY+hlczwr7cO1PWRxIV19U8lzOsyVIiww4uu98sC95UsDeWstCZyFmiCTrBFQa4Sv
	nipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=QBccNVp//hroMYA/GQ05iG8z/Ai0Kt5YFnybCCAhvmg=;
	b=GH3YuV/+AU/MPxETnOlVxxphhUGhoOOjajqbzZPsVzuZpc2tmD6NGs3TCJP/R8O2Yx
	TcSppNgxWDYfBe9ENy+jgvaNMRv0SVx+3hgUXwQyd5WnJ7nyKwGMhoDQYooEXcyTzjPC
	3bmr7ihg190ZW9QoaF97VfoJvj0U+35xBdeTmm+S7RLC58n1Urm/3K2bCTAIe4JyOP9C
	szXCFtETO36qKc6gIGaGkE8LxEv45TG7LX9Ykte7ltyNWk0Vp0d662u8j2LXhTAKzxqb
	aOkseSZiReH2MvNrW8aVQLa7XUkFowcI28LcSZ0k4Loz82F9LomUrumxDFfjwAdMpGCT
	fCDA==
X-Gm-Message-State: AEkoouumBx/+elg9wD0sQgQbzNgDMf/iK8aVtziDZxwCt9Ph1eAoz9XxcdJphR3jhHK+/5VpjwM2ugIrwN9BBA==
X-Received: by 10.28.19.134 with SMTP id 128mr1536532wmt.40.1470989224830;
	Fri, 12 Aug 2016 01:07:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Fri, 12 Aug 2016 01:06:44 -0700 (PDT)
In-Reply-To: <CAMKF1sqhKAKN8EJVHTm50F6N0Ons3hqJrkc3ERujrwj90m94JA@mail.gmail.com>
References: <1470920876-22501-1-git-send-email-ricardo.ribalda@gmail.com>
	<D01FFBA5-7B48-4F0F-B1E0-3D96FE48044F@gmail.com>
	<CAPybu_35+Ug0CpasvpVg=WfC2N3F_6hmcSbN7CJ7tquhGr7C8A@mail.gmail.com>
	<CAMKF1sqhKAKN8EJVHTm50F6N0Ons3hqJrkc3ERujrwj90m94JA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 12 Aug 2016 10:06:44 +0200
Message-ID: <CAPybu_2dSbwx3FbGzf9OuWyz9p6xDr6rAfiSnB+t1oNu2ZvrMg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3 1/2] gflags: New recipe
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
X-List-Received-Date: Fri, 12 Aug 2016 08:07:05 -0000
Content-Type: text/plain; charset=UTF-8

Hi Kehm

On Fri, Aug 12, 2016 at 9:26 AM, Khem Raj <raj.khem@gmail.com> wrote:

> So it seems its BSD-3-Clause
>

Shall I produce a patch for glog and gflags?

