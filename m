Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 01F9665CBD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2015 14:58:42 +0000 (UTC)
Received: by pdbep18 with SMTP id ep18so166495453pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2015 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ab9bXPNVMrQLnrPiy4nsyFWrjmtPs82nnWTjYNuPU0c=;
	b=JUwMQPKY1DmMyHOsu3AZo8ftuYmJvIyrzwgVBx1WuMYPs6kDY0XFFb/vOQdeOsIrMw
	k3hRWhBPppXdJhIXNXJyxVGkuhJwnzGq82c/6eaLcQ463fyMk3o/k5Pk/da5n3267Cg7
	+kyqAOWiwF8lam/EuYISmnFwO4Ma6mRdmBLFbS9ponx3M/utqm++Y1XmRFgf36Lak9Zb
	MUG4PXZZp5o11phbMfFfRUAI9jjPGT4wAhcUrq6QWEWpBF4YGnmjy6IknhD8cmD+IgSq
	0W3h8dT+4oXGFiyL4JNMsP5qy+o2mP+ZIprj0cICQSrrb4x9akBCQU9I7lv88f53SGCS
	dioQ==
X-Received: by 10.68.142.42 with SMTP id rt10mr32121855pbb.27.1436453922893;
	Thu, 09 Jul 2015 07:58:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:1f1:f366:7a5c:28ff?
	([2601:202:4000:1239:1f1:f366:7a5c:28ff])
	by smtp.googlemail.com with ESMTPSA id
	oo3sm6296832pac.31.2015.07.09.07.58.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jul 2015 07:58:41 -0700 (PDT)
Message-ID: <559E8C1E.9060607@gmail.com>
Date: Thu, 09 Jul 2015 07:58:38 -0700
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
X-List-Received-Date: Thu, 09 Jul 2015 14:58:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

fyi:

CVE-2015-5380

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

