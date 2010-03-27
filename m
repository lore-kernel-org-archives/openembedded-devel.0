Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvRHs-0005cf-C9 for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 09:22:32 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvRE6-0008OL-Vt for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 09:18:38 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 09:18:38 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 09:18:38 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 27 Mar 2010 09:18:10 +0100
Message-ID: <hokf02$31b$1@dough.gmane.org>
References: <1252561144-5528-1-git-send-email-mike@compulab.co.il>
	<20100326215955.GF18337@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <20100326215955.GF18337@excalibur.local>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] omap3-sgx-modules: fix proc related build errors
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
X-List-Received-Date: Sat, 27 Mar 2010 08:22:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-03-10 22:59, Stefan Schmidt wrote:
> Hello.
> 
> Koen, omap3-sgx-modules is your area of expertise. Can you comment on this?

1.3.x is gone from OE now, we only have 1.4.x now, that doesn't need
this patch.

regards,

Koen

> 
> regards
> Stefan Schmidt
> 
> On Thu, 2009-09-10 at 08:39, Mike Rapoport wrote:
>> Signed-off-by: Mike Rapoport <mike@compulab.co.il>
>> ---
>>  .../fix-proc-compile-errors.patch                  |   36 ++++++++++++++++++++
>>  .../omap3-sgx-modules_1.3.13.1607.bb               |    1 +
>>  2 files changed, 37 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes/powervr-drivers/omap3-sgx-modules/fix-proc-compile-errors.patch
>>
>> diff --git a/recipes/powervr-drivers/omap3-sgx-modules/fix-proc-compile-errors.patch b/recipes/powervr-drivers/omap3-sgx-modules/fix-proc-compile-errors.patch
>> new file mode 100644
>> index 0000000..890dc67
>> --- /dev/null
>> +++ b/recipes/powervr-drivers/omap3-sgx-modules/fix-proc-compile-errors.patch
>> @@ -0,0 +1,36 @@
>> +From af0a5882ad56d484c94555940c7987ad1a50930f Mon Sep 17 00:00:00 2001
>> +From: Mike Rapoport <mike@compulab.co.il>
>> +Date: Wed, 9 Sep 2009 18:09:04 +0300
>> +Subject: [PATCH] Fix proc compile errors
>> +
>> +---
>> + services4/srvkm/env/linux/proc.c |    3 ---
>> + 1 files changed, 0 insertions(+), 3 deletions(-)
>> + mode change 100755 => 100644 services4/srvkm/env/linux/proc.c
>> +
>> +diff --git a/services4/srvkm/env/linux/proc.c b/services4/srvkm/env/linux/proc.c
>> +old mode 100755
>> +new mode 100644
>> +index 274c35f..8470f5a
>> +--- a/services4/srvkm/env/linux/proc.c
>> ++++ b/services4/srvkm/env/linux/proc.c
>> +@@ -134,7 +134,6 @@ int CreateProcEntry(const char * name, read_proc_t rhandler, write_proc_t whandl
>> + 
>> +     if (file)
>> +     {
>> +-        file->owner = THIS_MODULE;
>> + 		file->read_proc = rhandler;
>> + 		file->write_proc = whandler;
>> + 		file->data = data;
>> +@@ -165,8 +164,6 @@ int CreateProcReadEntry(const char * name, pvr_read_proc_t handler)
>> + 
>> +     if (file)
>> +     {
>> +-        file->owner = THIS_MODULE;
>> +-
>> +         return 0;
>> +     }
>> + 
>> +-- 
>> +1.6.0.6
>> +
>> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
>> index 8e4d2a2..527ef2c 100644
>> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
>> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
>> @@ -7,6 +7,7 @@ SRC_URI = "file://omap3-sgx-modules-${PV}.tar.bz2 \
>>             file://0002-Compile-fixes-for-DSS2.patch;patch=1 \
>>             file://rotation-dss2.patch;patch=1 \
>>             file://build_es3.x_sgx.patch;patch=1 \
>> +	   file://fix-proc-compile-errors.patch;patch=1 \
>>  "
>>  
>>  PVRBUILD = "release"
>> -- 
>> 1.6.0.6
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLrb9CMkyGM64RGpERAhHsAJ0ZD055MyfH7jq0lqAo7bXmXBoBugCguDeg
ZGWnBvLqUyrZsTMI83L3pHU=
=sQJf
-----END PGP SIGNATURE-----



