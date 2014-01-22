Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 08A0F6E76C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:37:36 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id q8so386580lbi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=hR/deVyHZRj9BEexl6MyltqT/HWEg2x6o8ohX+9lRrk=;
	b=NJiwz8blvXXScF2XHyUzm4VbY1s2UH7khZfpN8Yu/eISnTI3mP+ENErm+pxHhBOz6m
	yhAgV9OT+Pmz/0HcSNFU26T+qOu4/+foXseWBMwAz8cpoDJdcwciR/izZRmccx/Uciex
	REyT2gfiDVGmXZWfbMkgL6+NhVcRL6Gm1BX+UXkpcJmofuSEzpDlD02M9OlFgixXdFwB
	xWOAJtv/+6rq1gvpy9eAIqncheH0Ss2P45lngnt4P/fkTl1e28OZZhKrWtV9saAScxKE
	o5hmff+OnOxTEdNXG3SJzsjy9cEXFwAEAV1Xm/wYzT5yPxjKyR5F0A7ttJ+WrNRun4TL
	5ybw==
X-Gm-Message-State: ALoCoQm6Pc4K/GOivYOtj+QRUxojyUOxgHW/pf3MkQS2M0ux/0Q5R0K6cr6GoMnnxfw2D1fDy12y
MIME-Version: 1.0
X-Received: by 10.112.126.135 with SMTP id my7mr1239440lbb.56.1390401457428;
	Wed, 22 Jan 2014 06:37:37 -0800 (PST)
Received: by 10.112.45.230 with HTTP; Wed, 22 Jan 2014 06:37:37 -0800 (PST)
In-Reply-To: <52DFD5B0.2010205@linaro.org>
References: <1389960374-16694-1-git-send-email-koen.kooi@linaro.org>
	<1389960374-16694-2-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKr8u4ybYPFzsjXZWxQW32Pf72+Vb_wJkRfb5OSR_a9zZg@mail.gmail.com>
	<52DFD5B0.2010205@linaro.org>
Date: Wed, 22 Jan 2014 16:37:37 +0200
Message-ID: <CAGNsrLCeBGkOb9Mim-19jiNguwJOPhHPF9=khY0MD6e_e-qOoQ@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCHv2 2/3] acpica: replace patch with EXTRA_OEMAKE args
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
X-List-Received-Date: Wed, 22 Jan 2014 14:37:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Tested-by: Fathi Boudra <fathi.boudra@linaro.org>

On 22 January 2014 16:29, Koen Kooi <koen.kooi@linaro.org> wrote:
> On 01/22/2014 03:13 PM, Otavio Salvador wrote:
>>
>> On Fri, Jan 17, 2014 at 10:06 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
>>>
>>> No need to patch the makefile when you can just passs
>>> CC=${TARGET_PREFIX}gcc to make.
>>>
>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>
>>
>> You have a typo in the commit log: "pass"
>>
>> What about the HOST variable from the Makefile which were removed and
>> now set to _CYGWIN?
>
>
> I didn't touch HOST, the patch only touched CC and now the patch isn't
> applied anymore. So either way, no changes to HOST.
>
> --
> Koen Kooi
> Builds and Baselines | Release Manager
> Linaro.org | Open source software for ARM SoCs
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

