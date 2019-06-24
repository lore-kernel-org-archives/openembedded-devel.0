Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id F1E657E553
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 00:54:52 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id w17so12758449qto.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2019 17:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SXmClb+1geYY9t8CZX//aaiu3OHMjwdXa8U5O8/3ReM=;
	b=SkfVzSm+YlE1i6+Xy6TOYziJEDEVKYj/EfMa4jvMaVawLluAm/fAvl1r6JbRDlPcwH
	uIYq7Al/ZWzUdqeI12eqUQ334I1aP4o+2aJBtVoJVpOwzEc/FMnt/NUsbgmtRQlabCot
	jYNgUxYADKQhcdfpfr//ZOUZZ6HgcxHHCJK8rpJr1i5jkdmHUFP3JvHEwesBY+LtCGND
	nfR2jXPWTxG4I8oomAwkkZ40T3t5m7U2ef5WhsXTHviHv0s7deYx9fm0go5ANEAQqgjr
	WjSX1jrZgio9Nrloe8tkhNWz7uL8qn2FxJmISLj+7tKZubntOjgENaqWo8l/Lnuuknlv
	nkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SXmClb+1geYY9t8CZX//aaiu3OHMjwdXa8U5O8/3ReM=;
	b=rGMLHzyR1B9xEhBQXQL5/Nt3aqJFQy0F9F7ygFlZ7raT/5aGKSRmPuOWRlMmNyZAyp
	YIUQ2jKMTE4Fv74LZp9fG73Ikn2V7/02feFjmzLDOVhFPQ1EjjMV5TUv/UrvGV29FBqo
	Qy8VEroWLubSe3SeTAwRKRyC9mSP5vVBDAEy5E2DK/PIEttYl5nCQ0AjfbLwXqySq8wb
	iXN5VISWHe8+biik/YMxJHGyPgoXVBPdkB/8xtSptgzBTj4/kFiRpxkvGjUn8C6+v7ZO
	d//L/VazeJv043uMyqBcjy+TBj1DLNPEV4C/bnfWiEvOjyho7KgHwf4oT2xVeu95ahu5
	vrRA==
X-Gm-Message-State: APjAAAUwMBkTAXEWteoYHYm+p3q+zbQvUGU1A55tqYKfzO6ECiSjXYS3
	BcTZci5KkYxfIhWfDFv9q3aXfKr1UJFTK7oBwrQaEOBZ
X-Google-Smtp-Source: APXvYqwMv5rQBAvJDOKn8yYo/dDZAhRl0dTrrUeWljN93B1dGyyVy3mmXMrPHnLGDW6phNveukTAJb1jZ3EOHT8kkyI=
X-Received: by 2002:ac8:e05:: with SMTP id a5mr92803657qti.53.1561337693416;
	Sun, 23 Jun 2019 17:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190623223554.13989-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190623223554.13989-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Jun 2019 17:54:35 -0700
Message-ID: <CAMKF1soezey1nig9E+7ZGt_Lq=tycPfL0-OXMvdFaeRomai3+w@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] nuttcp: add systemd unit file
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
X-List-Received-Date: Mon, 24 Jun 2019 00:54:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 23, 2019 at 3:36 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../recipes-support/nuttcp/nuttcp/nuttcp.socket      |  9 +++++++++
>  .../recipes-support/nuttcp/nuttcp/nuttcp@.service    |  8 ++++++++
>  .../recipes-support/nuttcp/nuttcp_8.2.2.bb           | 12 +++++++++++-
>  3 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket
>  create mode 100644 meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service
>
> diff --git a/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket
> new file mode 100644
> index 000000000..a8ae74fb8
> --- /dev/null
> +++ b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=Network Performance Testing Server Activation Socket
> +
> +[Socket]
> +ListenStream=5000
> +Accept=true
> +
> +[Install]
> +WantedBy=sockets.target
> diff --git a/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service
> new file mode 100644
> index 000000000..b778e8552
> --- /dev/null
> +++ b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service
> @@ -0,0 +1,8 @@
> +[Unit]
> +Description=Network Performance Testing Server
> +After=local-fs.target
> +
> +[Service]
> +User=nobody
> +ExecStart=/usr/bin/nuttcp -S
> +StandardInput=socket
> diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
> index 2fd563123..193caf3cf 100644
> --- a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
> +++ b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
> @@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://${BP}.c;beginline=4;endline=30;md5=496a7c0bb83c07ff52
>
>  UPSTREAM_CHECK_URI = "https://www.nuttcp.net/nuttcp/beta/"
>
> -SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c"
> +SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c \
> +           file://nuttcp@.service \
> +           file://nuttcp.socket"
>  SRC_URI[md5sum] = "d3c92c4d2f261221193c3726c1b9a42f"
>  SRC_URI[sha256sum] = "8c5595bcd27c2fd66831be74c390df078cfb1870aa427f2511ac2586d236c8a1"
>

I think we also need to inherit systemd bbclass,

> @@ -24,5 +26,13 @@ do_compile () {
>
>  do_install () {
>      install -d ${D}${bindir}
> +    install -d ${D}${systemd_system_unitdir}
>      install -m 0755 nuttcp ${D}${bindir}
> +    install -m 0644 ${WORKDIR}/nuttcp@.service ${D}${systemd_system_unitdir}
> +    install -m 0644 ${WORKDIR}/nuttcp.socket ${D}${systemd_system_unitdir}
>  }
> +
> +FILES_${PN} += " \
> +    ${bindir} \
> +    ${systemd_system_unitdir} \
> +"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

