Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id B2EE178312
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 18:32:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513708357; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=syzbp0IjfwBuWUOAaAfNGiwid564RwYRBeyZKUtWLiM=;
	b=HveeL4PDq9m+KUvYhhjsvmURtIzL8HXztlYdKWdGpC/t8h/uYnYC2eVHuIL0Q4BP8D7BZ/cw
	RWxfhUA/F0ZICTNtzCSoNJpRr6T6fWZtl8jyFEVujx7fhchdEtBJtpvP762522DmjMssIe2Q
	BNmTW220xDTA6alPZWNyT339NKE=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mxa.mailgun.org with ESMTP id 5a395b45.7f1b90255e30-smtp-out-n02;
	Tue, 19 Dec 2017 18:32:37 -0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id a193so15028382qkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:32:37 -0800 (PST)
X-Gm-Message-State: AKGB3mLlp8gCjA+17Ou7H4Covjb7eSwL2x0tQxW3BJwTo2SgDTgTtiXB
	V4SQVj3WT5t18LqmiJ2UZT3m8dcTxTDY60jR6CY=
X-Google-Smtp-Source: ACJfBosjJKG4z/17sG+4K8uBiK4Bl8iOg1nZhpF1MtBwuhC7IHkR1gSCdMdOwW9HKrnDD7zFfUqtFxyOfo+A7FB3JQs=
X-Received: by 10.55.214.194 with SMTP id p63mr6256487qkl.153.1513708356153;
	Tue, 19 Dec 2017 10:32:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Tue, 19 Dec 2017 10:32:35 -0800 (PST)
In-Reply-To: <1513708153-1614-1-git-send-email-derek@asterius.io>
References: <1513708153-1614-1-git-send-email-derek@asterius.io>
From: Derek Straka <derek@asterius.io>
Date: Tue, 19 Dec 2017 13:32:35 -0500
X-Gmail-Original-Message-ID: <CADNbA1rPeqStVHV4nMAP5rX240f6OWvMZ5zKkEwckrfEyPGbsw@mail.gmail.com>
Message-ID: <CADNbA1rPeqStVHV4nMAP5rX240f6OWvMZ5zKkEwckrfEyPGbsw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-webencodings: update RDEPENDS to include lxml
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
X-List-Received-Date: Tue, 19 Dec 2017 18:32:36 -0000
Content-Type: text/plain; charset="UTF-8"

Drop this one in favor of the v2 that has the correct package in the commit
msg

On Tue, Dec 19, 2017 at 1:29 PM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python-webencodings.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-webencodings.inc
> b/meta-python/recipes-devtools/python/python-webencodings.inc
> index ed57c52..74b7517 100644
> --- a/meta-python/recipes-devtools/python/python-webencodings.inc
> +++ b/meta-python/recipes-devtools/python/python-webencodings.inc
> @@ -7,4 +7,7 @@ SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a828483
> 79241dc04b865afcc4aab1674858
>
>  inherit pypi
>
> -RDEPENDS_${PN} += "${PYTHON_PN}-codecs"
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-codecs \
> +    ${PYTHON_PN}-json \
> +"
> --
> 2.7.4
>
>

