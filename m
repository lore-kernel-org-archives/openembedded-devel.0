Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id C56B76010D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Feb 2017 00:08:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1487981328; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=X9XMlZbRtOUtLKLsyzZ67xc/ifeCvbUVaPNSLS05UB0=;
	b=rfB3dez6KAtfGKMoTG0kem0vVhF6eiOQwODVlzioXt+GBXp/OqPtXyvgQPDe6axgY0G1ogqW
	C1JB3jbeGgLH32lb/AqafqGvAkwA5rufS7TJq4NYTqHIk0nDLDnjzOdv8rer1xG3gnhcl0Xp
	OA+X9fHmIXIY48zJNNKKf8nDc8A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=IwTT+GuTHN0hC1FAB1834ozGmvOt5zKX1cFuF9wNIY4RaE+dYqwLnEuK4KiDLkh4QADka/
	mIUJWhkFDKAFkky/6maWE1dQj+MuZZ99rTf93dnw2Qgo0mM69lT+bB6bXrJaTVsTq/jCcmXi
	w1tQUf3ezGwPB0oEjoj1/3lveR5u8=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mxa.mailgun.org with ESMTP id 58b0cb10.7fe8805cf830-smtp-out-n03;
	Sat, 25 Feb 2017 00:08:48 -0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 203so37571526ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 16:08:47 -0800 (PST)
X-Gm-Message-State: AMke39mV29glz/VpbGlBhbTCWgqtppC8rpBXKhry7yEw46jRaqh4y8VWAiRa3Eca8gNF6eV5u5wjR0/WdG6owg==
X-Received: by 10.36.82.22 with SMTP id d22mr5431035itb.0.1487981327529; Fri,
	24 Feb 2017 16:08:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Fri, 24 Feb 2017 16:08:47 -0800 (PST)
In-Reply-To: <CA+chaQfByGPt4qL3O0PmXdENAu4iOE9N8jbi8xMdOiYUSaYsQg@mail.gmail.com>
References: <1487979579-7984-1-git-send-email-derek@asterius.io>
	<CA+chaQfByGPt4qL3O0PmXdENAu4iOE9N8jbi8xMdOiYUSaYsQg@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 24 Feb 2017 19:08:47 -0500
X-Gmail-Original-Message-ID: <CADNbA1pFnAokAtoQjxoEx-SiprKb1O2qsYQ072uvuoum1E5+zA@mail.gmail.com>
Message-ID: <CADNbA1pFnAokAtoQjxoEx-SiprKb1O2qsYQ072uvuoum1E5+zA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] system-config-keyboard: fix depends to work correctly with RSS
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
X-List-Received-Date: Sat, 25 Feb 2017 00:08:49 -0000
Content-Type: text/plain; charset=UTF-8

I'll pull it out and give it a shot.  It is probably that I just needed the
'+=' vs the '='; I just tried both at once

On Fri, Feb 24, 2017 at 7:03 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> isn't gettext-native already added by gettext inherit? Strange
>
> On Sat, Feb 25, 2017 at 12:39 AM, Derek Straka <derek@asterius.io> wrote:
>
>> Resolves build issue exposed by RSS
>>
>> See http://errors.yoctoproject.org/Errors/Details/132829/
>> and http://errors.yoctoproject.org/Errors/Details/132855/
>>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>  .../system-config-keyboard/system-config-keyboard_1.4.0.bb          | 6
>> +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/system-config-keyboard/system-conf
>> ig-keyboard_1.4.0.bb b/meta-oe/recipes-support/system-config-keyboard/
>> system-config-keyboard_1.4.0.bb
>> index f52b594..26b4412 100644
>> --- a/meta-oe/recipes-support/system-config-keyboard/system-conf
>> ig-keyboard_1.4.0.bb
>> +++ b/meta-oe/recipes-support/system-config-keyboard/system-conf
>> ig-keyboard_1.4.0.bb
>> @@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69
>> f5fce4486a80fdaf4a4263"
>>  SRC_URI = "https://fedorahosted.org/releases/s/y/${BPN}/${BP}.tar.bz2"
>>  SRC_URI[md5sum] = "c267db0ee7a2131ba418399dc17f9e72"
>>  SRC_URI[sha256sum] = "218c883e4e2bfcc82bfe07e785707
>> b5c2ece28df772f2155fd044b9bb1614284"
>> -inherit python-dir
>>
>>  inherit python-dir gettext
>> -DEPENDS = "intltool-native"
>> +DEPENDS += "intltool-native gettext-native"
>>
>>  EXTRA_OEMAKE = " \
>>      PYTHON='${STAGING_BINDIR_NATIVE}'/python-native/python \
>> @@ -27,6 +26,3 @@ FILES_${PN} += " \
>>     ${datadir}/* \
>>  "
>>  BBCLASSEXTEND = "native"
>> -
>> -PNBLACKLIST[system-config-keyboard] ?= "Fails to build with RSS
>> http://errors.yoctoproject.org/Errors/Details/132829/"
>> -PNBLACKLIST[system-config-keyboard-native] ?= "Fails to build with RSS
>> http://errors.yoctoproject.org/Errors/Details/132855/"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

