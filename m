Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id E82CE75D4A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 20:32:26 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so64236155pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Dpkrz+JfTit4YdX2h1AoKQmGQZKQ3iEnYRAL1NmWlEc=;
	b=dREpiUGZ7r9JNYVDBjf1CHE4IL2fOOdfKXjUj0RBJGh1/3x24O4oYhCcYVLO32zi8c
	mWuo/5QRQI8ytMoJG4q1vitTkpoCaOq/DBmXKIdXYvlS1V7SMPuDKdvoCqd4ur0t/wmq
	TmjBuYzjrIOqh4XxTMrknokGL8xHXIOuG3rSH32R2VZXq6clrtvKHuEqdH74+PORTrp+
	x7WGMWu83hj3B2z+sTpRfSceJLcuAnI742RXuPkzzwZMMvDETq/ETwZIkLMpvVrLBU4V
	a9cW/+2KGZcWh0u6VBPYMoLQqY85aZS9Q0jh32rpPRJRbOSzKa1wrKEmli4XmEza0lOw
	Yk+g==
X-Received: by 10.68.103.2 with SMTP id fs2mr12633355pbb.123.1445459547003;
	Wed, 21 Oct 2015 13:32:27 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:2488:b73b:7240:2aa6?
	([2601:202:4000:1239:2488:b73b:7240:2aa6])
	by smtp.googlemail.com with ESMTPSA id
	er1sm265400pbb.6.2015.10.21.13.32.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 13:32:25 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1445456418-2756-1-git-send-email-schnitzeltony@googlemail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5627F658.1010401@gmail.com>
Date: Wed, 21 Oct 2015 13:32:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1445456418-2756-1-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH 1/2] libvpx: avoid CVE-2015-1258
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
X-List-Received-Date: Wed, 21 Oct 2015 20:32:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

same version in fido and dizzy.

will add to queue.

- armin

On 10/21/2015 12:40 PM, Andreas Müller wrote:
> [1] https://security-tracker.debian.org/tracker/CVE-2015-1258
> [2] http://pkgs.fedoraproject.org/cgit/libvpx.git/commit/?id=4257ff5f4ac22a3fe7b34f441e6425b2a8b690ae
> 
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
> index 4d9d2fd..5d049bb 100644
> --- a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
> +++ b/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
> @@ -37,6 +37,7 @@ CONFIGUREOPTS = " \
>      --enable-shared \
>      --prefix=${prefix} \
>      --libdir=${libdir} \
> +    --size-limit=16384x16384 \
>  "
>  
>  do_configure() {
> 

