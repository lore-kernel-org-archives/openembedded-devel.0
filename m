Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9aKn-0002Hk-6g
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:33:21 +0200
Received: from localhost ([127.0.0.1]:36439 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9a8m-0002td-Ps
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 11:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=+/HnGgTyCA8EgzHPmg9jiWTlGto=; b=cEPZJ9Z6sSCaFuy2CV83LCFQL3QR
	g5yAzIKNxHKYEyrFI+LKx9QoiQfEDYRwD0+d3cezWubXDppojuzAgXgCPZVvglQv
	znrQmpjhQWfypGFXLTeh6pB6PjGJ+fh0N3SNHDIX9f1lUMGDjAgnC9LOUCzzkz60
	fWuNcHzxW6MSwIE=
Received: from [195.171.99.130] (port=30366 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9a8m-0002tX-MN
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 11:20:56 +0000
Message-ID: <5048875A.1000205@communistcode.co.uk>
Date: Thu, 06 Sep 2012 12:22:02 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
	<1346858494-4849-2-git-send-email-ml@communistcode.co.uk>
	<k2a0m9$1it$1@ger.gmane.org>
In-Reply-To: <k2a0m9$1it$1@ger.gmane.org>
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
X-List-Received-Date: Thu, 06 Sep 2012 11:33:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/12 12:16, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 05-09-12 17:21, ml@communistcode.co.uk schreef:
>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>>
>> V4
>>
>> - Remove debian packaging patch, it is not needed
>>
>> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk> ---
>> .../liblockdev/liblockdev_1.0.3.bb                 | 26
>> ++++++++++++++++++++++ 1 file changed, 26 insertions(+) create mode
>> 100644 meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb
>>
>> diff --git a/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb
>> b/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb new file mode
>> 100644 index 0000000..be5ce44 --- /dev/null +++
>> b/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb @@ -0,0 +1,26
>> @@ +DESCRIPTION = "Manage character and block device lockfiles."
>> +HOMEPAGE =
>> "http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary" +
>> +LICENSE = "LGPLv2.1" +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499" + +PV = "1.0.3"
> That's superfluous
>
>
>> +FILES_{PN} = "${includedir}/* \ +              ${libdir}/* \ +"
> This concerns me, what is going wrong in the regular FILES_${PN} situation?
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQSIYUMkyGM64RGpERAq3vAJ9JrlmJY5WRA4sKpp1xs+m5jcQCdwCfSgmr
> u+zcjBy1Y1NbD+muNrVgCts=
> =11Ia
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

If I remember correctly it wasn't picking up the include files, however 
that may have been before I added the incdir="${D}${includedir}" to 
oe_runmake. Let me check it out.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



