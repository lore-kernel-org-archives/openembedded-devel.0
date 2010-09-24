Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OzE6j-0007fL-3E for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 21:39:01 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OzE6d-00083J-VW for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 21:38:51 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 21:38:51 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 21:38:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 24 Sep 2010 21:38:38 +0200
Message-ID: <i7iunu$n5d$2@dough.gmane.org>
References: <E1OzA6d-00044S-Vd@melo.openembedded.org>
	<AANLkTinLsQ+3ffLMOBfLjPH7Ma9QvkToNruEN6q_mru-@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <AANLkTinLsQ+3ffLMOBfLjPH7Ma9QvkToNruEN6q_mru-@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Koen Kooi : speex: make float and asm settings more intelligent
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
X-List-Received-Date: Fri, 24 Sep 2010 19:39:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-09-10 20:13, Martin Jansa wrote:
> On Fri, Sep 24, 2010 at 5:22 PM, git version control
> <git@git.openembedded.org> wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: e06553979d23531397af3dd71870abb80718c681
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=e06553979d23531397af3dd71870abb80718c681
>>
>> Author: Koen Kooi <koen@openembedded.org>
>> Date:   Fri Sep 24 17:20:54 2010 +0200
>>
>> speex: make float and asm settings more intelligent
>>
>> ---
>>
>>  recipes/speex/speex-fpu.inc |    5 +++++
>>  recipes/speex/speex_1.2.bb  |   14 ++++++++------
>>  2 files changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/recipes/speex/speex-fpu.inc b/recipes/speex/speex-fpu.inc
>> new file mode 100644
>> index 0000000..4c63920
>> --- /dev/null
>> +++ b/recipes/speex/speex-fpu.inc
>> @@ -0,0 +1,5 @@
>> +def get_speex_fpu_setting(bb, d):
>> +       if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
>> +               return "--enable-fixed-point --disable-float-api --disable-vbr"
>> +       return ""
>> +
>> diff --git a/recipes/speex/speex_1.2.bb b/recipes/speex/speex_1.2.bb
>> index f498731..049b472 100644
>> --- a/recipes/speex/speex_1.2.bb
>> +++ b/recipes/speex/speex_1.2.bb
>> @@ -5,7 +5,7 @@ HOMEPAGE = "http://www.speex.org"
>>  DEPENDS = "libogg"
>>  BETA = "1.2rc1"
>>  PV = "1.1+${BETA}"
>> -PR = "r0"
>> +PR = "r1"
>>
>>  SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-${BETA}.tar.gz"
>>  S = "${WORKDIR}/speex-${BETA}"
>> @@ -25,13 +25,15 @@ LEAD_SONAME = "libspeex.so"
>>  #       --disable-float-api --disable-vbr (must disable-vbr if disable-float-api)
>>  #
>>
>> -EXTRA_OECONF_append_openmn = " --enable-arm5e-asm --enable-fixed-point --disable-float-api --disable-vbr "
>> -EXTRA_OECONF_append_amsdelta = " --enable-arm4-asm --enable-fixed-point --disable-float-api --disable-vbr "
>> -EXTRA_OECONF_append_bfin = " --enable-blackfin-asm --enable-fixed-point --disable-float-api --disable-vbr "
>> -EXTRA_OECONF_append_arm = " --enable-fixed-point --disable-float-api --disable-vbr "
>> -EXTRA_OECONF_append_dht-walnut = " --enable-fixed-point --disable-float-api --disable-vbr "
>> +#check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
>> +require speex-fpu.inc
>> +EXTRA_OECONF += "${@get_speex_fpu_setting(bb, d)}"
>>
>> +ARMASM_armv4t = "--enable-arm4-asm"
> 
> Hi,
> 
> for some reason it fails on armv4t (om-gta02) with --enable-arm4-asm
> 
> http://tinderbox.openembedded.net/packages/779499/
> 
>> +ARMASM_armv5te = "--enable-arm5e-asm"
> 
> and this breaks armv5te (spitz)
> 
> http://tinderbox.openembedded.net/packages/779550/
> 
> pity :/

I turned it off till we figure out how to make it work for everyone.
Thanks for the report!

regards,

Koen



> 
> Regards,
>> +ARMASM ?= ""
>>
>> +EXTRA_OECONF += "${ARMASM}"
>>
>>  do_configure_append() {
>>        sed -i s/"^OGG_CFLAGS.*$"/"OGG_CFLAGS = "/g Makefile */Makefile */*/Makefile
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMnP4+MkyGM64RGpERAimyAJsELGVtbyyiPW75+YoyEMgGW2gH1wCeKOOZ
UCBYQq1GmQNs7rGB0286NQM=
=gZxy
-----END PGP SIGNATURE-----



