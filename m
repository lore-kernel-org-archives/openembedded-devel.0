Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD1E60557
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 04:51:25 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id uq10so257440igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 21:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=kOh4hHrLfufM3pSIJ9um753oJUuTH4lD6iB17H6Pmqg=;
	b=A6oN/95Xv3nQ+v/oK/QQx2hk4lm7eQM6/GLw1EB1hdzj7TRbLnijbozwdVsBpbvE2S
	GqsaSrFwcCK70dxvfPJwuijW5/mGNTqgkRIDXZ/n5Z+XHNu9NDiT/zWwzXlZQY0/GXCk
	LgvUnHNxvkysZjBSWVWnkdrIKoVUMSXAeZK5lE9//fLAUB8PUIbG+UHpod+7oLb+fwJ8
	5YX0H5dbsEpZJFC9VY1m26L/AwISA9uGoHRgo85L54Z1tE0qLGppcV9M34Myzwov9mxd
	vlJsU04KVGJEJq0RGbXGzbAGkH0xbHDdkOGbwutOnjU1rDmNZdmfbSJ1ozGEMGMruVJi
	+g7A==
X-Received: by 10.107.3.133 with SMTP id e5mr23457119ioi.45.1413953485598;
	Tue, 21 Oct 2014 21:51:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.169.2 with HTTP; Tue, 21 Oct 2014 21:50:55 -0700 (PDT)
In-Reply-To: <1413947089-3995-1-git-send-email-cnelson711@gmail.com>
References: <1413947089-3995-1-git-send-email-cnelson711@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Oct 2014 21:50:55 -0700
Message-ID: <CAMKF1so35KLMvZ77w14kF6a19D4xrwNHiR43=Fi5_HwA+5Bx5A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ruby][PATCH] ruby-lang.org changed the subdomain/hostname of their download server.
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
X-List-Received-Date: Wed, 22 Oct 2014 04:51:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 21, 2014 at 8:04 PM, Chad Nelson <cnelson711@gmail.com> wrote:
> From: Chad Nelson <cnelson@agleader.com>
>
> Signed-off-by: Chad Nelson <cnelson@agleader.com>
> ---
>  meta-ruby/recipes-devtools/ruby/ruby.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc b/meta-ruby/recipes-devtools/ruby/ruby.inc
> index 409a320..7702869 100644
> --- a/meta-ruby/recipes-devtools/ruby/ruby.inc
> +++ b/meta-ruby/recipes-devtools/ruby/ruby.inc
> @@ -20,7 +20,7 @@ DEPENDS_class-native = "libyaml-native"
>  INC_PR = "r1"
>
>  SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
> -SRC_URI = "http://ftp.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
> +SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
>             file://extmk.patch \
>  "

It seems to be a temp failure now I can download successfully from
original ftp location

curl -O ftp://ftp.ruby-lang.org/pub/ruby/ruby-1.9.1-p429.tar.gz

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current

                                 Dload  Upload   Total   Spent    Left  Speed

100 8865k  100 8865k    0     0  1403k      0  0:00:06  0:00:06 --:--:-- 1865k

this patch may not be needed

