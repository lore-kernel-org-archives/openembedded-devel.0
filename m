Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 18EDC780A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Aug 2017 01:09:09 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y43so2579853wrd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Aug 2017 18:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eAtxp1AhAtX9ICEyZ4kQklZtYjbMtIGeQCAF43bsP3I=;
	b=cD8zH6Bj7vzZuQ+cDNvKyPI7ajUqBdeVcVmswW2Do58MdcTEYyJmsJpLyu96nAwOAL
	CYQu3zZhkwRkFrulBirRB4s5chznAkvrMj+tVfSS5pMzDycoIBNZyvA2ej4JFUrAXoG6
	HLzaP+lLj5bCvIMvSI/hWyuZZOpxq8+C7SORHVS87l8DamkLO+wHsLXeXyLWUrHLMASH
	8dkEBef0p0eYshrUiGqVduSYRrpJFhK1ne1W3i9ag04sOeDkrX/l2bCPgl6YHZIHJCUz
	onZonuTZQFF8LaZG50Q1P7EYZl1C11uz1m8nP+ByOoOTu3rgcP3B9TSGF3IbsfjxhEk0
	WScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eAtxp1AhAtX9ICEyZ4kQklZtYjbMtIGeQCAF43bsP3I=;
	b=IK8skelFP5wD3KzMxBL2UDcjnkdF8lRWPsGPTEvAzp0mS9yF2F3oj3UVHFmb9LGfVq
	ErcB0n6o11FDLESmuVLSz7IMr95F91MEwmq1Rh4Z6DOuzymgf42A9Pt6IIqd5XeXe4rM
	/Nzgf88Cq1DDqBJdSFi8vHYeaz93VoLRaYyNuwwhc0E67rwA5UYd8fgJ+b3OqNFL+Mzz
	4tL9yzbcapqCdHIMHhcS1lrh24W1M6B3MW2GmKqqMkJHhi0+/8kxFtIFXlCpEaQ8ehgJ
	DOKwVBXWkSCFWYaJtqAHgqgJePuuju4DEmt/+V7j1kNRssPZXN09tpALcwrIQ7WCRv/Z
	U8Vw==
X-Gm-Message-State: AIVw110NA+kj0EQeyxC8P4S4W356yUlM1+RLTZVinPn2zC9rhZT92CEr
	8FQJWoCM6TpH601vySfgt1uOr3ndyA==
X-Received: by 10.223.151.82 with SMTP id r76mr16308661wrb.6.1501636150469;
	Tue, 01 Aug 2017 18:09:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Tue, 1 Aug 2017 18:09:09 -0700 (PDT)
In-Reply-To: <1501583507-1017-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1501583507-1017-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 1 Aug 2017 18:09:09 -0700
Message-ID: <CAJ86T=UoTjRek3EfeqzhPXZP2GgmeJXEHCiz84id_MnkLuK7fg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] uninative: Allow a local own-mirror to work with uninative
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
X-List-Received-Date: Wed, 02 Aug 2017 01:09:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 1, 2017 at 3:31 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The games we play with path manipulation of DL_DIR in uninative mean standard
> PREMIRRORS don't work and we can't easily put 'chksum' into the url path from
> a url parameter with the current fetcher url handling to make a generic
> remapping. We therefore add to PREMIRRORS when we know the chksum to
> create a premirror mapping which can work.

Wrong list?

> [YOCTO #9888]
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/uninative.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
> index 8f34483..a410647 100644
> --- a/meta/classes/uninative.bbclass
> +++ b/meta/classes/uninative.bbclass
> @@ -49,6 +49,12 @@ python uninative_event_fetchloader() {
>              localdata = bb.data.createCopy(d)
>              localdata.setVar('FILESPATH', "")
>              localdata.setVar('DL_DIR', tarballdir)
> +            # Our games with path manipulation of DL_DIR mean standard PREMIRRORS don't work
> +            # and we can't easily put 'chksum' into the url path from a url parameter with
> +            # the current fetcher url handling
> +            ownmirror = d.getVar('SOURCE_MIRROR_URL')
> +            if ownmirror:
> +                localdata.appendVar("PREMIRRORS", " ${UNINATIVE_URL}${UNINATIVE_TARBALL} ${SOURCE_MIRROR_URL}/uninative/%s/${UNINATIVE_TARBALL}" % chksum)
>
>              srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};sha256sum=%s" % chksum)
>              bb.note("Fetching uninative binary shim from %s" % srcuri)
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

