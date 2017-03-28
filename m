Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C9F6077ACB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 20:37:15 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z133so1696231wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 13:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gqJxWfpOqfubNBop1fdNYCDuaW8b1hedAbekhHJjMas=;
	b=IcQFjx1TfB25s7XXxGqAoZ+ZHQl6srHgDbWLwAHtdbwG1ftv1S4DmivbP+xmSvsKJn
	CrYO9LuegQ3ZOSynIT30PjT9CpiPHAbIbC5PCGR2yNM/NhWrJUsQKyrqwfFm4+RzHeWo
	RRk1DWbkIZXR/o5STtezx3vUH3/lEIwAZ8lkJQ5yNDLzVB9wtquOYO2UZmPynvUkZqa3
	LVQcNB2g1DorTOO2I0Aao3SsQdbS6LXY4tSSnI/rDmLfW0RBnl+U55N6/It6bIGcnSU6
	dGzHTUN9wBwkap9gEDqiXTsZrCNmn2kDbf4W/oqZjyYA4423WpWGUkV083nyIJ+WmK2p
	gaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gqJxWfpOqfubNBop1fdNYCDuaW8b1hedAbekhHJjMas=;
	b=TX3Kz7OxOLUAUc2FdjCTMRSFw7HQNDIHfLc0bf2yckkoAlPaff7NuqqNwC4DpeuQPQ
	qNUhiP772fY5scn8Ibew1TdMR+I/8UQ9jAsP0ioTgaaRTfK1xPTTr64/ANNSEQd7O0Ih
	sV4yixQhL7L4kf1nikLjf7PjctMVNF5JbUiPAfdOwDp4ivNH/hPaJDC6OaCLwwAgk4VI
	zKg6sB3YSLqIp2MYdywSd9l1L8I1BkRfLrR0TchLxSMN4mYvhrioFocvpUB1IgkCTe5i
	PQJGiNDo04wfYT0IgiuMfLyGxJCVuw4IFueHiZGZ45oKzti9Rf4c9Bp2FG8EzysUeIv3
	e8vg==
X-Gm-Message-State: AFeK/H22nWwNieDoMrT5zaZouZRuAFKOx5auLhNFCpKuYzFZMBwT0pbg2cZaBSaG9HEhxLtl8C3MesivZO9rmQ==
X-Received: by 10.28.186.70 with SMTP id k67mr15311232wmf.65.1490733436668;
	Tue, 28 Mar 2017 13:37:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Tue, 28 Mar 2017 13:37:16 -0700 (PDT)
In-Reply-To: <1490729609-25245-1-git-send-email-martin@xevo.com>
References: <1490729609-25245-1-git-send-email-martin@xevo.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 28 Mar 2017 13:37:16 -0700
Message-ID: <CAJ86T=UiAqfpiHBo5hif2kd_=2Vag1KkaUJGsT=eXd3dTR22Cw@mail.gmail.com>
To: Martin Kelly <martin@xevo.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gtest: add -fPIC
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
X-List-Received-Date: Tue, 28 Mar 2017 20:37:16 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 28, 2017 at 12:33 PM, Martin Kelly <martin@xevo.com> wrote:
> From: Martin Kelly <mkelly@xevo.com>
>
> I tried turning on the Yocto security flags and hit a compilation
> error due to gtest not compiling. Adding -fPIC fixes the issue.

Since gtest only creates static libraries, compiling everything with
-fPIC might not be the correct solution.

Does adding:

  SECURITY_CFLAGS_pn-gtest = "${SECURITY_NO_PIE_CFLAGS}"

to meta-oe/conf/distro/include/meta_oe_security_flags.inc help? If so,
that might be the better approach.

> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  meta-oe/recipes-test/gtest/gtest_1.8.0.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
> index 483dc1f..9ba4ee4 100644
> --- a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
> +++ b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
> @@ -19,6 +19,15 @@ S = "${WORKDIR}/googletest-release-${PV}"
>
>  inherit cmake
>
> +# -fPIC is needed to prevent relocation errors when we compile with Yocto
> +# security flags. See this issue for more details:
> +#
> +# https://github.com/google/googletest/issues/854
> +#
> +# If that issue is fixed, we can probably remove the manual -fPIC flags here.
> +OECMAKE_C_FLAGS += " -fPIC"
> +OECMAKE_CXX_FLAGS += " -fPIC"

No leading space is required with +=

> +
>  ALLOW_EMPTY_${PN} = "1"
>  ALLOW_EMPTY_${PN}-dbg = "1"
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

