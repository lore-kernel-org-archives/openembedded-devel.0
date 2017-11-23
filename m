Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0D969782D3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 14:43:30 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id m11so12542157iti.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 06:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AoAFSfLlj7ggxAofTB93B785C1lMkWnyRm9GQXCtN6g=;
	b=koBwQCQthjo3LDpdcEfKma/ux3v4yaHBT4Lsf3lEh9XIFACuxwUP+TCETvnz5GiKM6
	bkasdW5pQXLdsCSv6gmB8eV3hI25h//TDJ4isC8GykMEJl54p3QXEAE9k8YRdtD895/B
	8XEj6kxWzPuv6fq3xKTvjcIhLkOCsQpqOLwJ9sqy0DLMYRr79aBbSEYpIXhdKPSzOpNv
	yUfhIzoMVDGga+h3cJQe44kZi6A2f33U2Qwy4J9TJKLPVcCyM2eRA/7gMV9EnRRFFzGk
	8raXMxqokKHdfh9LdCAfZ0CcFDFLKD0pcs25MNsB7cwlgS1e9WPVkKwtjKGodokh/yGl
	Sj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AoAFSfLlj7ggxAofTB93B785C1lMkWnyRm9GQXCtN6g=;
	b=QgD3uiOuvfJG8lFFcLVOr2eO82TsQiNQLM99sWDWzr81qYBolzLEn2cNhlTpf8ICmU
	5xIRLFu8zWbR6/APbvO6A8G0hBtESJLKTBA2iDUDtaC8a7dbiCQAnnTV5+g57dzxXFiG
	jodyebBhYsE1fXAslVXDeVP9x4s2oSjvBXwmY5DaOwk8b8yy0MNNJ7nCbql+3w1uKV+y
	5hTL1fXYIBOwzjIIGYEn9kylPyfqiT+45pOopWplFjKBtCUbgOFJpFYoz3NV+XH+VyqY
	UFP4w6j5QwuqsbuEHXbjpv5BoPpQTAWdrpifLNSyv4C2PH55C6Fmg1J9+o7wTIJh7xHM
	Q6Ow==
X-Gm-Message-State: AJaThX7mVdJGlWim/iGjiXv5iYRdK/d/xj3O7TJuplXepOpnFwktLVaN
	ODZAxoLq/Cf2C8un2vW/yrAdiQ1ZNs92sfyxWK23lw==
X-Google-Smtp-Source: AGs4zMaG686ALfkaG/rHI3f43LtEpKFp8YTz0IfuXNdAHRYLuqe2jp0zfypjNHveu+695JloPX4OojRkdAJK1M/PZTM=
X-Received: by 10.36.147.198 with SMTP id y189mr12003881itd.6.1511448212167;
	Thu, 23 Nov 2017 06:43:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Thu, 23 Nov 2017 06:43:11 -0800 (PST)
In-Reply-To: <1511443538-32104-1-git-send-email-vladan.jovanovic@gmail.com>
References: <1511443538-32104-1-git-send-email-vladan.jovanovic@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Nov 2017 14:43:11 +0000
Message-ID: <CAJTo0LYXU4mMY3pm6r7cZhRQ3=erY=j5+nkO-Bfnr0cLfx6vOg@mail.gmail.com>
To: Vladan Jovanovic <vladan.jovanovic@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Fix PACKAGES assignment for fftw
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
X-List-Received-Date: Thu, 23 Nov 2017 14:43:31 -0000
Content-Type: text/plain; charset="UTF-8"

You should explain why its the wrong operator, as =+ is as valid as += is.

Ross

On 23 November 2017 at 13:25, Vladan Jovanovic <vladan.jovanovic@gmail.com>
wrote:

> fftw recipe using wrong operator for modifying PACKAGES variable.
> ---
>  meta-oe/recipes-support/fftw/fftw_3.3.6.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
> b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
> index ed14e16..e13684c 100644
> --- a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
> @@ -65,12 +65,12 @@ do_install() {
>  }
>
>
> -PACKAGES =+ "libfftw libfftwl libfftwf"
> +PACKAGES += "libfftw libfftwl libfftwf"
>  FILES_libfftw = "${libdir}/libfftw3.so.* ${libdir}/libfftw3_*.so.*"
>  FILES_libfftwl = "${libdir}/libfftw3l.so.* ${libdir}/libfftw3l_*.so.*"
>  FILES_libfftwf = "${libdir}/libfftw3f.so.* ${libdir}/libfftw3f_*.so.*"
>
> -PACKAGES =+ "fftw-wisdom fftwl-wisdom fftwf-wisdom fftw-wisdom-to-conf"
> +PACKAGES += "fftw-wisdom fftwl-wisdom fftwf-wisdom fftw-wisdom-to-conf"
>  FILES_fftw-wisdom = "${bindir}/fftw-wisdom"
>  FILES_fftwl-wisdom = "${bindir}/fftwl-wisdom"
>  FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

