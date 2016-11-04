Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6C79371B01
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 05:49:15 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a136so6902023pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 22:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=KOxZE/9KNErbk8uZzftJZ6NeMcg8dKBzQw+pU503xw0=;
	b=aH16MNx22w1/6pc88KgmmMODHwfMB2OEk209i2kGLzM6CIe0V5ktQTFPoHbJzAjfaN
	AhVUFlB4t/UbyDLEcc05b6xZB5VRRc/CoxI2DFGyMMntGNh8pWsSzGmV4tPBOwKoArVf
	mxq/npnAR9AXhRliYH+vUWvoB3HI1AIWUuzjOcFqGVnkdD5L0x3rVI67Mi/1h/HGQ31i
	Ko3aHRHrnGxOhTbgnN3Yxf7jUp6f6J/xmkUaoo6KN9RbszoiM27Eu3SIX4I0IAdoGSeA
	SKTFOopiJhlLq5FU4vK+TSuctwTQLVxfrxhIcZlakrdKYp5QgmlXsr/cvhaRhjktgTYT
	XqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=KOxZE/9KNErbk8uZzftJZ6NeMcg8dKBzQw+pU503xw0=;
	b=WJzcA5j0W72Qw2vP2nV8TUZN1w+6O1HJQbys57vsYRJ36g62a0W5Gnrey5tUz7ERkq
	TOg1YO1FylFgkgkfjDuubmOSS7gyazzvcdToaECj07VUGW0xCsSL56XmxsXv2jK+KBZE
	c9wMJkCafMoiYCycohAdx07s/OcEKkICE5eJIBLMxy7XSwH/V3gAVXcdqlabP4dn1N32
	YVhFqnhyNMe+ECC0HpuvHjrM2CmUhLm7UpDpTg8S0GHAP/s4jMay2nPyAFE49qipeDji
	PCAeSWdlE9Nn6xMUgdSUHFtMHLJfSpxva2t/C4b0P/iWkJ7h5DdeE453dqMWW17GPlMo
	/Yfg==
X-Gm-Message-State: ABUngvcciH9Xlp73ykvrLNiMvfqAq1JZ4JgaM33qtZmb/bf99kyEgWLkedVFbnc8r4PGBg==
X-Received: by 10.98.28.79 with SMTP id c76mr23513272pfc.8.1478238557511;
	Thu, 03 Nov 2016 22:49:17 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:3d81:a694:3206:326e?
	([2601:202:4001:9ea0:3d81:a694:3206:326e])
	by smtp.gmail.com with ESMTPSA id
	f129sm16844001pfc.3.2016.11.03.22.49.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 22:49:17 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1477886266-2836-1-git-send-email-akuster808@gmail.com>
	<20161101180418.GC2985@jama> <20161103212705.GA3003@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <c8049c8c-69ac-08fd-0614-d47e93a3b254@gmail.com>
