Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6B45F79C76
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 15:38:17 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id x24-v6so3167500qtx.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 08:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=brE4NVzRmBMYmiPGQUZgxbG0+xaqWSslF6yZznxtp8M=;
	b=tWJi/nUdt2XcMBtwQQ+FQxJ6RRGPXSADtiaivI2i9yMKynOoTyQOsCw1qJt3rBPMOi
	uN+nknaYIu25tho3NTges7BYx0zRq5bauDFQwWwBaW0yhPCU8RbeO+cOqmqtEpbERBOe
	4OeQiHfo1D3Oqm2nLPUny6JymxKVgiiQmisMNtyKkBpZhTnI+mUyAcTQiykG9OrI1wOD
	wW2Y+QN7eW67Zhxw6GGLMG+O9KLlTRiDtVuWyyzFfupSbFbKGzBkTK5s2I22un9MyJZh
	+LGyF2XDXOe/kwnznB6Yk1qWsAtM1v/rhEk9Z7u/doQH8OGt7I28n7d/+P0s0QcfYnPI
	Hneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=brE4NVzRmBMYmiPGQUZgxbG0+xaqWSslF6yZznxtp8M=;
	b=tb2L8JTIqntGon1lC0TzJESV57M8hMaVpZxg8jA/2wY82uP+SeZdeiwYr0TaO7MevU
	MOiSw99RJTPoE4nfHxEvIUryeqwpnTd+dNyusqJ5l5wXR075qJ9lUfqzlh7NnzWGOYeY
	J1IX1eR4xvptuFoCdrFDQyvwRO1qYAlrVb4d9jbcbKBqfQU/5UqlqkvrT4J9ckFf724z
	G4BPoNESr0GMJ34ZRhyVoWt69916mVH/BZlEojvrlqY1LGf2PibdREDBQrmDPh9IoNZc
	eefpr7nUdsuL/0VcQQwqioHItDOaP1znavQyxlxC52PBZg+OHv9kQRk4ER6AseOpD/Wa
	p1cQ==
X-Gm-Message-State: ABuFfohbINX9vvKJowIFO6lF9ayDTwCNi50LFiv72Ddsh+Nhlc+cZgkG
	6TVVD6vSOF+gF8NsTAds3It/J1709U6sNlJYaSI=
X-Google-Smtp-Source: ACcGV63yj2PDkUN2UE7v1SMVbv+409ZnvThUG4ougrWs2bnrLDf0/+GvOuZXLfjG+Eln/HbsNO2uvxAceA4SVWnTR+E=
X-Received: by 2002:a0c:ad47:: with SMTP id v7mr26852891qvc.228.1539877097901; 
	Thu, 18 Oct 2018 08:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <baba8cff-5f3f-b6a4-efcd-377a43ba8096@telfort.nl>
In-Reply-To: <baba8cff-5f3f-b6a4-efcd-377a43ba8096@telfort.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Oct 2018 08:37:51 -0700
Message-ID: <CAMKF1soxg8+rL-L4KLAZQy4cVoFZR=jz0uGrprJJCGBk05_Oag@mail.gmail.com>
To: Ferry Toth <ftoth@telfort.nl>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: libgpiod2 incorrectly depends on python3-core
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
X-List-Received-Date: Thu, 18 Oct 2018 15:38:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hi ferry

On Thu, Oct 18, 2018 at 6:33 AM Ferry Toth <ftoth@telfort.nl> wrote:
>
> On master (to be 2.6): In recipe libgpiod_1.1.1 when enabling python3
> bindings the generated libgpiod2 package depends on python3-core. The
> result is when needing only libgpiod-tools in initramfs the whole of
> python3 is pulled in.
>

This is because of the recommendation thats added to for best out of
box instal experience. You can always override that in your image
recipe and that will break the rdep chain

BAD_RECOMMENDATIONS += "libgpiod-python"

> I believe this dependency to be incorrect, instead libgpiod-python
> should depend on python3-core.
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

