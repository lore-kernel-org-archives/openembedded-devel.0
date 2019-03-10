Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 132AC7C40C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Mar 2019 14:47:46 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q17so1759130pfh.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Mar 2019 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=632GTewx3sVhkp/U2nbCnLGTbtz1CUB9OchuigFMgMQ=;
	b=RE715h0ohuZ4n41U/VhzM7oj+ioHRkul+tAtp2311us+F9u4CqPgYnu6j+3iWN/+10
	E4H6e3ldbCW9G9bGz0bIMp5lieiI1cu0Q0UKdKBEWBzDXbT1JotJegx1pPpfw83M1wPv
	Tn+RDuhmanmwbBd6w4kGNIVh69CoPvBCUUn8IXhkxQNXx/Nu2mwz/1JjJjAyVeq0uIvZ
	UvYVydZ4CU61tLutLCFtXmO7JqbgsUSX3GaGGFUNiqXq1LiYVTTD+GwuFSBeTEAiqOen
	tgYrIgF1YMEcQI8HMYBt+FlICcurZkAzHfgHY1pFiqL22pqmDg7ejPTNHb5uvJL8N6Wl
	vRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=632GTewx3sVhkp/U2nbCnLGTbtz1CUB9OchuigFMgMQ=;
	b=DNZmnOBN3kNC+Zfyf8cS+SLNzO7grjWG5jZ53ge90DD3Gjee4UTLVyD/32sIx0IBnd
	dYr7Qo6D7KVwFJRjPMHWXAJ3wB+iI62eeBhxJdOVCZrNAifD024/PiquE/p0NKM1f5+I
	lHVaXSCtzFGCKpIz0758Fc/iJWInfgh7AccqoWNX+o9HefHlvD3XgGAKvv5c5vOQTcNL
	UapDbmsl4cHQptt6eqn8VkNzLAeEl4s9pBrm4sOd53EFRMcRzd6vGxRFNpYrfm0OSg5V
	aNuEVxBzf2OUJJYUs9y5Kb8ihoylBy/QWkAt2okzu+AR9nWDiDBj9UgRtTyI01ViOPcA
	PphA==
X-Gm-Message-State: APjAAAW+5zBrPFwfFZlBHoZqCGQLGnuc43OVspkcxCs2SEe3q6vtN2Ut
	7M7WPQp0Y37ZQgBwZ74rV2GRf7al
X-Google-Smtp-Source: APXvYqxLh54sKiUpZ3FOG/Mg9yayOlBh12HT0mwEfNp1qSpNk/m8HVeIdHuTGRgLw9bkxjZ4FqyvuQ==
X-Received: by 2002:a62:564d:: with SMTP id k74mr28308482pfb.19.1552229267529; 
	Sun, 10 Mar 2019 07:47:47 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:18fc:c150:6496:1a0d?
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id
	x19sm4457827pfm.108.2019.03.10.07.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Mar 2019 07:47:46 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
References: <20190309141726.9429-1-oleksandr.kravchuk@pelagicore.com>
	<CAMKF1spUrVb+RA0HLbMN-Gjp71k617mB_iL2P+6Fjmk2WLd3Hg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6d65f745-f096-80f0-493c-822a336a5a96@gmail.com>
Date: Sun, 10 Mar 2019 07:47:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spUrVb+RA0HLbMN-Gjp71k617mB_iL2P+6Fjmk2WLd3Hg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] wireshark: upgrade to 3.0.0
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
X-List-Received-Date: Sun, 10 Mar 2019 14:47:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/9/19 10:00 PM, Khem Raj wrote:
> Hi Oleksandr
>
> I merged v1, can you rebase this on top of master and send the delta in
> v3?
Why this patch was taken when there was an objection and the issues did
not get addresses?

