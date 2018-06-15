Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6ECEF750F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 07:47:18 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id l15-v6so10035744oth.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 00:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XAkmGQe4omIp1pMjeAAiXRSYMsNvo4p0B6zoTCN/5xw=;
	b=nc8BW1o/y1fgjjuAQTQbDyOQhIdjuxpQIOMuM8+MKG01+6qAY53DFfaRwtqyBEYgYs
	iEhep6ZeHZUkjG4bT0Avz+f0BfhvigKkzypfCeiCa6mtiKtrR0iZTSzFww2Bxnxjl7H9
	4Sea36Mn8AgqLvbKUqrBOq9ZWtiMUqb299JVokk+kaw0mpKn5kS9qxqpnT9Ty87n8HCd
	SKsDo4keRlgHvby+D12nkZMnfaGa4FaPSEtvQkY2HkxzAw29oI2bJLLVD6La0DjfOtrw
	ZUJQMu8gOHcumOOVJkqqE3iQ1ZsFHwi/VRKUuvjfagpisxHLLkFtYklqVVTzAU5BMyIq
	ubgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XAkmGQe4omIp1pMjeAAiXRSYMsNvo4p0B6zoTCN/5xw=;
	b=lZzYE0XOZWdVR3n5pua6a/7+0Fz5jYT2dOhplQXDxAe2kNoVGLUD1eqme7oeo+36UW
	QwhI1KZ+BekPs9/Qnt/E2msxi8L3rk5uFDQFwzya7JUDitj4Bh5R8Km2Ae5yEQcJVHsf
	hwA49pgf/q5knfEPOB2pBNCJ8/X7wmUWcYn5TnWmvNWMqZleKaRGhKo4Nw3py/8CfxQJ
	q1+5uyto7smcXDA+ZTpROLdT1E1vxsLETOWVTN3xIAiJRAwj/rdbkYZg7Pnl8ZvChnWT
	Jbz89OiZoHnpIDUuMUtboNjxuCMsExRyX6m/6giuuZppupp6eMZ3KHRgmY89WpC8++vT
	M/ww==
X-Gm-Message-State: APt69E1LVFUpZAuJ5iCfTzb7GomBTUs85OUyPOUBAY6ivn9KqlVN1iTu
	wAGVAweOx5PYgCskqH0ct0B4qGuzex+21LSDoOU=
X-Google-Smtp-Source: ADUXVKIH+ed50E0u6bkXivAqVNJR9iPZ2t3E0xPc0LNyj9SUCChjcFXgClg4gSksMRuR7qUTKtIf/7S47anxBTPQvCg=
X-Received: by 2002:a9d:2d72:: with SMTP id
	v105-v6mr354260ota.227.1529048839565; 
	Fri, 15 Jun 2018 00:47:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 00:47:17
	-0700 (PDT)
In-Reply-To: <20180615033106.32342-2-raj.khem@gmail.com>
References: <20180615033106.32342-1-raj.khem@gmail.com>
	<20180615033106.32342-2-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 15 Jun 2018 09:47:17 +0200
Message-ID: <CALbNGRSAGKCugcid7S6ufvFbX4YJz8DA8+L-c3WSs5s4sidRGA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 2/2] modemmanager: Fix build with musl provide canonicalize_file_name()
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
X-List-Received-Date: Fri, 15 Jun 2018 07:47:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2018 at 5:31 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> Changed in V2:
> - Add Upstream-Status
Thanks - although I hoped for 'submitted' :)

Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

