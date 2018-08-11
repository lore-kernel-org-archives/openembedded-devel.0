Return-Path: <twoerner@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 28B4378F34
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Aug 2018 22:21:59 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id f8-v6so9826303ljk.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Aug 2018 15:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=awDiStZtcAk2gUfYWBh2UKoY2qhpesW5RDNK5RhpLXQ=;
	b=Wj50+yiQ8g31yH2IwUBSpl/qiyhfn2MmhitmnxvkE+16LLfcu+Gr3NWjpqGbN0n31o
	CL4dbICv6WUkx5g2FT25WAd+t6GFsL4u4skG6F08PA+qlR/LdaXRXoyrbPG2g9CO69Vr
	+k73DSkJJrIoopdjgvYmIeUmwo9ek/M2TmFJjQwGCssvq1F/NSVJx19Pp2vUDQ+Dh44L
	iezYw3vT6Sayg5juYIwLN9kSqWILnBaBgHS/R6qTvPC69+milAEo/IMayypJoD02q207
	nk/ZypDHP9xhvPPa5rnisgHx4MBABgre5sjxjNmhHR9qhIvi2yXaoUIfHJb8pxcWRnYG
	JVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=awDiStZtcAk2gUfYWBh2UKoY2qhpesW5RDNK5RhpLXQ=;
	b=pLtk7jd692STyuwwU/YjeMlxh8S8aKCwLzjhtJROte2qBBFFVZVDkBviGSl1pSGfiR
	h8H/azpJ+EEVgY7/v5ZnhrcKWqjaLzod7pqD59UiSUQiHmeVECWwVFmwpKJBc25hShku
	G1KBtF5CkQYdA/6HcTAUQd5eFY7DzJ9F528wQRDblWNBhtXKRaVi9Gg+b3G8QJwH4PVC
	SFOv/G7gAiAcsvMqwW3nqf7XxTguccwXZ2b/NO0x8Ui9ue9GAN4pcxEs+PHbZCA/k2OF
	bI86qNSbI/2kkQeZeRwtHbtDwie/eVrxOtg80/+AO0PAVBqG7JLMuMOO2wyrbO3avUQd
	VU2Q==
X-Gm-Message-State: AOUpUlGJ5XnlL9S3KjgTCsErXG7MkDvcGNBf7KRUJl+3vfKZTSXZMfCd
	bi3tGsXb1NhNKxI7tAbgj4ad6HeaPuvPuDo6E8E=
X-Google-Smtp-Source: AA+uWPwpcS0ZqGDWf9Re/8ePlUKK2CH1HQo0Ieoz5hCHfcD4hPZwHxvWjMYTvHSCPaEKyrhxCZqJYdWCRPZ9rNTGNXo=
X-Received: by 2002:a2e:9004:: with SMTP id h4-v6mr8533373ljg.44.1534026119698;
	Sat, 11 Aug 2018 15:21:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:2195:0:0:0:0:0 with HTTP; Sat, 11 Aug 2018 15:21:59
	-0700 (PDT)
In-Reply-To: <20180627114455.31496-1-fritjofj@axis.com>
References: <20180627114455.31496-1-fritjofj@axis.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sat, 11 Aug 2018 18:21:59 -0400
Message-ID: <CAHUNapSBA4MGKVCKY5AVDQpBd9jgVTfCxZUwnAppBxiV1pGzSQ@mail.gmail.com>
To: Fritjof Jonsson <fritjof.jonsson@axis.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Fritjof Jonsson <fritjofj@axis.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Add recipe for cereal, a header-only C++11 serialization library.
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
X-List-Received-Date: Sat, 11 Aug 2018 22:21:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 27, 2018 at 7:44 AM, Fritjof Jonsson <fritjof.jonsson@axis.com>
wrote:

>  meta/recipes-support/libcereal/libcereal_1.2.2.bb | 16 ++++++++++++++++


Is this recipe supposed to be orphaned all by itself in
meta-openembedded/meta ??

