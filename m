Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3A4437833C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 22:54:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q124so460026wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 15:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vri69C2IMrZ3zwI7g83IuPyStQZvC/SohLauwOJqO/8=;
	b=EznxgnI4+fKGuNXuuQ/OTPz1kYHjuut0FROh8JlyVA02CKD/DsSMAkPxmGZnifvdij
	xG0KfMl0iIR4baWkmmvhTUZB1rmoCsAlOtfujxpQcbAWztMNvnS42BJKUXDiPXLPJrpM
	XPBAQxNAl/tpT08a4nl8vrtPn+dy99a+j2q+KvXnwEq1fx7HBKSkGMLDhz/ZYVkpga6s
	JEA8+pAQNTysegCJ0pfPuzOx/Ib4BjRrA/+xhEH8Ai7wRKdZnvJEZpR5pPHDrRjKJOu2
	pKJ4Y5/KCnuPTk/klqB0M8YzlGt9qifXIBNsX+fyyffJ6EZe+t4YqDpCQONyfoSo5L/S
	1uuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vri69C2IMrZ3zwI7g83IuPyStQZvC/SohLauwOJqO/8=;
	b=EzyBICFhegZdU1M2eveZskfAaC5pYm8DahVb7tqAV1KJaLPDTCHRTTZX/P7y16wUzv
	sl9ECSZ66KPdT71FGzpTtBtFjHYm5uqzaSuPantDOXDbWKZj09Dt0lSRTKB+VIY+xZW2
	8KN7xLUzgNzjRlMzBswwtXwMIStkceRJELh6ZNlSV/wqPwY5dfTlEPR9v7sOZw791eWb
	uj0K++O8lDVz6xaZxkW/AITz6xZO+ZdLkzMM7MjGbtMzg0yNGIxHbS1z+sDrlQ7w+AwE
	cl6OKEpgAQ+F658/f8jpPkxrvU3X4G6hSoIwAnrb7yCxZafwucg9g7y44GLz5Gu0smkk
	OhOQ==
X-Gm-Message-State: AMCzsaVroq9pzSl9OFlM6lAAeNht4wEmUbrQjcm4qtMrOOclL7W5Xb8x
	60mtqQFM0mJPYy/x7xCv7DyHiAmSt0Gg09LOBnY=
X-Google-Smtp-Source: ABhQp+QnlbRJew7NbIXq/1tkGP/qQM7yYg8m1uusrz1svtTgPbeHtsQaAVp5gPq21f5g37IIts3KrUgGf/x9WCozRXY=
X-Received: by 10.28.235.18 with SMTP id j18mr227941wmh.50.1508540067121; Fri,
	20 Oct 2017 15:54:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Fri, 20 Oct 2017 15:54:26 -0700 (PDT)
In-Reply-To: <20171017195649.8657-2-s.sonski@gmail.com>
References: <20171017195649.8657-1-s.sonski@gmail.com>
	<20171017195649.8657-2-s.sonski@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 21 Oct 2017 00:54:26 +0200
Message-ID: <CA+chaQcK6+mS9SgBTaNdzgLdDS=nhoHNj1crFtPeirxnK1m87Q@mail.gmail.com>
To: Stefan Sonski <s.sonski@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"Chris E. Rallis" <Chris.Rallis@ravenind.net>
Subject: Re: [meta-qt5][PATCH 2/2] qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY
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
X-List-Received-Date: Fri, 20 Oct 2017 22:54:26 -0000
Content-Type: text/plain; charset="UTF-8"

Either this or the ptest change seems to cause:
http://errors.yoctoproject.org/Errors/Details/157417/

On Tue, Oct 17, 2017 at 9:56 PM, Stefan Sonski <s.sonski@gmail.com> wrote:

> From: "Chris E. Rallis" <Chris.Rallis@RavenInd.net>
>
> Signed-off-by: Stefan Sonski <s.sonski@gmail.com>
> ---
>  classes/qmake5_base.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 8e1fe20..042008c 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -28,6 +28,7 @@ EXTRA_OEMAKE = " \
>      OE_QMAKE_LINK='${OE_QMAKE_LINK}' \
>      OE_QMAKE_LDFLAGS='${OE_QMAKE_LDFLAGS}' \
>      OE_QMAKE_AR='${OE_QMAKE_AR}' \
> +    OE_QMAKE_OBJCOPY='${OE_QMAKE_OBJCOPY}' \
>      OE_QMAKE_STRIP='${OE_QMAKE_STRIP}' \
>      OE_QMAKE_WAYLAND_SCANNER='${OE_QMAKE_WAYLAND_SCANNER}' \
>      OE_QMAKE_INCDIR_QT='${STAGING_DIR_TARGET}/${OE_QMAKE_PATH_HEADERS}' \
> @@ -42,6 +43,7 @@ export OE_QMAKE_CXXFLAGS = "${CXXFLAGS}"
>  export OE_QMAKE_LINK = "${CXX}"
>  export OE_QMAKE_LDFLAGS = "${LDFLAGS}"
>  export OE_QMAKE_AR = "${AR}"
> +export OE_QMAKE_OBJCOPY = "${OBJCOPY}"
>  export OE_QMAKE_STRIP = "echo"
>  export OE_QMAKE_WAYLAND_SCANNER = "${STAGING_BINDIR_NATIVE}/
> wayland-scanner"
>
> --
> 2.14.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

