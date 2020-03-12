Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1E38861C2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 03:37:20 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id d14so3618763ilq.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 20:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kgCYnJAzaqiH50BejOLSzrxW5q5VV3lfv3eQwyUTjwk=;
	b=E7qMCy9JdHybFVlE21NDkqdW5fgm+6lt11qbwKn2dnbCCnYspx1hm2Tq9KXlh1beNQ
	Cbgqs+H99seR2hT3d71k0kRRLFWRSk94CWaiftGgqcs15NO3QhT9wZJQs6ay9Mc+1gLs
	ycUmpFShh0J2JkSP2tFhmHP+92OVVeYYzT6JhT5VJQSNh65XKSD0GZ5BnJbRZHjkhCl9
	QdvAnpIwDtXmMoYD5akmZ06SfetE3G4XjRABGlX16wGfCJRX/7yUcsrHTlffVp9salWY
	0aj/xxANQFRsG6Sk67z2Hm62ivUgygvHNgFJz+R4mNN/TIsOLQHzk89gv0iC0GAai9fe
	bNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kgCYnJAzaqiH50BejOLSzrxW5q5VV3lfv3eQwyUTjwk=;
	b=HVhv69qLB1Ga6b0gRl6PVTXJ6Q+pPmGu/Jo+oG4rmcG0suobGw5nhbpeGg4B6U4o/Q
	cK3fw432ZkcnJqXw577QT1UQeh4vlmXLmWcJ2prtJopoC5Ns43WT+IY9sIstw45QT4oz
	KSYLjNIk47a8BYMcwDInWJpmh/synEh/ReybYqmbKDZTkJjV5kxgQsvGqpFgt+Rgz7i4
	OnvEFNmn1ckbBkh1UO6AmG+NDuCZcEyis6jQHZTEz+ZLhGvEOf/zneZ3VUCYBepSb0by
	NioHlMTb0gMCgCq12qzcYKHlFvXafeN7zzB4ZkJv3FYapyM1JTZFtLkaE1FEFRUgyRXY
	A1Wg==
X-Gm-Message-State: ANhLgQ2trvAanEQPBgtB0HzgNSszuJgkjYNWD+DDb4JjKWh2cbibXTlU
	amQ03JrYsZUEnjLfjiuLfdx5JkAbWJNJVAZvBQg=
X-Google-Smtp-Source: ADFU+vv3fH0mDHKQlZVsbiTGNu7Meon3PpsOpNcpZ66g4KPcVUfF/LsHp41q1MUQxCCpXqs044AMd+HOfDG7NPFi1mk=
X-Received: by 2002:a92:911b:: with SMTP id t27mr6249608ild.142.1583984241771; 
	Wed, 11 Mar 2020 20:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200310024936.18941-1-scott.branden@broadcom.com>
	<CANx9H-A_bpFV7c+u_-3p23a4kUmjiuQ+FUE5LqtKu2_rDW+BzQ@mail.gmail.com>
	<2bdaa8bf-73cd-18d4-fbf7-2f08469e7a00@broadcom.com>
	<CAAr5zNcMr=PuSfM5sQ4oSFFwpVX8rjKuYOHoawOxtgs89jom_w@mail.gmail.com>
	<CA+JzhdJO5KR8+McWj8gBKsW0k4TuWH=WB47DdbNtiPcGvBfZAg@mail.gmail.com>
In-Reply-To: <CA+JzhdJO5KR8+McWj8gBKsW0k4TuWH=WB47DdbNtiPcGvBfZAg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 11 Mar 2020 20:37:10 -0700
Message-ID: <CANx9H-DknFT=arvxEvTiKktBUS2ONZt9wDGDA=4mwz_YuQvCog@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Vikram Prakash <vikram.prakash@broadcom.com>
Subject: Re: [meta-python][PATCH] python3-pycryptodomex: add 3.9.4 recipe
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
X-List-Received-Date: Thu, 12 Mar 2020 03:37:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 11, 2020 at 8:02 PM Scott Branden <scott.branden@broadcom.com>
wrote:

> So no changes to make.  Could we get this added to master-next?
>

My concerns have been addressed.

Thank you everyone for the time you took to research the state of things.

Reviewed-by: Tim Orling <ticotimo@gmail.com>

