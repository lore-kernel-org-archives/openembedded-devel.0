Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id B570C607A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 12:41:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1468240907; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=Y5QQGSI986xlD3s9jPmmdCDtboEG4u77P1pEImT5q4M=;
	b=vmkRLPO/32ftsggnl6ICgpatAL6jP7eWi0c+YfBHPzdwbWbhmTNI/t0tEmoz/puL8e0hWbLH
	PJOGhHjwnIkLQlh9zU0nbGPPrstb2cIH66V0SPx+6C+6BkyaSSRHtAoTmOJcmQ0MpJcO102g
	e+S+bk0YiWwlcdBb0g2kxoCm9RM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=rXSeMwXYlk4RkL7eWPlbsVgFQuY5PYPdXdnHpdIrqqr8alzKywBjb+pdFSgbsOZEao2uyY
	6f7arktNlM97qFeVDfwtiaqlNCc1bbofabfZCj0tl+fy8Uv7A4HWD2FdkHcgUaflvdxv1m9R
	pGzOiNynxILdooXKSRqGsHI615uAM=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mxa.mailgun.org with ESMTP id 5783940b.7f61c445a5f0-in3;
	Mon, 11 Jul 2016 12:41:47 -0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 38so4909035iol.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 05:41:47 -0700 (PDT)
X-Gm-Message-State: ALyK8tLCIijXHMHAcGfmzhnVsLLRK3L+5HHtFWhV6BJXF/idcF/lgcb+AGRDz6Mfz0XQjZBI6z6AOG7keZD6qw==
X-Received: by 10.107.18.225 with SMTP id 94mr18561926ios.157.1468240906846;
	Mon, 11 Jul 2016 05:41:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.178.215 with HTTP; Mon, 11 Jul 2016 05:41:46 -0700 (PDT)
In-Reply-To: <57836590.7@windriver.com>
References: <1467619576-13899-1-git-send-email-mingli.yu@windriver.com>
	<1467619576-13899-6-git-send-email-mingli.yu@windriver.com>
	<CANx9H-DVRsHZGBJVkc2k1p4fTdWOchBhQBnm3Y8HuhTtiuzwMA@mail.gmail.com>
	<57836590.7@windriver.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 11 Jul 2016 08:41:46 -0400
X-Gmail-Original-Message-ID: <CADNbA1pfxK1PNxXXEmP9281MzvsnBtVU+iAbMpjUkpqRjdLy0A@mail.gmail.com>
Message-ID: <CADNbA1pfxK1PNxXXEmP9281MzvsnBtVU+iAbMpjUkpqRjdLy0A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v2 5/5] python-setuptools-scm: Add python-setuptools-scm bb
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
X-List-Received-Date: Mon, 11 Jul 2016 12:41:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Could you use PYPI_PACKAGE =3D "setuptools_scm" to override the default pyp=
i
package name?

On Mon, Jul 11, 2016 at 5:23 AM, Yu, Mingli <mingli.yu@windriver.com> wrote=
:

>
>
> On 2016=E5=B9=B407=E6=9C=8809=E6=97=A5 01:09, Tim Orling wrote:
>
>> Built ok for beaglebone.
>>
>> NOTE: SRC_URI probably not required with Derek's pypi.bbclass patch
>> https://patchwork.openembedded.org/patch/125551/ but I did not test for
>> that.
>>
> We still need this SRC_URI as we do translation for the package
> python-setuptools-scm as the previous packages name as
> python-setuptools_scm which includes underline=EF=BC=8C but the package n=
ame part
> can't include underline for a recipe name.
>
> Thanks,
> Grace
>
>>
>>
>> Acked-by: Tim Orling (Intel OpenSource Technology Center) <
>> ticotimo@gmail.com>
>>
>> On Mon, Jul 4, 2016 at 1:06 AM, <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>>
>>> * Add python-setuptools-scm bb as python-pytest-runner depends
>>>    on python-setuptools-scm
>>>
>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> ---
>>>   .../python/python-setuptools-scm_1.11.1.bb             | 18
>>> ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>   create mode 100644 meta-python/recipes-devtools/python/
>>> python-setuptools-scm_1.11.1.bb
>>>
>>> diff --git a/meta-python/recipes-devtools/python/
>>> python-setuptools-scm_1.11.1.bb b/meta-python/recipes-devtools/python/
>>> python-setuptools-scm_1.11.1.bb
>>> new file mode 100644
>>> index 0000000..2a3b97d
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/
>>> python-setuptools-scm_1.11.1.bb
>>> @@ -0,0 +1,18 @@
>>> +SUMMARY =3D "the blessed package to manage your versions by scm tags"
>>> +LICENSE =3D "MIT"
>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D838c366f69b72c5df05c96dff79=
b35f2"
>>> +
>>> +inherit pypi setuptools
>>> +
>>> +SRCNAME =3D "setuptools_scm"
>>> +
>>> +SRC_URI =3D "
>>>
>>> https://pypi.python.org/packages/84/aa/c693b5d41da513fed3f0ee27f1bf02a3=
03caa75bbdfa5c8cc233a1d778c4/${SRCNAME}-${PV}.tar.gz
>>> "
>>> +
>>> +SRC_URI[md5sum] =3D "4d19b2bc9580016d991f665ac20e2e8f"
>>> +SRC_URI[sha256sum] =3D
>>> "8c45f738a23410c5276b0ed9294af607f491e4260589f1eb90df8312e23819bf"
>>> +
>>> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>>> +
>>> +RDEPENDS_${PN} =3D "python-py python-setuptools python-argparse
>>> python-debugger python-json"
>>> +
>>> +
>>> --
>>> 2.8.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

