Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TCHYv-0007iA-PT
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 00:07:06 +0200
Received: by iaky10 with SMTP id y10so2649327iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 14:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=uc8ylQ91z5znbBEmHISJblGVjDclsAhlmfi0Oj2FV1Y=;
	b=PVBUjBVSnrrD9wY0SHw59CZVyOBaFbcCaoXgIshXgquMTQsNd4eNGNL/DL0jH62nSh
	E8NrbqyUS2hRqGwYHrzXcA7+ApCwD2UoBj/EWJsicpILLSGnBAi8a8RKMYZOHAbOa1i9
	WoIHDohqE/ds4oxH3TmKjogJ3A0J7Unjddv5FOF4+0cl3jhxb4nyPLOlYUzzc32/JElZ
	zCLn66HY8eOXcA8Dg3bbf6PZ82s1FegRJN/mXTpap7/cCwWHaYkKwpab1/VdO3WyiGvO
	9Rk7mDkpr2DcnGfZx/jq2w3yC8gm8MiWwjWbul9EWp8kr/BBdfZGxb68MJDBom+lpCvS
	vyDA==
Received: by 10.50.95.233 with SMTP id dn9mr657618igb.63.1347573271244; Thu,
	13 Sep 2012 14:54:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.129.232 with HTTP; Thu, 13 Sep 2012 14:54:10 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <504EF1BA.3070509@communistcode.co.uk>
References: <1346931347-8672-1-git-send-email-ml@communistcode.co.uk>
	<CAK18fxE277_zyJF=Xv955KusWwAcyD=ve09w3Cj35Xm0tU-5tw@mail.gmail.com>
	<504EF1BA.3070509@communistcode.co.uk>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 14 Sep 2012 00:54:10 +0300
Message-ID: <CAK18fxHzsBhpqEimD6+RfGn2eo24nqU5Zx_DGUiXSorUDYjLFQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnrpzI16HDN8DaIchAOoDeueLibqh5JAGVK5BzLWeLveF/PMy+PJn28MPPC5xTH/bg0BbXL
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
X-List-Received-Date: Thu, 13 Sep 2012 22:07:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 11, 2012 at 11:09 AM, Jack Mitchell <ml@communistcode.co.uk>wrote:

> On 10/09/12 21:13, Andrei Gherzan wrote:
>
>> On Thu, Sep 6, 2012 at 2:35 PM, <ml@communistcode.co.uk> wrote:
>>
>>  From: Jack Mitchell <jack.mitchell@dbbroadcast.co.**uk<jack.mitchell@dbbroadcast.co.uk>
>>> >
>>>
>>> V5
>>>
>>> - FILES_{PN} no loger required now libdir and includedir are passed to
>>> oe_runmake
>>>
>>> V4
>>>
>>> - Remove debian packaging patch, it is not needed
>>>
>>> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.**uk<jack.mitchell@dbbroadcast.co.uk>
>>> >
>>> ---
>>>   .../recipes-extended/**liblockdev/liblockdev_1.0.3.bb  | 20
>>> ++++++++++++++++++++
>>>   1 file changed, 20 insertions(+)
>>>   create mode 100644 meta-oe/recipes-extended/**liblockdev/
>>> liblockdev_1.0.3.bb
>>>
>>> diff --git a/meta-oe/recipes-extended/**liblockdev/liblockdev_1.0.3.**
>>> bbb/meta-oe/recipes-extended/**liblockdev/
>>> liblockdev_1.0.3.bb
>>> new file mode 100644
>>> index 0000000..210a47b
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/**liblockdev/liblockdev_1.0.3.bb
>>> @@ -0,0 +1,20 @@
>>> +DESCRIPTION = "Manage character and block device lockfiles."
>>> +HOMEPAGE = "
>>> http://anonscm.debian.org/**gitweb/?p=lockdev/lockdev.git;**a=summary<http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary>
>>> "
>>> +
>>> +LICENSE = "LGPLv2.1"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=**d8045f3b8f929c1cb29a1e3fd737b4
>>> **99"
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
>>>
>>>  Why install only _dev? Why don't you use make install? It makes no
>> sense to
>> compile shared and not install it... I just tested your recipe.
>>
>>
I cleaned a little your recipe and sent a pull request (added you as Signed
of by).
https://github.com/openembedded/meta-oe/pull/10

ag

