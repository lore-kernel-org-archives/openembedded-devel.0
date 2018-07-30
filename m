Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id BF2B478DD6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 15:07:59 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id q7-v6so4662677pff.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 08:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=VOSjCO4wB2EC5pBQThi1LFcXXuicjsYSztg4xryGDj8=;
	b=RKm8A7j5pbeYRlEZdp6oYVd9HObaaMMrvpROVXnwy3/dprPOYLK8W1ggTchP2qrjGW
	Jkr9cjn089EoYv6v7XW3OYA0qoob5aGkXCldNCo9tw7tMvKsKQY/8uGW4a6vNInWKFGd
	a5llnW4eqlQgSimT+8guc7QwgiUwF6JaHtuCuzily31Elym8alvNng+c8CseuDvUBR+y
	/hofprj9EJpW9aBfJj/UZh/wR04HOFA4dxTvb8ZNQdzHhYEx6L1WacKEQZOTfGF2orD6
	kjsZ4mqhtx70WOpHC0MOlPxhINIA0i9/VRR99vko1uhfkgp/6RPtrjXxdhrZsVc6af7u
	G/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=VOSjCO4wB2EC5pBQThi1LFcXXuicjsYSztg4xryGDj8=;
	b=NluEP0ieEuSw2t3JCEDgbxdC8vkwkTf/kf0LPaba3bC+0kGpdaNk7ktCvJJ1E5Km03
	yYelI0i4c+EMjqobb27KYGeFjOKo6PjTK6MuRfqLn/wybS7Nmof2kcDr4xY+FgsNBa32
	pPUzx4a6ZlAcHXXjAEyQyDOaPmNRWUgAd/Yj+7EKwUgMMVnMvXtwZDy54uM6pAWJpRMR
	7DTGVkPxvNBvJQ1JrHBq92bqThuUSq5el/ii++w/tBysWfSyqpmQfr574eKjM069Nw10
	Vdkre/9V2M0NJmL2EDgiSiYgBBw7ePT9GZo7Pztwo4RGSxP3+0JK2SrEbFS+Hb2cEmLH
	4fDg==
X-Gm-Message-State: AOUpUlE+NMAYeTxloHVVKrKSgs0FYM/Y70ieHbFL9mXq8LkziEiCZUxP
	xiFhk0sze018/n87XfPwLQe78icc
X-Google-Smtp-Source: AAOMgpdKWPFvN+chAT6vV8rX9bRKKis49S2BSfDD58vvTyv3+eUBaW0OUScniVibcuFiqJK57M2dyw==
X-Received: by 2002:a65:538e:: with SMTP id
	x14-v6mr16658555pgq.388.1532963280613; 
	Mon, 30 Jul 2018 08:08:00 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:f98c:c6a6:efae:e2fe?
	([2601:202:4180:c33:f98c:c6a6:efae:e2fe])
	by smtp.gmail.com with ESMTPSA id
	c142-v6sm15804027pfb.62.2018.07.30.08.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jul 2018 08:07:59 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1532882465-3210-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spEi6G+gJMo1Wd-EpaY=-+KokOBcKjgjQp8ND7WOipwhg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <bb053f36-0099-802b-b891-9302c6e90cbe@gmail.com>
Date: Mon, 30 Jul 2018 08:07:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spEi6G+gJMo1Wd-EpaY=-+KokOBcKjgjQp8ND7WOipwhg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][v3][PATCH] wireshark: update to 2.6.2
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
X-List-Received-Date: Mon, 30 Jul 2018 15:07:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 07/29/2018 02:50 PM, Khem Raj wrote:
> Can you also validate if it’s building ok on musl

Sure. any particular arch ? I have arm, arm64 and mips64  boards at home
plus the normal qemu ones.

