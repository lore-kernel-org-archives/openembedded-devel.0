Return-Path: <picmaster@mail.bg>
X-Greylist: delayed 361 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 14 Nov 2015 14:10:24 UTC
Received: from mx3.mail.bg (mx3.mail.bg [193.201.172.119])
	by mail.openembedded.org (Postfix) with ESMTP id 03BF277308
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 14:10:24 +0000 (UTC)
Received: from [192.168.0.73] (unknown [93.152.143.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx3.mail.bg (Postfix) with ESMTPSA id E2459204CE5D;
	Sat, 14 Nov 2015 16:04:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mail.bg; s=default;
	t=1447509863; bh=6HSDcyKw4xoHq+EDTKHW1458afkjpszwFtRowYdXrmQ=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=s/4uEyZMdUmBAsTP0PWcs/SEY0GvOIn2kiZU0zdynugsOczBHU81SOs4Lj5QQP3D9
	3iZKifDLfWBlFw50O4nSzsN5jJ8bp0z+ArQ+bt2ugFjvubHXnbYWF/Aq1+tHtg6BYB
	O/bTm88lMj6gVhdVifOpA9/g8jN9VIPqrIGEt3sM=
Message-ID: <56473F66.3020501@mail.bg>
Date: Sat, 14 Nov 2015 16:04:22 +0200
From: Nikolay Dimitrov <picmaster@mail.bg>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: armccurdy@gmail.com
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
	<1447217296-7145-2-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1447217296-7145-2-git-send-email-armccurdy@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser][PATCH 2/2] chromium: use PARALLEL_MAKE to control build parallelism
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
X-List-Received-Date: Sat, 14 Nov 2015 14:10:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre,

On 11/11/2015 06:48 AM, Andre McCurdy wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>   recipes-browser/chromium/chromium_40.0.2214.91.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
> index a9635cd..f20610c 100644
> --- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
> +++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
> @@ -196,7 +196,7 @@ do_configure_append() {
>
>   do_compile() {
>           # build with ninja
> -        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS} chrome chrome_sandbox
> +        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} chrome chrome_sandbox
>   }

Can you please share the chromium build times on your build-box with
and without this patch? I'm just curious how well this worked for you.

Thanks and regards,
Nikolay

