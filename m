Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O36o6-0002v4-Ah for openembedded-devel@lists.openembedded.org;
	Sat, 17 Apr 2010 14:07:31 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O36kh-0002bk-PG for openembedded-devel@lists.openembedded.org;
	Sat, 17 Apr 2010 14:03:59 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Apr 2010 14:03:59 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Apr 2010 14:03:59 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 17 Apr 2010 14:03:49 +0200
Message-ID: <hqc836$6kc$1@dough.gmane.org>
References: <1271327750-29247-1-git-send-email-koen@openembedded.org>
	<lyiq7qe2uv.fsf@ensc-virt.intern.sigma-chemnitz.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100406 Shredder/3.0.5pre
In-Reply-To: <lyiq7qe2uv.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] kernel bbclass: convert to new style staging (from poky)
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
X-List-Received-Date: Sat, 17 Apr 2010 12:07:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-04-10 13:27, Enrico Scholz wrote:
> Koen Kooi <koen.kooi@gmail.com> writes:
> 
>>  	if [ -e include/asm ] ; then
>>  		# This link is generated only in kernel before 2.6.33-rc1, don't stage it for newer kernels
>>  		ASMDIR=`readlink include/asm`
>>  
>> -		mkdir -p ${STAGING_KERNEL_DIR}/include/$ASMDIR
>> -		cp -fR include/$ASMDIR/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
>> +		mkdir -p $kerneldir/include/$ASMDIR
>> +		cp -fR include/$ASMDIR/* $kerneldir/include/$ASMDIR/
>>  	fi
>> +
>> +	cp -fR include/$ASMDIR/* $kerneldir/include/$ASMDIR/
> 
> this breaks on recent kernels because they do no have include/asm and
> ASMDIR won't be defined here.
> 
> 
>>  	if [ -e arch/${ARCH}/include/asm/ ] ; then 
>> -		if [ -e include/asm ] ; then
>> -			cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
>> -		fi
>> -		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
>> -		cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/	
>> +		cp -fR arch/${ARCH}/include/asm/* $kerneldir/include/$ASMDIR/
> 
> ditto

That should be fixed now, thanks for pointing it out.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLyaOlMkyGM64RGpERAnR7AJ4vt2QC6JdPRwyPsa1/Khsll9JlvgCfWRbU
IjQvo6EZCAWkAbywrcna/MY=
=NAMq
-----END PGP SIGNATURE-----



