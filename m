Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2132D7EF4C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:23:45 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id v24so35818978ljg.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 17:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=VnH34QdKba824RdjIRnyRyDdXvHDRfY2IYA7LSaTPbg=;
	b=I38HgD7L3FSQKe0SmD2uyMeXfcn6iukWJZue1mxMe84RLiYe8XwRe8VimZ4H3QRAwM
	DldpXqyR3feKj1DCRBOQL/4aJJUsc1kr5RFYPeRAj6Zymzc+T/GHBuIsFolDoh+yotXr
	wnEC299QocWqWAeE+PZQiKxfz343SW55hIc+bTumGix1HV5wrIlKcQLe0JRaCQn9Tf73
	L/OiwsZLIQZifcfDCF8F0yelyZYi3qpGMuMhrE5jLH+ZbaXDVs2w2nsek7Yqbnd3/qqM
	9bCTieSa/Y9Se8IAjzykKYc476V9CWHvPBAzfl3jULyIVz1Ze02ifKVt/qcuZg1CaVUS
	kBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=VnH34QdKba824RdjIRnyRyDdXvHDRfY2IYA7LSaTPbg=;
	b=rYMcQk6pOynynA5QrHPizlyjOc0hC/qwTE6ugIH2c0lxzzJdxhoQXbcLgIuAMlBPMn
	cdjsdKhcfPQtbMcTA2WoquMNqyT1l3xh66OnlzDDM/uHacTXkFyw1gsXrfXof/sdP3W6
	88iRbC9UkeB0J07Xc3H5QdQt3qgyBn6ZmFI/sPyNnkepmGRdpzyfWSjvtmRc4yNtewrJ
	hF8k+XccACxZAMxKJI5LL91wln1JlO6EEybgYsqeYAAHLuMGHQvefCYQ1QJCGa3tYDq2
	I2iZ2d2pCLn7YZQf2s8S/IfSzxfa1Gs1vX8wfHPjr7qMCp6xPHGNM3MV3aVri8Y9IEfc
	w02A==
X-Gm-Message-State: APjAAAVlpSWvVZFK9AVBSE4ypZxqIqUUysit46Uy6cFPu0hbRMKUsphv
	+IXgMkw3Pml9dr/c1cvIfzgc76bl
X-Google-Smtp-Source: APXvYqxiaEF8yz/kRfAr590pGgN7wLUuESUXFIC+STGRFkoBN6uHfidCUjGThDZKu2JoDS0RnC3tZQ==
X-Received: by 2002:a2e:8944:: with SMTP id b4mr10540834ljk.154.1563755026264; 
	Sun, 21 Jul 2019 17:23:46 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	m17sm7267420lji.16.2019.07.21.17.23.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Jul 2019 17:23:45 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20190721233802.32193-1-open.source@oleksandr-kravchuk.com>
	<c9ce95b6-ddd4-a290-c7d7-04fd9fea116d@gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <1a5062db-50dc-76cf-3d71-f796a2e5da9b@oleksandr-kravchuk.com>
Date: Mon, 22 Jul 2019 02:23:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c9ce95b6-ddd4-a290-c7d7-04fd9fea116d@gmail.com>
Subject: Re: [PATCH][meta-networking] blueman: update to 2.1.1
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
X-List-Received-Date: Mon, 22 Jul 2019 00:23:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

Hm... It applies cleanly on the top of master-next and resulted patch is
identical.

