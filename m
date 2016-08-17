Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3247321C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 06:50:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7H6oHxr015001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 23:50:18 -0700
Received: from [128.224.162.178] (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 16 Aug 2016 23:50:15 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1471399586-685-1-git-send-email-yi.zhao@windriver.com>
	<EBA0587A-DC61-44EA-B7D9-E3C2C26F8B77@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <726d7443-c0fe-aada-0c99-d1e54263c234@windriver.com>
Date: Wed, 17 Aug 2016 14:50:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <EBA0587A-DC61-44EA-B7D9-E3C2C26F8B77@gmail.com>
X-Originating-IP: [128.224.162.178]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.0.5
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
X-List-Received-Date: Wed, 17 Aug 2016 06:50:18 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2016年08月17日 10:09, Khem Raj 写道:
>> On Aug 16, 2016, at 7:06 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
>>
>> The following vulnerabilities have been fixed:
>>     * [1]wnpa-sec-2016-39
>>       CORBA IDL dissector crash on 64-bit Windows. ([2]Bug 12495)
>>     * [3]wnpa-sec-2016-41
>>       PacketBB crash. ([4]Bug 12577)
>>     * [5]wnpa-sec-2016-42
>>       WSP infinite loop. ([6]Bug 12594)
>>     * [7]wnpa-sec-2016-44
>>       RLC long loop. ([8]Bug 12660)
>>     * [9]wnpa-sec-2016-45
>>       LDSS dissector crash. ([10]Bug 12662)
>>     * [11]wnpa-sec-2016-46
>>       RLC dissector crash. ([12]Bug 12664)
>>     * [13]wnpa-sec-2016-47
>>       OpenFlow long loop. ([14]Bug 12659)
>>     * [15]wnpa-sec-2016-48
>>       MMSE, WAP, WBXML, and WSP infinite loop. ([16]Bug 12661)
>>     * [17]wnpa-sec-2016-49
>>       WBXML crash. ([18]Bug 12663)
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>> .../recipes-support/wireshark/wireshark_2.0.4.bb   | 60 ----------------------
>> .../recipes-support/wireshark/wireshark_2.0.5.bb   | 60 ++++++++++++++++++++++
> for better reviews, please send patches where renames can be detected.
> you can add
>
> [diff]
>          renames = copies
>
> to your ~/.gitconfig

Thanks.  I will re-send v2 patch.

Yi

>> 2 files changed, 60 insertions(+), 60 deletions(-)
>> delete mode 100644 meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
>> create mode 100644 meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
>>
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
>> deleted file mode 100644
>> index d36c3f3..0000000
>> --- a/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
>> +++ /dev/null
>> @@ -1,60 +0,0 @@
>> -DESCRIPTION = "wireshark - a popular network protocol analyzer"
>> -HOMEPAGE = "http://www.wireshark.org"
>> -SECTION = "net"
>> -LICENSE = "GPL-2.0"
>> -LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
>> -
>> -DEPENDS = "pcre expat glib-2.0 sbc"
>> -
>> -SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
>> -
>> -SRC_URI[md5sum] = "622928dc6cb31c227c672ec3ec697f28"
>> -SRC_URI[sha256sum] = "9ea9c82da9942194ebc8fc5c951a02e6d179afa7472cb6d96ca76154510de1a5"
>> -
>> -PE = "1"
>> -
>> -inherit autotools pkgconfig perlnative
>> -
>> -ARM_INSTRUCTION_SET = "arm"
>> -
>> -# Works with either gtk+ or gtk3.
>> -WHICH_GTK = "gtk+"
>> -
>> -PACKAGECONFIG ?= "libpcap gnutls libnl libcap"
>> -PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk2 graphics", "", d)}"
>> -PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
>> -#PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "gtk3", "", d)}"
>> -
>> -PACKAGECONFIG[libcap] = "--with-libcap=${STAGING_LIBDIR}, --with-libcap=no --enable-pcap-ng-default , libcap"
>> -PACKAGECONFIG[libpcap] = "--with-pcap=${STAGING_LIBDIR} --with-pcap-remote, --with-pcap=no --enable-pcap-ng-default  , libpcap"
>> -PACKAGECONFIG[libsmi] = "--with-libsmi=yes, --with-libsmi=no, libsmi"
>> -PACKAGECONFIG[libnl] = "--with-libnl=yes, --with-libnl=no, libnl"
>> -PACKAGECONFIG[portaudio] = "--with-portaudio=yes, --with-portaudio=no, portaudio-v19"
>> -PACKAGECONFIG[gtk2] = "--with-gtk2=yes, --with-gtk2=no, gtk+"
>> -PACKAGECONFIG[gtk3] = "--with-gtk3=yes, --with-gtk3=no, gtk+3"
>> -PACKAGECONFIG[graphics] = "--enable-wireshark, --disable-wireshark,"
>> -PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
>> -PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
>> -PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
>> -PACKAGECONFIG[ssl] = "--with-ssl=yes, --with-ssl=no, openssl"
>> -PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
>> -PACKAGECONFIG[lua] = "--with-lua=yes, --with-lua=no, lua"
>> -PACKAGECONFIG[zlib] = "--with-zlib=yes, --with-zlib=no, zlib"
>> -PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
>> -PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
>> -
>> -# these next two options require addional layers
>> -PACKAGECONFIG[adns] = "--with-adns=yes, --with-adns=no, adns"
>> -PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
>> -
>> -EXTRA_OECONF += "--with-qt=no --enable-usr-local=no --enable-tshark --enable-rawshark"
>> -
>> -do_configure_prepend() {
>> -    # force to use fallback
>> -    sed -i -e '/^glib_prefix/s/=.*$/=""/' ${S}/aclocal-flags
>> -}
>> -
>> -ALLOW_EMPTY_${PN} = "1"
>> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>> -
>> -FILES_${PN} += "${datadir}*"
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
>> new file mode 100644
>> index 0000000..31ca4d2
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
>> @@ -0,0 +1,60 @@
>> +DESCRIPTION = "wireshark - a popular network protocol analyzer"
>> +HOMEPAGE = "http://www.wireshark.org"
>> +SECTION = "net"
>> +LICENSE = "GPL-2.0"
>> +LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
>> +
>> +DEPENDS = "pcre expat glib-2.0 sbc"
>> +
>> +SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
>> +
>> +SRC_URI[md5sum] = "627b5fc6cf0aeca196c75debd5e69b14"
>> +SRC_URI[sha256sum] = "0ce0241330828973f5b4efee422a3760cab8ce0b41e7721c4b9fd185be1bb10b"
>> +
>> +PE = "1"
>> +
>> +inherit autotools pkgconfig perlnative
>> +
>> +ARM_INSTRUCTION_SET = "arm"
>> +
>> +# Works with either gtk+ or gtk3.
>> +WHICH_GTK = "gtk+"
>> +
>> +PACKAGECONFIG ?= "libpcap gnutls libnl libcap"
>> +PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk2 graphics", "", d)}"
>> +PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
>> +#PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "gtk3", "", d)}"
>> +
>> +PACKAGECONFIG[libcap] = "--with-libcap=${STAGING_LIBDIR}, --with-libcap=no --enable-pcap-ng-default , libcap"
>> +PACKAGECONFIG[libpcap] = "--with-pcap=${STAGING_LIBDIR} --with-pcap-remote, --with-pcap=no --enable-pcap-ng-default  , libpcap"
>> +PACKAGECONFIG[libsmi] = "--with-libsmi=yes, --with-libsmi=no, libsmi"
>> +PACKAGECONFIG[libnl] = "--with-libnl=yes, --with-libnl=no, libnl"
>> +PACKAGECONFIG[portaudio] = "--with-portaudio=yes, --with-portaudio=no, portaudio-v19"
>> +PACKAGECONFIG[gtk2] = "--with-gtk2=yes, --with-gtk2=no, gtk+"
>> +PACKAGECONFIG[gtk3] = "--with-gtk3=yes, --with-gtk3=no, gtk+3"
>> +PACKAGECONFIG[graphics] = "--enable-wireshark, --disable-wireshark,"
>> +PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
>> +PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
>> +PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
>> +PACKAGECONFIG[ssl] = "--with-ssl=yes, --with-ssl=no, openssl"
>> +PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
>> +PACKAGECONFIG[lua] = "--with-lua=yes, --with-lua=no, lua"
>> +PACKAGECONFIG[zlib] = "--with-zlib=yes, --with-zlib=no, zlib"
>> +PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
>> +PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
>> +
>> +# these next two options require addional layers
>> +PACKAGECONFIG[adns] = "--with-adns=yes, --with-adns=no, adns"
>> +PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
>> +
>> +EXTRA_OECONF += "--with-qt=no --enable-usr-local=no --enable-tshark --enable-rawshark"
>> +
>> +do_configure_prepend() {
>> +    # force to use fallback
>> +    sed -i -e '/^glib_prefix/s/=.*$/=""/' ${S}/aclocal-flags
>> +}
>> +
>> +ALLOW_EMPTY_${PN} = "1"
>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>> +
>> +FILES_${PN} += "${datadir}*"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


