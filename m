Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id E4240784E5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 18:32:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513362773; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=AxvdIzeQgAfBgcxWDLRoAkf47Bwa9ya1vxAnESNqBhA=;
	b=cIqSuplvRta3P+vjV3IFSSZMgNBx0XOwXf+ThnQx8yZwThCE/fKBM6v4L9rZOsm2wfb18Jf5
	AdjDt2BPPzhqT4H4MEu+ftUt7iy2Barr1liUWJASat0SpWTE4QKN46fMYQ+83MZyY5lQZvjs
	UkfuYG3j5jzoCCR+XpBnMTDU8DA=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mxa.mailgun.org with ESMTP id 5a341555.7fd7b86b7c70-smtp-out-n03;
	Fri, 15 Dec 2017 18:32:53 -0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id d4so13214721qtj.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 10:32:53 -0800 (PST)
X-Gm-Message-State: AKGB3mIxXhsUb1LBCIxptD/ohCPIu8e0ZhHAsheUuq4+MGFwuFT16UiF
	KIlaV6VefC/L6VCSt5LZjomIm3sFD4Dpm7+d6e4=
X-Google-Smtp-Source: ACJfBoumlxv5dHfPmYx4XflLHeZpuK9i7e7pmU4xs+/l/c/XffVMMO6NClLLRSbyU1mA3sITwNwIfi/79u24ku2nbLs=
X-Received: by 10.200.15.155 with SMTP id b27mr23901498qtk.151.1513362772884; 
	Fri, 15 Dec 2017 10:32:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Fri, 15 Dec 2017 10:32:52 -0800 (PST)
Received: by 10.140.21.177 with HTTP; Fri, 15 Dec 2017 10:32:52 -0800 (PST)
In-Reply-To: <1513359926-17087-3-git-send-email-mark.asselstine@windriver.com>
References: <1513359926-17087-1-git-send-email-mark.asselstine@windriver.com>
	<1513359926-17087-3-git-send-email-mark.asselstine@windriver.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 15 Dec 2017 13:32:52 -0500
X-Gmail-Original-Message-ID: <CADNbA1ruiCp4u810eg9LcLXzWdAAaMY5aC-5KVyeViq4jSKxKg@mail.gmail.com>
Message-ID: <CADNbA1ruiCp4u810eg9LcLXzWdAAaMY5aC-5KVyeViq4jSKxKg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][rocko][PATCH 2/2] python-twisted: restore RDEPENDS on -news for py2
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
X-List-Received-Date: Fri, 15 Dec 2017 18:32:53 -0000
Content-Type: text/plain; charset="UTF-8"

Is it actually required for core?  I thought I went through and verified
that news was a stand alone module.

On Dec 15, 2017 12:46 PM, "Mark Asselstine" <mark.asselstine@windriver.com>
wrote:

> Although this plugin has not yet been ported to py3 it is available in
> py2. The previous commit isn't clear about what is being addressed but
> I assume it is:
>
> nothing provides python3-twisted-news needed by python3-twisted-17.9.0-r0.
> corei7_64
>
> For py2 this package is valid and so we should maintain the RDEPENDS,
> restore this RDEPENDS for py2.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python-twisted_17.9.0.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
> b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
> index 2be1709..7fc8c65 100644
> --- a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
> @@ -2,3 +2,9 @@ inherit pypi setuptools
>  require python-twisted.inc
>
>  RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
> +
> +# Not yet ported to py3 yet available in py2
> +# See src/twisted/python/_setup.py -- notPortedModules
> +RDEPENDS_${PN} += "\
> +    ${PN}-news \
> +    "
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