Date: Thu, 3 Nov 2016 22:49:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161103212705.GA3003@jama>
Subject: Re: [meta-networking][V2]PATCH] wireshark: install missing header files
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
X-List-Received-Date: Fri, 04 Nov 2016 05:49:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/03/2016 02:38 PM, Martin Jansa wrote:
> On Tue, Nov 01, 2016 at 07:04:18PM +0100, Martin Jansa wrote:
>> On Sun, Oct 30, 2016 at 08:57:46PM -0700, Armin Kuster wrote:
>>> Wireshark does not install header files. add install_append
>>> Remove ALLOW_EMPTY & INHIBIT_PACKAGE_DEBUG_SPLIT, they are no longer needed
>>>
>>> V2]
>>> add missing libssh and sbc config
>>>
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>   .../recipes-support/wireshark/wireshark_2.2.1.bb   | 28 ++++++++++++++++++----
>>>   1 file changed, 24 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
>>> index a5fb7f6..4e23bae 100644
>>> --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
>>> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
>>> @@ -4,7 +4,7 @@ SECTION = "net"
>>>   LICENSE = "GPL-2.0"
>>>   LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
>>>   
>>> -DEPENDS = "pcre expat glib-2.0 sbc"
>>> +DEPENDS = "pcre expat glib-2.0"
>>>   
>>>   SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
>>>   
>>> @@ -37,13 +37,33 @@ PACKAGECONFIG[lua] = "--with-lua=yes, --with-lua=no, lua"
>>>   PACKAGECONFIG[zlib] = "--with-zlib=yes, --with-zlib=no, zlib"
>>>   PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
>>>   PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
>>> +PACKAGECONFIG[sbc] = "--with-sbc=yes, --with-sbc=no, sbc"
>>> +
>>> +PACKAGECONFIG[libssh] = "--with-ssh=yes, --with-ssh=no, libssh2"
>>> +
>>>   
>>>   # these next two options require addional layers
>>>   PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
>>>   
>>>   EXTRA_OECONF += "--with-qt=no --enable-tshark --enable-rawshark"
>>>   
>>> -ALLOW_EMPTY_${PN} = "1"
>>> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>> +# Currently wireshark does not install header files
>>> +do_install_append () {
>>> +
>>> +	install -d ${D}/${includedir}/${BPN}
>>> +	install -d ${D}/${includedir}/${BPN}/epan
>>> +	install -d ${D}/${includedir}/${BPN}/epan/crypt
>>> +	install -d ${D}/${includedir}/${BPN}/epan/dfilter
>>> +	install -d ${D}/${includedir}/${BPN}/epan/dissectors
>>> +	install -d ${D}/${includedir}/${BPN}/epan/ftypes
>>> +	install -d ${D}/${includedir}/${BPN}/epan/wmem
>>>   
>>> -FILES_${PN} += "${datadir}*"
>> Doesn't this still cause many unpackaged files and QA errors as reported
>> earlier?
> It does and sbc issue is still there as well:
dang it.  ok. v3 is in order.

- armin
>
> wireshark-2.2.1: wireshark: Files/directories were installed but not
> shipped in any package:
>    /usr/share/mime
>    /usr/share/appdata
>    /usr/share/icons
>    /usr/share/mime/packages
>    /usr/share/mime/packages/wireshark.xml
>    /usr/share/appdata/wireshark.appdata.xml
>    /usr/share/icons/hicolor
>    /usr/share/icons/hicolor/16x16
>    /usr/share/icons/hicolor/24x24
>    /usr/share/icons/hicolor/32x32
>    /usr/share/icons/hicolor/48x48
>    /usr/share/icons/hicolor/64x64
>    /usr/share/icons/hicolor/128x128
>    /usr/share/icons/hicolor/256x256
>    /usr/share/icons/hicolor/scalable
>    /usr/share/icons/hicolor/16x16/apps
>    /usr/share/icons/hicolor/16x16/mimetypes
>    /usr/share/icons/hicolor/16x16/apps/wireshark.png
>    /usr/share/icons/hicolor/16x16/mimetypes/application-wireshark-doc.png
>    /usr/share/icons/hicolor/24x24/apps
>    /usr/share/icons/hicolor/24x24/mimetypes
>    /usr/share/icons/hicolor/24x24/apps/wireshark.png
>    /usr/share/icons/hicolor/24x24/mimetypes/application-wireshark-doc.png
>    /usr/share/icons/hicolor/32x32/apps
>    /usr/share/icons/hicolor/32x32/mimetypes
>    /usr/share/icons/hicolor/32x32/apps/wireshark.png
>    /usr/share/icons/hicolor/32x32/mimetypes/application-wireshark-doc.png
>    /usr/share/icons/hicolor/48x48/apps
>    /usr/share/icons/hicolor/48x48/mimetypes
>    /usr/share/icons/hicolor/48x48/apps/wireshark.png
>    /usr/share/icons/hicolor/48x48/mimetypes/application-wireshark-doc.png
>    /usr/share/icons/hicolor/64x64/apps
>    /usr/share/icons/hicolor/64x64/mimetypes
>    /usr/share/icons/hicolor/64x64/apps/wireshark.png
>    /usr/share/icons/hicolor/64x64/mimetypes/application-wireshark-doc.png
>    /usr/share/icons/hicolor/128x128/apps
>    /usr/share/icons/hicolor/128x128/mimetypes
>    /usr/share/icons/hicolor/128x128/apps/wireshark.png
>    /usr/share/icons/hicolor/128x128/mimetypes/application-wireshark-doc.png
>    /usr/share/icons/hicolor/256x256/apps
>    /usr/share/icons/hicolor/256x256/mimetypes
>    /usr/share/icons/hicolor/256x256/apps/wireshark.png
>    /usr/share/icons/hicolor/256x256/mimetypes/application-wireshark-doc.png
>    /usr/share/icons/hicolor/scalable/apps
>    /usr/share/icons/hicolor/scalable/apps/wireshark.svg
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
> wireshark: 45 installed and not shipped files. [installed-vs-shipped]
> wireshark-2.2.1: wireshark rdepends on sbc, but it isn't a build
> dependency, missing sbc in DEPENDS or PACKAGECONFIG? [build-deps]
>
>>> +	install config.h ${D}/${includedir}/${BPN}
>>> +	install ${S}/register.h ${D}/${includedir}/${BPN}
>>> +	install -D ${S}/epan/*.h ${D}/${includedir}/${BPN}/epan
>>> +	install -D ${S}/epan/crypt/*.h ${D}/${includedir}/${BPN}/epan/crypt
>>> +	install -D ${S}/epan/dfilter/*.h ${D}/${includedir}/${BPN}/epan/dfilter
>>> +	install -D ${S}/epan/dissectors/*.h ${D}/${includedir}/${BPN}/epan/dissectors
>>> +	install -D ${S}/epan/ftypes/*.h ${D}/${includedir}/${BPN}/epan/ftypes
>>> +	install -D ${S}/epan/wmem/*.h ${D}/${includedir}/${BPN}/epan/wmem
>>> +}
>>> -- 
>>> 2.7.4
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> -- 
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>


