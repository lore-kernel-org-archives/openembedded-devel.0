Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 896C272FB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:54:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1488297269; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=yEqmX0uc2QfI0F9zqm988XJe90eT6jedOhylnxImuxU=;
	b=Af89zJGt85xh9YXtUnxmdMKFeTZvsievZhb8Xf0aF/JgtzBAntOn3+hBeQ7i/JOH7buo6+o6
	2NZsXjZADG1J2VS5KCXeTRK5opYgFgS+HMDYPsoHqC8P/jKPuKA1ctA11QJVlF5Y+qOXVvep
	5E/7hGkWtLDt58Qo5ixvSWv6H90=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=a8UJU2F3CDZrssjPtj/Ge831B39my7RTNkuXClkNW7e8K2eRARVmzwYioruipRlK0UmKo/
	ax7KMofSqB8Oirv5KqcakIUY0JBXUlsTnHOwSyr7cnmElUtyaXb7J2uIBjWTHY0HTax1ZHxZ
	4Lpo4Ni+BZpIVXDAmMf3G1w9YwAKs=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mxa.mailgun.org with ESMTP id 58b59d34.7fc3b05e4870-smtp-out-n02;
	Tue, 28 Feb 2017 15:54:28 -0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id 90so12070923ios.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 07:54:28 -0800 (PST)
X-Gm-Message-State: AMke39l1+KBu3mNlo7aodoc2JgqOpE0J/IgFlDsOrBNLzvgR8N4pwNW+A+SoTFvoCT2PyukX5jThQteXccdqfg==
X-Received: by 10.107.182.9 with SMTP id g9mr3022626iof.233.1488297267828;
	Tue, 28 Feb 2017 07:54:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Tue, 28 Feb 2017 07:54:27 -0800 (PST)
In-Reply-To: <CA+chaQesP+RXmj5SEkpCZdiWwZQkfLCwhQHHuiJqHcu2wRtj-w@mail.gmail.com>
References: <1487973956-9430-1-git-send-email-derek@asterius.io>
	<CA+chaQe4JwXjKwhFFG62Z3+9zrGpLfoPA+FFNqibypFQMAcrgQ@mail.gmail.com>
	<CADNbA1qfBGSOGoqMTL+oH+9khe90q_9PtiNn3wguJus5Kn6N0A@mail.gmail.com>
	<CA+chaQesP+RXmj5SEkpCZdiWwZQkfLCwhQHHuiJqHcu2wRtj-w@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 28 Feb 2017 10:54:27 -0500
X-Gmail-Original-Message-ID: <CADNbA1o_dbB+8f_Mkrc_JUog8oJrwOfYiPJs3tYpFDbgzKyRrA@mail.gmail.com>
Message-ID: <CADNbA1o_dbB+8f_Mkrc_JUog8oJrwOfYiPJs3tYpFDbgzKyRrA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] xfsprogs: update depends to work correctly with RSS
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
X-List-Received-Date: Tue, 28 Feb 2017 15:54:29 -0000
Content-Type: text/plain; charset=UTF-8

Ah, I am not.  I will add that and check it out.  Thanks.

On Tue, Feb 28, 2017 at 10:53 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Are you using gold (ld-is-gold in DISTRO_FEATURES)?
>
> On Tue, Feb 28, 2017 at 4:37 PM, Derek Straka <derek@asterius.io> wrote:
>
>> I don't understand why I'm not seeing this failure with the patch and you
>> are.  The only difference I can think of is that I do a cleansstate prior
>> to rebuilding, but I would have expected the additional DEPENDS to
>> invalidate any cached SSTATE that may have been laying around.  Any
>> thoughts?
>>
>> On Tue, Feb 28, 2017 at 4:25 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>> Unfortunately still fails with:
>>>
>>> TOPDIR/tmp-glibc/work/core2-64-oe-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.so: error: undefined reference to 'uuid_compare'
>>> TOPDIR/tmp-glibc/work/core2-64-oe-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.so: error: undefined reference to 'uuid_copy'
>>>
>>> http://errors.yoctoproject.org/Errors/Details/134287/
>>>
>>> On Fri, Feb 24, 2017 at 11:05 PM, Derek Straka <derek@asterius.io>
>>> wrote:
>>>
>>>> Resolves build issue exposed by RSS
>>>> See http://errors.yoctoproject.org/Errors/Details/130663/
>>>>
>>>> Signed-off-by: Derek Straka <derek@asterius.io>
>>>> ---
>>>>  meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb | 3 +--
>>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>>>> b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>>>> index b4c50a2..f527237 100644
>>>> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>>>> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>>>> @@ -15,6 +15,7 @@ inherit autotools-brokensep
>>>>
>>>>  PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
>>>>
>>>> +DEPENDS += "util-linux"
>>>>
>>>>  RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs ${PN}-repair"
>>>>
>>>> @@ -54,5 +55,3 @@ do_configure_prepend () {
>>>>  do_install_append() {
>>>>          oe_runmake 'DESTDIR=${D}' install install-dev
>>>>  }
>>>> -
>>>> -PNBLACKLIST[xfsprogs] ?= "Fails to build with RSS
>>>> http://errors.yoctoproject.org/Errors/Details/130663/"
>>>> --
>>>> 2.7.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>>
>>>
>>
>

