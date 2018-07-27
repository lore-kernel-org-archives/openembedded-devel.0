Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id E2CCB78AFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:38:21 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id n6-v6so4298167qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S+4qcYM45wWLW5zR643WwTvZ7v1Lep68RM2VH0E44P4=;
	b=caBAEv4XSOVAGcjTMX90VNn94zebDG/iIz6Ex+ojSsYPeKjzojBI2OAjvAK0VJ4U+h
	Z+w3Olv25jVDLaRhqHCpFlQmZpGctXsbNV17fGHClzFGlpXI1N7Dl71j2odokrWyUwfs
	ESY9ARbYePMCShTclhNqBsg/zmV3jY9WiCB2eOOpt9yyfYSEb7wlGb9cyyqr+VuAZDcv
	6naRmdVZ46sY5EqxbDQp+NAmRvhwqKw0jVSR7jFCnXbtIC7zJqZ7Tane0PmJB+ziIEi7
	6q7HqVxA1KQFQqC94QVkMglh4ld1sbKXOUmYoELCmZ0h5iJGX7a5SesXmUmk76Cv9ZzR
	gdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S+4qcYM45wWLW5zR643WwTvZ7v1Lep68RM2VH0E44P4=;
	b=mm5IVVHm7IS5yWqcDNQsOoRdgM/i/N8JIdStaKaeLMV0IHc5yB6x8mOpHgl4S4zuSq
	o4pdbu2R003s734+dFVn1tCJUf8hfDVlZbXItAeBbgsdLCyCsGXMz3shGyawYHBQ37Mo
	X5eSwF6oBJpAbmutkzLBIoMzrXMxxNPYUJpGJ4dM2qNyyCLmEfSfUfOOXS9FqMW+EUgM
	ttd+f0g2WcaOdxb+XPEkfYyUsdBtaZCvOYl/nn89RvNUY6JIu+DECyG6OE93tYjZ8vGZ
	7HW38F62tbQnNnLcaOElkKjfH6D2KEAnv0Jt0VI5ypFzeAHZXk7U2vDFPGn82vyouIUH
	9geg==
X-Gm-Message-State: AOUpUlErFHx9xwuA/PWOiPJnsO0PfcEEIydrDyWa78p/yccfnu5Co9Xp
	mPmYbWNaaaf1k9DcmW8tLWVhQC1pV6ejyHgGR/o=
X-Google-Smtp-Source: AAOMgpejTGmNCizTFcna2T+jeLWzDzcyPKBpc6nPT/S7vngZbpMkAQZCCLTKztvUUioNZTpc8+V5qCfgKJiGqKLokFM=
X-Received: by 2002:ac8:70c5:: with SMTP id
	g5-v6mr5191100qtp.376.1532680702453; 
	Fri, 27 Jul 2018 01:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180726151045.19586-1-akuster808@gmail.com>
In-Reply-To: <20180726151045.19586-1-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Jul 2018 01:37:56 -0700
Message-ID: <CAMKF1sqwAVsyjjhwP5WRs3hAfO37ZUh=i3C9KMgHc7hfznt+fA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.6.2
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
X-List-Received-Date: Fri, 27 Jul 2018 08:38:22 -0000
Content-Type: text/plain; charset="UTF-8"

wireshark-native fails in do_install

| install: cannot stat
'/mnt/a/oe/build/tmp/work/x86_64-linux/wireshark-native/1_2.6.2-r0/build/run/make-dissectors':
No such file or directory
| WARNING: /mnt/a/oe/build/tmp/work/x86_64-linux/wireshark-native/1_2.6.2-r0/temp/run.do_install.31339:1
exit 1 from 'install -m 0755
/mnt/a/oe/build/tmp/work/x86_64-linux/wireshark-native/1_2.6.2-r0/build/run/$f
/mnt/a/oe/build/tmp/work/x86_64-linux/wireshark-native/1_2.6.2-r0/image/mnt/a/oe/build/tmp/work/x86_64-linux/wireshark-native/1_2.6.2-r0/recipe-sysroot-native/usr/bin'
| ERROR: Function failed: do_install (log file is located at
/mnt/a/oe/build/tmp/work/x86_64-linux/wireshark-native/1_2.6.2-r0/temp/log.do_install.31339)
On Thu, Jul 26, 2018 at 8:11 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> includes security fixes:
>
> wnpa-sec-2018-34 BGP dissector large loop. Bug 13741. CVE-2018-14342.
> wnpa-sec-2018-35 ISMP dissector crash. Bug 14672. CVE-2018-14344.
> wnpa-sec-2018-36 Multiple dissectors could crash. Bug 14675. CVE-2018-14340.
> wnpa-sec-2018-37 ASN.1 BER dissector crash. Bug 14682. CVE-2018-14343.
> wnpa-sec-2018-38 MMSE dissector infinite loop. Bug 14738. CVE-2018-14339.
> wnpa-sec-2018-39 DICOM dissector crash. Bug 14742. CVE-2018-14341.
> wnpa-sec-2018-40 Bazaar dissector infinite loop. Bug 14841. CVE-2018-14368.
> wnpa-sec-2018-41 HTTP2 dissector crash. Bug 14869. CVE-2018-14369.
> wnpa-sec-2018-42 CoAP dissector crash. Bug 14966. CVE-2018-14367.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../wireshark/{wireshark_2.6.1.bb => wireshark_2.6.2.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_2.6.1.bb => wireshark_2.6.2.bb} (95%)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
> similarity index 95%
> rename from meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
> index 91c5e96bb0..4da0cecee4 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
> @@ -14,8 +14,8 @@ SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
>
>  UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>
> -SRC_URI[md5sum] = "b0e9e5fe22e96d9fdfad18f750fa8f55"
> -SRC_URI[sha256sum] = "ab6e5bbc3464c956347b8671ce8397950ad5daff3bf9964c967d495f4ddbcd88"
> +SRC_URI[md5sum] = "086d235509717190d06554b2ab870209"
> +SRC_URI[sha256sum] = "49b2895ee3ba17ef9ef0aebfdc4d32a778e0f36ccadde184516557d5f3357094"
>
>  PE = "1"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

