Return-Path: <jpewhacker@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2B06877D6D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 21:30:27 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id l8so9781756oig.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 13:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C7+OJQqMjSm1B0+MKyQdp4c5k3tLdRkMlrdlKLt369s=;
	b=CIE2KTTfhj64e5Sr9OA0bhClV7UgG1bSrhKWi9kGizGaSv2W8eCWo1ewFvEF+PWNNs
	umEM8XCq4p6zfVfTvMvuGhlNyhALCfsMbGJFYymx6RcUR2xWyNIp7C3DM6fFhvw42c/i
	+qGvZWsA/lPbe7p+cyfX5lb0Xqxs1yhASedYONwOlqx6d+7BFdzvWTRXFgFP4K3IjQ/U
	CPVmy8sPZ977tUr/Tb70t3/EW4tMAu6+fY7pV5Obx7+ajzWOVjsbnvLV/qBrfIdnOOOb
	wBQAGirXU0b4BMQ3J8FOAHB8tPDXrTg6wxJhegctOeG1T9PKT8ItguigPhIf44zs2FpM
	Rfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C7+OJQqMjSm1B0+MKyQdp4c5k3tLdRkMlrdlKLt369s=;
	b=oID+tsHyCnH3lDkq9ZrEyXZN7OUPBBBQX3bpjCzMJNfWQYCsyjLogt45iolSMblBkZ
	6PgxMRN7Qu6qROsfZ1eHXJNVhkyXTwijbAkZjK0LqxEbN+QovBOsHlP6YA31d+hoXlv+
	1M/lEQkhsvdEWYbR26IYM5UULxwyH6hgWU7rxo7d06TE0C9mxuXOzYuSwisixCTJFUn6
	eJNEjgqrw9JyNTYvCs6tdlQg2z34QvFnaFCtGEl5SaKLsx1kHzfbIOqVsfzK1txE7MJ7
	TmsUVtmHLhnjqOYjvE+YQRv/iLTXI+Oud7ZuxUMmKdHQsaH6eFq7SkpdW+vspsIFfmbt
	YLTA==
X-Gm-Message-State: APf1xPAVvlwm7+Q4HKgw2e3vbupVsPkS2F1ly/+sUxYpem7Mv+aidLan
	FW10TzyahNFq5t0ud1t3/clJ/49Z68wGSFBCniM=
X-Google-Smtp-Source: AH8x226cmnwVpUqPgaMQ47+sA3YQ4RBvhe79ZPCZOV6BJdLYaY5Gqs/LbIqJtD72hbW5cEKF9tdVR/dWTm/scg84r3U=
X-Received: by 10.202.225.133 with SMTP id y127mr1726387oig.217.1518384629026; 
	Sun, 11 Feb 2018 13:30:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.48.29 with HTTP; Sun, 11 Feb 2018 13:30:28 -0800 (PST)
In-Reply-To: <1518277173-32712-1-git-send-email-bkylerussell@gmail.com>
References: <1518277173-32712-1-git-send-email-bkylerussell@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 11 Feb 2018 15:30:28 -0600
Message-ID: <CAJdd5GZhQVmfWA7m16nWZL2BwUT6L8LNjJunoiHwXvk56KrALQ@mail.gmail.com>
To: Kyle Russell <bkylerussell@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] waf-samba: skip waf_preconfigure() prefunc from waf.bbclass
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
X-List-Received-Date: Sun, 11 Feb 2018 21:30:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 10, 2018 at 9:39 AM, Kyle Russell <bkylerussell@gmail.com> wrote:
> waf_preconfigure() fails in samba packages because wafbin is packaged
> differently, and we already pass bindir and libdir through
> CONFIGUREOPTS.
>
> Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
> ---
>  meta-networking/classes/waf-samba.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
> index e490176..94ecf4a 100644
> --- a/meta-networking/classes/waf-samba.bbclass
> +++ b/meta-networking/classes/waf-samba.bbclass
> @@ -42,6 +42,7 @@ CONFIGUREOPTS = " --prefix=${prefix} \
>  # to help generate the cross answer when adding new board support.
>  CROSS_METHOD ?= "answer"
>
> +do_configure[prefuncs] = ""

Hmm, I'm not sure we want to unconditionally remove all prefuncs.

This breaking samba was brought up to me (since I wrote the patch that
broke samba), and I actually think a better approach would be to make
waf-samba no longer inherit from waf.bbclass. The samba method of
using waf is so different from a "standard" waf usage, that the
inheritance doesn't really make sense IHMO. I'm preparing a patch to
do this, and it appears that the only two things that
waf-samba.bbclass actually needs from waf.bbclass are
get_waf_parallel_make() and DISABLE_STATIC = "", neither of which it
can't implement itself.

>  do_configure() {
>
>      # Prepare the cross-answers file
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

