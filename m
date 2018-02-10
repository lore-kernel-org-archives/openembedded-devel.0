Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 540A978449
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 14:46:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1518274012; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=bDbIZ52Y4jY3ZLa+/upBw5lljq4Ankyu5oAl9ppCpY4=;
	b=okUv8GsH2oJgkomE90tQ+KiGKgFr7QRomPuguBtXwjcveeWApLmif1v9hgfM06FlmiQMEAAd
	p2VlhDs4QAaiZcCqp8dkfl4+ECeNkLDHcoTujbknbY3sKy5xxuG1WzZ0tdZgb6WqUwupUlxd
	iHJceaJVcayJvVdq4hEsVC4Uvcc=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mxa.mailgun.org with ESMTP id 5a7f05dc.7fec686e7bf0-smtp-out-n03;
	Sat, 10 Feb 2018 14:46:52 -0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id x127so13546131qkb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 06:46:52 -0800 (PST)
X-Gm-Message-State: APf1xPAEJLTiIdmB0ADghqq5Z73eIxAeKBzaqGrA890hISjNvBjlQWUR
	HD1QboOLJHbZ45EVGcXJnCfqvt4TKcaXxb0MkjA=
X-Google-Smtp-Source: AH8x224pCN1tv8xyjaANk83/7qtd895w3FU+y2+T9QOa8WUgH2lHdhOpN3QTienl0QgAlw17oXEU4a7ta4k1yaJsMSo=
X-Received: by 10.233.223.134 with SMTP id t128mr9769738qkf.121.1518274011925; 
	Sat, 10 Feb 2018 06:46:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.81.10 with HTTP; Sat, 10 Feb 2018 06:46:51 -0800 (PST)
In-Reply-To: <CA+chaQcZvX7f-yuZHxM_+urhOquTNg1iTv3ev5s9b-vfoE2VmA@mail.gmail.com>
References: <1518098282-23564-1-git-send-email-derek@asterius.io>
	<CA+chaQdUtAC0EkTiebPUYBWybk972E89x2tTNvAnC2r0cMpVqw@mail.gmail.com>
	<CA+chaQcZvX7f-yuZHxM_+urhOquTNg1iTv3ev5s9b-vfoE2VmA@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Sat, 10 Feb 2018 09:46:51 -0500
X-Gmail-Original-Message-ID: <CADNbA1rxe2=ho8ynOH+dus89tjbocyooV=8O6N5wF1Dd8uFqAA@mail.gmail.com>
Message-ID: <CADNbA1rxe2=ho8ynOH+dus89tjbocyooV=8O6N5wF1Dd8uFqAA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-smbus: remove sed to replace i2c path
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
X-List-Received-Date: Sat, 10 Feb 2018 14:46:51 -0000
Content-Type: text/plain; charset="UTF-8"

Bumped the PR and sent a V2.  Thanks for catching that.

On Sat, Feb 10, 2018 at 5:35 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> There is small issue I've noticed in incremental builds.. when
> do_configure is re-executed in the same WORKDIR where this sed was already
> executed it will fail with the same error about missing i2c-dev-user.h.
>
> It can be fixed by additional PR bump to force new WORKDIR.
>
> On Fri, Feb 9, 2018 at 8:16 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Thanks, works for me.
>>
>> On Thu, Feb 8, 2018 at 2:58 PM, Derek Straka <derek@asterius.io> wrote:
>>
>>> The i2c-dev file is now installed in the standard location, so
>>> the sed to change the path can be removed
>>>
>>> Signed-off-by: Derek Straka <derek@asterius.io>
>>> ---
>>>  meta-python/recipes-devtools/python/python-smbus.inc | 6 ------
>>>  1 file changed, 6 deletions(-)
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python-smbus.inc
>>> b/meta-python/recipes-devtools/python/python-smbus.inc
>>> index 0bca58f..57ca8ae 100644
>>> --- a/meta-python/recipes-devtools/python/python-smbus.inc
>>> +++ b/meta-python/recipes-devtools/python/python-smbus.inc
>>> @@ -9,9 +9,3 @@ SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62
>>> f2054bb39f19961d67e0c91610f07
>>>  DEPENDS += "i2c-tools"
>>>
>>>  S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
>>> -
>>> -do_configure_prepend() {
>>> -    # Adjust for OE header rename
>>> -    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: Module.mk
>>> -    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: smbusmodule.c
>>> -}
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>
>

