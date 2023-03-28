Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE49C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 00:31:12 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.54816.1679963464981705678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 17:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout11.t-online.de (Postfix) with SMTP id 596B3B305
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 02:31:03 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.35.166]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pgxEn-3qeWem0; Tue, 28 Mar 2023 02:30:57 +0200
Message-ID: <4fe30b51-acc4-f7f0-2480-5b5342ece762@t-online.de>
Date: Tue, 28 Mar 2023 02:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [meta-multimedia][PATCH] libcamera: update 0.0.1 -> 0.0.4
To: openembedded-devel@lists.openembedded.org
References: <20230325061639.8856-1-f_l_k@t-online.de>
 <167993217536.765114.1846701853726561760@Monstersaurus>
Content-Language: en-US
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <167993217536.765114.1846701853726561760@Monstersaurus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1679963457-0B7FDC11-DADBDB14/0/0 CLEAN NORMAL
X-TOI-MSGID: a6eaa2f6-ff7b-40c1-8ef7-e9808398832f
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 00:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101794

Hi Kieran,

indeed, thank you. Thought that file was removed, instead it was just 
moved to another directory. Sent a v2 with ported patch

Am 27.03.23 um 17:49 schrieb Kieran Bingham:
> Hi Markus,
>
> Quoting Markus Volk (2023-03-25 06:16:39)
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>   ...le_sink.cpp-Avoid-dangling-reference.patch | 46 -------------------
>>   ...{libcamera_0.0.1.bb => libcamera_0.0.4.bb} |  7 +--
>>   2 files changed, 2 insertions(+), 51 deletions(-)
>>   delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-file_sink.cpp-Avoid-dangling-reference.patch
> I don't think this has been fully resolved yet, so I suspect you need to
> keep this patch to be able to build with gcc-13.
>
>  From what I recall, we're waiting to identify if this will be fixed by
> GCC before it's released.
>
> --
> Kieran
>
>
>>   rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.0.1.bb => libcamera_0.0.4.bb} (89%)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-file_sink.cpp-Avoid-dangling-reference.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-file_sink.cpp-Avoid-dangling-reference.patch
>> deleted file mode 100644
>> index 5aa6ee8d3..000000000
>> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-file_sink.cpp-Avoid-dangling-reference.patch
>> +++ /dev/null
>> @@ -1,46 +0,0 @@
>> -From 0e97896e6a09957f27125957d00b5150ec90b2e9 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Tue, 24 Jan 2023 01:18:25 -0800
>> -Subject: [PATCH] file_sink.cpp: Avoid dangling-reference
>> -
>> -Fixes following errors with gcc-13
>> -
>> -../git/src/cam/file_sink.cpp:92:45: error: possibly dangling reference to a temporary [-Werror=dangling-reference]
>> -   92 |                 const FrameMetadata::Plane &meta = buffer->metadata().planes()[i];
>> -      |                                             ^~~~
>> -../git/src/cam/file_sink.cpp:92:81: note: the temporary was destroyed at the end of the full expression '(& buffer->libcamera::FrameBuffer::metadata())->libcamera::FrameMetadata::planes().libcamera::Span<const libcamera::FrameMetadata::Plane>::operator[](i)'
>> -   92 |                 const FrameMetadata::Plane &meta = buffer->metadata().planes()[i];
>> -      |                                                                                 ^
>> -cc1plus: all warnings being treated as errors
>> -
>> -Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2023-January/036575.html]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - src/cam/file_sink.cpp | 8 ++++----
>> - 1 file changed, 4 insertions(+), 4 deletions(-)
>> -
>> -diff --git a/src/cam/file_sink.cpp b/src/cam/file_sink.cpp
>> -index 45213d4a..897c4b37 100644
>> ---- a/src/cam/file_sink.cpp
>> -+++ b/src/cam/file_sink.cpp
>> -@@ -89,13 +89,13 @@ void FileSink::writeBuffer(const Stream *stream, FrameBuffer *buffer)
>> -       Image *image = mappedBuffers_[buffer].get();
>> -
>> -       for (unsigned int i = 0; i < buffer->planes().size(); ++i) {
>> --              const FrameMetadata::Plane &meta = buffer->metadata().planes()[i];
>> -+              unsigned int bytesused = buffer->metadata().planes()[i].bytesused;
>> -
>> -               Span<uint8_t> data = image->data(i);
>> --              unsigned int length = std::min<unsigned int>(meta.bytesused, data.size());
>> -+              unsigned int length = std::min<unsigned int>(bytesused, data.size());
>> -
>> --              if (meta.bytesused > data.size())
>> --                      std::cerr << "payload size " << meta.bytesused
>> -+              if (bytesused > data.size())
>> -+                      std::cerr << "payload size " << bytesused
>> -                                 << " larger than plane size " << data.size()
>> -                                 << std::endl;
>> -
>> ---
>> -2.39.1
>> -
>> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
>> similarity index 89%
>> rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
>> rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
>> index 46f058f2e..cbcc33aa4 100644
>> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
>> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
>> @@ -8,12 +8,9 @@ LIC_FILES_CHKSUM = "\
>>       file://LICENSES/LGPL-2.1-or-later.txt;md5=2a4f4fd2128ea2f65047ee63fbca9f68 \
>>   "
>>   
>> -SRC_URI = " \
>> -        git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
>> -        file://0001-file_sink.cpp-Avoid-dangling-reference.patch \
>> -"
>> +SRC_URI = "git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master"
>>   
>> -SRCREV = "a83aed77df1258e469c0eb42d9cb4f1938db53f2"
>> +SRCREV = "6cf637eb253a68edebe59505bea55435fafb00cd"
>>   
>>   PE = "1"
>>   
>> -- 
>> 2.34.1
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#101788): https://lists.openembedded.org/g/openembedded-devel/message/101788
>> Mute This Topic: https://lists.openembedded.org/mt/97839322/3618223
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [f_l_k@t-online.de]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

