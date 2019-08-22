Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0849E7F284
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 09:14:31 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z3so10486349iog.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=r9zWbGsrjImSZswgjEdwIjHJS4YZanjT9lBJLPR4Z0o=;
	b=JufxdgOyBDc8cCaO4qBvlZDclFPRpdvneGY5FKd6G1OqBuAAj9FutIa6Fct4T9FRcz
	x+jqKiUVpfpxVDQuZXtVIuqG7TI2F0NAB8FSvpxaa/ZnyOiaqVZ0Yv5OU6X8uI61mztW
	zSr5FGSgjh/rgR+6dmtlG+W6hKv5FR8Lj1OzFow4vgeiJHn2SdMNn/cqmbq4tWi7RL8B
	56WnKf6ZbE5XhLVfqSnolR57B47Km5SrPvAiXEeADXrJl5s59Kpf0AJD9gkc37bFGG4H
	Gh0jZozY6hf5NX/bFQqag+IIAFI5h0Oh4yY8QtKXiErtD9KoEYTP6ypXQ8qtf261CNY0
	Wr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=r9zWbGsrjImSZswgjEdwIjHJS4YZanjT9lBJLPR4Z0o=;
	b=cwjB458zcn4X1tQ+GLveHMQaR9yU8IxOKPsMoGZ9wxwAEqYk7bID3gZdqBVpfkVITq
	NVnMJ0JJpNZshM4M+olk7H1bgn4e4NmddXKoit9ZX5k7agec7fg7mc/HuiOyI/JfEeeW
	288udY4jlTun+Mk5QeJRfrSMGYdwhZzFCAaa2MlIBrCZruznuzKjQC2DbIZsba48XHNB
	9OAG7qvwyDIqxws9HuJCkdp+1JMAmvn8OYnSlyPbE8IEhiQCWx+4gm+Wt9bIQ4+SAmns
	ihFvEMeypnET8btMoXBi2x79myCD75hEu7O+QUqhVcYldhHiZAWAF4NdABUmfXg9rl+1
	okQQ==
X-Gm-Message-State: APjAAAWOyTvkFwYiCK4vLgQqOkAuivhEQ67NZ2bv3eeHnpcwGNFZYhwj
	xlmMBkKeW9Tjx9k3JjCRRpslT8fVRRl3ZaOeZyo=
X-Google-Smtp-Source: APXvYqxxjhnBF5JFSKzMtFptvTEfyfX9Hijo4OIXTNVtfzMM0s32TYeK/Ueb//iU7kR8WPlzsMidOboEdCD+cMOLabE=
X-Received: by 2002:a5d:9e05:: with SMTP id h5mr7496515ioh.302.1566465272930; 
	Thu, 22 Aug 2019 02:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
	<20190817081339.22253-2-schnitzeltony@gmail.com>
	<0935fc2d-42bf-2b2a-ff09-973a291343b9@gmail.com>
In-Reply-To: <0935fc2d-42bf-2b2a-ff09-973a291343b9@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 22 Aug 2019 11:14:21 +0200
Message-ID: <CALbNGRS=7joKaYC6mSw3+vM=9igErYQZQqhmYOSX-tgsiD4nPQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [warrior][PATCH 1/4] vlc: rework qt PACKAGECONFIG
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
X-List-Received-Date: Thu, 22 Aug 2019 09:14:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2019 at 6:16 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 8/17/19 1:13 AM, Andreas M=C3=BCller wrote:
> I found this buried at the bottom of my inbox so apologies for
> responding so late.
> > * qt4 support is gone -> move to qt5
> By support gone do mean, not supported by Poky or do you mean QT removed
> the sources?
>
As far as I can remember qt4 support was dropped in vlc

Andreas

