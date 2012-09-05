Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9I1k-0002wZ-JJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 18:00:28 +0200
Received: from localhost ([127.0.0.1]:51227 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9Hpl-0000tn-8Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 15:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=lzr+u9kL27QeG6Yw298RvBjBbjk=; b=I+E5gzX+gVVCWeVQlrfSifHUIaxC
	S7VRwS0ofYjcaX9p2AqgxdHmWcvru7RMbHxEp1Z2DUsuDbEOmRtSD3MsVZl2e/De
	OmuIwA1xzcTd4aVavFQA61/1wmg7+pZSxllV82vAfLKOJlTqiRvMWdqX57el62af
	9jGri+c4IXNogxI=
Received: from [195.171.99.130] (port=48478 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9Hpl-0000te-6O
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 15:48:05 +0000
Message-ID: <50477479.70400@communistcode.co.uk>
Date: Wed, 05 Sep 2012 16:49:13 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
	<1346858494-4849-2-git-send-email-ml@communistcode.co.uk>
	<CAK18fxG8PpuVYW0UXZwRKghn1duy2FwhL2RWt_cP82XX33srcA@mail.gmail.com>
In-Reply-To: <CAK18fxG8PpuVYW0UXZwRKghn1duy2FwhL2RWt_cP82XX33srcA@mail.gmail.com>
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
X-List-Received-Date: Wed, 05 Sep 2012 16:00:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/12 16:41, Andrei Gherzan wrote:
> On Wed, Sep 5, 2012 at 6:21 PM, <ml@communistcode.co.uk> wrote:
>
>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>>
>> V4
>>
>> - Remove debian packaging patch, it is not needed
>>
>>
> What means it is not needed anymore? Included in upstream? Fixed in yocto?
>
>
>> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>> ---
>>   .../liblockdev/liblockdev_1.0.3.bb                 | 26
>> ++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>   create mode 100644 meta-oe/recipes-extended/liblockdev/
>> liblockdev_1.0.3.bb
>>
>>
> Where is the removed patch?
>
>
>> diff --git a/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bbb/meta-oe/recipes-extended/liblockdev/
>> liblockdev_1.0.3.bb
>> new file mode 100644
>> index 0000000..be5ce44
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb
>> @@ -0,0 +1,26 @@
>> +DESCRIPTION = "Manage character and block device lockfiles."
>> +HOMEPAGE = "
>> http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary"
>> +
>> +LICENSE = "LGPLv2.1"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
>> +
>> +PV = "1.0.3"
>> +
>> +SRC_URI = "
>> http://ftp.de.debian.org/debian/pool/main/l/lockdev/lockdev_${PV}.orig.tar.gz
>> "
>> +
>> +SRC_URI[md5sum] = "64b9c1b87b125fc348e892e24625524a"
>> +SRC_URI[sha256sum] =
>> "ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82"
>> +
>> +S = "${WORKDIR}/lockdev-${PV}"
>> +
>> +do_compile() {
>> +  oe_runmake CC="${CC}" LD="${LD}" shared
>> +}
>> +
>> +do_install() {
>> +  oe_runmake basedir="${D}" incdir="${D}${includedir}"
>> libdir="${D}${libdir}" install_dev
>> +}
>> +
>> +FILES_{PN} = "${includedir}/* \
>> +              ${libdir}/* \
>> +"
>> --
>> 1.7.12
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Sorry, this has been confusing!

I had erroneously added a patch in my V1 git send-patch for building 
liblockdev which wasn't required so I removed it and rebased my patches 
without it.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



