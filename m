Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OYw04-0000En-Pr
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 09:03:25 +0200
Received: by bwz10 with SMTP id 10so4396256bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 00:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=w22xwElwHjY4CO2wF+JCNWEKPd2aXsf0Eot5yHBwPE8=;
	b=KEb5LJWc9i+/HxN3MoHKQ1WFFyQAIfh0BXCDkcdy+WYDHH/r7kVrd6X2ljKotY9sII
	+wjKq1mUBTdNVcxNeaxG4IgA92cdKbjjPlPXajV12Su/U5n2RmCjjW4T4FQ50FbC1BG9
	nKw37s5zJdxVGbRCnKcIOcf0QwBfqlrbeyU1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=u/Z5Y4Hd99PrUrsiHrmcLzhutmI1sIy+Qyy0HXcNVUCsIN83Tp2UUHLivSVvIVge/o
	V6IUN9PVz2+mIJyrVw6m4SXPkNbZQ6F8GluNWb7n9BOSY4aboAgF/9b3C7mx0ktqxbqe
	/JyV88OJ4OFj7/I3GJXQ/7q+kc/m6SgdAAFi0=
MIME-Version: 1.0
Received: by 10.204.47.36 with SMTP id l36mr12795262bkf.32.1279090995752; Wed, 
	14 Jul 2010 00:03:15 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 14 Jul 2010 00:03:15 -0700 (PDT)
In-Reply-To: <4C3CEC5C.8080506@mentor.com>
References: <E1OYmec-0005TF-MX@melo.openembedded.org>
	<4C3CEC5C.8080506@mentor.com>
Date: Wed, 14 Jul 2010 09:03:15 +0200
Message-ID: <AANLkTin00ehMzluJxB7_PIBze8OM-gxZBiC9qBpfc5ub@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-commits] Dmitry Eremin-Solenikov : u-boot: add a recipe for fresh release of u-boot. Also make it default for tqm8540 board
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
X-List-Received-Date: Wed, 14 Jul 2010 07:03:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/14 Tom Rini <tom_rini@mentor.com>

> git version control wrote:
>
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: e1a3091c2417994a798b51bc6d6cac1d52799865
>> URL:
>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=e1a3091c2417994a798b51bc6d6cac1d52799865
>>
>> Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> Date:   Wed Jul 14 00:01:39 2010 +0400
>>
>> u-boot: add a recipe for fresh release of u-boot. Also make it default for
>> tqm8540 board
>>
>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>>
>> ---
>>
>>  recipes/u-boot/u-boot_2010.06.bb |   20 ++++++++++++++++++++
>>  1 files changed, 20 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/u-boot/u-boot_2010.06.bb b/recipes/u-boot/
>> u-boot_2010.06.bb
>> new file mode 100644
>> index 0000000..73dea39
>> --- /dev/null
>> +++ b/recipes/u-boot/u-boot_2010.06.bb
>> @@ -0,0 +1,20 @@
>> +PR = "r1"
>> +require u-boot.inc
>> +
>> +DEFAULT_PREFERENCE = "-1"
>> +DEFAULT_PREFERENCE_tqm8540 = "1"
>> +
>> +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2<ftp://ftp.denx.de/pub/u-boot/u-boot-$%7BPV%7D.tar.bz2>"
>> +
>> +TARGET_LDFLAGS = ""
>> +
>> +inherit base
>> +
>> +do_compile () {
>> +       oe_runmake ${UBOOT_MACHINE}
>> +       oe_runmake all
>> +}
>>
>
> I know this isn't new.  Why is the oe_runmake ${UBOOT_MACHINE}, which is
> basically "configure u-boot for this machine" in do_compile and not
> do_configure?
>

I suspect this is because it happens in some other recipes.

There is an issue if you want to generate multiple u-boot binaries in one
recipe (like the gta guys do, and like I had to do for mpc8536 which has
different u-boots for sd, spi flash and nand).
Typically what you then get is multiple lines like given above in
do_compile.


> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

