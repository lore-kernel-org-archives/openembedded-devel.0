Return-Path: <ayoub.zaki@embexus.com>
Received: from mailrelay2-3.pub.mailoutpod1-cph3.one.com
	(mailrelay2-3.pub.mailoutpod1-cph3.one.com [46.30.212.11])
	by mail.openembedded.org (Postfix) with ESMTP id 052A67EED4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 18:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20140924;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	message-id:from:references:to:subject:from;
	bh=PXJp4pAF7r6UYBnSAuTDA4sJwsl07sCmKB86e7WO4/I=;
	b=BDkoF8KbejjEIOebd7DCzblkY4bGwjxsyKpPOMlCKkeI/29l4wcSuJZSunwNKNjDD55xGy08yPBid
	/SYlgr3gaLUl7uV5Wxy4KhVfM+Xnbjc8qaoS6uU5vFNHHYd39aLiRcUkPjMc2+z14thg2UVaSj7e/F
	44EXAgzbgwX83uBI=
X-HalOne-Cookie: 2836d345f2059eb904835820f0d521fd5699a404
X-HalOne-ID: 7362e99f-abe7-11e9-b9fd-d0431ea8a290
Received: from [192.168.178.41] (unknown [77.181.243.113])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 7362e99f-abe7-11e9-b9fd-d0431ea8a290;
	Sun, 21 Jul 2019 18:43:37 +0000 (UTC)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20190721180605.5356-1-ayoub.zaki@embexus.com>
	<20190721180605.5356-2-ayoub.zaki@embexus.com>
	<5fca05d2-5fd6-bd45-323c-47afc56e1c91@gmail.com>
From: Ayoub Zaki <ayoub.zaki@embexus.com>
Organization: Embexus
Message-ID: <99ee5a9c-bdac-32c1-08e6-6d99a7c94094@embexus.com>
Date: Sun, 21 Jul 2019 20:43:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5fca05d2-5fd6-bd45-323c-47afc56e1c91@gmail.com>
Subject: Re: [meta-oe][PATCH 2/2] usbguard: Initial recipe
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
X-List-Received-Date: Sun, 21 Jul 2019 18:43:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

On 21.07.19 20:27, Khem Raj wrote:
>
> On 7/21/19 11:06 AM, Ayoub Zaki wrote:
>> Introduce the USBGuard software framework that helps to protect 
>> against rogue USB devices (a.k.a. BadUSB)
>> by implementing basic whitelisting and blacklisting capabilities 
>> based on device attributes.
>>
>> Signed-off-by: Ayoub Zaki <ayoub.zaki@embexus.com>
>> ---
>>   .../usbguard/usbguard_0.7.4.bb                | 37 +++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>   create mode 100644 meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
>>
>> diff --git a/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb 
>> b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
>> new file mode 100644
>> index 000000000..a77694cc3
>> --- /dev/null
>> +++ b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
>> @@ -0,0 +1,37 @@
>> +DESCRIPTION="USBGuard framework helps to protect against BadUSB."
>> +HOMEPAGE="https://github.com/dkopecek/usbguard"
>> +LICENSE="GPLv2"
>> +LIC_FILES_CHKSUM = 
>> "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
>> +
>> +SRC_URI="https://github.com/USBGuard/usbguard/archive/${PN}-${PV}.tar.gz" 
>>
>
> Its better to use BP instead of PN-PV do it will work with multilib as 
> well


Okay.

>
>> +SRC_URI[md5sum] = "ddaa9ae884200c861ad946f34dfd5ab9"
>> +SRC_URI[sha256sum] = 
>> "d37886508583565aae0df6a110b11524c59b39e0deb25ee49fc34274e4784f55"
>> +
>> +inherit autotools pkgconfig systemd bash-completion
>> +
>> +S= "${WORKDIR}/${PN}-${PN}-${PV}"
>
> this should also be ${BPN}-${BP}


I'll fix that and resend a v2.


Thanks!


>
>> +
>> +DEPENDS = "protobuf-native libxml2-native libxslt-native 
>> xmlto-native glib-2.0-native \
>> +    dbus dbus-glib libqb libseccomp libcap-ng libgcrypt libsodium 
>> protobuf pegtl"
>> +
>> +EXTRA_OECONF += "--with-bundled-catch"
>> +
>> +PACKAGECONFIG ??= "libsodium \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
>> +
>> +PACKAGECONFIG[systemd]   = "--enable-systemd,--disable-systemd"
>> +PACKAGECONFIG[libsodium] = "--with-crypto-library=sodium"
>> +PACKAGECONFIG[libgcrypt] = "--with-crypto-library=gcrypt"
>> +PACKAGECONFIG[polkit]    = "--with-polkit,--without-polkit"
>> +PACKAGECONFIG[dbus]      = "--with-dbus,--without-dbus"
>> +
>> +SYSTEMD_SERVICE_${PN} = "${PN}.service"
>> +SYSTEMD_PACKAGES += "${PN}"
>> +
>> +
>> +do_install_append(){
>> +
>> +    sed -i 
>> 's|/var/log/usbguard/usbguard-audit.log|/var/log/usbguard-audit.log|g' \
>> + ${D}${sysconfdir}/usbguard/usbguard-daemon.conf
>> +}

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


