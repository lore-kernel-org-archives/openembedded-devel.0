Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id AB3A165DAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 17:18:33 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lf10so11572764pab.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 09:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=+ebM8Xbg3iDh0zVuQoNSJjTszv0gTfFDMJXoy1g9pGM=;
	b=CT90Xkrj/r8Va0RXOx6gNSHMTnycSoNpvvBehy7i5jJ4viyGg1xbv9Cshf11JYL5Sc
	uFJPpWB/EQPSxLiac1IU3bscJL6UMPHzd9cMlzY/NIfNJtJlx3zl4x62C9oJ6MqSmWAM
	7oqixckTl2FcEzlA3B5FX/bQGg5LUlnrkzK2PV/rcXHiGbvWfyFXE4WSABaT28rKp9s9
	pEMBJldxUeG2KYpN5vzhEUN8EOUunjbuDM7cCNa+wroAwQPLMHT897fy/y4g5uO8SDah
	4RucD74bIQ7O4qKIn7B+Ednjus2DvJuz1JSJIkgVPCdfwVr9XDJsSSb+JzGStccus55K
	MH8A==
X-Gm-Message-State: ALoCoQkXedWYzm5pC4GqpZyutyNYC/DIxX5hFl1u/w6T+CYGwfb1BdUf5SXZTvTSGZdVe+q4Hg2f
X-Received: by 10.68.68.227 with SMTP id z3mr33328343pbt.3.1418663914207;
	Mon, 15 Dec 2014 09:18:34 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:1d1a:5082:6eef:d127?
	([2601:c:9380:601:1d1a:5082:6eef:d127])
	by mx.google.com with ESMTPSA id
	ny10sm9835530pdb.21.2014.12.15.09.18.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Dec 2014 09:18:33 -0800 (PST)
Message-ID: <548F17E1.8090904@mvista.com>
Date: Mon, 15 Dec 2014 09:18:25 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB091792@dor-sms-xch01.digi.com>
In-Reply-To: <DA8287CC96892A4EB4FCF4FB3FBDA1AB091792@dor-sms-xch01.digi.com>
Subject: Re: Dizzy backports
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
X-List-Received-Date: Mon, 15 Dec 2014 17:18:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Javier,

I will stage these for my next request.

thanks,
Armin

On 12/15/2014 09:05 AM, Viguera, Javier wrote:
> Hi all,
>
> Could the following commits be considered for Dizzy backporting? The first one is absolutely needed as the SRC_URI for imagemagick is currently wrong in Dizzy. The second one would be nice to have as it removes a possible security hole.
>
> Both of them are just a cherry-pick away so I don't include here the patches.
>
> commit 7e034ebd5424a19a1a3a6d7a0d00f3c0b138359a
> Author: Peter Bigot <pab@pabigot.com>
> Date:   Sat Nov 1 16:27:23 2014 -0500
>
>      imagemagick: update URI to allow fetching current and previous releases
>
>      The only version available at the original URI is patch 9.  All releases
>      are available at the /releases sub-path.
>
>      Signed-off-by: Peter A. Bigot <pab@pabigot.com>
>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
>
> commit 56dd9cb399f55223899dbee60a384f752cbc5db7
> Author: Javier Viguera <javier.viguera@digi.com>
> Date:   Wed Nov 26 09:34:14 2014 +0100
>
>      xserver-common: disable TCP connections
>
>      For security reasons disable TCP connections to the xserver.
>
>      Signed-off-by: Javier Viguera <javier.viguera@digi.com>
>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
>
> -- jviguera
>

