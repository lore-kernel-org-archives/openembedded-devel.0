Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E42C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 00:42:09 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web09.5046.1645144928326196643
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 16:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 8BF473706
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 01:42:06 +0100 (CET)
Received: from [192.168.178.83] ([84.163.45.78]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nKrLV-41sVRR0; Fri, 18 Feb 2022 01:42:02 +0100
Message-ID: <72d17fbe-1aea-f219-52aa-dbece3d434d8@t-online.de>
Date: Fri, 18 Feb 2022 01:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH] seahorse: initial add recipe
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220216165722.25908-1-f_l_k@t-online.de>
 <CAMKF1sqA_Dryp--gMJtnbNtKgbzQ1KCJL31q_ptT54SOG0Ao3g@mail.gmail.com>
 <16D4815E2CBA08CD.19478@lists.openembedded.org>
 <16D4824B2C83E660.30488@lists.openembedded.org>
 <d4f68a6f-547b-dcc2-683f-bb0a4f4195fe@t-online.de>
 <CAMKF1srEf0wQneiNKUqc-2sjqaBjR+KkG6WA3dw_Y7Y6tcj=2w@mail.gmail.com>
 <CAMKF1srtFoy3-xf4UGRYmSveJAJ-ULmDqEtdO-TQUGj2FUAh8w@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CAMKF1srtFoy3-xf4UGRYmSveJAJ-ULmDqEtdO-TQUGj2FUAh8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1645144922-0000AD4E-4DBF6226/0/0 CLEAN NORMAL
X-TOI-MSGID: 5cfcd8b8-fea8-4aa3-a707-ebb612987e84
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 00:42:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95365

building openssh-native fails on my machine with:

ERROR: Nothing PROVIDES 'libpam-native' (but 
virtual:native:/home/flk/build/poky/meta/recipes-connectivity/openssh/openssh_8.8p1.bb 
DEPENDS on or otherwise requires it)
libpam-native was skipped: missing required distro feature 'pam' (not in 
DISTRO_FEATURES)
ERROR: Required build target 'openssh-native' has no buildable providers.
Missing or unbuildable dependency chain was: ['openssh-native', 
'libpam-native']

'pam' is in DISTRO_FEATURES

This only happens if openssh was built with pam support, but thats kind 
of an issue.

