Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9216FFF7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 11:09:08 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id x190so257706829qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 03:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0JI6yJiJdSe0XNCuzuh9XUQEgpd6tkWzO7tMUVN3rkU=;
	b=jgwaKWMtQrPJSVmTC5dknXlSWeM+a0jDqNgrUspPEk8tPN03zIhvMm2+MOhVBFHCD+
	lbjiCbm3lHQXZ640ZI0+jCPgcchK5FdteLthG1BHU3ZkBd3n3T84n7eL/FWfwK1JOGQ6
	qMMVmKndEO7JKiG9psw5BajanSzccohVP542Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0JI6yJiJdSe0XNCuzuh9XUQEgpd6tkWzO7tMUVN3rkU=;
	b=QxsXrGD9r6qGkvxrNMb10iT3iPlL7dKLRksTNxxHcOE6tZNKvSllbgkt6Dxzfa9/z0
	cg01Oqct3LrmYRfPy+WTVvh7B6DqjqFbkXGNkhnJUvyURJUANEz3mRwKbeHb5CUtu2Lw
	ALXNqAUGh17ym8hHaYV8tvg3Ar/hgKttjLcESG7zOVZcmS0ed1c+Y2ZhlrDmxLIE6kiO
	m8HMvy/q6H3RSjL0NU2fuDAQRK2bSCRV3qUOUSWBtc3apLC7PKNOhZmQ3Ccna76AHvof
	l5Yc4G94BH+12/4AXJ0z6fVBlIqz709RK4TGv6OiKwUc/KIlmikYkZ1186WTySFPqj1n
	e7gg==
X-Gm-Message-State: AKaTC02m042ym3S2mzM+VrbcEGxWYNugHxBTexXsEvsFl8SCmpZGRSLOvy85dg05KSjHdbWOFbNQZOh0RPdjggl3
X-Received: by 10.55.98.73 with SMTP id w70mr10244128qkb.91.1479467350327;
	Fri, 18 Nov 2016 03:09:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.104.102 with HTTP; Fri, 18 Nov 2016 03:08:49 -0800 (PST)
In-Reply-To: <1479464791-28098-1-git-send-email-koen.kooi@linaro.org>
References: <1479464791-28098-1-git-send-email-koen.kooi@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 18 Nov 2016 12:08:49 +0100
Message-ID: <CAP71Wjw8ti_zfUpZKqiwp=VggWq8=87sG49xrvHwbCvKy=4CVQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH] android-tools: fix do_install
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
X-List-Received-Date: Fri, 18 Nov 2016 11:09:10 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 18, 2016 at 11:26 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> -    if [ grep -q "ext4_utils" "${TOOLS}" ] ; then
> +    export TOOLSFILE="${WORKDIR}/tools.txt"
> +    echo ${TOOLS} > ${TOOLSFILE}
> +
> +    if grep -q "ext4_utils" ${TOOLSFILE} ; then


how about this instead?

echo  "${TOOLS}" | grep -q "ext4_utils"

it looks simpler and more readable to me.

