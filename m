Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9838D75E05
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 15:30:36 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so133536741pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jul 2015 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=B8zZ/V4LZCXJ9b6wxNBnGR/eP3psY7KqKu4JB2aPz5I=;
	b=jIuoMgq0IO/cpkeC2X5PdEB9D+2jIk5IU740ArtkpTRWjTfR4br6OtGvubLiwURvB8
	NhanLC4hOyu0AV7LI4Si9qf1YSTSx6IS5aS1PCZd+hQN9dFo/BJgrGYrSsH9ymll6jG/
	vY8kLgMJAX5Q77HrhaWkWK2iTuW1HbvDZA/iiLxRCi4EYnwNOxR+ByWTikthyNVHuA3h
	m/1MyexSQ7v09xQYbOjM2+E+rpgSTblr97X7kdIIKh3XvMqEu5QvYsuA3cwZKw1HOU5a
	Gm/Pzsz3iOyXpZPgiB59feQy5F1Ie7auOGJGhmdYDUAjOxDA6e0IuS+fWYrJbbPO9+en
	WWEw==
X-Received: by 10.68.90.225 with SMTP id bz1mr22022121pbb.6.1436369436942;
	Wed, 08 Jul 2015 08:30:36 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:202d:ddf7:682b:65c6?
	([2601:202:4000:1239:202d:ddf7:682b:65c6])
	by smtp.googlemail.com with ESMTPSA id
	ly7sm2900937pdb.17.2015.07.08.08.30.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jul 2015 08:30:35 -0700 (PDT)
Message-ID: <559D4219.10505@gmail.com>
Date: Wed, 08 Jul 2015 08:30:33 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1436254986-18539-1-git-send-email-net147@gmail.com>
In-Reply-To: <1436254986-18539-1-git-send-email-net147@gmail.com>
Subject: Re: [meta-oe][PATCH] nodejs: update to 0.12.6
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
X-List-Received-Date: Wed, 08 Jul 2015 15:30:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

this update includes a security fix. No CVE assigned yet.



On 07/07/2015 12:43 AM, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   .../recipes-devtools/nodejs/{nodejs_0.12.5.bb => nodejs_0.12.6.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.5.bb => nodejs_0.12.6.bb} (95%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.5.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.6.bb
> similarity index 95%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.5.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_0.12.6.bb
> index 5685721..73c0557 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.5.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.6.bb
> @@ -9,8 +9,8 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
>       file://enable-armv5e-build.patch \
>       file://no-registry.patch \
>   "
> -SRC_URI[md5sum] = "aa6d22762e70b4f46293a17373788291"
> -SRC_URI[sha256sum] = "4bc1e25f4c62ac65324d3cf4aa9de2d801cd708757c3567b6ad2ced7df30cdd2"
> +SRC_URI[md5sum] = "698ebd8ecd5c9c61091875bbd54401f4"
> +SRC_URI[sha256sum] = "7a3b5ac351973a9dee8edbf0684bc8d0dea44b231e42274ffb008141ffa19ad2"
>
>   S = "${WORKDIR}/node-v${PV}"
>
>

