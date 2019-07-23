Return-Path: <ayoub.zaki@embexus.com>
Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com
	(mailrelay4-3.pub.mailoutpod1-cph3.one.com [46.30.212.13])
	by mail.openembedded.org (Postfix) with ESMTP id 15CB27D58A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 10:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20140924;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	message-id:from:references:cc:to:subject:from;
	bh=c5ZqtvWbLGHMAmz+OT/+yJS/1br65gG6zIqForBPay0=;
	b=QQYW1WcEPhJnYsNDIfWWwq/DR8MBy3HN7VHKSBEzdn+ocZNC1uyG0cL3+Fq284oj1d/bCzyPUuXrg
	aW2e1Vw+cAtwksspRDomg7f9PszhGy4il2MrnBf+uox84QG7HAvs9rKsX0MLKtVKNPSmXy4HfHFrw1
	gOlcpUcmhtwaikec=
X-HalOne-Cookie: e413b4a7abd73aafb6facb71465faf6c92bff3cf
X-HalOne-ID: 6f31c4ea-ad33-11e9-8280-d0431ea8bb10
Received: from [10.40.86.158] (unknown [193.240.242.3])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 6f31c4ea-ad33-11e9-8280-d0431ea8bb10;
	Tue, 23 Jul 2019 10:20:03 +0000 (UTC)
To: Khem Raj <raj.khem@gmail.com>
References: <20190721185137.27323-1-ayoub.zaki@embexus.com>
	<20190721185137.27323-2-ayoub.zaki@embexus.com>
	<CAMKF1soc=iL9HotW4WDdkHLDS_10b2zWOGaOCN7FswcK_M7y2g@mail.gmail.com>
From: Ayoub Zaki <ayoub.zaki@embexus.com>
Organization: Embexus
Message-ID: <f2096ec3-e4b4-e0d9-f543-5b5cbd895d5b@embexus.com>
Date: Tue, 23 Jul 2019 12:20:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soc=iL9HotW4WDdkHLDS_10b2zWOGaOCN7FswcK_M7y2g@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 2/2] usbguard: Initial recipe
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
X-List-Received-Date: Tue, 23 Jul 2019 10:20:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem,


On 22.07.19 09:41, Khem Raj wrote:
> it seems to be using recipes from other layers see
>
> ERROR: Nothing PROVIDES 'libseccomp' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> DEPENDS on or otherwise requires it). Close matches:
>    libcomps
> ERROR: Nothing RPROVIDES 'usbguard-dev' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'usbguard-dev'
> NOTE: Runtime target 'usbguard-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['usbguard-dev']
> ERROR: Nothing RPROVIDES 'usbguard' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'usbguard'
> NOTE: Runtime target 'usbguard' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['usbguard']
>
> I would prefer it to be a packageconfig and disabled by default so it
> can build without libseccomp


Right libseccomp is provided by meta-security layer, it is not a 
required dependency, I will remove it and send a new patch.

>
> On Sun, Jul 21, 2019 at 11:51 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>> Introduce the USBGuard software framework that helps to protect against rogue USB devices (a.k.a. BadUSB)
>> by implementing basic whitelisting and blacklisting capabilities based on device attributes.
>> ---
>>   .../usbguard/usbguard_0.7.4.bb                | 37 +++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>   create mode 100644 meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
>>
>> diff --git a/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
>> new file mode 100644
>> index 000000000..eee381fbe
>> --- /dev/null
>> +++ b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
>> @@ -0,0 +1,37 @@
>> +DESCRIPTION="USBGuard framework helps to protect against BadUSB."
>> +HOMEPAGE="https://github.com/dkopecek/usbguard"
>> +LICENSE="GPLv2"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
>> +
>> +SRC_URI="https://github.com/USBGuard/usbguard/archive/${BP}.tar.gz"
>> +SRC_URI[md5sum] = "ddaa9ae884200c861ad946f34dfd5ab9"
>> +SRC_URI[sha256sum] = "d37886508583565aae0df6a110b11524c59b39e0deb25ee49fc34274e4784f55"
>> +
>> +inherit autotools pkgconfig systemd bash-completion
>> +
>> +S= "${WORKDIR}/${BPN}-${BP}"
>> +
>> +DEPENDS = "protobuf-native libxml2-native libxslt-native xmlto-native glib-2.0-native \
>> +       dbus dbus-glib libqb libseccomp libcap-ng libgcrypt libsodium protobuf pegtl"
>> +
>> +EXTRA_OECONF += "--with-bundled-catch"
>> +
>> +PACKAGECONFIG ??= "libsodium \
>> +       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>> +       ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
>> +
>> +PACKAGECONFIG[systemd]   = "--enable-systemd,--disable-systemd"
>> +PACKAGECONFIG[libsodium] = "--with-crypto-library=sodium"
>> +PACKAGECONFIG[libgcrypt] = "--with-crypto-library=gcrypt"
>> +PACKAGECONFIG[polkit]    = "--with-polkit,--without-polkit"
>> +PACKAGECONFIG[dbus]      = "--with-dbus,--without-dbus"
>> +
>> +SYSTEMD_SERVICE_${PN} = "${PN}.service"
>> +SYSTEMD_PACKAGES += "${PN}"
>> +
>> +
>> +do_install_append(){
>> +
>> +       sed -i 's|/var/log/usbguard/usbguard-audit.log|/var/log/usbguard-audit.log|g' \
>> +                                               ${D}${sysconfdir}/usbguard/usbguard-daemon.conf
>> +}
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    : ayoub.zaki@embexus.com
Homepage : https://embexus.com
VAT No.  : DE313902634


