Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 4695678966
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 14:07:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1521554844; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=LdD+UwxK3jGoef5Z93xco+KC6K9oF3L6QzXnfGI8FyA=;
	b=fHc2h2MmgDW42/PL6PrauncbjcM4CBTb0YPlxzoBxTtzFA5hCUT4CiYknDjB+j268Dw68lJb
	7IKio5cme//9VP52lapdb/WIVjQwbXKjvrocnwmXE3Z0c1Lrb2q322PH09cg/Ve9SQ+fUgvk
	7s0i2bs0JiPEkNj37EX8hQ+mR5o=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mxa.mailgun.org with ESMTP id 5ab1159b.7ff2d830c4f0-smtp-out-n03;
	Tue, 20 Mar 2018 14:07:23 -0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 141so2470862iou.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 07:07:23 -0700 (PDT)
X-Gm-Message-State: AElRT7HKIw7nyR9zgWToe6ulvSe6BBuGcn/zuU0NnD8lmBtQp6BiV9Z0
	rbWM1TUMxGpcA/OylSMHd5HSGCrBiNk9DYI7n/M=
X-Google-Smtp-Source: AG47ELsxHuAVP1JUnd3rDD/nvIrPI5FRxOdenvdK23TJU41LhqUNBOG1UB80Uyngtxs9TdRFUdKgg9c2hoM3vOXoamg=
X-Received: by 10.107.36.204 with SMTP id k195mr15954522iok.131.1521554843201; 
	Tue, 20 Mar 2018 07:07:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.6 with HTTP; Tue, 20 Mar 2018 07:07:22 -0700 (PDT)
In-Reply-To: <1521554658-10933-1-git-send-email-derek@asterius.io>
References: <1521554658-10933-1-git-send-email-derek@asterius.io>
From: Derek Straka <derek@asterius.io>
Date: Tue, 20 Mar 2018 10:07:22 -0400
X-Gmail-Original-Message-ID: <CADNbA1q6z6rAhvCcn8P5Job6kCQM1R2kDuwVRq8JfMRAwMLhWQ@mail.gmail.com>
Message-ID: <CADNbA1q6z6rAhvCcn8P5Job6kCQM1R2kDuwVRq8JfMRAwMLhWQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-attrs: add logging to the RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 14:07:23 -0000
Content-Type: text/plain; charset="UTF-8"

Ignore this one.  Commit message fail.

On Tue, Mar 20, 2018 at 10:04 AM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python-attrs.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-attrs.inc
> b/meta-python/recipes-devtools/python/python-attrs.inc
> index 12410bf..360f9c6 100644
> --- a/meta-python/recipes-devtools/python/python-attrs.inc
> +++ b/meta-python/recipes-devtools/python/python-attrs.inc
> @@ -9,5 +9,6 @@ SRC_URI[sha256sum] = "1c7960ccfd6a005cd9f7ba884e6316
> b5e430a3f1a6c37c5f87d8b43f83
>  inherit pypi
>
>  RDEPENDS_${PN}_class-target += " \
> +    ${PYTHON_PN}-crypto \
>      ${PYTHON_PN}-ctypes \
>  "
> --
> 2.7.4
>
>

