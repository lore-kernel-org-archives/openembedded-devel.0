Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PAeQv-0006OP-Rd
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 09:59:04 +0200
Received: by qyk33 with SMTP id 33so2208005qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6v42P5rXbGhRbvwYBbHtDIRJTemjNdYS9qYa+AHdse4=;
	b=HOKoHHrRPzoM9eQGt8i3wsD84WConKGYeOvUJa3V6FD9YmKdz+Ow58LF0YMIBjlUT4
	R+tJUW27LLfEGQ7GRj/zFRGDT2l3DpjvYdG2e/QiJDOUyTN6QrKh1U1VT1UiptCEXxBL
	COeQb6tzYsBd9PERn4hAqICfq1nz28UQk+qE0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pYCZT6izXMi8E5wiU53VA6JdlaVqX5bqIeCAFxIIM6ae2rOryXbb/VvVj1sGsJmT0Q
	CyzuDxUk1UXZGjXVm4fez8/smuEZVtJ2Sd5f9pUJIONp992DXrTCfvAm5W5xBwgzt/nQ
	CFTdg31WNW5Lm2H1B2I3WVkAmUSM0j3ex3k6U=
MIME-Version: 1.0
Received: by 10.224.188.203 with SMTP id db11mr1186799qab.292.1288079899278;
	Tue, 26 Oct 2010 00:58:19 -0700 (PDT)
Received: by 10.229.18.197 with HTTP; Tue, 26 Oct 2010 00:58:19 -0700 (PDT)
In-Reply-To: <4CC500A2.7020702@gmail.com>
References: <AANLkTinXYcNN=iozP-aXPDuFzQqM13KDf5my1W6DTap6@mail.gmail.com>
	<4CC500A2.7020702@gmail.com>
Date: Tue, 26 Oct 2010 09:58:19 +0200
Message-ID: <AANLkTikzjkHxbXd3iCBny0yoNPBVTH4_LyhuYfSpg-SV@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Race issues (lzma-native)
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
X-List-Received-Date: Tue, 26 Oct 2010 07:59:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Just to add this time the race appears building on Ubuntu 10.4 32bit.
Last race-case (gtk+-native) was only on Gentoo and not on Ubuntu...

Both distros are on the same Quad host and share  an EXT3 OpenEmbedded
partition, though.

PARALLEL_MAKE =3D "-j5"
BB_NUMBER_THREADS =3D "4"


Perplexed...

Andrea

On Mon, Oct 25, 2010 at 5:59 AM, Graham Gower <graham.gower@gmail.com> wrot=
e:
> On 10/24/2010 07:29 PM, Andrea Adami wrote:
>> Hello,
>>
>> during first build of console image I notice a strange fault:
>> subsequent builds are ok.
>> My scripts builds console-image and opie-image.
>>
>> ERROR: Task 2411
>> (virtual:native:/oe/openembedded/recipes/lzma/lzma_4.65.bb,
>> do_distribute_sources) failed with exit code '1'
>> NOTE: Unpacking ../sources/lzma465.tar.bz2 to
>> tmp/work/i686-linux/lzma-native-4.65-r4.1/
>> NOTE: package lzma-native-4.65-r4.1: task do_distribute_sources: Started
>> NOTE: package lzma-native-4.65-r4.1: task SRC_DISTRIBUTECOMMAND: Failed
>> ERROR: Function 'SRC_DISTRIBUTECOMMAND' failed
>>
>>
>> Looking at the
>> run.SRC_DISTRIBUTECOMMAND.18268 =A0 16384 (failing)
>> run.SRC_DISTRIBUTECOMMAND.9570 =A0 =A0 34334
>>
>> it looks like the file is not complete / malformed:
>>
>> package_generate_ipkg_conf() {
>> <------>mkdir -p /oe/build/tmp/sysroots/i686-linux/etc/
>> <------>echo "src oe file:/oe/build/tmp/deploy/glibc/ipk" >
>> /oe/build/tmp/sysroots/i686-linux/etc/opkg.conf
>> <------>echo "src oe file:/
>> EOF
>>
>> run.do_distribute_sources.18268 =A0is empty, while second time
>> run.do_distribute_sources.9570 =A0 1051 contains =A0def do_distribute_so=
urces(d):
>>
>> This seems indeed a race issue...
>>
>> Andrea
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> I can reproduce this one quite easily. Reverting a6a23f73 seems to make i=
t
> disappear. Alternately the change below works, but I'm not convinced this=
 is
> the right fix.
>
> Can someone with greater insight explain what causes this race?
>
> -Graham
>
>
> diff --git a/classes/src_distribute.bbclass b/classes/src_distribute.bbcl=
ass
> index 795a5cf..98d8d88 100644
> --- a/classes/src_distribute.bbclass
> +++ b/classes/src_distribute.bbclass
> @@ -1,7 +1,7 @@
> =A0SRC_DISTRIBUTE_DLONLY ?=3D "0"
> =A0SRC_DISTRIBUTECOMMAND[func] =3D "1"
>
> -addtask distribute_sources before do_build after do_fetch
> +addtask distribute_sources before do_build after do_unpack
> =A0python do_distribute_sources () {
> =A0 =A0 =A0 =A0bb.build.exec_func("do_fetch", d)
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


