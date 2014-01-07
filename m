Return-Path: <kirgene@gmail.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8426B961
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 02:44:28 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id j5so164801qaq.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2014 18:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LiDLv3Wc9E1g5oJYmYj2iSVd+pBJfU7Az4d6cdxNzak=;
	b=PHhPWBqsLZCDRw4lBGE7H9561WXmbwww0Av3SxNb3HGHbfUEGIcbqcdihtF2nW99gG
	ZYQJ4TBIRWamUheI5raFnli9h3PHBW8nWt4qnQJbxgSOLfP2T6NItGTv2t62x2Nb1a2u
	5mq1D8EYTNUj+3PsUGNHHQvUbEf1LLlG0F9SX3OciUtKYbXeiliRwJCrhlJDnnQpg1wS
	WCIuGiyOBVY6TLL+CZW2V7y+IAB82xSVLGmsakNOWnCL2Dj57v32LW81SiR9Lh9KyRQR
	/N4cCY/fr0zRsCZLZQHBSYsPW0cGZjVcq84unmBY4hqJlVmujKYwCuyg1e8xQBWipUV3
	6j1w==
MIME-Version: 1.0
X-Received: by 10.49.1.10 with SMTP id 10mr192091093qei.6.1389062669901; Mon,
	06 Jan 2014 18:44:29 -0800 (PST)
Received: by 10.96.177.105 with HTTP; Mon, 6 Jan 2014 18:44:29 -0800 (PST)
In-Reply-To: <C43D5437-90C2-4BF6-9519-43A8B7244576@dominion.thruhere.net>
References: <1389024737-56946-1-git-send-email-koen@dominion.thruhere.net>
	<C43D5437-90C2-4BF6-9519-43A8B7244576@dominion.thruhere.net>
Date: Tue, 7 Jan 2014 04:44:29 +0200
Message-ID: <CADV-EXG2Febjf6kNmOVjBDinyv=02J+K5KhkJdORDubzZJKFuA@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "openembedded-devel@lists.openembedded.org List"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] udisks: updated to v2.1.1.
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
X-List-Received-Date: Tue, 07 Jan 2014 02:44:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

2014/1/6 Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 6 jan. 2014, om 17:12 heeft Koen Kooi <koen@dominion.thruhere.net> het volgende geschreven:
>
>> From: Yevhen Kyriukha <kirgene@gmail.com>
>>
>> One patch was removed because changes are already exist in upstream version.
>> Added patch to turn libatasmart, polkit, acl and libsystemd-login into optional dependencies.
>>
>> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>
> Gah, stupid muscle memory, that SOB is premature
>
>> ---
>
> I played a bit with this patch and I have a few questions
>
>
>> diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_2.1.1.bb
>> similarity index 34%
>> rename from meta-oe/recipes-support/udisks/udisks_1.0.4.bb
>> rename to meta-oe/recipes-support/udisks/udisks_2.1.1.bb
>> index 32f0c11..9eff5e1 100644
>> --- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
>> +++ b/meta-oe/recipes-support/udisks/udisks_2.1.1.bb
>> @@ -1,39 +1,38 @@
>> DESCRIPTION = "A storage daemon that implements well-defined D-Bus interfaces that can be used to query and manipulate storage devices."
>> LICENSE = "GPLv2+"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
>>
>> -DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
>> -# optional dependencies: device-mapper parted
>> +DEPENDS = "udev dbus-glib glib-2.0"
>>
>> DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>
> [..]
>
>> inherit autotools systemd
>>
>> -PACKAGECONFIG ??= ""
>> -PACKAGECONFIG[parted] = "--enable-parted,--disable-parted,parted"
>> +PACKAGECONFIG ??= "atasmart polkit acl ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd-login', '', d)}"
>> +PACKAGECONFIG[atasmart] = "--enable-libatasmart,--disable-libatasmart,libatasmart"
>> +PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit"
>> +PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
>> +PACKAGECONFIG[systemd-login] = "--enable-libsystemd-login,--disable-libsystemd-login,systemd"
>
> I think 3 different ways to add systemd to DEPENDS is a bit much, the inherit + PACKAGECONFIG should be enough. Also, what happened to the parted PACKAGECONFIG?
>

You're right, I'll remove redundant DEPENDS statement for systemd.
As for parted, udisks doesn't depend on it already during compile.

> regards,
>
> Koen
>
>
>>
>> -EXTRA_OECONF = "--disable-man-pages"
>> +EXTRA_OECONF = "--disable-man"
>> +
>> +PACKAGES =+ "${PN}-bash-completion"
>>
>> FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
>>                 ${datadir}/dbus-1/ \
>>                 ${datadir}/polkit-1 \
>>                 ${base_libdir}/udev/* \
>> +                ${libdir}/udisks2/* \
>> "
>> +FILES_${PN}-dbg += "${base_libdir}/udev/.debug \
>> +             ${libdir}/udisks2/.debug"
>> +FILES_${PN}-bash-completion = "${datadir}/bash-completion"
>>
>> -FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
>> -
>> -RPROVIDES_${PN} += "${PN}-systemd"
>> -RREPLACES_${PN} += "${PN}-systemd"
>> -RCONFLICTS_${PN} += "${PN}-systemd"
>> -SYSTEMD_SERVICE_${PN} = "udisks-daemon.service"
>> +SYSTEMD_SERVICE_${PN} = "udisks2.service"
>> SYSTEMD_AUTO_ENABLE = "disable"
>> --
>> 1.8.4
>>
>>
>

