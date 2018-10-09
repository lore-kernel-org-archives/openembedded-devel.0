Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id ADEA1746A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 05:29:37 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id c56-v6so317332qtd.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2018 22:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gDtHNr9v5JYkFHg3qjNPxwbbjjscR3KpPloCSwflIj8=;
	b=dcj5i+k/tqQi8QrpiDwpXC3FTBo/aaZ+Q8vT/cMq7CHVcsgaX6P73dXFZWSbToAdYo
	TwLJpfTT428hVAS8YQfwfDuDuCqjujVwov9hNS1Y7zdHi6XIkKTbJHPBb6479BnfctkY
	pcdaeElnY3+S3aUH12LV1JAepELFbIJTuk/elYCXS9PJZmp06rolMyzl/F30m+2wKsDD
	eG53pvhVxyrBA7vOf9MmEkMqQnlyz/akiaQ1O5obE8QPS8KvSOVJ0Q1+X4QYbBFMVzTR
	9mA1ZJbxdhxq2++bG1IUJ99UjS4vmibSFOzEl/qa4Sj70ZSLmz9B9gt/Ape0Uf24UQxS
	SZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gDtHNr9v5JYkFHg3qjNPxwbbjjscR3KpPloCSwflIj8=;
	b=s6ZxNZyyfBUST82Tv6PR6Aq3TC1fprKeScS5/nm9pRElXeCaI7eLYsdpNIAA3RJrH+
	ssni8ZEX6ENL059m6HuCnnKn8ExppJ2yCql29DeugQkrescxMvcu/FKfsdM6NrcOb2Nb
	5qivW9e0ReJjcLlCh4RVWf9BzYY3XICOkLJ4N/XuuRbK0vvCzQKqyiWnvUCPLLToTbV0
	WrZgdxU+wK/7qlj7fciuUVEBFw95JBAtsV/uhUfGnKK0Z8iMCCC0DbyFksZbKV2bmJSG
	0kOKD7d+LOQvsj+dbEy6UuEasdO0d9XlMpUYIxYMojCBLWZ2tEfGOCLiRj3JW8MK/D90
	hbvw==
X-Gm-Message-State: ABuFfojDv+ys3l5byBprCN5E4mVc7On3eTKr/TEOnJ8sYunUunKrpjRj
	ezrkRM1X9w2N+0DOmp86/Wh+Cz7KMFWNKnwnAiM=
X-Google-Smtp-Source: ACcGV60FvQX3UY889Fo3yFRoC1IVLk/+lH27zOK5MNOk6wq1Xd/tgOV8Iy1QBpj0NAX6TjydYcskDbkuW7N9BSuevds=
X-Received: by 2002:ac8:4912:: with SMTP id
	e18-v6mr22244814qtq.34.1539062978363; 
	Mon, 08 Oct 2018 22:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20181009045520.32013-1-douglas.royds@taitradio.com>
	<61910e8d-fdb7-1cc8-8b25-f60a4e120548@taitradio.com>
In-Reply-To: <61910e8d-fdb7-1cc8-8b25-f60a4e120548@taitradio.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Oct 2018 22:29:12 -0700
Message-ID: <CAMKF1soj=qv2UusvK2CADBFnLGbwx8Gw7nHtLHKy-yQfZXJaqQ@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openldap: Reproducibility: Remove user, hostname, pwd from version string
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
X-List-Received-Date: Tue, 09 Oct 2018 05:29:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 8, 2018 at 10:06 PM Douglas Royds
<douglas.royds@taitradio.com> wrote:
>
> Is this a good idea? We need to replace the WHOWHERE value with
> something fixed, so I've opted for the SOURCE_DATE_EPOCH. If you're not
> trying to do a reproducible build, it won't be set, so the existing
> WHOWHERE string will apply.
>
> I'll wait for other opinions before submitting this upstream.
>

this is fine.

>
> On 09/10/18 17:55, Douglas Royds wrote:
>
> > Upstream-Status: Pending
> > ...
> > +-WHOWHERE="$USER@`uname -n`:`pwd`"
> > ++WHOWHERE="${SOURCE_DATE_EPOCH:-$USER@`uname -n`:`pwd`}"
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

