Return-Path: <brgl@bgdev.pl>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 38749797DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 12:26:47 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id x79-v6so5876640ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tZcr9z8oQ7DEb31w48EHfQKGTwnhQczBZ4kWLGI8feA=;
	b=c75P4LxUf5C4t7kdD/Cb7FGohWBTAaG8BnABz5aJcAzYJI5oTG7PHl/97EyrBRGlJY
	kZN0aguUZoVU/LwlwLDswFFu00usb4GT54gaytw6wxyKP+icW6QE/mkIb5DAeljeESiv
	SLWHdrq3sDYNMqhBJVlBmRJHGhfaX5KdXEsK6eegpgPPU5AjTqLEzkWxa2DYok5T7Qh7
	QlKmxjj2dl2ZEt5RpV9TlpyKVfD3l4OZUql2Wt02MOo3z7f4EIPe89Rmt56qtb/v1eCa
	5ZEuK7B/1lOP8C9oFdW510bHE0HgSx4F9QlWI4XBXvGzWOhaHpCC5cZN8A1T5qbhMQpl
	Tufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tZcr9z8oQ7DEb31w48EHfQKGTwnhQczBZ4kWLGI8feA=;
	b=WusM2mIHAQWyMYFAo/bw4CiqvUEahmoawmoGAuExk9c0yOKI/Hd7FNxTburlLUW8iJ
	hhbxz0AeTT4Av109sv/1GsSOhLirX6oYlsAB8ELm/98FD94xV4ElltK0lqPwLde78TN5
	qNp8X/5lEim3+ULFLb9b3ZCaLpMrzJxaQS/j8n1qKc3NgTy7z1O7A9UG9wOaYEfZlBEv
	eCHlqU3j6yikT0o/easuLQCuA9HIy5frQHbD9lyOGWdOjbb9mboUQJmgnTDmdt+RVtL9
	+2OMrvfJQQtgx9o4niewhVPEk/gbPV5/W0Uq9vMBjOhMgIVIp8dIoLq5w+E1/KwL3Xn8
	kp5A==
X-Gm-Message-State: APzg51BKgACS4GOS90nu/tRgKwPCM+WvRK9sy/oK5Q1FCFprb9Q4H2KF
	idBxzyDOG7jGHvWkaOSIi+mKz4D1oL86xIPOwyV04w==
X-Google-Smtp-Source: ANB0VdaeNsiGwDmgg80hXYzps8U8285k+PzaXcXOFwBgAS2xc8F4kTL6JYixKoBl1fnX2WwbQ49jVXiVoxIj+Y3nJcI=
X-Received: by 2002:a02:95c4:: with SMTP id
	b62-v6mr17210182jai.43.1536582408901; 
	Mon, 10 Sep 2018 05:26:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:1905:0:0:0:0:0 with HTTP; Mon, 10 Sep 2018 05:26:48
	-0700 (PDT)
In-Reply-To: <10179944-546e-fe85-b58f-47ed31e109da@gmail.com>
References: <20180907105515.18840-1-brgl@bgdev.pl>
	<CAMKF1srQXEdRrnfN2L=zsJmZwCV545Epwdd5nwo9MWZfGfYNQQ@mail.gmail.com>
	<CAMRc=Mf1kZzJrdJ781PK3RKfbXWe4GpgypbvLSC2=sqBuDPcsA@mail.gmail.com>
	<10179944-546e-fe85-b58f-47ed31e109da@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Sep 2018 14:26:48 +0200
Message-ID: <CAMRc=Mfv1U1_REz6mo_DgPwA0epACLfmX_POf4bsH+xUw+g3qA@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Sep 2018 12:26:48 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-08 16:49 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>
>
> On 9/8/18 2:52 AM, Bartosz Golaszewski wrote:
>> 2018-09-08 2:50 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>>> http://errors.yoctoproject.org/Errors/Details/192034/
>>
>> Can I somehow retrieve the bblayers.conf and local.conf for this
>> build? I don't see this problem locally.
>>
>
> if you use poky master + systemd you should be similar
>
> https://github.com/kraj/oe-build/blob/master/conf/local.conf
> https://github.com/cbrake/meta-bec/blob/master/conf/distro/bec.conf
> http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180906_223200.log/auto.conf
>

Using current master for poky, meta-openembedded and meta-bec + the
config you posted I'm getting the following error:

