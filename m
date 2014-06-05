Return-Path: <akuster@mvista.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0001A6FA7C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 17:26:49 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id md12so1398789pbc.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2014 10:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=6ImCBBYyOddY4rYclaBuEZqWdhvsRQbkXzrDupc4dT0=;
	b=jkzcGoItMRel1y3tlteGsg0JqBGIQ2pJP0DJa+zf8DiKE06DxmF8KHRsGBkmRsFEp3
	qcWBXBPsCjLygY568ZEj07JrNEMT7k39zRWPISJvUC4M4mQAsd9SumIK5Bv0wRLHasnK
	RHLzgamT8JD9KKfgi17t9SWg+ph8/6jUSsyeVw5mGb0O8g+OsmkppucysDwJXt+iSlck
	XCyen43cpTK716TN8KFrlByWUcrQD7a2EmkemZAkaH/ubavU9bjE+OAtMZnSof96j/7R
	aItdNNZSTNk9u0IaVjwhOOMPD0iWamkfBeJnOMrxeo9bjyyOA43MdioJBrLkLXK8nzXn
	v84w==
X-Gm-Message-State: ALoCoQmk1hYQIwlBNkTiK0T2hJ0fZWtFC1V73f6ZCv6pHv4bwB4qMtx+T/hWx41seR6Wm1praNt8
X-Received: by 10.68.234.2 with SMTP id ua2mr77852245pbc.81.1401989210214;
	Thu, 05 Jun 2014 10:26:50 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	jt7sm25169091pbc.46.2014.06.05.10.26.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Jun 2014 10:26:49 -0700 (PDT)
Message-ID: <5390A856.8060200@mvista.com>
Date: Thu, 05 Jun 2014 10:26:46 -0700
From: "akuster@mvista" <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1401975481-22389-1-git-send-email-akuster@mvista.com>
In-Reply-To: <1401975481-22389-1-git-send-email-akuster@mvista.com>
Subject: Re: [meta-oe][PATCH] libop: compile issue files missing in B
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
X-List-Received-Date: Thu, 05 Jun 2014 17:26:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hold off on this. There is a packaging issue as well.

I will be sending V2 later today.

regards,
Armin

On 06/05/2014 06:38 AM, Armin Kuster wrote:
> needed to copy over a file from S to B.
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   meta-oe/recipes-support/libol/libol_0.3.18.bb | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-support/libol/libol_0.3.18.bb b/meta-oe/recipes-support/libol/libol_0.3.18.bb
> index 429945f..7ad7ab5 100644
> --- a/meta-oe/recipes-support/libol/libol_0.3.18.bb
> +++ b/meta-oe/recipes-support/libol/libol_0.3.18.bb
> @@ -8,3 +8,8 @@ SRC_URI[md5sum] = "cbadf4b7ea276dfa85acc38a1cc5ff17"
>   SRC_URI[sha256sum] = "9de3bf13297ff882e02a1e6e5f6bf760a544aff92a9d8a1cf4328a32005cefe7"
>   
>   inherit autotools binconfig
> +
> +do_compile_prepend() {
> +
> +    install ${S}/utils/make_class.in ${B}/utils
> +}