>
> On Tue, 10 Mar 2020 at 20:48, Rajesh Ravi <rajesh.ravi@broadcom.com>
> wrote:
>
>> ++
>>
>> Hi Scott,
>>
>> A)I tried a lot no other recipe could resolve OP-TEE 3.8.0 build break.
>> I posted this in OP-TEE as well as meta-openembedded forums.
>> This is the only solution suggested in following OP-TEE forum and  I
>> found to be worked as per my knowledge.
>>
>> Ref: https://github.com/OP-TEE/optee_os/issues/3624
>>
>>        https://github.com/openembedded/meta-openembedded/issues/187
>>
>> python3-pycryptodome could not resolve all the required dependencies
>> needed by OP-TEE 3.8.0
>>
>> B)Already existing recipe: python-pycryptodomex_3.9.4.bb does not have
>> RCONFLICTS. (even with python3-pycryptodome_3.9.4.bb)
>>    Is this probably because there is no  python-pycryptodome recipe?
>> Please correct me if I'm wrong
>>
>> Regards,
>> Rajesh
>>
>>
>>
>>
>>
>>
>>
>>
>>
>> On Wed, Mar 11, 2020 at 12:45 AM Scott Branden <
>> scott.branden@broadcom.com> wrote:
>>
>>>
>>>
>>> On 2020-03-09 10:50 p.m., Tim Orling wrote:
>>>
>>> This probably should have an RCONFLICTS with python3-cryptodme (and
>>> maybe even python3-crypto).
>>>
>>> These three packages step all over each other with same functionality...
>>>
>>>
>>> Good feedback Tim.
>>>
>>> Rajesh, could you look if the other recipes do what is needed or can be
>>> enhanced and used instead?
>>>
>>>
>>> On Mon, Mar 9, 2020 at 7:50 PM Scott Branden via Openembedded-devel <
>>> openembedded-devel@lists.openembedded.org> wrote:
>>>
>>>> From: Rajesh Ravi <rajesh.ravi@broadcom.com>
>>>>
>>>> Add python3-pycryptodomex 3.9.4 recipe needed to build
>>>> such components as optee 3.8.0.
>>>>
>>>> Signed-off-by: Rajesh Ravi <rajesh.ravi@broadcom.com>
>>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>>>> ---
>>>>  .../python/python3-pycryptodomex_3.9.4.bb     | 30 +++++++++++++++++++
>>>>  1 file changed, 30 insertions(+)
>>>>  create mode 100644 meta-python/recipes-devtools/python/
>>>> python3-pycryptodomex_3.9.4.bb
>>>>
>>>> diff --git a/meta-python/recipes-devtools/python/
>>>> python3-pycryptodomex_3.9.4.bb b/meta-python/recipes-devtools/python/
>>>> python3-pycryptodomex_3.9.4.bb
>>>> new file mode 100644
>>>> index 000000000..be6b10f3f
>>>> --- /dev/null
>>>> +++ b/meta-python/recipes-devtools/python/
>>>> python3-pycryptodomex_3.9.4.bb
>>>> @@ -0,0 +1,30 @@
>>>> +SUMMARY = "Cryptographic library for Python"
>>>> +DESCRIPTION = "PyCryptodome is a self-contained Python package of
>>>> low-level\
>>>> + cryptographic primitives."
>>>> +HOMEPAGE = "http://www.pycryptodome.org"
>>>> +LICENSE = "PD & BSD-2-Clause"
>>>> +LIC_FILES_CHKSUM =
>>>> "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
>>>> +
>>>> +SRC_URI[md5sum] = "46ba513d95b6e323734074d960a7d57b"
>>>> +SRC_URI[sha256sum] =
>>>> "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3967167"
>>>> +
>>>> +inherit pypi
>>>> +inherit setuptools3
>>>> +
>>>> +RDEPENDS_${PN} += " \
>>>> +    ${PYTHON_PN}-io \
>>>> +    ${PYTHON_PN}-math \
>>>> +"
>>>> +
>>>> +RDEPENDS_${PN}-tests += " \
>>>> +    ${PYTHON_PN}-unittest \
>>>> +"
>>>> +
>>>> +PACKAGES =+ "${PN}-tests"
>>>> +
>>>> +FILES_${PN}-tests += " \
>>>> +    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
>>>> +    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
>>>> +"
>>>> +
>>>> +BBCLASSEXTEND = "native nativesdk"
>>>> --
>>>> 2.17.1
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
>> --
>> Regards,
>> Rajesh
>>
>

