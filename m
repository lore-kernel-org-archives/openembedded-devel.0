Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB5C6BF47
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 00:21:29 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id aq17so13024294iec.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Ca1tbp6kGV0Mlm+fXE10eMR1jNfbomFrWnTfwxJteMI=;
	b=ZRmn/2dyh45vO9VloTfLjaU4UUHJaitKczMoGrtbnxfkr7Q46FjQKE73yxgYtXjD8H
	UqXA/LgWbWCLf9qFrNkKjITkcszHNcxpAj4T9t6NlDCo5ZpE0s1mV7KmaOMhf0+X2IId
	jjLnqBbU1B+tTPF/GPkMaFKpbWVtpcj4f/r5k8GMAkdsrmrLNexUoDRe7LRmkP5JM2oy
	9r65xPSamlKwIK59GmXB0vUVql1Fd1DCchxmftfU8i5WmmgrfofyEfjXpBBKLY3b5n4Y
	FU8mBfNnNphcPSAMypP2ErybgypvvnvGHM4ayTO7LqS8yi2dFdyxLdCUVZPyNgfO/QGg
	IV4Q==
X-Received: by 10.50.23.103 with SMTP id l7mr10520181igf.3.1383006091298; Mon,
	28 Oct 2013 17:21:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Mon, 28 Oct 2013 17:21:01 -0700 (PDT)
In-Reply-To: <1382713732-18896-1-git-send-email-joe@deserted.net>
References: <1382713732-18896-1-git-send-email-joe@deserted.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2013 17:21:01 -0700
Message-ID: <CAMKF1sq8F3GTfX_azsttaHvECM7KNRtrZZ5cFC4bR_n94gFKtA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] tftpd-hpa: update default tftpboot location
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Oct 2013 00:21:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 25, 2013 at 8:08 AM, Joe MacDonald <joe@deserted.net> wrote:
> The tftp-hpa package installs /var/lib/tftpboot and tftpd-hpa is
> configured to use that directory, but the default points at /svc/tftpboot.
> Correct that so the default points to a location that exists when the
> package is installed.

Looks good

>
> Signed-off-by: Joe MacDonald <joe@deserted.net>
> ---
>  meta-networking/recipes-daemons/tftp-hpa/files/default |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/default b/meta-networking/recipes-daemons/tftp-hpa/files/default
> index de2ed18..1dce7fd 100644
> --- a/meta-networking/recipes-daemons/tftp-hpa/files/default
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/default
> @@ -1,3 +1,3 @@
>  #Defaults for tftpd-hpa
>  RUN_DAEMON="yes"
> -OPTIONS="-l -s /srv/tftpboot"
> +OPTIONS="-l -s /var/lib/tftpboot"
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

