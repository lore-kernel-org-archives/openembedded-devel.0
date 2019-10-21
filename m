Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8079D7F382
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2019 11:52:30 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e14so756896qto.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2019 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KydRCVIMrwIGulbc6rxriXtnEa/7gzhEU2NYrEOM8jo=;
	b=oRSrIiWEn7/nhMvRygGJW6I6G6pk0rIcAc+rVqKgwooKnpfr5LAdVcPT6ftbSN0ITz
	4TLNOUYgAQjQa/45YLgevFlSsl5UG2o+49F/jMC60ARCJYhyoH1XMcBt1H+Wz1GGKh+Z
	RCn+OiYqAjv0Mrq0081mBTdE5HSh4o/sgeFSFhrH8jsGzKo0o+bXU0YwDKyHJ7U2mJ66
	XkJHFdZFPdfNFmTAveGFz0zjJ7D5I1NLm55ftJ4dZrhMhMBkzWSdX8WJyflCtA+/ftb7
	H9OFGcSw0iM+lGrUeccT4CYvCxsY3vwH/70GFYi16KrPfMivz9VATLX+XA5r4XtdWrIh
	ofww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KydRCVIMrwIGulbc6rxriXtnEa/7gzhEU2NYrEOM8jo=;
	b=fMYJPeUvMPuTNxY33QYNvmeekSlVfaaTXwqEsfi9nbyFPawhBhJe7Ai20GX4YmW9ZQ
	tKW+tcr8qvE/QMz99HpbLvy7gpwIpe9ZdozYJx4xwrltaxHVHmHcUHDqnJpS0YaZsn0R
	K2TMSc5mYl6qzaKlRR2/AuSUV9WJNAUh14lU6L7Z8WwDglzBBfgexHt+JN6wm+tDJvLd
	Q/talXMnctfQiCkAnuY6T+3l1Ej815n7/gcot5sNNC6gm1cBZVOpR7TjfAnH+qNH+TMp
	cuBu1ILcK0UZS5CtFbb5P6ACck9jm1ubrRMSja4iyUjolieQAzg+FLbPxpIQKr67Ty4e
	5jtw==
X-Gm-Message-State: APjAAAUpoTOxbCToyx9nn/LhhX8xp9/gHBax+sAgKCnExyYn1MOI8Q8v
	JQnXgBV6nI9E5SM2X4fCVoJXt1DWgYv+l5OjOJ/gBTE7v7c=
X-Google-Smtp-Source: APXvYqxyhhX+WRSAQdIozNImJg/au1fZ0Ux1P5hcSHSn1H9Eqt/GORM6HBO+KoFXbUq/bACI9PZXYqBtlda/8HL2HjQ=
X-Received: by 2002:ac8:768e:: with SMTP id g14mr24256415qtr.378.1571658750779;
	Mon, 21 Oct 2019 04:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191017144659.24850-1-christophe.priouzeau@st.com>
	<20191017144659.24850-4-christophe.priouzeau@st.com>
In-Reply-To: <20191017144659.24850-4-christophe.priouzeau@st.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Oct 2019 04:52:03 -0700
Message-ID: <CAMKF1spQFVSM=J4xvswgEJjUqKwX_wPO3Wspy4wt4N8R1Zc7tg@mail.gmail.com>
To: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/7] libsmi: Clarify BSD license variant
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
X-List-Received-Date: Mon, 21 Oct 2019 11:52:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 17, 2019 at 7:47 AM Christophe PRIOUZEAU
<christophe.priouzeau@st.com> wrote:
>
> The License of libsmi is BSD-3-Clause and TCL.
>
> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
> ---
>  meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
> index b537ce67d..c2142a628 100644
> --- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
> +++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "A Library to Access SMI MIB Information"
>  HOMEPAGE = "https://www.ibr.cs.tu-bs.de/projects/libsmi"
>
> -LICENSE = "BSD"
> +LICENSE = "BSD-3-Clause && TCL"

This should be '&' instead of '&&', I have made relevant changes
before accepting this into master

>  LIC_FILES_CHKSUM = "file://COPYING;md5=3ad3076f9332343a21636cfd351f05b7"
>
>  SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
> --
> 2.17.1
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