Am 17.02.22 um 23:54 schrieb Khem Raj:
> On Thu, Feb 17, 2022 at 11:04 AM Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Feb 17, 2022 at 12:17 AM Markus Volk <f_l_k@t-online.de> wrote:
>>> Apologies. Caused by my testing I had a lingering symlink to ssh-keygen
>>> in ${TMP}/hosttools. Therefore, I did not have a build error. Since
>>> 'ssh' is in hosttools, maybe it would be best to add 'ssh-keygen' as well?
>>>
>>> Without building openssh-native, the only other way I could think of
>>> would be to use a hardcoded path like this:
>> adding dependency on openssh-native is ok here.
> that also needs to enhance openssh recipe, on fedora and debian both
> ssh and ssh-keygen come from same package, so perhaps unblocking it
> for build host might be also equally good solution. Please propose
> needed changes for oe-core first and then see whichever is acceptable
> way resend this patch once dependencies are accepted in core.
>
>>> +--- a/meson.build       2022-02-17 09:03:00.081459067 +0100
>>> ++++ b/meson.build       2022-02-17 09:02:34.321668809 +0100
>>> +@@ -44,7 +44,7 @@
>>> + libpwquality = dependency('pwquality')
>>> + posix = valac.find_library('posix')
>>> + ssh_bin = find_program('ssh')
>>> +-ssh_keygen = find_program('ssh-keygen')
>>> ++ssh_keygen = find_program('/usr/bin/ssh-keygen')
>>> + gpg_bin = find_program('gpg2', 'gpg', required: get_option('pgp-support'))
>>> + gpgme_dep = dependency('gpgme', version: '>= 1.14.0', required:
>>> get_option('pgp-support'))
>>> +
>>> +
>>>
>>>
>>> Am 17.02.22 um 08:29 schrieb Markus Volk:
>>>> Maybe i'm not running into this because i have this in my config ?
>>>>
>>>> IMAGE_FEATURES += " ssh-server-openssh"
>>>>
>>>> Am 17.02.22 um 08:13 schrieb Markus Volk:
>>>>> That's strange. I have this error only without using
>>>>> meson-build-dont-look-for-native-ssh-keygen.patch
>>>>>
>>>>>
>>>>> Native ssh Dependency is fullfilled because we have it in HOSTTOOLS,
>>>>> probably because the machine fails to build openssh-native. But we
>>>>> dont provide native ssh-keygen. Adding it to hosttools would help to
>>>>> fix the issue.
>>>>> Does it help to add 'openssh' to depends ?
>>>>>
>>>>> Am 17.02.22 um 07:59 schrieb Khem Raj:
>>>>>> seeing configure failure
>>>>>> https://errors.yoctoproject.org/Errors/Details/625735/
>>>>>>
>>>>>> On Wed, Feb 16, 2022 at 8:57 AM Markus Volk <f_l_k@t-online.de> wrote:
>>>>>>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>>>>>>> ---
>>>>>>>    ...uild-dont-look-for-native-ssh-keygen.patch | 15 +++++++++++
>>>>>>>    .../recipes-gnome/seahorse/seahorse_41.0.bb   | 27
>>>>>>> +++++++++++++++++++
>>>>>>>    2 files changed, 42 insertions(+)
>>>>>>>    create mode 100644
>>>>>>> meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
>>>>>>>    create mode 100644
>>>>>>> meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
>>>>>>> b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
>>>>>>>
>>>>>>> new file mode 100644
>>>>>>> index 000000000..ac83de486
>>>>>>> --- /dev/null
>>>>>>> +++
>>>>>>> b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
>>>>>>> @@ -0,0 +1,15 @@
>>>>>>> +From: Markus Volk <f_l_k@t-online.de>
>>>>>>> +Date: Tue, 16 Feb 2022 10:38:04 +0100
>>>>>>> +Subject: [PATCH] meson.build: dont look for native ssh-keygen
>>>>>>> +
>>>>>>> +--- a/meson.build      2022-02-16 10:38:04.170081321 +0100
>>>>>>> ++++ b/meson.build      2022-02-16 10:38:28.257864179 +0100
>>>>>>> +@@ -44,7 +44,7 @@
>>>>>>> + libpwquality = dependency('pwquality')
>>>>>>> + posix = valac.find_library('posix')
>>>>>>> + ssh_bin = find_program('ssh')
>>>>>>> +-ssh_keygen = find_program('ssh-keygen')
>>>>>>> ++ssh_keygen = find_program('ssh-keygen', native : false)
>>>>>>> + gpg_bin = find_program('gpg2', 'gpg', required:
>>>>>>> get_option('pgp-support'))
>>>>>>> + gpgme_dep = dependency('gpgme', version: '>= 1.14.0', required:
>>>>>>> get_option('pgp-support'))
>>>>>>> +
>>>>>>> diff --git a/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
>>>>>>> b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
>>>>>>> new file mode 100644
>>>>>>> index 000000000..ec1328598
>>>>>>> --- /dev/null
>>>>>>> +++ b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
>>>>>>> @@ -0,0 +1,27 @@
>>>>>>> +SUMMARY = "Seahorse is a graphical interface for managing and
>>>>>>> using encryption keys."
>>>>>>> +LICENSE="GPLv2"
>>>>>>> +LIC_FILES_CHKSUM =
>>>>>>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>>>>>> +
>>>>>>> +GNOMEBASEBUILDCLASS = "meson"
>>>>>>> +
>>>>>>> +DEPENDS = " \
>>>>>>> +    avahi \
>>>>>>> +    gcr \
>>>>>>> +    glib-2.0 \
>>>>>>> +    gnupg \
>>>>>>> +    gpgme \
>>>>>>> +    gtk+3 \
>>>>>>> +    libhandy \
>>>>>>> +    libpwquality \
>>>>>>> +    libsecret \
>>>>>>> +    libsoup-2.4 \
>>>>>>> +    openldap \
>>>>>>> +"
>>>>>>> +
>>>>>>> +inherit gnomebase itstool vala
>>>>>>> +
>>>>>>> +SRC_URI:append = "
>>>>>>> file://meson-build-dont-look-for-native-ssh-keygen.patch"
>>>>>>> +SRC_URI[archive.sha256sum] =
>>>>>>> "e6eec09e810448295f547f18c1d5772b65c3edc1d9e5a2595f10b5dde68929f5"
>>>>>>> +
>>>>>>> +FILES:${PN} += "${datadir}"
>>>>>>> +
>>>>>>> --
>>>>>>> 2.25.1
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#95362): https://lists.openembedded.org/g/openembedded-devel/message/95362
>>> Mute This Topic: https://lists.openembedded.org/mt/89189799/3618223
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [f_l_k@t-online.de]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

