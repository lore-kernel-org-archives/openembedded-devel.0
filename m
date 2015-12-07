Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id C838A60124
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 18:28:57 +0000 (UTC)
Received: by igl9 with SMTP id 9so79994361igl.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2015 10:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=HCAHO/xB95/yuW0V4Q5q6KXXTsqKgYtLS+FuiQongbM=;
	b=sXxdzXAiXZUxFJBlG4BSk2VhmdpmdCNUhDzNsLAFJufebnm0XEutK9N3BytYKYFC6Q
	qxNGOfF1vTbn44Qvfn8byZPYpXc8D8UJsa4Al7y+vvnUVHYZmPCmVgAQWKfLzvRVi3o3
	/Oarbfy6FBEeUoCPiabvpKW8rrRDgJgSPak9UfBYmI7K+2S5s42a3N6hhyt1iDjoL0N/
	ZOFaefs/WgotqrLt1LVhYODqadVmH8i88GReclVsdv3ocLzMBiEkQ9kyy2aKw+lzLmi4
	Abj4mopRYmWsh3q1n88JYVHO/o5EJQPNCDnsfqOtn6WejI8F3rhjKEPAMiqMdAV2mb1r
	S3vw==
X-Received: by 10.50.79.196 with SMTP id l4mr8304252igx.77.1449512938073; Mon,
	07 Dec 2015 10:28:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Mon, 7 Dec 2015 10:28:28 -0800 (PST)
In-Reply-To: <1449199316-14048-3-git-send-email-armccurdy@gmail.com>
References: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
	<1449199316-14048-3-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Dec 2015 10:28:28 -0800
Message-ID: <CAMKF1soHqG46x7dL9VbBs-ydELYg_3z5u=sZn76O=Yrw9AmKAA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 2/4] mpg123: limit ARM_INSTRUCTION_SET = "arm" over-ride to armv4/armv5
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
X-List-Received-Date: Mon, 07 Dec 2015 18:28:58 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 3, 2015 at 7:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
> index a3225f2..0625634 100644
> --- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
> +++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
> @@ -57,4 +57,5 @@ EXTRA_OECONF = " \
>  #| {standard input}:48: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r5,r5,lsr#24'
>  #...
>  #| make[3]: *** [equalizer.lo] Error 1
> -ARM_INSTRUCTION_SET = "arm"
> +ARM_INSTRUCTION_SET_armv4 = "arm"
> +ARM_INSTRUCTION_SET_armv5 = "arm"

how does is fix the problem ? I think it might just be hiding real problem

> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

