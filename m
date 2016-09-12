Return-Path: <sujith.h@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 01A597705F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 09:47:54 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id w204so136366495qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 02:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=JlpPgvG9WVhCtUEl9eTpAV1pMrDUT1oMfqB5LmBgMho=;
	b=kE3BPd6hAqlWM8Vq/n/8NDC7l6FSr8ywq64J+2NT0Oj1r0Pfs9uR/d9Eg6wNn8g9X+
	ORvVILfZKhaCGgSRLBBX/zQ6yfPrvMYchLPEFZRfQN9zgEYVwepv9VlKfS3XHBjGJgc9
	S0FlQ4jsf8DX6CfuCivd9Z/rJDIHlkkRNTDylEJVEF/YwYGNUSuxHyncUTdNDDcABcwj
	o1rJCcjJKSfd1rZ419OEhvcTwJAPWQPse/F8+3HBYehOy8t/yUbrBqs94DUU+CQW2tSq
	ufcWdkWECegLiCbJljHPhpyI/rfHLfGYxfQzLVwVJNfkHVzkxkQTlF5rJvpqkLN7sVQm
	5C1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=JlpPgvG9WVhCtUEl9eTpAV1pMrDUT1oMfqB5LmBgMho=;
	b=ZoaHjwgZ2G4UpUOjxfewm8PcWsx25AZcnDyPnBFSmHbWUnKm6jIyFoL8hAZ4Zg4e9J
	sYCSJUwvrNIJ/L9AGx+Kk/PEgrYqw9+uWKJs65agFPyNziUEYDL0Fg8eJHzxxuS8QHBx
	ACzZZ8Kc4QUwpk1emOG+NV6KoYmjJopPfZh6TVqLltbVnk3n2n2h0T8C08NrROk6RBwx
	sdMxMtg+MJ7t7FLVIiCjSLS9UX/I312Kenvt4lLIEpMRKF5VLNBI6DhZTsdyAWJOMiLq
	8pI7uYLmathzo1Y8xGjAFr3jUa0Dg+Nc9R/JqI6+2DpamkuzYm7ws39hLyEROEwUOt/J
	FuKg==
X-Gm-Message-State: AE9vXwPlH7atsv4rP2ariUWX36P2EpJGXvVJm2I2wdBE65LCtu0qC1+XM6EugWDllvjgEl5zgEdC39JWDEIEOQ==
X-Received: by 10.55.143.134 with SMTP id r128mr19114161qkd.161.1473673674774; 
	Mon, 12 Sep 2016 02:47:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Mon, 12 Sep 2016 02:47:34 -0700 (PDT)
In-Reply-To: <1473668091-5615-1-git-send-email-sujith.h@gmail.com>
References: <1473668091-5615-1-git-send-email-sujith.h@gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 12 Sep 2016 15:17:34 +0530
Message-ID: <CADyYWLnzkgD+B3R1qjX1tF2PeVULe686qU14m=ntSo54C7LtXQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java][PATCH] xpp[23]: fix/remove bashism
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
X-List-Received-Date: Mon, 12 Sep 2016 09:47:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Hope the patch looks ok. Else do let me know I can work on the same.

Thanks,
Sujith H

On Mon, Sep 12, 2016 at 1:44 PM, Sujith H <sujith.h@gmail.com> wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> This was breaking on hosts with dash as /bin/sh.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  recipes-core/xml-commons/xpp2_2.1.10.bb    | 2 +-
>  recipes-core/xml-commons/xpp3_1.1.3.4.O.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-core/xml-commons/xpp2_2.1.10.bb
> b/recipes-core/xml-commons/xpp2_2.1.10.bb
> index d3baca4..c926722 100644
> --- a/recipes-core/xml-commons/xpp2_2.1.10.bb
> +++ b/recipes-core/xml-commons/xpp2_2.1.10.bb
> @@ -19,7 +19,7 @@ do_compile() {
>
>      sourcepath=3D"src/java/drivers/jaxp11:src/java/drivers/sax2:
> src/java/impl/factory:src/java/impl/format:src/java/
> impl/node:src/java/impl/pullparser:src/java/impl/tag:src/java/intf"
>
> -    findpath=3D"${sourcepath//:/ }"
> +    findpath=3D"$(echo "$sourcepath" | tr : " ")"
>
>      javac -sourcepath $sourcepath -d build-oe `find $findpath -name
> "*.java"`
>
> diff --git a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
> b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
> index bedb8a9..f264022 100644
> --- a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
> +++ b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
> @@ -19,7 +19,7 @@ do_compile() {
>      mkdir -p build-oe
>
>      sourcepath=3D"src/java/api:src/java/builder:src/java/dom2_
> builder:src/java/mxp1_min:src/java/mxp1_standard:src/java/
> parser_pool:src/java/sax2_driver:src/java/serializer_
> impl:src/java/util:src/java/wrapper"
> -    findpath=3D"${sourcepath//:/ }"
> +    findpath=3D"$(echo "$sourcepath" | tr : " ")"
>
>      javac -sourcepath $sourcepath -d build-oe `find $findpath -name
> "*.java"`
>
> --
> 1.9.1
>
>


--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

