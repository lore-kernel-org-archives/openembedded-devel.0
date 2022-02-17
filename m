Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08177C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 07:13:26 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.4637.1645082004713137762
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 23:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout08.t-online.de (Postfix) with SMTP id 855FF9573;
	Thu, 17 Feb 2022 08:13:22 +0100 (CET)
Received: from [192.168.178.83] ([79.219.224.19]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nKayf-2uU8Ej0; Thu, 17 Feb 2022 08:13:21 +0100
Message-ID: <22b359ba-d2d6-3ff1-eed7-c95ed9828b5b@t-online.de>
Date: Thu, 17 Feb 2022 08:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH] seahorse: initial add recipe
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220216165722.25908-1-f_l_k@t-online.de>
 <CAMKF1sqA_Dryp--gMJtnbNtKgbzQ1KCJL31q_ptT54SOG0Ao3g@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CAMKF1sqA_Dryp--gMJtnbNtKgbzQ1KCJL31q_ptT54SOG0Ao3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1645082001-0000C4DD-72346470/0/0 CLEAN NORMAL
X-TOI-MSGID: 14a30308-3201-4f83-9cbc-7fb62c8978e7
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Feb 2022 07:13:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95353

That's strange. I have this error only without using
meson-build-dont-look-for-native-ssh-keygen.patch


Native ssh Dependency is fullfilled because we have it in HOSTTOOLS, 
probably because the machine fails to build openssh-native. But we dont 
provide native ssh-keygen. Adding it to hosttools would help to fix the 
issue.
Does it help to add 'openssh' to depends ?

Am 17.02.22 um 07:59 schrieb Khem Raj:
> seeing configure failure
> https://errors.yoctoproject.org/Errors/Details/625735/
>
> On Wed, Feb 16, 2022 at 8:57 AM Markus Volk <f_l_k@t-online.de> wrote:
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>   ...uild-dont-look-for-native-ssh-keygen.patch | 15 +++++++++++
>>   .../recipes-gnome/seahorse/seahorse_41.0.bb   | 27 +++++++++++++++++++
>>   2 files changed, 42 insertions(+)
>>   create mode 100644 meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
>>   create mode 100644 meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
>>
>> diff --git a/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
>> new file mode 100644
>> index 000000000..ac83de486
>> --- /dev/null
>> +++ b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
>> @@ -0,0 +1,15 @@
>> +From: Markus Volk <f_l_k@t-online.de>
>> +Date: Tue, 16 Feb 2022 10:38:04 +0100
>> +Subject: [PATCH] meson.build: dont look for native ssh-keygen
>> +
>> +--- a/meson.build      2022-02-16 10:38:04.170081321 +0100
>> ++++ b/meson.build      2022-02-16 10:38:28.257864179 +0100
>> +@@ -44,7 +44,7 @@
>> + libpwquality = dependency('pwquality')
>> + posix = valac.find_library('posix')
>> + ssh_bin = find_program('ssh')
>> +-ssh_keygen = find_program('ssh-keygen')
>> ++ssh_keygen = find_program('ssh-keygen', native : false)
>> + gpg_bin = find_program('gpg2', 'gpg', required: get_option('pgp-support'))
>> + gpgme_dep = dependency('gpgme', version: '>= 1.14.0', required: get_option('pgp-support'))
>> +
>> diff --git a/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
>> new file mode 100644
>> index 000000000..ec1328598
>> --- /dev/null
>> +++ b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
>> @@ -0,0 +1,27 @@
>> +SUMMARY = "Seahorse is a graphical interface for managing and using encryption keys."
>> +LICENSE="GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +GNOMEBASEBUILDCLASS = "meson"
>> +
>> +DEPENDS = " \
>> +    avahi \
>> +    gcr \
>> +    glib-2.0 \
>> +    gnupg \
>> +    gpgme \
>> +    gtk+3 \
>> +    libhandy \
>> +    libpwquality \
>> +    libsecret \
>> +    libsoup-2.4 \
>> +    openldap \
>> +"
>> +
>> +inherit gnomebase itstool vala
>> +
>> +SRC_URI:append = " file://meson-build-dont-look-for-native-ssh-keygen.patch"
>> +SRC_URI[archive.sha256sum] = "e6eec09e810448295f547f18c1d5772b65c3edc1d9e5a2595f10b5dde68929f5"
>> +
>> +FILES:${PN} += "${datadir}"
>> +
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95340): https://lists.openembedded.org/g/openembedded-devel/message/95340
>> Mute This Topic: https://lists.openembedded.org/mt/89189799/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

