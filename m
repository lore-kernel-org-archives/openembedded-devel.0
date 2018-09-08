Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id EA96779731
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 20:26:09 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id i190-v6so8574349pgc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Sep 2018 13:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=NHKkE57kpkcpPdbR5mzdVGAThxzhk3tARg4tVkB6wjo=;
	b=ebjJgg8p0RhrfURxOPxCJSrf05v4W2aHKxCaan+mn3gJdANaGfucUoxmyRHmtn5zFe
	ylMh10FC7FSVNR8aUD49ySMGLWw26NlLAuj3QJhTv74d8DOISmQI68K1fZqp8wWNUfeo
	8cMh0Xeb1mKqrEkvxczUdOwR0S4M+pQkBOXKp0TAz48mvq/vUqwNFqBOgx5dpMXt6AZT
	t0N8V94BeGjF3NYfBFAkVoFHdW7k887wf+zT3611AOZ9/hEF/rcqh9agV0bJxeb8siPW
	6v2DaMnlu9n6vT1FGztJpEREix+fKIPoZ8rNClaF20vhRxbkwl+5N63wHmgnDl/hQreb
	HOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=NHKkE57kpkcpPdbR5mzdVGAThxzhk3tARg4tVkB6wjo=;
	b=IZsIjvprfLeITBs0f4o6r4rrQoCE4nAQVI4lUiYMP3QzmLe0PRw6u23GtCDHuP3eGK
	eqf4gvRuBrXMjN/KRNKPJDpY8otKRlcbFZDC3XLALoXIexWjNPLwBxEtr5wFA1lD1Dui
	H58zrZEn9tG/IE+PKLLM9VIvoJ1+heK687VAEB8tnUNz4q5DbjyuVkNt6gE4w/1xDy2o
	7Ay51gMyGJmPy08sHOdkYNTBuj520GFeEpwRwJVZ5ktbdm29qKqF2p6ED4BMajv4tlH0
	5st+YUUUowlEnhwNamlHln87L9SG8Sc6BeZgAE8ra6y3mJzClCRe6nhmuNoM46dldrB8
	iMFQ==
X-Gm-Message-State: APzg51CyEaRNPayx2qqBVFwG6hjCFxZqYNXJAZyACagAr73YxvQGj6/x
	H2aG4WnC02wUPCgRzI72bgg=
X-Google-Smtp-Source: ANB0VdYW9lQTgkUzOO2oKoYSwKpk57r2huhrTn/V5ODVv3+at9O4Ecd4su8ne4iA3B6Vs9bRF41/6w==
X-Received: by 2002:a62:c288:: with SMTP id
	w8-v6mr15497182pfk.92.1536438370858; 
	Sat, 08 Sep 2018 13:26:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:298f:c8f9:a134:db17?
	([2601:202:4180:c33:298f:c8f9:a134:db17])
	by smtp.gmail.com with ESMTPSA id
	j191-v6sm16548274pfc.136.2018.09.08.13.26.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Sep 2018 13:26:10 -0700 (PDT)
To: Alexander Filippov <a.filippov@yadro.com>,
	openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe_macdonald@mentor.com>
References: <20180905161049.13809-1-a.filippov@yadro.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <148c879d-6ae3-0fc0-b65b-a0d366b1b5ac@gmail.com>
Date: Sat, 8 Sep 2018 13:26:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180905161049.13809-1-a.filippov@yadro.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [sumo][meta-networking][PATCH] split net-snmp-libs into smaller packages
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
X-List-Received-Date: Sat, 08 Sep 2018 20:26:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/05/2018 09:10 AM, Alexander Filippov wrote:
> By default `net-snmp-libs` contains all compiled libs.
> This commit splits `net-snmp-libs` into subpackages for each library.
>
> This allows for smaller resulting image due to finer packaging.
>
> Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
Please submit for master.
> ---
>  .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   | 23 ++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> index faf73a563..4ea0a5915 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> @@ -173,17 +173,21 @@ net_snmp_sysroot_preprocess () {
>      fi
>  }
>  
> -PACKAGES += "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd"
> +PACKAGES += "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client \
> +             ${PN}-server-snmpd ${PN}-server-snmptrapd \
> +             ${PN}-lib-netsnmp ${PN}-lib-agent ${PN}-lib-helpers \
> +             ${PN}-lib-mibs ${PN}-lib-trapd"
>  
>  # perl module
>  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'perl', '${PN}-perl-modules', '', d)}"
>  
>  ALLOW_EMPTY_${PN} = "1"
>  ALLOW_EMPTY_${PN}-server = "1"
> +ALLOW_EMPTY_${PN}-libs = "1"
>  
>  FILES_${PN}-perl-modules = "${libdir}/perl/*"
>  
> -FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
> +FILES_${PN}-libs = ""
>  FILES_${PN}-mibs = "${datadir}/snmp/mibs"
>  FILES_${PN}-server-snmpd = "${sbindir}/snmpd \
>                              ${sysconfdir}/snmp/snmpd.conf \
> @@ -196,6 +200,12 @@ FILES_${PN}-server-snmptrapd = "${sbindir}/snmptrapd \
>                                  ${systemd_unitdir}/system/snmptrapd.service \
>  "
>  
> +FILES_${PN}-lib-netsnmp = "${libdir}/libnetsnmp${SOLIBS}"
> +FILES_${PN}-lib-agent = "${libdir}/libnetsnmpagent${SOLIBS}"
> +FILES_${PN}-lib-helpers = "${libdir}/libnetsnmphelpers${SOLIBS}"
> +FILES_${PN}-lib-mibs = "${libdir}/libnetsnmpmibs${SOLIBS}"
> +FILES_${PN}-lib-trapd = "${libdir}/libnetsnmptrapd${SOLIBS}"
> +
>  FILES_${PN} = ""
>  FILES_${PN}-client = "${bindir}/* ${datadir}/snmp/"
>  FILES_${PN}-dbg += "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.debug/"
> @@ -219,10 +229,15 @@ SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
>  RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'net-snmp-perl-modules', '', d)}"
>  RDEPENDS_${PN} += "net-snmp-client"
>  RDEPENDS_${PN}-server-snmpd += "net-snmp-mibs"
> -RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd"
> +RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd ${PN}-lib-trapd"
>  RDEPENDS_${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
>  RDEPENDS_${PN}-client += "net-snmp-mibs net-snmp-libs"
> -RDEPENDS_${PN}-libs += "libpci"
> +RDEPENDS_${PN}-libs += "libpci \
> +                        ${PN}-lib-netsnmp \
> +                        ${PN}-lib-agent \
> +                        ${PN}-lib-helpers \
> +                        ${PN}-lib-mibs \
> +"
>  RDEPENDS_${PN}-ptest += "perl \
>                           perl-module-test \
>                           perl-module-file-basename \


