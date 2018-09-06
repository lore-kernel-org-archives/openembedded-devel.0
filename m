Return-Path: <brgl@bgdev.pl>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 245B2795D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 19:17:15 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id j81-v6so17038073ite.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 12:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aV06JB6EwbrZh49f7xarhHNfop9PTI9O6a4T3AzcpWk=;
	b=amQ0SswRvZSz41SZ9dvIB1ypv1HN2/hqi5EAW/cGiIs+8HtDys20n9OVH5EkPnV+8u
	wJNJgLzAgCYQLq7H8UXwKwQffwj9YDrNm+7IBFR25EXfHUcGoz0wc+DEZp3oeykFc12E
	+CBj3THc/cI14etd0epTSexF2wkUNOs0eyg3Od7CBwHxBYgUBl81qDdPAWIUUGcnSPPF
	R3gk0Xw1pVI+J82jxQ6lnlcD4CZTKH18YrPwQAm8wR7iXEvUth420rdSQP0Ye5QSdn8x
	vkOslexcFIBMhRNZqQr5ywAgIjzzQbLhIN7kGUk6z92jmwV2Y/XjXzaLWrxa/XpmIOJP
	PGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aV06JB6EwbrZh49f7xarhHNfop9PTI9O6a4T3AzcpWk=;
	b=bOiGjMySDprdQ2EPIjwX8eGb6skAIMSLUlSa7nAHd+IcligmgPMazTIoXNshMxd+gV
	mzagTGW9SQrDZ9m73HKrOZphkMtQKUcy42E3ynfu7Iylxk7oTrVKPodWdApfoKBaAbiN
	t4UpIwtzXwjtc9md+IOKvDB13mT5NH1+OgX+STqepU5MzERc3DGduYHmhY5BKuin0gPN
	xlTdWJ8iqfThHGsJsZREOn9yCrahp+OuJf2HzKSTTLFJyf+Zb/tCv5JXIxu5NwHtqkBN
	KCUIr1yW/IbqOok5BWJLG8USyTgVE0ME/iaN7ELdkjdcR3nAgBM/k4V3UvdvI7ZUeTud
	z1Gg==
X-Gm-Message-State: APzg51C57z1MJsgVueFo3ALh6xjxWVqsW/MLfb6/9tVbvXNNmp82RTjJ
	czlYlLt8vbCcOtFqF3MFCrzLFDXU2SXOsEhvqb9G0g==
X-Google-Smtp-Source: ANB0VdaE0VTJ/389sRZh71rE8Q+ww++Q2EKFB+eLOeiTMtCLPQTARdpgO+rmBXWclZM10kka2EU4K4xgri7cGj842iw=
X-Received: by 2002:a6b:6401:: with SMTP id
	t1-v6mr3366728iog.111.1536261436877; 
	Thu, 06 Sep 2018 12:17:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:238d:0:0:0:0:0 with HTTP;
	Thu, 6 Sep 2018 12:17:16 -0700 (PDT)
In-Reply-To: <CAMKF1sqUR8-z3_2dq3_-Q-krPMxnzN2kx6Jx_EmEKzNcwc2sEQ@mail.gmail.com>
References: <20180906123745.26192-1-brgl@bgdev.pl>
	<CAMKF1soK0OxkEai1r0U-aZdE97u5HPoev7G7Ykes9m8BP9uSmQ@mail.gmail.com>
	<CAMRc=MejwMEJS89gOmxNqbAd6AnSg28fY+urhLT6ofaQ1aC5cQ@mail.gmail.com>
	<CAMKF1sqUR8-z3_2dq3_-Q-krPMxnzN2kx6Jx_EmEKzNcwc2sEQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 6 Sep 2018 21:17:16 +0200
Message-ID: <CAMRc=Mepc6fZusBM=gW0PjUP5iCS6s78KoeVoTSTUk7JuDOAHA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkd-dispatcher: new package
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
X-List-Received-Date: Thu, 06 Sep 2018 19:17:16 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-06 18:58 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> On Thu, Sep 6, 2018 at 9:13 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> 2018-09-06 17:31 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>> > On Thu, Sep 6, 2018 at 5:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> >>
>> >> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> >>
>> >> This adds a recipe for networkd-dispatcher.
>> >>
>> >> It's a simple package containing a python script that needs to be
>> >> installed together with a systemd service and an example config
>> >> file. There's nothing to build.
>> >>
>> >> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> >> ---
>> >>  .../networkd-dispatcher_1.7.bb                | 30 +++++++++++++++++++
>> >>  1 file changed, 30 insertions(+)
>> >>  create mode 100644 meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
>> >>
>> >> diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
>> >> new file mode 100644
>> >> index 000000000..1887c4c7a
>> >> --- /dev/null
>> >> +++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
>> >> @@ -0,0 +1,30 @@
>> >> +SUMMARY = "Dispatcher service for systemd-networkd connection status changes"
>> >> +DESCRIPTION = "This daemon is similar to NetworkManager-dispatcher, but is much \
>> >> +more limited in the types of events it supports due to the limited nature of \
>> >> +systemd-networkd(8)."
>> >> +AUTHOR = "Clayton Craft and others"
>> >> +
>> >> +LICENSE = "GPLv3"
>> >> +LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
>> >> +
>> >> +RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
>> >> +
>> >> +SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher.git;protocol=https"
>> >> +SRCREV = "c7e25623a161b64618ea778541c064d2a1df086b"
>> >
>> > perhaps define PV in terms of SRCPV
>> >
>> >> +
>> >> +S = "${WORKDIR}/git"
>> >> +
>> >> +# Nothing to build, just a python script to install.
>> >> +do_compile() {
>> >> +}
>> >
>> > use deltask
>> >
>> >> +
>> >> +do_install() {
>> >> +    mkdir -p ${D}/${sbindir}
>> >> +    install -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/networkd-dispatcher
>> >
>> > condense both into install -D -m 0755 ....
>> >
>> >> +    mkdir -p ${D}/${systemd_unitdir}/system
>> >> +    install -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_unitdir}/system/networkd-dispatcher.service
>> >> +    mkdir -p ${D}/${sysconfdir}/conf.d
>> >> +    install -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf
>> >
>> > this whole section should check for systemd being in DISTRO_FEATURES
>> >
>>
>> It doesn't seem necessary - if systemd is not in DISTRO_FEATURES the
>> following error is raised:
>>
>> ERROR: Nothing RPROVIDES 'systemd' (but
>> /<snip!>/meta-openembedded/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
>> RDEPENDS on or otherwise requires it)
>> systemd was skipped: missing required distro feature 'systemd' (not in
>> DISTRO_FEATURES)
>>
>
> which is other concern, since we do support sysvinit, we need to have
> both options functional if possible.
>

Why? This package doesn't make sense without networkd.

Bart

>> For other issues: I'll fix them all in v2 and resend tomorrow.
>>
>> Thanks!
>> Bart
>>
>> >> +}
>> >> +
>> >> +FILES_${PN} += "${systemd_unitdir}/system/networkd-dispatcher.service"
>> >
>> > use systemd_system_unitdir
>> >
>> >> --
>> >> 2.18.0
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

