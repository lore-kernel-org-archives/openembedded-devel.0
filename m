Return-Path: <twoerner@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4C69C74891
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 15:22:16 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id t11-v6so15451897wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 08:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=QbZoW+PbAg7bSMG6lSp2tWR9/PkMUi/qDjgYGSfvH4U=;
	b=G9s5+xvRkvxpldl15FaSMmgmi/RQJgtY8y37gr7oxyiDI3ogPZjhjNK7ZFJSEDTXZe
	+z+VOCME8oFMcq1ZPnvqGXLfviDRiUoJ04DPctVHKSVGJDUDc/uQsJCqVYjhz6nEY9vk
	dR+d5jq3K6UI9G1/iowcSAp4cTQKf0iZN3Q6GrORg2zyyoMDv1cRq8wjdJNQ8h2X2TvU
	AZaAjQ2dTvljt2qYQp97Xr9aGPBafseo/DEif/hzhlYs/O+cfrD+XPkJHJ/GkeqeKTUX
	+tVxKIX+gJYmWu5KFR6dUkFr3XrnMGSCfdBTLVi/M0YYdKbYcVr+X8Cf9u9w1JxAA6je
	Pr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=QbZoW+PbAg7bSMG6lSp2tWR9/PkMUi/qDjgYGSfvH4U=;
	b=AKFSyVWn0WTQo/0w/+Uo69ug63c4MNji4AF9N81yyFxf8PEGIamHLXNZT9lnap847f
	BfljROBFPTJcJUvspuOi+ovm+iuRia8i+BiVfBr/daVA0MScf28fzr24unV3UWoao2oz
	9SERBXWNWX2I9PySjgVccJ8hb3FXNkaUtbgbPEpR788zg57UqjtCtv2XEr5ylPA3qICW
	XmrA6D6/7YiBXFVHrCtqhBW2gO5VYWzCVjhrR8mVEzIxQm6VIxZYeKxYVEmvDVXt6T61
	2Cqjf1Te7OZCalDVJoceM77Pm7Vn+480/1hEvUytfBxfSzPkBreRoquAxT319++d4ycJ
	P/Kw==
X-Gm-Message-State: ALKqPwdzz67ISUTP80x3KkfeD8VJTfi6vOO9PkdUIAp9/QOpP8UpQj+C
	7zTjHCgHyJuaaMWWfx2ErCJ+64FvuXKXlMIFtEJ+Ixmn
X-Google-Smtp-Source: ADUXVKJ12wRxTx4tMkk82qxBuu1Gi4VLTPgHQ4bpbyzuRhe84oZ3p97XFksrD5PPIqYM8gxkJsRKvQC8KOEiydlwW8A=
X-Received: by 2002:a2e:4411:: with SMTP id
	r17-v6mr1991717lja.139.1527261737403; 
	Fri, 25 May 2018 08:22:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb07:0:0:0:0:0 with HTTP; Fri, 25 May 2018 08:22:16
	-0700 (PDT)
In-Reply-To: <20180524143854.24096-18-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
	<20180524143854.24096-18-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 25 May 2018 11:22:16 -0400
Message-ID: <CAHUNapRj1Sadwo8BAujAuPn3Egs85vshAgz4dGW8f_4dzd0Atw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][master-next][PATCH v3 17/17] libeigen: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 25 May 2018 15:22:17 -0000
Content-Type: text/plain; charset="UTF-8"

As Anuj pointed out with patch 16/17 of this series (opencv: rely on
cmake.bbclass...), so too is this patch wrong and shouldn't be applied.
Sorry!

Looking closer at this recipe (on an unrelated issue) do we really want the
include files being part of FILES_${PN}?

