Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA29751F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 07:41:43 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id e8-v6so8051417oii.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 00:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WY5iby0vVwpL74H/Qt7U3khcosMmzsaz/FM+XliyF/0=;
	b=KaFV7OwFnsVI/0e+7CGmcFbSp/E23VK2YbrDg7Aa1skTdg7yI8cJvEqeimc2mNQL1n
	DGbBwZO/akQ82fGrEbB490Ula42zPcCdOUgx96sK/KbODBt4cmitb16fR30b5PnfXuHP
	Gx98phq0f5afjI8LxmdN57QrOiXuORB0J8Glog1pFRvFwbrauUwHwK3TLC+S11MTepEp
	xKnKLvknCfw2AMjZOlRtjBWUfQFiVwMRISIvZ7g9euDbrognDIsKGxzR1OWkAZw4o9GK
	XS+nUKFoaRegl5BN93aNXgfuGamVVQXbOVQRLEsHjVgfKVFRwgCzFnfOEw0GD9tjBk3y
	eMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WY5iby0vVwpL74H/Qt7U3khcosMmzsaz/FM+XliyF/0=;
	b=at4WynCXS3EdEgf0+qiDSP6ZBiosUZUElYXLJFEMQ+B9Yk2oslUHuTqPHHZ0iXukcP
	2zWgEmhW1J+IBSRNw6bh4x87xjHydCrZZbCIPLTt/8VN0ZbqhONeTTLROA1jn8Hw+coe
	CCYZXC42QQWJohdLZy8NSRAFYYJ+JT5RP0sVSP86/0qU0kW47fqxWY6OcjPweF5dxvfR
	0jLJbaSesr90BtgZjVCXICDv5J3SNFS7BJ76DPEo+eq9gcVq/sMo1jlZH/AzYl4zX/s/
	D9qvg2xtIpFbxyooTT/tJfH3fQ6v/qG8Cm5RsJfmI5L8vJLLmpw2jGo6xc/bpf7rDmQl
	PT/A==
X-Gm-Message-State: APt69E1dqTOVgcFfmPcc6dnTczZXbCZUeiIs/9MMUaTB1uZqm6eAu1c7
	ONcnQhFnqwyytEDZGLq+lrOdUtYT/JSf/UXOYd4=
X-Google-Smtp-Source: ADUXVKL+o5TEllEGWoAXwdWbiVzmhVPS4sYJjSWCre7kltJnV/ofG/gEBpT/xnrq8Mey61qZgGCtrS7gtkzxBWQJN10=
X-Received: by 2002:aca:4b0d:: with SMTP id
	y13-v6mr260911oia.251.1529048504457; 
	Fri, 15 Jun 2018 00:41:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 00:41:43
	-0700 (PDT)
In-Reply-To: <20180615033106.32342-1-raj.khem@gmail.com>
References: <20180615033106.32342-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 15 Jun 2018 09:41:43 +0200
Message-ID: <CALbNGRRh-JbUvPEjdHKfkxg1wFEVighOMRBS85V2SithEUU-Eg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH V2 1/2] htpdate: Add recipe
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
X-List-Received-Date: Fri, 15 Jun 2018 07:41:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2018 at 5:31 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Fix build with musl
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

