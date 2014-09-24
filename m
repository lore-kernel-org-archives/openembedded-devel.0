Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id D20586116C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 16:16:09 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id eu11so8202953pac.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=cT37ejkxVDQduCdw1Sn9268IQ5dHKBjVFbGncWQEIeg=;
	b=aOXltUx4UmjJXpzAgifU+1WpUtccS34DvAR2KKX8Xi0V+cIexmLUcYl9jjVcskAO/Y
	VfH2Gy/G17sK9ZnyHvd1leLipzBhwtERCqFv6ApOdzbSft3RuT4FurHRaUhFy1GOCVr5
	xYvxLYHdefj7tu9qQwm8RMtovKZqJ6FsQVX1kbrPfC0wpdq5TZfj15s4DAyYbNaRx+uO
	3PGFFR53DMFuW1yOi9CNbIZKv/SQ9KNDzjvq4loza0TVeQ+iPEEuXzWqGvflxqikCp5T
	v3+TR0vDLuaDtBz7okZNO/56rsg14u4R9c3KGeZjzaZpJS9vdsjrl6/LBOyTBmBDGa72
	QGEg==
X-Received: by 10.68.212.134 with SMTP id nk6mr10561208pbc.61.1411575370284;
	Wed, 24 Sep 2014 09:16:10 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:ec77:7fc4:f575:b70e?
	([2601:c:9380:601:ec77:7fc4:f575:b70e])
	by mx.google.com with ESMTPSA id
	rl4sm12093820pbc.69.2014.09.24.09.16.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Sep 2014 09:16:09 -0700 (PDT)
Message-ID: <5422EE47.1060202@gmail.com>
Date: Wed, 24 Sep 2014 09:16:07 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: damann@sensoft.ca
References: <1411399687-11026-1-git-send-email-damann@sensoft.ca>
	<1411399687-11026-2-git-send-email-damann@sensoft.ca>
In-Reply-To: <1411399687-11026-2-git-send-email-damann@sensoft.ca>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][daisy][PATCH] Fixed repo path for libmikmod, was changed in sourceforge
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
X-List-Received-Date: Wed, 24 Sep 2014 16:16:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Dominic,

how is this fix different than the patch sent on Sept 12th? The patch on 
the 12th has more of a description in the header.

- Armin

On 09/22/2014 08:28 AM, Dominic Amann wrote:
> ---
>   .../recipes-multimedia/mikmod/libmikmod_3.3.3.bb   |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
> index 6a3077f..7f9651f 100644
> --- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
> +++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=b2b941d484c442e5c031a51463d8e11b"
>   DEPENDS = "alsa-lib texinfo"
>
>   SRC_URI = "\
> -    ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
> -"
> +    ${SOURCEFORGE_MIRROR}/project/mikmod/outdated_versions/${BPN}/${PV}/${BPN}-${PV}.tar.gz\
> +	"
>   SRC_URI[md5sum] = "0e0f9bce8f8e598ca292b41e0ae385c8"
>   SRC_URI[sha256sum] = "79f02478c5abd8b2af73df4cc5f9d52625aa044327c01563168e270cf79b2437"
>
>

