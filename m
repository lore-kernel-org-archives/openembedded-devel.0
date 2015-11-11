Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id F3CA675CF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 05:49:09 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so40411294wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=fUpDQTmDepzBSddpzgvnnejHKbdI1B5fay7Tt5u9Pdg=;
	b=V1ztHfzKsiitNxjSvX99fEzXU72+7XErIajW9yDbpsAQyKW6sJ+9Wv+GbWnDkTiRB/
	GzQKujj0Cw308p1bR6gUW7gjbQxEi4/xPv5/ONKUKJpoPqFN31Cry0U5nb8h6qBnHsMR
	5FsZr/fmmKUQ3FLl3MykG0Q6cJ8kEeItx1xlW1HxXRQ6bH8W15zAV1YwLZEcp/LY/C/I
	sRvto4DY1rd83o1qFtdJ1wROhb3C5QriIrxsKIo1/ZczBX2CmIig3Opa9Ahw6ekbl30c
	9uKOGdpRm5nJezhlf+r7PiP1Bz9pDWJI/q/qBYDNxsp7jrBYLUlZRBCJku/1T1Qfp8pz
	EE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=fUpDQTmDepzBSddpzgvnnejHKbdI1B5fay7Tt5u9Pdg=;
	b=PWnibAVQBQHV9re4DQseaxDbSe56imVHO8uwz4fQTrSCNhG/ARo6/jjjq8xlJI5+qC
	UgD1CZTEdfco8tp4qDbvbl6XwNXHI3fw7rGVSf/zMg6Usd0Ae9Cna7HuStk7j+SN4MVX
	ZXInmm9KcbMLCORm7/UwV7nTTMA+FkyXD0aueuGtDC0anj5qs73tyimLR5daQq+Qjhp6
	My5+VpqnzgGA68yWIQpQRRmTr7zcCg5IYwlF3mbrzGeY3ZFZbGds/S9+osSdP6u1s2dW
	d57vk2iT1Gf+jy8y6igzlEA+mWjIJQ+Bs93U6WZy+aTrNCFoDK6k7+YSPIWueMrd/z0f
	UfhA==
X-Gm-Message-State: ALoCoQmuN2pR24Ic9fIhEETxNf/QHXfBLRA4fD5LlENKh53+Enc1BXOrpRlQQu5hr5HkOWp7m7r2
X-Received: by 10.194.175.164 with SMTP id cb4mr8043147wjc.72.1447220949896;
	Tue, 10 Nov 2015 21:49:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.27.127.213 with HTTP; Tue, 10 Nov 2015 21:48:50 -0800 (PST)
In-Reply-To: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Wed, 11 Nov 2015 06:48:50 +0100
Message-ID: <CAAzKXngADOxQ-rOfF1DBSNqhV-GUPookXZjLkTZ=CgOf4ks7Eg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH 1/2] cef3: use PARALLEL_MAKE to control build parallelism
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
X-List-Received-Date: Wed, 11 Nov 2015 05:49:11 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

isn't ninja picking up the number of cores separately? I'm not sure why
this is needed.


Z

On 11 November 2015 at 05:48, Andre McCurdy <armccurdy@gmail.com> wrote:

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  recipes-browser/chromium/cef3_280796.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-browser/chromium/cef3_280796.bb
> b/recipes-browser/chromium/cef3_280796.bb
> index d827b8e..6872e5b 100644
> --- a/recipes-browser/chromium/cef3_280796.bb
> +++ b/recipes-browser/chromium/cef3_280796.bb
> @@ -60,5 +60,5 @@ do_qa_configure() {
>  }
>
>  do_compile() {
> -    ninja -C out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS} cefsimple
> +    ninja -C out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} cefsimple
>  }
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Zoltan Kuscsik

Senior Software Developer, Linaro Digital Home Group
email: zoltan.kuscsik@linaro.org
IRC: zoli_ on irc.linaro.org