On 22/07/2019 02:20, Khem Raj wrote:
> HI Oleksandr
>
> Can you rebase this on top of master-next and resend ?
>
> On 7/21/19 4:38 PM, Oleksandr Kravchuk wrote:
>> Removed patch was upstreamed.
>>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>   .../blueman/blueman_2.1.1.bb                  | 58 +++++++++++++++++++
>>   .../blueman/blueman_git.bb                    | 42 --------------
>>   2 files changed, 58 insertions(+), 42 deletions(-)
>>   create mode 100644
>> meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
>>   delete mode 100644
>> meta-networking/recipes-connectivity/blueman/blueman_git.bb
>>
>> diff --git
>> a/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
>> b/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
>> new file mode 100644
>> index 000000000..36de2af1d
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
>> @@ -0,0 +1,58 @@
>> +DESCRIPTION = "Blueman is a GTK+ Bluetooth Manager"
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> +
>> +DEPENDS = "bluez5 python3-pygobject python3-cython-native
>> python3-setuptools-native intltool-native"
>> +
>> +inherit autotools systemd gsettings python3native gtk-icon-cache
>> +
>> +SRC_URI = " \
>> +   
>> https://github.com/blueman-project/blueman/releases/download/${PV}/blueman-${PV}.tar.xz
>> \
>> +    file://0001-Search-for-cython3.patch \
>> +"
>> +SRC_URI[md5sum] = "9de89abb31be45bdbf11f7884764a2dc"
>> +SRC_URI[sha256sum] =
>> "f1eab2334e5a1587defa80900901048d14c2e8ffa8c0cff7240bc9937a61dbc3"
>> +
>> +EXTRA_OECONF = " \
>> +    --disable-runtime-deps-check \
>> +    --disable-schemas-compile \
>> +"
>> +
>> +SYSTEMD_SERVICE_${PN} = "${BPN}-mechanism.service"
>> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>> +
>> +RRECOMENDS_${PN} += "adwaita-icon-theme"
>> +RDEPENDS_${PN} += " \
>> +    python3-core \
>> +    python3-dbus \
>> +    packagegroup-tools-bluetooth \
>> +"
>> +
>> +PACKAGECONFIG ??= "thunar"
>> +PACKAGECONFIG[thunar] =
>> "--enable-thunar-sendto,--disable-thunar-sendto"
>> +
>> +FILES_${PN} += " \
>> +    ${datadir}/dbus-1 \
>> +    ${datadir}/Thunar \
>> +    ${systemd_user_unitdir} \
>> +    ${exec_prefix}${systemd_system_unitdir} \
>> +    ${PYTHON_SITEPACKAGES_DIR} \
>> +"
>> +
>> +FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_blueman.a"
>> +
>> +# In code, path to python is a variable that is replaced with path
>> to native version of it
>> +# during the configure stage, e.g
>> ../recipe-sysroot-native/usr/bin/python3-native/python3.
>> +# Replace it with #!/usr/bin/env python3
>> +do_install_append() {
>> +    sed -i "1s/.*/#!\/usr\/bin\/env python3/"
>> ${D}${prefix}/libexec/blueman-rfcomm-watcher \
>> +                                             
>> ${D}${prefix}/libexec/blueman-mechanism \
>> +                                             
>> ${D}${bindir}/blueman-tray \
>> +                                             
>> ${D}${bindir}/blueman-services \
>> +                                             
>> ${D}${bindir}/blueman-sendto \
>> +                                             
>> ${D}${bindir}/blueman-report \
>> +                                             
>> ${D}${bindir}/blueman-manager \
>> +                                             
>> ${D}${bindir}/blueman-assistant \
>> +                                             
>> ${D}${bindir}/blueman-applet \
>> +                                             
>> ${D}${bindir}/blueman-adapters
>> +}
>> diff --git
>> a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
>> b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
>> deleted file mode 100644
>> index 91b64a36b..000000000
>> --- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
>> +++ /dev/null
>> @@ -1,42 +0,0 @@
>> -DESCRIPTION = "Blueman is a GTK+ Bluetooth Manager"
>> -LICENSE = "GPLv3"
>> -LIC_FILES_CHKSUM =
>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> -
>> -DEPENDS = "bluez5 python3-pygobject python3-cython-native
>> python3-setuptools-native intltool-native"
>> -
>> -inherit autotools systemd gsettings python3native gtk-icon-cache
>> -
>> -SRC_URI = " \
>> -    git://github.com/blueman-project/blueman.git \
>> -    file://0001-Search-for-cython3.patch \
>> -"
>> -SRCREV = "c4a03417e81e21543d4568e8e7f7de307582eb50"
>> -PV = "2.0.5+git${SRCPV}"
>> -S = "${WORKDIR}/git"
>> -
>> -EXTRA_OECONF = " \
>> -    --disable-runtime-deps-check \
>> -    --disable-schemas-compile \
>> -"
>> -
>> -SYSTEMD_SERVICE_${PN} = "${BPN}-mechanism.service"
>> -SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>> -
>> -RRECOMENDS_${PN} += "adwaita-icon-theme"
>> -RDEPENDS_${PN} += " \
>> -    python3-dbus \
>> -    packagegroup-tools-bluetooth \
>> -"
>> -
>> -PACKAGECONFIG ??= "thunar"
>> -PACKAGECONFIG[thunar] =
>> "--enable-thunar-sendto,--disable-thunar-sendto"
>> -
>> -FILES_${PN} += " \
>> -    ${datadir}/dbus-1 \
>> -    ${datadir}/Thunar \
>> -    ${systemd_user_unitdir} \
>> -    ${exec_prefix}${systemd_system_unitdir} \
>> -    ${PYTHON_SITEPACKAGES_DIR} \
>> -"
>> -
>> -FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_blueman.a"

