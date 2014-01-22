Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6C9096B389
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:29:06 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id t60so367432wes.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=CRTwUez43d9hqzSaFtL/dBblf0NJCjyFIqPFUPW5DI4=;
	b=X/Uti/gLYEt4Kjz15WMrfBBQfN5GGxtm95Oxls6M0+e7uacqGTItrvRgsm/dXGVAsY
	23c3iIIxuL963xS4/a/CJUBGkPDe4/y30/ufiGHd7P5vs1L+5rfppDeH9k3aX58SplQ0
	MNPa1xYs749jTkwZ/LwbUMito4xKdBiyf3UvJ3vrjTYYJ+ZCdt0ObYPCsbv/dOTPT3LJ
	40Ze7GgcuO/hLv/3vDaN3+Ru8lcUvqo/55uI8abMksYwUc4s+PE3/UiNE4rP9OGCmX0/
	J0Xo62Fc0u2gYQ5BQcytWuBjBn7mB74o8gGgW6A0jRi1fIudDiw8FmePHKuUWUEnH50k
	S5zA==
X-Gm-Message-State: ALoCoQnEocUQznlm+hszVC7qZhEUNkYIgFmUBKFjWz6L15KASI0ZcLAy1BCEd4AQ5IAPB7HAHueB
X-Received: by 10.181.11.201 with SMTP id ek9mr3492746wid.54.1390400946158;
	Wed, 22 Jan 2014 06:29:06 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	bj3sm15203280wjb.14.2014.01.22.06.29.04 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 06:29:05 -0800 (PST)
Message-ID: <52DFD5B0.2010205@linaro.org>
Date: Wed, 22 Jan 2014 15:29:04 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <1389960374-16694-1-git-send-email-koen.kooi@linaro.org>	<1389960374-16694-2-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKr8u4ybYPFzsjXZWxQW32Pf72+Vb_wJkRfb5OSR_a9zZg@mail.gmail.com>
In-Reply-To: <CAP9ODKr8u4ybYPFzsjXZWxQW32Pf72+Vb_wJkRfb5OSR_a9zZg@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Jan 2014 14:29:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2014 03:13 PM, Otavio Salvador wrote:
> On Fri, Jan 17, 2014 at 10:06 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
>> No need to patch the makefile when you can just passs CC=${TARGET_PREFIX}gcc to make.
>>
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>
> You have a typo in the commit log: "pass"
>
> What about the HOST variable from the Makefile which were removed and
> now set to _CYGWIN?

I didn't touch HOST, the patch only touched CC and now the patch isn't 
applied anymore. So either way, no changes to HOST.

-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

