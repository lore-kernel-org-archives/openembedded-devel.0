Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PDNmb-0004uu-8j
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 21:48:41 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PDNlm-0004CI-V3 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 13:47:50 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 2 Nov 2010 13:47:50 -0700
Received: from [172.30.80.166] ([172.30.80.166]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 2 Nov 2010 14:47:49 -0600
Message-ID: <4CD078F0.6010800@mentor.com>
Date: Tue, 02 Nov 2010 13:47:44 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CD02461.3020106@eukrea.com>	<1288709799-9891-1-git-send-email-eric@eukrea.com>
	<AANLkTim8oPBrRRMFVBknR+c3+gxMgSZAJkB84qa_ByYO@mail.gmail.com>
In-Reply-To: <AANLkTim8oPBrRRMFVBknR+c3+gxMgSZAJkB84qa_ByYO@mail.gmail.com>
X-OriginalArrivalTime: 02 Nov 2010 20:47:50.0167 (UTC)
	FILETIME=[36849A70:01CB7ACF]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gdb-cross-sdk: reconfigure before running	oe_runmake configure-host
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
X-List-Received-Date: Tue, 02 Nov 2010 20:48:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Khem Raj wrote:
> On Tue, Nov 2, 2010 at 7:56 AM, Eric Bénard <eric@eukrea.com> wrote:
>> so we have : configure then make configure-host which generates the
>> Makefile that we modify using sed to statically link the libs
>>
>> Without this patch, we don't statically link libncurses, libtinfo
>> and libz which leads to :
>> /usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-gdb:
>> error while loading shared libraries: libtinfo.so.5:
>> cannot open shared object file: No such file or directory
>>
>> when trying to use the toolchain.
>>
>> Signed-off-by: Eric Bénard <eric@eukrea.com>
> 
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> 
>> ---
>>  recipes/gdb/gdb-cross-sdk.inc |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/gdb/gdb-cross-sdk.inc b/recipes/gdb/gdb-cross-sdk.inc
>> index 6a708ca..e1d4895 100644
>> --- a/recipes/gdb/gdb-cross-sdk.inc
>> +++ b/recipes/gdb/gdb-cross-sdk.inc
>> @@ -8,6 +8,7 @@ EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils' L
>>  # add a depenency on the -sdk versions of them.
>>  do_configure_append () {
>>        cd ${B}
>> +       oe_runconf
>>        oe_runmake configure-host
>>        sed -e 's,-lncurses,${STAGING_LIBDIR_NATIVE}/libncurses.a ${STAGING_LIBDIR_NATIVE}/libtinfo.a ,g' -i ${B}/gdb/Makefile
>>        sed -e 's,-lz, ${STAGING_LIBDIR_NATIVE}/libz.a ,g' -i ${B}/gdb/Makefile
>> @@ -16,5 +17,4 @@ do_configure_append () {
>>        for SIM in ${B}/sim/*/Makefile; do
>>                [ -f $SIM ] && sed -e 's,-lz, ${STAGING_LIBDIR_NATIVE}/libz.a ,g' -i $SIM
>>        done
>> -       oe_runconf
>>  }
>> --
>> 1.6.3.3
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Tom Rini
Mentor Graphics Corporation