>
> On Sun, Jul 29, 2018 at 9:41 AM Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     [v3]
>     Get  wireshark-gtk building again
>     split tshark, wireshark-gtk into their own pkgs
>
>     [v2]
>     Fix native build, lemon is the only one needed natively
>
>     [v1]
>     includes security fixes:
>
>     wnpa-sec-2018-34 BGP dissector large loop. Bug 13741. CVE-2018-14342.
>     wnpa-sec-2018-35 ISMP dissector crash. Bug 14672. CVE-2018-14344.
>     wnpa-sec-2018-36 Multiple dissectors could crash. Bug 14675.
>     CVE-2018-14340.
>     wnpa-sec-2018-37 ASN.1 BER dissector crash. Bug 14682. CVE-2018-14343.
>     wnpa-sec-2018-38 MMSE dissector infinite loop. Bug 14738.
>     CVE-2018-14339.
>     wnpa-sec-2018-39 DICOM dissector crash. Bug 14742. CVE-2018-14341.
>     wnpa-sec-2018-40 Bazaar dissector infinite loop. Bug 14841.
>     CVE-2018-14368.
>     wnpa-sec-2018-41 HTTP2 dissector crash. Bug 14869. CVE-2018-14369.
>     wnpa-sec-2018-42 CoAP dissector crash. Bug 14966. CVE-2018-14367.
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      .../{wireshark_2.6.1.bb <http://wireshark_2.6.1.bb> =>
>     wireshark_2.6.2.bb <http://wireshark_2.6.2.bb>}     | 34
>     +++++++++++++++-------
>      1 file changed, 24 insertions(+), 10 deletions(-)
>      rename
>     meta-networking/recipes-support/wireshark/{wireshark_2.6.1.bb
>     <http://wireshark_2.6.1.bb> => wireshark_2.6.2.bb
>     <http://wireshark_2.6.2.bb>} (70%)
>
>     diff --git
>     a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
>     <http://wireshark_2.6.1.bb>
>     b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
>     <http://wireshark_2.6.2.bb>
>     similarity index 70%
>     rename from
>     meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
>     <http://wireshark_2.6.1.bb>
>     rename to
>     meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
>     <http://wireshark_2.6.2.bb>
>     index 91c5e96..1735ae7 100644
>     --- a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
>     <http://wireshark_2.6.1.bb>
>     +++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
>     <http://wireshark_2.6.2.bb>
>     @@ -14,8 +14,8 @@ SRC_URI =
>     "https://1.as.dl.wireshark.org/src/${BP}.tar.xz
>     <https://1.as.dl.wireshark.org/src/$%7BBP%7D.tar.xz> \
>
>      UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>
>     -SRC_URI[md5sum] = "b0e9e5fe22e96d9fdfad18f750fa8f55"
>     -SRC_URI[sha256sum] =
>     "ab6e5bbc3464c956347b8671ce8397950ad5daff3bf9964c967d495f4ddbcd88"
>     +SRC_URI[md5sum] = "086d235509717190d06554b2ab870209"
>     +SRC_URI[sha256sum] =
>     "49b2895ee3ba17ef9ef0aebfdc4d32a778e0f36ccadde184516557d5f3357094"
>
>      PE = "1"
>
>     @@ -23,8 +23,11 @@ inherit cmake pkgconfig pythonnative perlnative
>     upstream-version-is-even
>
>      ARM_INSTRUCTION_SET = "arm"
>
>     +# Options: gtk+, gtk+3 and qt5
>     +GTK = "gtk+3"
>     +
>      PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
>     -PACKAGECONFIG_append_class-target = "
>     ${@bb.utils.contains("DISTRO_FEATURES", "x11", " gtk3 graphics ",
>     "", d)}"
>     +PACKAGECONFIG_append_class-target = "
>     ${@bb.utils.contains("DISTRO_FEATURES", "x11", " ${GTK}", "", d)}"
>
>      PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"
>
>     @@ -33,10 +36,8 @@ PACKAGECONFIG[libpcap] =
>     "-DENABLE_PCAP=ON,-DENABLE_PCAP=OFF -DENABLE_PCAP_NG_DE
>      PACKAGECONFIG[libsmi] = "-DENABLE_SMI=ON,-DENABLE_SMI=OFF,libsmi"
>      PACKAGECONFIG[libnl] = ",,libnl"
>      PACKAGECONFIG[portaudio] =
>     "-DENABLE_PORTAUDIO=ON,-DENABLE_PORTAUDIO=OFF, portaudio-v19"
>     -PACKAGECONFIG[gtk2] = "-DENABLE_GTK=ON,-DENABLE_GTK=OFF, gtk+"
>     -PACKAGECONFIG[gtk3] = "-DENABLE_GTK3=ON,-DENABLE_GTK3=OFF, gtk+3"
>     -PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF
>     -DBUILD_wireshark=OFF, qtbase"
>     -PACKAGECONFIG[graphics] = ",-DENABLE_GTK=OFF,"
>     +PACKAGECONFIG[gtk+] = "-DENABLE_GTK=ON -DBUILD_wireshark_gtk=ON,
>     -DENABLE_GTK=OFF, gtk+"
>     +PACKAGECONFIG[gtk+3] = "-DENABLE_GTK3=ON
>     -DBUILD_wireshark_gtk=ON, -DENABLE_GTK3=OFF, gtk+3"
>      PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF,
>     gnutls"
>      PACKAGECONFIG[ssl] = ",,openssl"
>      PACKAGECONFIG[krb5] = "-DENABLE_KRB5=ON,-DENABLE_KRB5=OFF, krb5"
>     @@ -50,9 +51,9 @@ PACKAGECONFIG[lz4] =
>     "-DENABLE_LZ4=ON,-DENABLE_LZ4=OFF, lz4"
>
>      # these next two options require addional layers
>      PACKAGECONFIG[c-ares] = "-DENABLE_CARES=ON,-DENABLE_CARES=OFF,
>     c-ares"
>     +PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON,
>     -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qtbase"
>
>     -EXTRA_OECMAKE += "-DBUILD_wireshark=ON \
>     -                  -DENABLE_NETLINK=ON \
>     +EXTRA_OECMAKE += "-DENABLE_NETLINK=ON \
>                        -DBUILD_mmdbresolve=OFF \
>                        -DBUILD_randpktdump=OFF \
>                        -DBUILD_androiddump=OFF \
>     @@ -60,9 +61,11 @@ EXTRA_OECMAKE += "-DBUILD_wireshark=ON \
>                        -DM_INCLUDE_DIR=${includedir} \
>                        -DM_LIBRARY=${libdir} \
>                       "
>     +CFLAGS_append = " -lm"
>     +
>      do_install_append_class-native() {
>             install -d ${D}${bindir}
>     -       for f in make-dissectors lemon make-taps
>     +       for f in lemon
>             do
>                     install -m 0755 ${B}/run/$f ${D}${bindir}
>             done
>     @@ -75,6 +78,17 @@ do_install_append_class-target() {
>             done
>      }
>
>     +PACKAGE_BEFORE_PN += "tshark"
>     +PACKAGE_BEFORE_PN += "${PN}-gtk"
>     +
>     +FILES_tshark = "${bindir}/tshark ${mandir}/man1/tshark.*"
>     +FILES_${PN}-gtk = "${bindir}/wireshark-gtk ${datadir}/icons
>     ${datadir}/appdata \
>     +                   ${datadir}/applications ${datadir}/wireshark
>     ${datadir}/mime \
>     +                   ${mandir}/man1/wireshark.* "
>     +
>      FILES_${PN} += "${datadir}*"
>
>     +RDEPENDS_tshark = "wireshark"
>     +RDEPENDS_${PN}-gtk = "${@bb.utils.contains("DISTRO_FEATURES",
>     "x11", "${GTK}", "", d)} wireshark"
>     +
>      BBCLASSEXTEND = "native"
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


