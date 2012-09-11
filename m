Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TBLhq-000467-Lm
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 10:20:26 +0200
Received: from localhost ([127.0.0.1]:34556 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TBLVk-0003om-44
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 08:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=LMTnX95+VAqrA/bd7gBFYaWP+us=; b=jM8y5EuDjN0Sv5Hi3ZnzxpLxUu3h
	FwFkR6Mav1s9xlpK3ByGAzBnTYKkfPRFcZ/eVibyRicyji1tyOt9uKWTvRf8iiHI
	p2BblRo8OjUW/zQk27+DizpJIeaSzSJ29cHLN3Boeb1FY5ZEADd866F7FpgV7lzv
	KaYVk0uH+Yd1wHg=
Received: from [195.171.99.130] (port=54449 helo=[192.168.0.40])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TBLVk-0003oj-1l
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 08:07:56 +0000
Message-ID: <504EF1BA.3070509@communistcode.co.uk>
Date: Tue, 11 Sep 2012 09:09:30 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1346931347-8672-1-git-send-email-ml@communistcode.co.uk>
	<CAK18fxE277_zyJF=Xv955KusWwAcyD=ve09w3Cj35Xm0tU-5tw@mail.gmail.com>
In-Reply-To: <CAK18fxE277_zyJF=Xv955KusWwAcyD=ve09w3Cj35Xm0tU-5tw@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Sep 2012 08:20:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/12 21:13, Andrei Gherzan wrote:
> On Thu, Sep 6, 2012 at 2:35 PM, <ml@communistcode.co.uk> wrote:
>
>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>>
>> V5
>>
>> - FILES_{PN} no loger required now libdir and includedir are passed to
>> oe_runmake
>>
>> V4
>>
>> - Remove debian packaging patch, it is not needed
>>
>> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>> ---
>>   .../recipes-extended/liblockdev/liblockdev_1.0.3.bb  | 20
>> ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>   create mode 100644 meta-oe/recipes-extended/liblockdev/
>> liblockdev_1.0.3.bb
>>
>> diff --git a/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bbb/meta-oe/recipes-extended/liblockdev/
>> liblockdev_1.0.3.bb
>> new file mode 100644
>> index 0000000..210a47b
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb
>> @@ -0,0 +1,20 @@
>> +DESCRIPTION = "Manage character and block device lockfiles."
>> +HOMEPAGE = "
>> http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary"
>> +
>> +LICENSE = "LGPLv2.1"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
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
>>
> Why install only _dev? Why don't you use make install? It makes no sense to
> compile shared and not install it... I just tested your recipe.
>
> ag
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Ah, well spotted I had -dev as that was what I needed to get libcec to 
link - did you have to change anything other than install_dev to install?

Cheers,


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



