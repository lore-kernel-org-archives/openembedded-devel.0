Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF4771C54
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 14:18:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513952338; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=NWQAB+5bBjKJOTtZwkfk0bF0QfTBjzJz5oXq88m+0vY=;
	b=TfHkm1Qk0YSnR5fEaqmk+vcLDSml1mGBJUQhWUfCUsLHrQYSj7uE9Gxe+fYI+CHYWjbIdVYJ
	dlzz0w4fopZttwUpPeXp2ol/6S8ZFLDKGUy3Aun+tbJUiG/X8bbZMp7cpIfVwFeMZswr0ryJ
	7CIwTYi34k9mJFJB4KsHv1p4ycg=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mxa.mailgun.org with ESMTP id 5a3d1452.7f9b140723b0-smtp-out-n03;
	Fri, 22 Dec 2017 14:18:58 -0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id j137so17120006qke.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 06:18:58 -0800 (PST)
X-Gm-Message-State: AKGB3mIsvNKm11SbX+I9t9DUsBxoYhE70XEHZTGgnXf8owZoXmRJ3neD
	rZ6zFSKn5cOWXa+7gkJTVJemSA+c4CNsZr5+3a8=
X-Google-Smtp-Source: ACJfBoubOeZP3xbH2Kw7tp+gADxqGVum6dEBpXUc10Jv3cI1OoabTniEwUO0vBcQy6itssotR/AEpsYexLAJKZFbewk=
X-Received: by 10.55.153.194 with SMTP id b185mr17177525qke.230.1513952338435; 
	Fri, 22 Dec 2017 06:18:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Fri, 22 Dec 2017 06:18:57 -0800 (PST)
In-Reply-To: <cd040284-bf17-756a-3243-a59ecd609ffd@windriver.com>
References: <1509554484-22352-1-git-send-email-derek@asterius.io>
	<cd040284-bf17-756a-3243-a59ecd609ffd@windriver.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 22 Dec 2017 09:18:57 -0500
X-Gmail-Original-Message-ID: <CADNbA1pBRxme+0BcWt8Mfx0L++SneTh4qXPggLBtFEqQiYNUhw@mail.gmail.com>
Message-ID: <CADNbA1pBRxme+0BcWt8Mfx0L++SneTh4qXPggLBtFEqQiYNUhw@mail.gmail.com>
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
X-List-Received-Date: Fri, 22 Dec 2017 14:18:58 -0000
Content-Type: text/plain; charset="UTF-8"

Chen,

Thanks for bringing this up.  Take a look here to see if this proposed
patchset fixes your issue:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-December/116094.html
.

-Derek

On Fri, Dec 22, 2017 at 4:54 AM, ChenQi <Qi.Chen@windriver.com> wrote:

> Hi Derek,
>
> I noticed in Automat's setup.py script:
>
>     setup_requires=[
>         'setuptools-scm',
>         'm2r',
>     ],
>     install_requires=[
>         "attrs",
>         "six",
>     ],
>
> Now the installed_requires entry is handled by the RDEPENDS meta data in
> recipe.
> How about the setup_requires entry? Do you know how to handle it in recipe?
>
> I'm asking this because when I build python-automat on my host, I met
> do_compile error because of being able to download the m2r and
> setuptools-scm.
>
> Ideally, we should be able to compile a recipe out without reaching out to
> the Internet, as long as the recipe's tarball is available in the DL_DIR.
>
> Best Regards,
> Chen Qi
>
>
> On 11/02/2017 12:41 AM, Derek Straka wrote:
>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>   meta-python/recipes-devtools/python/python-automat.inc   | 16
>> ++++++++++++++++
>>   .../recipes-devtools/python/python-automat_0.6.0.bb      |  2 ++
>>   .../recipes-devtools/python/python3-automat_0.6.0.bb     |  4 ++++
>>   3 files changed, 22 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/p
>> ython/python-automat.inc
>>   create mode 100644 meta-python/recipes-devtools/python/
>> python-automat_0.6.0.bb
>>   create mode 100644 meta-python/recipes-devtools/python/
>> python3-automat_0.6.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-automat.inc
>> b/meta-python/recipes-devtools/python/python-automat.inc
>> new file mode 100644
>> index 0000000..1ac5d3b
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-automat.inc
>> @@ -0,0 +1,16 @@
>> +DESCRIPTION = "Self-service finite-state machines for the programmer on
>> the go"
>> +HOMEPAGE = "https://github.com/glyph/Automat"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
>> +
>> +SRC_URI[md5sum] = "ad7bba58d262d8956d732330cb5ef53d"
>> +SRC_URI[sha256sum] = "3c1fd04ecf08ac87b4dd3feae4095
>> 42e9bf7827257097b2b6ed5692f69d6f6a8"
>> +
>> +PYPI_PACKAGE = "Automat"
>> +
>> +inherit pypi
>> +
>> +RDEPENDS_${PN} += "\
>> +   ${PYTHON_PN}-attrs \
>> +   ${PYTHON_PN}-six \
>> +"
>> diff --git a/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
>> b/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
>> new file mode 100644
>> index 0000000..8ac8c9c
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
>> @@ -0,0 +1,2 @@
>> +inherit setuptools
>> +require python-automat.inc
>> diff --git a/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
>> b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
>> new file mode 100644
>> index 0000000..0469e61
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
>> @@ -0,0 +1,4 @@
>> +inherit setuptools3
>> +require python-automat.inc
>> +
>> +RDEPENDS_${PN} += "${PYTHON_PN}-enum "
>>
>
>

