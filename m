Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7E265E2B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:12:31 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id fp1so9393840pdb.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 08:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=54wQsojVrzJ4AzSe+osjM+tOOHE/TN0cFk3TQxG2wKA=;
	b=cGY9GtrumbC1tAzUVe9NjI56CIaCEc08lppPwvtSkNIiOzvIEyjO7tjs7kusCRAPQN
	yJefSMxggXhMGSZBG744efFoQAJDv7y1kWongrAyKjuaKDxCkVTlEaTiMSn81cDRwh1R
	nojPHUIdmew+kmilgqnuJlbsbUWr4q4tXBUoRQO2s9vUvO2lzz8O/7PgXuDrIGC/9TdY
	bhWPnL+fKQA3Qsy/WWWru0gVmcwYScKIvJlvX1PYdJFWd+pZqUXXz/DlfDaUWbkUrAdh
	oPori9OqgHOvJTg7xqLYhFCsv+jO0qVrrrhCskvMNyjZI4VvgDj6q3mVnV302q5fQTzq
	uqSg==
X-Gm-Message-State: ALoCoQnYsvxnH7qlj0KULMyhqX9G7u18QL+yqBIW6AuvX+cSd8xWOXHLYPcx98+9O8VCILXWA0JL
X-Received: by 10.70.119.2 with SMTP id kq2mr18395952pdb.66.1405955552399;
	Mon, 21 Jul 2014 08:12:32 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	mn2sm14479979pbc.64.2014.07.21.08.12.30 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jul 2014 08:12:31 -0700 (PDT)
Message-ID: <53CD2DDD.4070807@mvista.com>
Date: Mon, 21 Jul 2014 08:12:29 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1405887685-12673-1-git-send-email-akuster@mvista.com>	<20140720214452.GF22875@jama>
	<20140721110145.GJ22875@jama>
In-Reply-To: <20140721110145.GJ22875@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] v2] wireshark: Add recipe 1.12.0-rc2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jul 2014 15:12:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Martin,

There is a bug opened on wireshark #10209 which just got fixed. I will 
pull in the patch soon.

- Armin

