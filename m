Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 49C8071A82
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 07:56:13 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o16so4954464wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2017 23:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Yho2958oR4kTAGFN4iO46VVMgqKRa9LgT65V9lCnRgc=;
	b=fNV0sGecZOAcPRLzmbh2Bzcsi/pcCqk98Tis1UI3UVAgckzuLMgIkJ7yrajBko4JMz
	JfZ/RePdc6KFcFJdiQDp/6lk65RDnHRLAoZtWt+n5A2bZzlUA9ZBDbKOn7b+lj4/A7T3
	vfe1COm9LGx5jSDLrvar32Wb/0rqIytJ4a5B74jnmmNsfZWQxtlJPgrOXsUuJf8+GcoJ
	CbPGbHW9llyy1EFVh5dGnTW7RL1VfvTP/nSZ6c+3JdhAJ3zGPaTuvmtXw3MSxQdrEbJ+
	13Y6S16Mhd9CwDr9eeHTPPn7xd5WwFdv8RUqFkj/SiifUhPRIgywvy9008OKH2JG+C6D
	4+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Yho2958oR4kTAGFN4iO46VVMgqKRa9LgT65V9lCnRgc=;
	b=kY3yGt++MOZAj/1dkdDzBoRsWt3kp+Mj2e2ioAUwb0JKeldvUyEECON+hbG46/MKGY
	I1vmaxdu327h7Zs4xgIAdBRoeu+iAaXbYlAglApQdi0hQpRJXWLd2yv46/ONSXM8PaPf
	oUxLa6FVdn3B8tgf6jjOINGIkG0o9Zvls3BGeBzW6Q8im97N3B2ulDOXXsUpgH+/hZ7t
	+kxRpzV8jfScFQctf5h17lb/NMpks9f2LELnPlGHD/whfgPLNjvZ86Xa/qbcECgX6Q27
	Txaw/dzieTI7Ab/Th05/b2TM8csNPzbQG7rwBpWV7si84mEwXKKsO2OidW2oCye6pvxx
	GccA==
X-Gm-Message-State: AIkVDXJOGv7Q1SPEFmV/JX3xOquuEELh9PMQGv53FKIHTwL9YlCWKynqcbALrlowuXVahdAWXxgoeYwYBNSXqg==
X-Received: by 10.223.154.109 with SMTP id z100mr12517593wrb.145.1486454173802;
	Mon, 06 Feb 2017 23:56:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Mon, 6 Feb 2017 23:56:13 -0800 (PST)
In-Reply-To: <20170207052133.1791-1-akuster808@gmail.com>
References: <20170207052133.1791-1-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 7 Feb 2017 08:56:13 +0100
Message-ID: <CA+chaQcvE1mRdBDg9WiKnLPQ2+F5p+jF6hbEYv8x5_iABEVCJw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "akuster@mvista" <akuster@mvista.com>
Subject: Re: [meta-networking][PATCH] netkit-ruser: update SRC_URI
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
X-List-Received-Date: Tue, 07 Feb 2017 07:56:14 -0000
Content-Type: text/plain; charset=UTF-8

Shouldn't we fix DEBIAN_MIRROR instead or does it influence only this
archive?

On Tue, Feb 7, 2017 at 6:21 AM, Armin Kuster <akuster808@gmail.com> wrote:

> ERROR: netkit-telnet-0.17-r0 do_checkuri: Fetcher failure for URL: '
> ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
> netkit-telnet-0.17.tar.gz'. URL ftp://ftp.uk.linux.org/pub/
> linux/Networking/netkit/netkit-telnet-0.17.tar.gz doesn't work
> ERROR: netkit-telnet-0.17-r0 do_checkuri: Function failed: do_checkuri
>
> Debian moved these sources
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-
> rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-
> rusers_0.17.bb
> index 24eb96f..459e39e 100644
> --- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> @@ -6,8 +6,8 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://rusers/rusers.c;beginline=2;endline=3;md5=
> f4fc634a4ce8c569911196b72b10770e"
>  DEPENDS = " tcp-wrappers libtirpc rpcbind"
>
> -SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive
> \
> -           ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-8.diff.gz;name=patch8
> \
> +SRC_URI = "http://http.debian.net/debian/pool/main/n/${BPN}/${
> BPN}_${PV}.orig.tar.gz;name=archive \
> +           http://http.debian.net/debian/pool/main/n/${BPN}/${BPN}_${
> PV}-8.diff.gz;name=patch8 \
>             file://rpc.rusersd-Makefile-fix-parallel-build-issue.patch \
>  "
>
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

