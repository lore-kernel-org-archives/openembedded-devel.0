Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 70B3060721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 01:46:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1514252770; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=NXFRx4th9EqaSj4qZQ3DUdKB5hu7uVvoBVfINJh8odI=;
	b=JQ7nPKg/FK4hIxguLjhe3rAu04/MooBPILGSu8wVAst85GFmU7wuOG0kWrqGdNXVdvtrAIqr
	hMpnB/HT01hcPAxBMNsXe9ukqNCDBmdahlJODZhecH9MMpoOgKN50D7HmRNol82GsbH2YhuK
	4UQY58Yt6zhh61KlevZd+7gCVyQ=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mxa.mailgun.org with ESMTP id 5a41a9e1.7f52cc699430-smtp-out-n02;
	Tue, 26 Dec 2017 01:46:09 -0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id q14so29531516qke.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Dec 2017 17:46:09 -0800 (PST)
X-Gm-Message-State: AKGB3mJVI5VGdBKWzW8t8slkswryKbvmC0JPMtNE9Mkj4I2fi63BjuUU
	3GsYPuM+ALoq0F++h9//9L4Z2jeK2GMY/o9TOWo=
X-Google-Smtp-Source: ACJfBot7qlj1e5NqGxF2/6gbOzuW0Jc6RevgmljuAjA6+4COtWz4LKwZOiT0+y22rcGHJgL3l3rJquAio2ct3zynZ7Y=
X-Received: by 10.55.27.156 with SMTP id m28mr8304473qkh.331.1514252768881;
	Mon, 25 Dec 2017 17:46:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Mon, 25 Dec 2017 17:46:08 -0800 (PST)
Received: by 10.140.21.177 with HTTP; Mon, 25 Dec 2017 17:46:08 -0800 (PST)
In-Reply-To: <116bf520-c8a6-cb3c-db77-6416fa23a329@windriver.com>
References: <1509554484-22352-1-git-send-email-derek@asterius.io>
	<cd040284-bf17-756a-3243-a59ecd609ffd@windriver.com>
	<CADNbA1pBRxme+0BcWt8Mfx0L++SneTh4qXPggLBtFEqQiYNUhw@mail.gmail.com>
	<116bf520-c8a6-cb3c-db77-6416fa23a329@windriver.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 25 Dec 2017 20:46:08 -0500
X-Gmail-Original-Message-ID: <CADNbA1p_g9JaQNeZMn_8euynON4Zc2Xr0ns30D98mfaUV_JOnA@mail.gmail.com>
Message-ID: <CADNbA1p_g9JaQNeZMn_8euynON4Zc2Xr0ns30D98mfaUV_JOnA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-automat: add an initial recipe for version 0.6.0
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
X-List-Received-Date: Tue, 26 Dec 2017 01:46:09 -0000
Content-Type: text/plain; charset="UTF-8"

Great.  I'll submit to rocko in the morning unless you want to do it.
Thanks for validating.

On Dec 25, 2017 8:44 PM, "ChenQi" <Qi.Chen@windriver.com> wrote:

> On 12/22/2017 10:18 PM, Derek Straka wrote:
>
> Chen,
>
> Thanks for bringing this up.  Take a look here to see if this proposed
> patchset fixes your issue: http://lists.openembedded.org/
> pipermail/openembedded-devel/2017-December/116094.html.
>
> -Derek
>
>
> Derek,
>
> Thanks!
> Your patch works.
>
> Best Regards,
> Chen Qi
>
> On Fri, Dec 22, 2017 at 4:54 AM, ChenQi <Qi.Chen@windriver.com> wrote:
>
>> Hi Derek,
>>
>> I noticed in Automat's setup.py script:
>>
>>     setup_requires=[
>>         'setuptools-scm',
>>         'm2r',
>>     ],
>>     install_requires=[
>>         "attrs",
>>         "six",
>>     ],
>>
>> Now the installed_requires entry is handled by the RDEPENDS meta data in
>> recipe.
>> How about the setup_requires entry? Do you know how to handle it in
>> recipe?
>>
>> I'm asking this because when I build python-automat on my host, I met
>> do_compile error because of being able to download the m2r and
>> setuptools-scm.
>>
>> Ideally, we should be able to compile a recipe out without reaching out
>> to the Internet, as long as the recipe's tarball is available in the DL_DIR.
>>
>> Best Regards,
>> Chen Qi
>>
>>
>> On 11/02/2017 12:41 AM, Derek Straka wrote:
>>
>>> Signed-off-by: Derek Straka <derek@asterius.io>
>>> ---
>>>   meta-python/recipes-devtools/python/python-automat.inc   | 16
>>> ++++++++++++++++
>>>   .../recipes-devtools/python/python-automat_0.6.0.bb      |  2 ++
>>>   .../recipes-devtools/python/python3-automat_0.6.0.bb     |  4 ++++
>>>   3 files changed, 22 insertions(+)
>>>   create mode 100644 meta-python/recipes-devtools/p
>>> ython/python-automat.inc
>>>   create mode 100644 meta-python/recipes-devtools/python/
>>> python-automat_0.6.0.bb
>>>   create mode 100644 meta-python/recipes-devtools/python/
>>> python3-automat_0.6.0.bb
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python-automat.inc
>>> b/meta-python/recipes-devtools/python/python-automat.inc
>>> new file mode 100644
>>> index 0000000..1ac5d3b
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python-automat.inc
>>> @@ -0,0 +1,16 @@
>>> +DESCRIPTION = "Self-service finite-state machines for the programmer on
>>> the go"
>>> +HOMEPAGE = "https://github.com/glyph/Automat"
>>> +LICENSE = "MIT"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca
>>> 81688e94593e5f60c87477"
>>> +
>>> +SRC_URI[md5sum] = "ad7bba58d262d8956d732330cb5ef53d"
>>> +SRC_URI[sha256sum] = "3c1fd04ecf08ac87b4dd3feae4095
>>> 42e9bf7827257097b2b6ed5692f69d6f6a8"
>>> +
>>> +PYPI_PACKAGE = "Automat"
>>> +
>>> +inherit pypi
>>> +
>>> +RDEPENDS_${PN} += "\
>>> +   ${PYTHON_PN}-attrs \
>>> +   ${PYTHON_PN}-six \
>>> +"
>>> diff --git a/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
>>> b/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
>>> new file mode 100644
>>> index 0000000..8ac8c9c
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
>>> @@ -0,0 +1,2 @@
>>> +inherit setuptools
>>> +require python-automat.inc
>>> diff --git a/meta-python/recipes-devtools/python/python3-automat_0.6.0.
>>> bb b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
>>> new file mode 100644
>>> index 0000000..0469e61
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
>>> @@ -0,0 +1,4 @@
>>> +inherit setuptools3
>>> +require python-automat.inc
>>> +
>>> +RDEPENDS_${PN} += "${PYTHON_PN}-enum "
>>>
>>
>>
>
>