On 07/21/2014 04:01 AM, Martin Jansa wrote:
> On Sun, Jul 20, 2014 at 11:44:52PM +0200, Martin Jansa wrote:
>> On Sun, Jul 20, 2014 at 01:21:25PM -0700, Armin Kuster wrote:
>>> Inital wireshark support on gtk+
>>> Added gtk3.
>>> Cleaned up PACKAGECONFIG options
>>> README with additional info
>>
>> RP submitted few fixes for this change, can you please check wireshark
>> in master-next and send just follow-up patch or comment on fixes RP did?
>
> Also world builds are failing with:
>
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/wireshark/1.12.0-rc2-r0/wireshark-1.12.0-rc2/epan/expert.c: In function 'expert_add_info':
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/wireshark/1.12.0-rc2-r0/wireshark-1.12.0-rc2/epan/expert.c:392:2: error: incompatible type for argument 8 of 'expert_set_info_vformat'
> |   expert_set_info_vformat(pinfo, pi, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, NULL);
> |   ^
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/wireshark/1.12.0-rc2-r0/wireshark-1.12.0-rc2/epan/expert.c:299:1: note: expected 'va_list' but argument is of type 'void *'
> |  expert_set_info_vformat(packet_info *pinfo, proto_item *pi, int group, int severity, int hf_index, gboolean use_vaformat,
> |  ^
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/wireshark/1.12.0-rc2-r0/wireshark-1.12.0-rc2/epan/expert.c: In function 'proto_tree_add_expert':
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/wireshark/1.12.0-rc2-r0/wireshark-1.12.0-rc2/epan/expert.c:420:2: error: incompatible type for argument 8 of 'expert_set_info_vformat'
> |   expert_set_info_vformat(pinfo, ti, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, NULL);
> |   ^
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/wireshark/1.12.0-rc2-r0/wireshark-1.12.0-rc2/epan/expert.c:299:1: note: expected 'va_list' but argument is of type 'void *'
> |  expert_set_info_vformat(packet_info *pinfo, proto_item *pi, int group, int severity, int hf_index, gboolean use_vaformat,
> |  ^
> | make[3]: *** [libwireshark_la-expert.lo] Error 1
>
> was it fixed in v2?
>
>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> ---
>>>   meta-networking/recipes-support/wireshark/README   | 37 +++++++++++++++++++
>>>   .../wireshark/wireshark_1.12.0-rc2.bb              | 42 ++++++++++++++++++++++
>>>   2 files changed, 79 insertions(+)
>>>   create mode 100644 meta-networking/recipes-support/wireshark/README
>>>   create mode 100644 meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
>>>
>>> diff --git a/meta-networking/recipes-support/wireshark/README b/meta-networking/recipes-support/wireshark/README
>>> new file mode 100644
>>> index 0000000..0e0c526
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-support/wireshark/README
>>> @@ -0,0 +1,37 @@
>>> +#
>>> +Wireshark - Notes
>>> +
>>> +URL: http://www.wireshark.org/
>>> +User Guide: http://www.wireshark.org/docs/wsug_html_chunked/
>>> +Secruity advisories: http://www.wireshark.org/security/
>>> +
>>> +Wireshark is slowly moving away from gtk and towards QT as their graphical stack.
>>> +Currently gtk is supported with this release and I plan on integrating QT.
>>> +
>>> +
>>> +
>>> +Adding the wireshark to your build
>>> +========================================
>>> +
>>> +via local.conf
>>> +IMAGE_INSTALL_append = " wireshark"
>>> +
>>> +Adding the wireshark to your graphical build
>>> +========================================
>>> +via local.conf
>>> +EXTRA_IMAGE_FEATURES += "x11-base"
>>> +
>>> +or use the "core-image-x11"
>>> +
>>> +
>>> +Maintenance
>>> +-----------
>>> +
>>> +Send patches, comments or questions to openembedded-devel@lists.openembedded.org
>>> +
>>> +When sending single patches, please using something like:
>>> +'git send-email -1 --to  openembedded-devel@lists.openembedded.org --cc akuster@mvista.com --subject-prefix=meta-security][PATCH'
>>> +
>>> +Maintainer:    Armin Kuster <akuster@mvista.com>
>>> +
>>> +
>>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
>>> new file mode 100644
>>> index 0000000..6860419
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
>>> @@ -0,0 +1,42 @@
>>> +DESCRIPTION = "wireshark - a popular network protocol analyzer"
>>> +HOMEPAGE = "http://www.wireshark.org"
>>> +SECTION = "network"
>>> +LICENSE = "GPL-2.0"
>>> +
>>> +DEPENDS = "perl-native libpcap pcre expat glib-2.0 libsmi"
>>> +
>>> +inherit autotools
>>> +
>>> +ARM_INSTRUCTION_SET = "arm"
>>> +
>>> +# Works with either gtk+ or gtk3.
>>> +WHICH_GTK = "gtk3"
>>> +
>>> +PACKAGECONFIG ??= "gnutls gcrypt"
>>> +PACKAGECONFIG += " ${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "${WHICH_GTK}  graphics", "", d)}"
>>> +
>>> +PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
>>> +
>>> +PACKAGECONFIG[gtk2] = "--with-gtk2=yes, --with-gtk2=no, gtk+"
>>> +PACKAGECONFIG[gtk3] = "--with-gtk3=yes, --with-gtk3=no, gtk+3"
>>> +PACKAGECONFIG[graphics] = "--enable-wireshark, --disable-wireshark,"
>>> +PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
>>> +PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
>>> +PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
>>> +
>>> +EXTRA_OECONF = "--with-qt=no --enable-usr-local=no -enable-tshark"
>>> +
>>> +LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
>>> +SRC_URI = "http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2.tar.bz2 "
>>> +
>>> +SRC_URI[md5sum] = "dc1149073066a29f91116c168558262e"
>>> +SRC_URI[sha256sum]= "31009bb450126e9b12808267419f31016d14e6fde7b5e39c85ad37459908cffb"
>>> +
>>> +do_configure_prepend() {
>>> +    # force to use fallback
>>> +    sed -i -e '/^glib_prefix/s/=.*$/=""/' ${S}/aclocal-flags
>>> +}
>>> +
>>> +ALLOW_EMPTY_${PN} = "1"
>>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>> +
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
>
>