- armin
>
> On Sat, Mar 9, 2019 at 6:19 AM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../0001-Add-libm-to-link-for-fmod-API.patch  | 29 -------------------
>>  ...{wireshark_2.6.6.bb => wireshark_3.0.0.bb} | 21 +++-----------
>>  2 files changed, 4 insertions(+), 46 deletions(-)
>>  delete mode 100644 meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch
>>  rename meta-networking/recipes-support/wireshark/{wireshark_2.6.6.bb => wireshark_3.0.0.bb} (71%)
>>
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch b/meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch
>> deleted file mode 100644
>> index e65ef9b10..000000000
>> --- a/meta-networking/recipes-support/wireshark/wireshark/0001-Add-libm-to-link-for-fmod-API.patch
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -From 1a6a5d2bcb1adec9ba138c2ebee7bbc994620aff Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Tue, 12 Jun 2018 23:23:44 -0700
>> -Subject: [PATCH] Add libm to link for fmod() API
>> -
>> -fixes
>> -ld: CMakeFiles/tshark.dir/ui/cli/tap-comparestat.c.o: undefined reference to symbol 'fmod@@GLIBC_2.2.5'
>> -| /mnt/a/oe/build/tmp/work/core2-64-bec-linux/wireshark/1_2.6.1-r0/recipe-sysroot/lib/libm.so.6: error adding symbols: DSO missing from command line
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - CMakeLists.txt | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/CMakeLists.txt b/CMakeLists.txt
>> -index 7950e85..acee140 100644
>> ---- a/CMakeLists.txt
>> -+++ b/CMakeLists.txt
>> -@@ -2494,6 +2494,7 @@ if(BUILD_tshark)
>> -               ${LIBEPAN_LIBS}
>> -               ${APPLE_CORE_FOUNDATION_LIBRARY}
>> -               ${APPLE_SYSTEM_CONFIGURATION_LIBRARY}
>> -+              m
>> -       )
>> -       set(tshark_FILES
>> -               capture_opts.c
>> ---
>> -2.17.1
>> -
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
>> similarity index 71%
>> rename from meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
>> rename to meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
>> index 4699f6798..dc55e3de0 100644
>> --- a/meta-networking/recipes-support/wireshark/wireshark_2.6.6.bb
>> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.0.bb
>> @@ -8,26 +8,20 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
>>
>>  DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
>>
>> -SRC_URI = "https://1.as.dl.wireshark.org/src/all-versions/${BP}.tar.xz \
>> -           file://0001-Add-libm-to-link-for-fmod-API.patch \
>> -          "
>> +SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
>>
>>  UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>>
>> -SRC_URI[md5sum] = "b30ba5b9b48ed2ff91c0ce357d33b46b"
>> -SRC_URI[sha256sum] = "487933ea075bdbb25d8df06017d9c4f49fc20eb7f6ec80af086718ed5550e863"
>> +SRC_URI[md5sum] = "258d62ac7434d126dc497303c8f7961b"
>> +SRC_URI[sha256sum] = "bc4f30f5b2e94f3a696fef9de44673cdf402db90aac5299966da647f708f009e"
>>
>>  PE = "1"
>>
>> -inherit cmake pkgconfig pythonnative perlnative upstream-version-is-even
>> +inherit cmake pkgconfig python3native perlnative upstream-version-is-even
>>
>>  ARM_INSTRUCTION_SET = "arm"
>>
>> -# Options: gtk+, gtk+3 and qt5
>> -GTK = "gtk+3"
>> -
>>  PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
>> -PACKAGECONFIG_append_class-target = " ${@bb.utils.contains("DISTRO_FEATURES", "x11", " ${GTK}", "", d)}"
>>
>>  PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"
>>
>> @@ -36,8 +30,6 @@ PACKAGECONFIG[libpcap] = "-DENABLE_PCAP=ON,-DENABLE_PCAP=OFF -DENABLE_PCAP_NG_DE
>>  PACKAGECONFIG[libsmi] = "-DENABLE_SMI=ON,-DENABLE_SMI=OFF,libsmi"
>>  PACKAGECONFIG[libnl] = ",,libnl"
>>  PACKAGECONFIG[portaudio] = "-DENABLE_PORTAUDIO=ON,-DENABLE_PORTAUDIO=OFF, portaudio-v19"
>> -PACKAGECONFIG[gtk+] = "-DENABLE_GTK=ON -DBUILD_wireshark_gtk=ON, -DENABLE_GTK=OFF, gtk+"
>> -PACKAGECONFIG[gtk+3] = "-DENABLE_GTK3=ON -DBUILD_wireshark_gtk=ON, -DENABLE_GTK3=OFF, gtk+3"
>>  PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF, gnutls"
>>  PACKAGECONFIG[ssl] = ",,openssl"
>>  PACKAGECONFIG[krb5] = "-DENABLE_KRB5=ON,-DENABLE_KRB5=OFF, krb5"
>> @@ -79,16 +71,11 @@ do_install_append_class-target() {
>>  }
>>
>>  PACKAGE_BEFORE_PN += "tshark"
>> -PACKAGE_BEFORE_PN += "${PN}-gtk"
>>
>>  FILES_tshark = "${bindir}/tshark ${mandir}/man1/tshark.*"
>> -FILES_${PN}-gtk = "${bindir}/wireshark-gtk ${datadir}/icons ${datadir}/appdata \
>> -                   ${datadir}/applications ${datadir}/wireshark ${datadir}/mime \
>> -                   ${mandir}/man1/wireshark.* "
>>
>>  FILES_${PN} += "${datadir}*"
>>
>>  RDEPENDS_tshark = "wireshark"
>> -RDEPENDS_${PN}-gtk = "${@bb.utils.contains("DISTRO_FEATURES", "x11", "${GTK}", "", d)} wireshark"
>>
>>  BBCLASSEXTEND = "native"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


