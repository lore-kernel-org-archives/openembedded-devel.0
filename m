Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 35B857FE00
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 07:23:44 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c17so5103804qkg.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2020 23:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0GPdRJf3bV8wixH+1m+7HRP6NlLJUIP5vOkop5zQ9qI=;
	b=T9m0C1RIbrmvfdOxtLaRb4XhH7OkLCwuEcFnvpr6brd4ew540ZIjxkLd4IJVzMjkaB
	fO37ySgOkBmwCSovlqR65KPrx2G3mBFTI/BPbWdtbR4vF7scBsiQAtC8TcHnlppcZarO
	s7GUle4qLngHR23gwLi+CHjixmaLLRvoLL2O8M2qU7n2hEFXHWbHYKMwzOcvzXd1908s
	4jIm/QTIrM3btQcLiZy7nzOcg8TwcozO3Nr81p1RpeBQMwx5zXgHH8jU9iWRhNuUYqaQ
	hiY0C43V7j2IN1uF1TtAsatYb2lSdcF0vbmatZmclP/t00shYUuzyiCDXyPxpfDovkOz
	9Y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0GPdRJf3bV8wixH+1m+7HRP6NlLJUIP5vOkop5zQ9qI=;
	b=hCL7okFMrm9AbAW8E2n37Ir//1MECXOCe6pqK9AmcoXCc/LYZd6f0/dTBSWqp+pJ38
	cpi8hRqDa2CWHfUD1NHcjxitla+8fW9RtP6KxJJW1dWju8vnZvDiYfUezle46y34uY/V
	mPMpq/oES/WOqpvrQcFDRJS5U8BxXxTBAPtDltAg2uta6Po1EaMHv/U64GzD+cpU7w0n
	U0b2y+u+9Im193QzTKRFD+rZ1GHW2+z8WuinTVEWhSE5KyhrTtqEyBWlqEktZFxlONID
	o5JxW3OtEAU3g/CqL7M8P38cKNTWp4tefgKKjgzYmY0gNNnQLPPjVcwfweOOJU39gXOv
	xnmQ==
X-Gm-Message-State: APjAAAXDjdYJt8YzsFhvAisfIH1XXfrn+mBcBsBKsWKEzuVmc0ncScqv
	DmD/+/xhoVZbfrdWrAoekGFMMG5ILsYJ4HCzyJ2Z3pee
X-Google-Smtp-Source: APXvYqw/Aim+myb8n16iCENP1pCtQDAZHt+DCmzLub0Rf/ySFLy5FIVPLyaxjKJDyUpaGO2n/juXotembssKuYqSg4k=
X-Received: by 2002:a37:a3c7:: with SMTP id m190mr8197976qke.212.1578554624746;
	Wed, 08 Jan 2020 23:23:44 -0800 (PST)
MIME-Version: 1.0
References: <1578463743-72832-1-git-send-email-liezhi.yang@windriver.com>
	<20200108092700.GA25926@localhost>
	<133f8cc7-2ef2-cee6-1642-251bd880cdc0@windriver.com>
In-Reply-To: <133f8cc7-2ef2-cee6-1642-251bd880cdc0@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Jan 2020 23:23:18 -0800
Message-ID: <CAMKF1spwmpWX=N_pU5X_GrSrJSc-0xjuUh6Sg=C9YHDZZQLfvw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH] rocksdb: Fix compile error for DEBUG_BUILD
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
X-List-Received-Date: Thu, 09 Jan 2020 07:23:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 8, 2020 at 11:15 PM Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
>
> On 1/8/20 5:27 PM, Adrian Bunk wrote:
> > On Wed, Jan 08, 2020 at 02:09:03PM +0800, Robert Yang wrote:
> >> Fixed do_compile error when DEBUG_BUILD = "1":
> >> db/write_thread.cc:183:14: error: 'state' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >> ...
> >
> > -Og warnings are not 100% reliable, and in general -Werror is
> > problematic for distributions.
> >
> > Does building with -DFAIL_ON_WARNINGS=OFF fix this problem?
>

I think this should be used when we have warnings which we have no
easy control over
and no good fixes.

> Yes, it works.
>
> I think that the correct way to fix it is initialize it rather than ignore the
> error.

Thats fine, Also submit this patch to rocksdb upstream as well.

>
> // Robert
>
> >
> > cu
> > Adrian
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

