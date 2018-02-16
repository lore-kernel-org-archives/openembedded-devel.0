Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 267886093A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 22:22:34 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id v194so3085041itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 14:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=t5u8tBhpnbK9D04ZRyrUR2Q0Jq1e3tn5fh9gFrzwk0I=;
	b=sZ2XOBLd6DGpqrGGtFeD0OcTtIjMFzH+z9mX7rxbQwN1QDBMCFw69RGQO1TH0DaH+/
	qy052n1j+Cth9xZpuLZc2pwYEIwzpBEaDxkqoKNZIkWITmInSFIhO/VBY9fV/w+3Rlgb
	1/x6uSZ9sMbtB4MuVJG0QzfQmJa9l01y0/AuYsdYW51l6MzmITPH3NpisVHnAylQ+rI/
	mGLrgjnEDBQ2WneLq1+3LPHUcdhmekbPI1G1Nk5EpZQS8qAc714WOZHhoCjluWO9XTwU
	TDsDBO1NvEOlPxjH4Lr2+DePEhiWEQbk+G4D0n/j+H/AxT+fB7SSZrz+BwPwFoUOTRFP
	ZkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=t5u8tBhpnbK9D04ZRyrUR2Q0Jq1e3tn5fh9gFrzwk0I=;
	b=TR2pIbQGRuLqcuY50GJNvoXRl+MdPQ8hNFL8YJojVnLYEGWmPj13TMjAX8hTra2Yhl
	ELloeKQeuSGlxRwqf1iR0+mStbvRx+gKuFq1VGk3cTJ0VgFUaAq70bwKWDGhu8G/LwQB
	VFJDOdgfHhf30Wl2mUGrhw1XiseNXs4mnfMU+PCSiJBgcbGn7PwJYMMu5UjweEHxJYXf
	ChkQi+8QmpFWS+VzDhQikQEhTP8L/zlphr6BxLvpo2Z39VUET/smjzDLsSuoNrJv4xa9
	LB+ivhw4KIEf4v8EMdSZ/7xcCJbWeKf9nEoGS+yP9QyFUOGIjnW7NKMH3zME+YRpFJpn
	j7mg==
X-Gm-Message-State: APf1xPDK8veHdaB2RnI79GPCBqv4Um85N1YlxQn47Bd83/6aCvBws3z7
	SKpmEEeiplb/Q9JklBTG/dc=
X-Google-Smtp-Source: AH8x2279ji7ustO2WE3FYuzIggwjxwpOu3OBnP442wb3McLYn9BpbIyLwL9s0ie/7tTO6T8LO/NZfw==
X-Received: by 10.36.58.135 with SMTP id m129mr9893854itm.52.1518819756047;
	Fri, 16 Feb 2018 14:22:36 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w195sm17305078ita.35.2018.02.16.14.22.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Feb 2018 14:22:35 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1518819754.6900.50.camel@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Date: Fri, 16 Feb 2018 16:22:34 -0600
In-Reply-To: <20180216213511.117-1-Martin.Jansa@gmail.com>
References: <20180216213511.117-1-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.26.4 (3.26.4-1.fc27) 
Mime-Version: 1.0
Subject: Re: [meta-networking][PATCH] waf-samba: use new oe.utils.parallel_make_argument function instead of removed get_waf_parallel_make
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
X-List-Received-Date: Fri, 16 Feb 2018 22:22:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-02-16 at 21:35 +0000, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/classes/waf-samba.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-
> networking/classes/waf-samba.bbclass
> index e490176241..a63842cadc 100644
> --- a/meta-networking/classes/waf-samba.bbclass
> +++ b/meta-networking/classes/waf-samba.bbclass
> @@ -87,7 +87,7 @@ do_configure() {
>  }
>  
>  do_compile () {
> -    python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
> +    python ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d
> , '-j%d', limit=64)}

Ah, beat me to it. Either way, I approve FWIW.

>  }
>  
>  do_install() {
> -- 
> 2.15.1
> 

