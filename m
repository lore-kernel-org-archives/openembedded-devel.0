Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 442317C349
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 15:40:00 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c70so4308508qkg.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 08:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U1ixvWmGKAg7bhYL4lIziT9y7fRll6EQxcoFkXNebSc=;
	b=kC9NDD0I1MEDRe2qLZzGPVNySeZ6lLBeDJXnZHwIvsbJ4A0bz7Ew+BHQFzKfvcjIiy
	loPnEyR8NBz6TqRx3xHEVfrPP8zrM3T6ywdUeuW9SRC9ekGs4hno6eKUC3u2cPx+5ie+
	kheEVwwp1Xv7Tj8lUYNjhYs/FkdNm1gxC9OemxFroYlT+m1tar6j1QxSL93YoM9kdyZK
	lWwzZH8cqa+JRTHrSsNiSxjlefQEailDBLu0tmAX94UXiP2LbuBLOk806TvNxOWIoBzB
	WS4vy+GzlhHPpcdxLwFR5Q7i3Q85cUHiAmBjmlIlkSnhr0CDz/nnR5OItWz/hMBCUxqe
	3QcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U1ixvWmGKAg7bhYL4lIziT9y7fRll6EQxcoFkXNebSc=;
	b=swo5t3Hc8UurExSpgvtCESpK0bftGByDHIWpc58txJHrVRN92Vh/FwBBdNwJzgJYGe
	RfMgyQUh/ambah1rJPknLaZVEpBoqSjETm+vbADOcFrmNbYWLwK4zsAtoMae/t3e+ONY
	W4NtRjWXHpnviTzP+Hc+JRmz1gbP3+ppIA1NIFDYcRwpx+I1/YoKF2KYAkaK8ZRmCGYi
	ZpFe5gw2yw8EZS9kG9N6MXPYlUiSL88hoAt4uiLBG6wBLu36AIQtxma3b8BX7DE7jGRR
	5iCke4IWNGEpnRIxCknTUWjrnDns4tpuDoSoNuohDrBAl+nxdzL5jg66/IK4NmPxlrb/
	Ribg==
X-Gm-Message-State: APjAAAXqv1A9aEsl0TDF8fpkjhZx+nLqXu39FiM0iU6IWj3K65YjFRW2
	q4hZtkxLu7WWNMTeqCrl8UrxG0fF639QQtlXodU=
X-Google-Smtp-Source: APXvYqydTTeC7HlxWJzBUamZEaZmPxWEPm/HbjXj+S3FfaTR7hH7rEuf+WsvnnH5yUZBnIc5SJBbQLLn9JNrYO7pl18=
X-Received: by 2002:ac8:26dc:: with SMTP id 28mr12025978qtp.88.1558971601003; 
	Mon, 27 May 2019 08:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190527100610.8944-1-ankit.tarot@gmail.com>
In-Reply-To: <20190527100610.8944-1-ankit.tarot@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 May 2019 08:39:34 -0700
Message-ID: <CAMKF1srM7s8F-i+R+pqOwiizg7kUce8seP66vvwrvC_av0p-Kw@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] safec: Initial recipe for safe C library
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
X-List-Received-Date: Mon, 27 May 2019 15:40:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 27, 2019 at 3:06 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Add generic recipe for safe C library.
> This library implements the secure C11 Annex K functions on top of most libc
> implementations, which are missing from them.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  meta-oe/recipes-core/safec/safec_3.4.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb
>
> diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb b/meta-oe/recipes-core/safec/safec_3.4.bb
> new file mode 100644
> index 000000000..ad3c4ba74
> --- /dev/null
> +++ b/meta-oe/recipes-core/safec/safec_3.4.bb
> @@ -0,0 +1,15 @@
> +SUMMARY  = "Safe C Library"
> +
> +LICENSE  = "safec"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
> +SECTION = "lib"
> +
> +inherit autotools pkgconfig
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
> +SRC_URI = "git://github.com/rurban/safeclib.git"
> +
> +COMPATIBLE_HOST = '(x86_64|i.86|arm|aarch64).*-linux'

is it limited to these architectures ?

> +
> +RDEPENDS_${PN} = "perl"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

