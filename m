Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id B7C1975CF1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 16:57:16 +0000 (UTC)
Received: by iofh134 with SMTP id h134so205907636iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 09:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=1ycWzegEqRmtZ7UwvM6gf2+h9Eqh8DwuTXQpqZ6bo/Y=;
	b=0Ol1sPy3ZZJi1rUeRJkZoHgRmYgNzn/ExYaq4hrUlSVlMehgGzkmOCLWRAVX7Df5J3
	srw7ywWisrzVyIBDGNRdc0svddjun41Y7SMdDbhRlYawrXK+KypnIKT7OnTy/o2N+8EB
	uzX+2mWXtGIPlx5IeWRS42l18Wx3oaiEsIOYMNbAkhea3fNgm/3xwNmMtPWJCM7cR3AF
	DnbzkDcIUZzfRqTRHpJkbfVQVEpuDNedhhMulYorb5y62yK9wcEHiuaBlugeotpCMmV7
	6mJYgVAk20N6dMJzeb1mYEpNJCIsdj+rb5r3tXNf9GjgnohaNHBq2oXKoRp98nHpPYXM
	MODQ==
X-Received: by 10.107.137.106 with SMTP id l103mr30077861iod.112.1442336236012;
	Tue, 15 Sep 2015 09:57:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Tue, 15 Sep 2015 09:56:46 -0700 (PDT)
In-Reply-To: <1442321402-22469-4-git-send-email-clopez@igalia.com>
References: <1442321402-22469-1-git-send-email-clopez@igalia.com>
	<1442321402-22469-4-git-send-email-clopez@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Sep 2015 09:56:46 -0700
Message-ID: <CAMKF1sqRmW0WYzAyusDEW47onz-h9W0tZ-sYWyqp28=u3fbzgQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 3/3] chromium: Rework the evaluation of the Wayland feature.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2015 16:57:16 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 15, 2015 at 5:50 AM, Carlos Alberto Lopez Perez
<clopez@igalia.com> wrote:
> +    CHROMIUM_BUILD_TYPE = d.getVar('CHROMIUM_BUILD_TYPE', True)

Lets default to one if its not set by user and set a bb.note about
what is chosen may be Release as default is good.

