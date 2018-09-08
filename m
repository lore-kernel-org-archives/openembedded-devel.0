Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2AFCA74553
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 09:52:20 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id q4-v6so3388037iob.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Sep 2018 02:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8IFa9nvbx2YK1hIFrMrH0yqROYmQKh6nEN4+TtiyFcM=;
	b=TNPrH4Nmj6XDrwfx3KANHTCVyjyAhxxsty0JXgBCoRVvwjz94/s+H6aQ0dyYOsfQC/
	Y1RLcBKBU/h82GFaRliDlQUeytC4SKc/WGQpgFTAK8EJEmGZSSVhe1QBfCgQtzsLJ98A
	Rpk9Uzbqqmqg/5lgiJMggkItkNj5PxZgClZinwPLs+wd0t0yMS254jcz0iR10viiP1rt
	GvOHbgJtjxEc1wmvW7wB66/xglGc1MJ+QHLuB7c1RvGXW5QASxrCsnaD/Sd9pSWZ5woj
	oPTInv+ozSE9rrd9W8kdLvN0spkjVE1R15d1tBORrWsjJh/P4RPdp/06HeEM4p/35MgL
	stRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8IFa9nvbx2YK1hIFrMrH0yqROYmQKh6nEN4+TtiyFcM=;
	b=ENj2h4sAtVfdN7uSyZLjOfxg1MlHw8Ib6EtrvGuGozBP+U3AKBRCZrpr0ZAv66tL48
	YlKcZIWm+7nxrPI0RR2bH1f3qsa69a0PVb5NJ8bkF90OhX1kOoOHEq+9zuGTnVlTC1Vm
	n5yIlU/hIah/LJgFhh4V6LmFDqWqhnv+COe0QLSSju7QHVzX17X2+rQMwtbhK0rhIF7q
	3gELTI308UaFvTTA6LsbV+R+FkWkaHtmVsyrsWDrhDXuWTNRxOdNrZolE4bExt/KfbU0
	O+/CuIPa1Ex58VMcH+kI3KtVbf4prLfwM7qPV/U5iGk0s61XsC2Q+tz6HUbu4zdQ1Z5v
	WtTA==
X-Gm-Message-State: APzg51BXnDxHf8D0pEjrR+N+BXTz9TyfMKyzeT9zhW9NQbxDCbEMrQFy
	KAYxUm87GK9O+vPAoFQpqvnDA23pi5rCxnQoXobtFg==
X-Google-Smtp-Source: ANB0Vdb9vJbDJ5vGEPS9IUbb8QGV39W9atdGQn7gfPgD1qJkSBJKr/u6xhYKm7ja4vSMLJZGdzN78EsnQ+N1eb/Rkyc=
X-Received: by 2002:a6b:6401:: with SMTP id
	t1-v6mr10082551iog.111.1536400341651; 
	Sat, 08 Sep 2018 02:52:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:1905:0:0:0:0:0 with HTTP;
	Sat, 8 Sep 2018 02:52:21 -0700 (PDT)
In-Reply-To: <CAMKF1srQXEdRrnfN2L=zsJmZwCV545Epwdd5nwo9MWZfGfYNQQ@mail.gmail.com>
References: <20180907105515.18840-1-brgl@bgdev.pl>
	<CAMKF1srQXEdRrnfN2L=zsJmZwCV545Epwdd5nwo9MWZfGfYNQQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 8 Sep 2018 11:52:21 +0200
Message-ID: <CAMRc=Mf1kZzJrdJ781PK3RKfbXWe4GpgypbvLSC2=sqBuDPcsA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] networkd-dispatcher: new package
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
X-List-Received-Date: Sat, 08 Sep 2018 09:52:21 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-08 2:50 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> http://errors.yoctoproject.org/Errors/Details/192034/

Can I somehow retrieve the bblayers.conf and local.conf for this
build? I don't see this problem locally.

Best regards,
Bartosz Golaszewski

> On Fri, Sep 7, 2018 at 3:55 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> This adds a recipe for networkd-dispatcher.
>>
>> It's a simple package containing a python script that needs to be
>> installed together with a systemd service and an example config
>> file. There's nothing to build.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>> NOTE: resending with a proper tag
>>
>> v1 -> v2:
>> - skip the package if systemd is not in DISTRO_FEATURES
>> - use -D in install for new directories
>> - use deltask instead of an empty do_compile() function
>> - define PV in the recipe as <version>+git${SRCPV}
>>
>>  .../networkd-dispatcher.bb                    | 33 +++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>  create mode 100644 meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
>>
>> diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
>> new file mode 100644
>> index 000000000..7bb2347a8
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
>> @@ -0,0 +1,33 @@
>> +python __anonymous() {
>> +    features = d.getVar('DISTRO_FEATURES')
>> +    if not features or 'systemd' not in features:
>> +        raise bb.parse.SkipPackage('networkd-dispatcher needs systemd in DISTRO_FEATURES')
>> +}
>> +
>> +SUMMARY = "Dispatcher service for systemd-networkd connection status changes"
>> +DESCRIPTION = "This daemon is similar to NetworkManager-dispatcher, but is much \
>> +more limited in the types of events it supports due to the limited nature of \
>> +systemd-networkd(8)."
>> +AUTHOR = "Clayton Craft and others"
>> +
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
>> +
>> +RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
>> +
>> +SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher.git;protocol=https"
>> +SRCREV = "c7e25623a161b64618ea778541c064d2a1df086b"
>> +PV = "1.7+git${SRCPV}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +# Nothing to build, just a python script to install
>> +deltask do_compile
>> +
>> +do_install() {
>> +    install -D -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/networkd-dispatcher
>> +    install -D -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_system_unitdir}/networkd-dispatcher.service
>> +    install -D -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf
>> +}
>> +
>> +FILES_${PN} += "${systemd_system_unitdir}/networkd-dispatcher.service"
>> --
>> 2.18.0
>>

