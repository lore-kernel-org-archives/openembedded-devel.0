Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T9I49-00035a-DW
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 18:02:57 +0200
Received: by obblz20 with SMTP id lz20so506644obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 08:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=YB5wg40cLBfhVc403hOOAgPyFfLQ10zOwQOScr3Bzgk=;
	b=C8uuUk0Cuc4uKsr77tXriHWfSDFsJ8oA5Ix2fMtjIz62ZAsglh0dPK/008DxBe5goO
	D7otcAawmevdzsT+AtJDIwkrJO+T2tPrZOhvCiDgPZyzaKOefhAWxbuuRUtDUzJzqFjV
	1R+pmho2haNdeejVbvbeUiv+xZoJSpG2EYjlIxpj2qrdXzsSit/+PlmcqxdgdTH12t5d
	y5O7e3QYQbiICNx0Puyb4Y2C65BoHCgsVn/AmOMIl0nhbw3jA5mT93en1MjD+GKeJKJK
	pdCFjRkFfpmY43oo1o/7fIPts2f2ZWIJAoRSGAhD6tI7n4W8z0za5Tas85mGD24RCWgk
	YHKw==
Received: by 10.60.13.226 with SMTP id k2mr17459826oec.14.1346860233621; Wed,
	05 Sep 2012 08:50:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.93.35 with HTTP; Wed, 5 Sep 2012 08:50:13 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <50477479.70400@communistcode.co.uk>
References: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
	<1346858494-4849-2-git-send-email-ml@communistcode.co.uk>
	<CAK18fxG8PpuVYW0UXZwRKghn1duy2FwhL2RWt_cP82XX33srcA@mail.gmail.com>
	<50477479.70400@communistcode.co.uk>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 5 Sep 2012 18:50:13 +0300
Message-ID: <CAK18fxHcOd+iC13o6E_3sH2ujShxQD8Cg6scq-h+6Uzs-4RmBg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlZK4FA4+dBrvs0DKq5NsdofQ5xBU1JrsUNC2XGj84PU40EEYFj2MuyjO1REpxCflRwhyLn
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCHv4 2/3] liblockdev: new recipe, new version of libcec requires it
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
X-List-Received-Date: Wed, 05 Sep 2012 16:02:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 5, 2012 at 6:49 PM, Jack Mitchell <ml@communistcode.co.uk>wrote:

> On 05/09/12 16:41, Andrei Gherzan wrote:
>
>> On Wed, Sep 5, 2012 at 6:21 PM, <ml@communistcode.co.uk> wrote:
>>
>>  From: Jack Mitchell <jack.mitchell@dbbroadcast.co.**uk<jack.mitchell@dbbroadcast.co.uk>
>>> >
>>>
>>> V4
>>>
>>> - Remove debian packaging patch, it is not needed
>>>
>>>
>>>  What means it is not needed anymore? Included in upstream? Fixed in
>> yocto?
>>
>>
>>  Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.**uk<jack.mitchell@dbbroadcast.co.uk>
>>> >
>>> ---
>>>   .../liblockdev/liblockdev_1.0.**3.bb <http://liblockdev_1.0.3.bb>
>>>             | 26
>>> ++++++++++++++++++++++
>>>   1 file changed, 26 insertions(+)
>>>   create mode 100644 meta-oe/recipes-extended/**liblockdev/
>>> liblockdev_1.0.3.bb
>>>
>>>
>>>  Where is the removed patch?
>>
>>
>>  diff --git a/meta-oe/recipes-extended/**liblockdev/liblockdev_1.0.3.**
>>> bbb/meta-oe/recipes-extended/**liblockdev/
>>> liblockdev_1.0.3.bb
>>> new file mode 100644
>>> index 0000000..be5ce44
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/**liblockdev/liblockdev_1.0.3.bb
>>> @@ -0,0 +1,26 @@
>>> +DESCRIPTION = "Manage character and block device lockfiles."
>>> +HOMEPAGE = "
>>> http://anonscm.debian.org/**gitweb/?p=lockdev/lockdev.git;**a=summary<http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary>
>>> "
>>> +
>>> +LICENSE = "LGPLv2.1"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=**d8045f3b8f929c1cb29a1e3fd737b4
>>> **99"
>>> +
>>> +PV = "1.0.3"
>>> +
>>> +SRC_URI = "
>>> http://ftp.de.debian.org/**debian/pool/main/l/lockdev/**
>>> lockdev_${PV}.orig.tar.gz<http://ftp.de.debian.org/debian/pool/main/l/lockdev/lockdev_$%7BPV%7D.orig.tar.gz>
>>> "
>>> +
>>> +SRC_URI[md5sum] = "**64b9c1b87b125fc348e892e2462552**4a"
>>> +SRC_URI[sha256sum] =
>>> "**ccae635d7ac3fdd50897eceb250872**b3d9a191d298f213e7f0c836910d86**9f82"
>>> +
>>> +S = "${WORKDIR}/lockdev-${PV}"
>>> +
>>> +do_compile() {
>>> +  oe_runmake CC="${CC}" LD="${LD}" shared
>>> +}
>>> +
>>> +do_install() {
>>> +  oe_runmake basedir="${D}" incdir="${D}${includedir}"
>>> libdir="${D}${libdir}" install_dev
>>> +}
>>> +
>>> +FILES_{PN} = "${includedir}/* \
>>> +              ${libdir}/* \
>>> +"
>>> --
>>> 1.7.12
>>>
>>>
>>> ______________________________**_________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
>>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>>> openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>>
>>>  ______________________________**_________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>> openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>
>
> Sorry, this has been confusing!
>
> I had erroneously added a patch in my V1 git send-patch for building
> liblockdev which wasn't required so I removed it and rebased my patches
> without it.
>
>
Got it now.