ERROR: bec-simple-image-1.0-r0 do_image: Function failed:
prelink_image (log file is located at
/<snip!>/build/tmp/work/qemux86_64-bec-linux/bec-simple-image/1.0-r0/temp/log.do_image.27182)
ERROR: Logfile of failure stored in:
/<snip!>/build/tmp/work/qemux86_64-bec-linux/bec-simple-image/1.0-r0/temp/log.do_image.27182
Log data follows:
| DEBUG: Executing python function do_image
| NOTE: Executing rootfs_update_timestamp prelink_setup ...
| WARNING: Function rootfs_update_timestamp prelink_setup doesn't exist
| NOTE: Executing prelink_image ...
| DEBUG: Executing shell function prelink_image
| Size before prelinking 74504.
| cat: /<snip!>/build/tmp/work/qemux86_64-bec-linux/bec-simple-image/1.0-r0/recipe-sysroot/etc/ld.so.conf:
No such file or directory
| WARNING: /<snip!>/build/tmp/work/qemux86_64-bec-linux/bec-simple-image/1.0-r0/temp/run.prelink_image.27182:1
exit 1 from 'cat
/<snip!>/build/tmp/work/qemux86_64-bec-linux/bec-simple-image/1.0-r0/recipe-sysroot/etc/ld.so.conf
>> $ldsoconf'
| DEBUG: Python function do_image finished
| ERROR: Function failed: prelink_image (log file is located at
/<snip!>/build/tmp/work/qemux86_64-bec-linux/bec-simple-image/1.0-r0/temp/log.do_image.27182)
ERROR: Task (/<snip!>/meta-bec/recipes-core/images/bec-simple-image.bb:do_image)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 3816 tasks of which 877 didn't need to
be rerun and 1 failed.
NOTE: The errors for this build are stored in
/<snip!>/build/tmp/log/error-report/error_report_20180910111340.txt
You can send the errors to a reports server by running:
  send-error-report
/<snip!>/build/tmp/log/error-report/error_report_20180910111340.txt
[-s server]
NOTE: The contents of these logs will be posted in public if you use
the above command with the default server. Please ensure you remove
any identifying or proprietary information when prompted before
sending.
NOTE: Build completion summary:
NOTE:   do_populate_sysroot: 0.0% sstate reuse(0 setscene, 256 scratch)
NOTE:   do_package_qa: 0.0% sstate reuse(0 setscene, 155 scratch)
NOTE:   do_package: 0.0% sstate reuse(0 setscene, 155 scratch)
NOTE:   do_packagedata: 0.0% sstate reuse(0 setscene, 155 scratch)
NOTE:   do_package_write_ipk: 0.0% sstate reuse(0 setscene, 155 scratch)
NOTE:   do_populate_lic: 0.0% sstate reuse(0 setscene, 59 scratch)
NOTE: Writing buildhistory

Summary: 1 task failed:
  /<snip!>/meta-bec/recipes-core/images/bec-simple-image.bb:do_image
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

I'm still not seeing any issues with a regular poky +
meta-openembedded build for "poky" distro and "qemux86-64" machine.

Bart

>> Best regards,
>> Bartosz Golaszewski
>>
>>> On Fri, Sep 7, 2018 at 3:55 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>>
>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>
>>>> This adds a recipe for networkd-dispatcher.
>>>>
>>>> It's a simple package containing a python script that needs to be
>>>> installed together with a systemd service and an example config
>>>> file. There's nothing to build.
>>>>
>>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>> ---
>>>> NOTE: resending with a proper tag
>>>>
>>>> v1 -> v2:
>>>> - skip the package if systemd is not in DISTRO_FEATURES
>>>> - use -D in install for new directories
>>>> - use deltask instead of an empty do_compile() function
>>>> - define PV in the recipe as <version>+git${SRCPV}
>>>>
>>>>  .../networkd-dispatcher.bb                    | 33 +++++++++++++++++++
>>>>  1 file changed, 33 insertions(+)
>>>>  create mode 100644 meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
>>>>
>>>> diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
>>>> new file mode 100644
>>>> index 000000000..7bb2347a8
>>>> --- /dev/null
>>>> +++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
>>>> @@ -0,0 +1,33 @@
>>>> +python __anonymous() {
>>>> +    features = d.getVar('DISTRO_FEATURES')
>>>> +    if not features or 'systemd' not in features:
>>>> +        raise bb.parse.SkipPackage('networkd-dispatcher needs systemd in DISTRO_FEATURES')
>>>> +}
>>>> +
>>>> +SUMMARY = "Dispatcher service for systemd-networkd connection status changes"
>>>> +DESCRIPTION = "This daemon is similar to NetworkManager-dispatcher, but is much \
>>>> +more limited in the types of events it supports due to the limited nature of \
>>>> +systemd-networkd(8)."
>>>> +AUTHOR = "Clayton Craft and others"
>>>> +
>>>> +LICENSE = "GPLv3"
>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
>>>> +
>>>> +RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
>>>> +
>>>> +SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher.git;protocol=https"
>>>> +SRCREV = "c7e25623a161b64618ea778541c064d2a1df086b"
>>>> +PV = "1.7+git${SRCPV}"
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +
>>>> +# Nothing to build, just a python script to install
>>>> +deltask do_compile
>>>> +
>>>> +do_install() {
>>>> +    install -D -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/networkd-dispatcher
>>>> +    install -D -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_system_unitdir}/networkd-dispatcher.service
>>>> +    install -D -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf
>>>> +}
>>>> +
>>>> +FILES_${PN} += "${systemd_system_unitdir}/networkd-dispatcher.service"
>>>> --
>>>> 2.18.0
>>>>
>

