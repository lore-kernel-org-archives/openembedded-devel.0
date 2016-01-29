Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0181875E2D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 18:36:42 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id e64so3235134vkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 10:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=kvQkLpfHjFM5VYFh2GjkD8jwn0bV+MJ9PqMP5a2E57Q=;
	b=ukpjbbFItVna0PRDQSn5ORMDfUn6sPDXRpTvhWFfo6TNmzI5KM/dd/QBpuggR88ChZ
	mlIeX7ccGlB5zK2ziWTDnCCydL29uWUvCcXBQ5RhIo/Ex9oUTHWkxm3SCBBdi79G8E7Q
	E6PFWPpibxIvnM07UMMWpotSysax2WNsayDlveOPziURZrboxQ5rZTsr4P/ZZjW6eh35
	smKMXprH1RK9X/+8FAAl2Pd839QBh/gVJSdhS9A6TM/z+Qq4/UgBgBQbx69WPD+tvvWz
	Txpa6+BgtcMtMbd44B1irF93LHWxq8kAGPZNAuWPY/KBv07PW5txLydZcPr/E3Ix3b74
	NvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=kvQkLpfHjFM5VYFh2GjkD8jwn0bV+MJ9PqMP5a2E57Q=;
	b=bAHPI37CByOf793OobO//or2ORK+5jrGDBJCsNfL/qwBl40Fn5xBrL4hcoVGC3vOwi
	PlLdUCQKja7iV6jWlz8c3iacLWg5I9VoyfdZNdc3zZUPk+hNj1HO9tDR7e6Y+/Bv2itr
	27/kBJWNgyp+9wxjiaJ3n308d9alUvsf4rvAYpJoHaYU5K4P9UWU6GRP22ZqrE3byoT2
	Q3Scn0ytWHKjukKj1nnEsU2SfLQsfSK019p3cfXMMC49rw2Q0KH55lvw5+5FjnkRVcmH
	IYawkMge5Iu21E7hMLszqUYvLUDtSCrGOXkdMdRg52+PyPJQaEFen6E35ZsciCitKmib
	51sw==
X-Gm-Message-State: AG10YOQb/RktHavEMg8L3S0dFJo/+0ufj0BxSSy2tSowXXj+I2HPVIVWgTK8d2eDuYO5P1ParO/WLtJCSxDyiQ==
MIME-Version: 1.0
X-Received: by 10.31.1.215 with SMTP id 206mr7290975vkb.101.1454092602966;
	Fri, 29 Jan 2016 10:36:42 -0800 (PST)
Received: by 10.103.82.152 with HTTP; Fri, 29 Jan 2016 10:36:42 -0800 (PST)
Received: by 10.103.82.152 with HTTP; Fri, 29 Jan 2016 10:36:42 -0800 (PST)
In-Reply-To: <1bbf4294022caa7880af64a76570c53aa2edeb0b.1454081481.git.adrian.ratiu@ni.com>
References: <397caaab4cdf263cb23cb988bbc100ee5e264261.1454081481.git.adrian.ratiu@ni.com>
	<1bbf4294022caa7880af64a76570c53aa2edeb0b.1454081481.git.adrian.ratiu@ni.com>
Date: Fri, 29 Jan 2016 12:36:42 -0600
Message-ID: <CACS+7ZSGjS62zJgc0MbTBk-T-50SKfunQduKwn1daojUYG1ywg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2 2/2] apache2: add openldap support to PACKAGECONFIG
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
X-List-Received-Date: Fri, 29 Jan 2016 18:36:45 -0000
Content-Type: text/plain; charset=UTF-8

On 29 Jan 2016 9:39 a.m., "Ioan-Adrian Ratiu" <adrian.ratiu@ni.com> wrote:
>
> This config option is disabled by default
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
b/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
> index 8ca6d00..597afe6 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
> @@ -59,6 +59,7 @@ EXTRA_OECONF = "--enable-ssl \
>
>  PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'selinux',
'selinux', '', d)}"
>  PACKAGECONFIG[selinux] =
"--enable-selinux,--disable-selinux,libselinux,libselinux"
> +PACKAGECONFIG[openldap] = "--enable-ldap
--enable-authnz-ldap,--disable-ldap --disable-authnz-ldap,openldap"
>
>  do_install_append() {
>      install -d ${D}/${sysconfdir}/init.d
> --
> 2.7.0

Looks good to me.

>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

