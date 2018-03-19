Return-Path: <mirza.krak@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7157278928
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:45:03 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id 61-v6so10243150plf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=NzQjUuLeG+oYPyWruv+zvV872GZTz6npzILhR+UWePc=;
	b=GnTIXCtNcHgH8I15UqOzduL/vWmZBNF4B0Ac9NLnxznsm8NKZPoYT6bQiMtCdfojNV
	jBffhoRUIPVkiEXA2nPI5jG4ZnzaJ1ZmN9aZMq4Oni8pmB0ASxec4B2aBx7ZWLtp+IyO
	O3X8TEPmkONTsgv37aJdzgukCdExMwy23MwJEX/8aXXIGX5jm59KhAXLxNXLDJMOQFC0
	QNhcrtJcw6rrL1JFQuMfrF9ofbNexBuTakIRmReOOWZKw8SB5v655EOCSStHHnKvqv/C
	/nn2XQXjEvZRM3nbFS8862vFCIM47izwoAK4YynSP63c/HlKUekZkNbfaX/DUcnC3OfC
	xkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=NzQjUuLeG+oYPyWruv+zvV872GZTz6npzILhR+UWePc=;
	b=blkFPkNHrSaGt6yfd5Ct8kGsWFVxpOIx4S5wxfQ94OjtWoPQ2PvOrlizrHxX2zd8DB
	9c5FaeLvIGG0H4mhkX7wt6BkFNrmh00FtNMiQpjqjuUD/CwCI7AfVr0/xQPnVlqTdvHk
	bvCTHizJyP26YfIkK8/SFSyHMnbFwYoyRUvVv5yLPSBbNC7Znqm3xDq7v+aoHPDhNMn1
	lV2YH3jXrJsjiNMCjwu6W0Loh2eLvlI5eQg4/2yYzFne2E5O2AEyV1rP7WykCnu855RJ
	8zzTB1ph/7AKmzoC2yyu4lyUFluv/2sZSU2JKoipFEPxwdLQ0Zoe/tNnYtT9FMRTHRN8
	1qvg==
X-Gm-Message-State: AElRT7EdD+tT4/OCRnNzwuGYWAMeITYyKFF9OOuosXjcNJZVA29Bmmcl
	fhJrPXZOEuZnDcHMDdsadqZsCX335AaUkSCi/3OMzQ==
X-Google-Smtp-Source: AG47ELuVqCIqezDuoP8ncBjSvjUroFO74ilnCFhHRknCb66cjTQprUnDYIqQJUaHt+WGD67WQnXt0BBqTyHcrS0lsNo=
X-Received: by 2002:a17:902:8602:: with SMTP id
	f2-v6mr12465801plo.6.1521467104415; 
	Mon, 19 Mar 2018 06:45:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.182.228 with HTTP; Mon, 19 Mar 2018 06:45:03 -0700 (PDT)
From: Mirza Krak <mirza.krak@gmail.com>
Date: Mon, 19 Mar 2018 14:45:03 +0100
Message-ID: <CALw8SCUwyJA29Ytmgo4rOL+cyVDDZyOePFWnVp-H2Y03BWDYkg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: meta-python/rocko
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
X-List-Received-Date: Mon, 19 Mar 2018 13:45:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

I came across some break-age in meta-python/rocko. More specifically
that there is no python3-asn1crypto recipe though several packages
depend on it.  I can trigger this by building python3-requests.

I was reading the archives of the mailing list that indicated that
there some some instability regarding meta-python recently but nothing
covering this.

I noticed the following commit [1], which mentions that it should be
merged together with another commit to actually add the
python3-asn1crypto. Which seems did not actually happen when the merge
was done.

python3-asn1crypto was actually added in this commit [1] on master and
I can not seen that it has been back-ported. Note the somewhat commit
cryptic commit message in [2] where it does not actually say that it
added a python3-asn1crypto package.


[1]. http://cgit.openembedded.org/meta-openembedded/commit/meta-python?h=3D=
rocko&id=3D187f959fbd220678595c2aa1fe1e17b00a0b2d92

[2]. http://cgit.openembedded.org/meta-openembedded/commit/meta-python/reci=
pes-devtools/python/python3-asn1crypto_0.24.0.bb?id=3D80b6e6f151588765000cf=
17d2b86d0ded762def1

--=20
Med V=C3=A4nliga H=C3=A4lsningar / Best Regards

Mirza Krak

