Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 69D6C6093A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jan 2017 21:19:19 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id dh1so331997wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2017 13:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=EqvnigbrObEbWsmIr/W/YkK5Urp3ZPfTOdEb9ZBwedA=;
	b=Ao0m65jXm3yZCFI8Pt3f9mI4tj7qcTYXOq0P9z+ZbdbQkTsKxYx5Jhfi4+VCgPqxV0
	Pi7Gyx1lG4Ie9cyyzi1/Q7KXNJTvF+bkTHjBkdu63L9O36zXgGKynWJJoiLYfE35huHq
	08xk8MpyNorkgfDHO6NUt7uW9PnklfJOQCOpwdrI2lEQ6CV97Envq4R6OjG6lRbdmMul
	fCKoAZfAM6jd5AS2qrB6PErIqVGEkaL8WwFApWmSLpdmqMQI+Dk+akR2Z7XjHQzvPEjb
	zUMSziKXyEo4annkTedqzIiW+KuRVYxPC0KFzwlPK1fP+LwMEmXmBKuswKHRJCvMtciu
	c/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=EqvnigbrObEbWsmIr/W/YkK5Urp3ZPfTOdEb9ZBwedA=;
	b=Z5OaIwg01wby5z/vWIJxoq6aM/4Hu63CHOPp1Xbb4k0E03B2uRMCx2ADm/6t1+M+tL
	xXotJXXREyvdoiceNQUmdzHAXxKF2IeZzJLJclOqx0FBOSut4F+cbfhaHkQaeMoSa1zB
	qoMJe2mglMdfpvOaDZPlfFZogtIxRxge+mtzZOlB/a2iiSnwE2yGk7u4YH3sG5Qx7E0i
	BJdHRP35bCDlyIpqGfvCVv97IpbsdXlvpYnH6pffO32B3mam8zYvO6SFOMHV7i5qC9Ox
	LX5fWX07QgLoLJGyEPZa4x4VFylKyIlZethKhFV8wmVdFiChAsayKfQOncvs5zQYJrSi
	mB6g==
X-Gm-Message-State: AIkVDXL9k5PGajj0zCG6E2ccViVKYrRq3Ojs/44VBN4wmfCoOUr2hpBTS1WkVumR9FCyQe5ESbXEbTS9P1A2yw==
X-Received: by 10.195.30.165 with SMTP id kf5mr60621363wjd.41.1483737558737;
	Fri, 06 Jan 2017 13:19:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.248.129 with HTTP; Fri, 6 Jan 2017 13:19:18 -0800 (PST)
In-Reply-To: <1482152989-3982-1-git-send-email-armccurdy@gmail.com>
References: <1482152989-3982-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 6 Jan 2017 13:19:18 -0800
Message-ID: <CAJ86T=Wtt8-cgQE32cjz83GkBjHMtNcd-RAamkiMtZCO7dFyxQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libconfig: add support for libconfig-native
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
X-List-Received-Date: Fri, 06 Jan 2017 21:19:19 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 5:09 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta-oe/recipes-extended/libconfig/libconfig_1.5.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> index fb6e50e..94daa88 100644
> --- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
> @@ -12,3 +12,5 @@ inherit autotools-brokensep pkgconfig
>
>  SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
>  SRC_URI[sha256sum] = "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
> +
> +BBCLASSEXTEND = "native"
> --
> 1.9.1
>

Ping.

