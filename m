Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TCSgQ-0000XV-ET
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 11:59:34 +0200
Received: by iebc11 with SMTP id c11so6767047ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 02:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=ecJ/NKkSVGLF3PQKwYI1DE1mGcTQ8jX/jxCSRZQKrdc=;
	b=OZyeXjGouuLWx+Ompvh3FWm62C/C5Ezi/1eO9bgudG+HVvsgRuC7rQaAh9Wyv38pgq
	6Z0hETIHuRVE2g0T0B2DtYe7YYx0/xE83+5MTNTAToBSFlvQQD3+xzDB3StmzbxmRSon
	f0cOfI+1S5o/SQpwwuAmsCAmgCHMXeRP9f8W4+FMgCAe0LJGRPSB0uep/5zzqkZD9Mlb
	u8mTsRD1L6rzcujDqiqaQuMm+eVS5v5+QePOH2Gqftb8dGTfQXc7nlbCorh6FbOyasd/
	YeSiWcqdz0MZ07/nnrOrgH1BpWZjLi5FNIRLCWIAF7d3ksFLOxO0pgQEt/F6BCbH006T
	pxcQ==
Received: by 10.50.159.201 with SMTP id xe9mr2444692igb.63.1347616019236; Fri,
	14 Sep 2012 02:46:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.129.232 with HTTP; Fri, 14 Sep 2012 02:46:39 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <5052EE59.4060409@communistcode.co.uk>
References: <1346931347-8672-1-git-send-email-ml@communistcode.co.uk>
	<CAK18fxE277_zyJF=Xv955KusWwAcyD=ve09w3Cj35Xm0tU-5tw@mail.gmail.com>
	<504EF1BA.3070509@communistcode.co.uk>
	<CAK18fxHzsBhpqEimD6+RfGn2eo24nqU5Zx_DGUiXSorUDYjLFQ@mail.gmail.com>
	<5052EE59.4060409@communistcode.co.uk>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 14 Sep 2012 12:46:39 +0300
Message-ID: <CAK18fxGWDZqrYtO9gRsXgwEbh1DMksQp9Xhbs8-J2WNPF1ifdA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnrdnosRsbQVRdv1oOtfSdEHasw0H6kF4/YPhUTMHniksOuXB7GXBJry8CyTtUcyVNBH4x8
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCHv5][meta-oe 1/2] liblockdev: new recipe, new version of libcec requires it
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 09:59:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 14, 2012 at 11:44 AM, Jack Mitchell <ml@communistcode.co.uk>wrote:

> On 13/09/12 22:54, Andrei Gherzan wrote:
>
>> On Tue, Sep 11, 2012 at 11:09 AM, Jack Mitchell <ml@communistcode.co.uk
>> >wrote:
>>
>>  On 10/09/12 21:13, Andrei Gherzan wrote:
>>>
>>>  On Thu, Sep 6, 2012 at 2:35 PM, <ml@communistcode.co.uk> wrote:
>>>>
>>>>   From: Jack Mitchell <jack.mitchell@dbbroadcast.co.****uk<
>>>> jack.mitchell@**dbbroadcast.co.uk <jack.mitchell@dbbroadcast.co.uk>>
>>>>
>>>>> V5
>>>>>
>>>>> - FILES_{PN} no loger required now libdir and includedir are passed to
>>>>> oe_runmake
>>>>>
>>>>> V4
>>>>>
>>>>> - Remove debian packaging patch, it is not needed
>>>>>
>>>>> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.****uk<
>>>>> jack.mitchell@**dbbroadcast.co.uk <jack.mitchell@dbbroadcast.co.uk>>
>>>>> ---
>>>>>    .../recipes-extended/****liblockdev/liblockdev_1.0.3.bb  | 20
>>>>> ++++++++++++++++++++
>>>>>    1 file changed, 20 insertions(+)
>>>>>    create mode 100644 meta-oe/recipes-extended/****liblockdev/
>>>>> liblockdev_1.0.3.bb
>>>>>
>>>>> diff --git a/meta-oe/recipes-extended/****
>>>>> liblockdev/liblockdev_1.0.3.**
>>>>> bbb/meta-oe/recipes-extended/****liblockdev/
>>>>> liblockdev_1.0.3.bb
>>>>> new file mode 100644
>>>>> index 0000000..210a47b
>>>>> --- /dev/null
>>>>> +++ b/meta-oe/recipes-extended/****liblockdev/liblockdev_1.0.3.bb
>>>>> @@ -0,0 +1,20 @@
>>>>> +DESCRIPTION = "Manage character and block device lockfiles."
>>>>> +HOMEPAGE = "
>>>>> http://anonscm.debian.org/****gitweb/?p=lockdev/lockdev.git;**
>>>>> **a=summary<http://anonscm.debian.org/**gitweb/?p=lockdev/lockdev.git;**a=summary>
>>>>> <http://anonscm.**debian.org/gitweb/?p=lockdev/**lockdev.git;a=summary<http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary>
>>>>> >
>>>>> "
>>>>> +
>>>>> +LICENSE = "LGPLv2.1"
>>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=****
>>>>> d8045f3b8f929c1cb29a1e3fd737b4
>>>>> **99"
>>>>> +
>>>>> +SRC_URI = "
>>>>> http://ftp.de.debian.org/****debian/pool/main/l/lockdev/**<http://ftp.de.debian.org/**debian/pool/main/l/lockdev/**>
>>>>> lockdev_${PV}.orig.tar.gz<http**://ftp.de.debian.org/debian/**
>>>>> pool/main/l/lockdev/lockdev_$%**7BPV%7D.orig.tar.gz<http://ftp.de.debian.org/debian/pool/main/l/lockdev/lockdev_$%7BPV%7D.orig.tar.gz>
>>>>> >
>>>>> "
>>>>> +
>>>>> +SRC_URI[md5sum] = "****64b9c1b87b125fc348e892e2462552****4a"
>>>>> +SRC_URI[sha256sum] =
>>>>> "****ccae635d7ac3fdd50897eceb250872******
>>>>> b3d9a191d298f213e7f0c836910d86****9f82"
>>>>> +
>>>>> +S = "${WORKDIR}/lockdev-${PV}"
>>>>> +
>>>>> +do_compile() {
>>>>> +  oe_runmake CC="${CC}" LD="${LD}" shared
>>>>> +}
>>>>> +
>>>>> +do_install() {
>>>>> +  oe_runmake basedir="${D}" incdir="${D}${includedir}"
>>>>> libdir="${D}${libdir}" install_dev
>>>>> +}
>>>>>
>>>>>   Why install only _dev? Why don't you use make install? It makes no
>>>>>
>>>> sense to
>>>> compile shared and not install it... I just tested your recipe.
>>>>
>>>>
>>>>  I cleaned a little your recipe and sent a pull request (added you as
>> Signed
>> of by).
>> https://github.com/**openembedded/meta-oe/pull/10<https://github.com/openembedded/meta-oe/pull/10>
>>
>> ag
>> ______________________________**_________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>> openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>
>
> Looks good, my only gripe is that you have listed basedir twice in the
> EXTRA_OEMAKE.
>
> Don't ask. :) Amended. Thanks.

ag

