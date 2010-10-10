Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P4rT7-00019W-Ih
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 10:41:22 +0200
Received: by vws3 with SMTP id 3so246235vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0MuewQGRlRY7BZWVdcaZjjjiU0H/I/b3b8jI/M/9/aM=;
	b=LMBjUQoLrzW1vXu/lC6mQQ/9q0BQ09UVGpmbg7UEZPuxXzMTEAwb+gvUOtmKmuCVmA
	oALvaKBnJFd4UKaY7xMjLQDDlawj+SYOMRYDtStAC7vgBhetpfeu9MIGO7GFsVIjPlVG
	j3yepiFOcqZGQ5U20GmH46vqda42OLU0/dvhA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gjw1fAcRQM7bbNIvye+L2uLT0XNmWlt0idLLVRNFyklNBhJ9iVhoKa3POCJpm+l62f
	u/dmWY7ZCRVmSzQ4QR7Utq/8nX28Mg9UaqFvcxs5A69wZN4fU9MgwQpd6NMwHAl5GYiD
	RORldWyUxO9agcglBIu/UXcHKmraTL8HBjDjg=
MIME-Version: 1.0
Received: by 10.220.180.193 with SMTP id bv1mr1460653vcb.12.1286700054048;
	Sun, 10 Oct 2010 01:40:54 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Sun, 10 Oct 2010 01:40:54 -0700 (PDT)
In-Reply-To: <AANLkTi=Fry0wuBpU6eFztR98rw2KtK76LUdZs6SMuUos@mail.gmail.com>
References: <AANLkTikXgD1ULsL7Fc3jQ45vDEH4ECqsG7s6KHRhJ1op@mail.gmail.com>
	<AANLkTi=Fry0wuBpU6eFztR98rw2KtK76LUdZs6SMuUos@mail.gmail.com>
Date: Sun, 10 Oct 2010 01:40:54 -0700
Message-ID: <AANLkTinhe7b-u+LMqXjgEZ4+3vuix0akw=6sghpZOfU8@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question on writing perl lib .bb files
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
X-List-Received-Date: Sun, 10 Oct 2010 08:41:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 10, 2010 at 1:36 AM, J. L. <vwyodapink@gmail.com> wrote:
> On Sun, Oct 10, 2010 at 1:33 AM, J. L. <vwyodapink@gmail.com> wrote:
>> I am trying to add a few more perl libs into my build that dont exist
>> and I have seen some that have dependences and others that dont. So I
>> wrote one for Net::Whois::ARIN and tried without what CPAN says is the
>> dependencies and it built correctly with no errors I installed the
>> .ipk and went to try the build of a program I wanted to try on my
>> overo and it no longer complains about it missing that. But why do
>> some perl lib .bb use depends and not even all the depends that cpan
>> lists and some list none even though according to CPAN they need them?
>> I will post the .bb I wrote as well, thanks for any info on the
>> correct way to do this as not sure if what I did is enough to properly
>> get the lib for perl built
>>
>> DESCRIPTION =3D "Net::Whois::ARIN =A0 =A0 =A0 =A0 whois arin "
>> SECTION =3D "libs"
>> LICENSE =3D "Perl"
>> PR =3D "r1"
>>
>> DEPENDS +=3D "libtest-mockmodule-perl scalar-util-perl libtest-exception=
-perl \
>> =A0 =A0 =A0 =A0 =A0 =A0test-harness-perl test-more-perl libsub-uplevel-p=
erl \
>> =A0 =A0 =A0 =A0 =A0 =A0libmodule-build-perl carp-perl universal-isa-perl=
 \
>> =A0 =A0 =A0 =A0 =A0 =A0universal-can-perl io-socket-inet-perl "
>>
>> SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TC/TCAINE/Net-Whoi=
s-ARIN-${PV}.tar.gz"
>>
>> S =3D "${WORKDIR}/Net-Whois-ARIN-${PV}"
>>
>> inherit cpan
>>
>> BBCLASSEXTEND=3D"native"
>>
>> SRC_URI[md5sum] =3D "a5aee39187c6272acd2a77e30847fdef"
>> SRC_URI[sha256sum] =3D
>> "d47a6720ff265674cbd918d866c73221be9916d81e1c30ccdb0d49e6b45110e8"
>>
>
> Sorry forgot the build output as well:
>
> NOTE: Running task 904 of 922 (ID: 11,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_setscene)
> NOTE: Running task 905 of 922 (ID: 9,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_fetch)
> NOTE: Running task 906 of 922 (ID: 0,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_unpack)
> NOTE: Unpacking sources/Net-Whois-ARIN-0.11.tar.gz to
> tmp/work/armv7a-angstrom-linux-gnueabi/libnet-whois-arin-perl-0.11-r1/
> NOTE: Running task 907 of 922 (ID: 1,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_patch)
> NOTE: Running task 908 of 922 (ID: 12,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_configure)
> NOTE: Running task 909 of 922 (ID: 13,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_qa_configure)
> NOTE: Running task 910 of 922 (ID: 14,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_compile)
> NOTE: Running task 911 of 922 (ID: 2,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_install)
> NOTE: Running task 912 of 922 (ID: 15,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_package)
> NOTE: the following files were installed but not shipped in any package:
> NOTE: =A0 /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
perl-5.8.8-r36/image/usr/share/man/man3/Net::Whois::ARIN.3pm
> NOTE: =A0 /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
perl-5.8.8-r36/image/usr/share/man/man3/Net::Whois::ARIN::Contact.3pm
> NOTE: =A0 /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
perl-5.8.8-r36/image/usr/share/man/man3/Net::Whois::ARIN::AS.3pm
> NOTE: =A0 /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
perl-5.8.8-r36/image/usr/share/man/man3/Net::Whois::ARIN::Organization.3pm
> NOTE: =A0 /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
perl-5.8.8-r36/image/usr/share/man/man3/Net::Whois::ARIN::Customer.3pm
> NOTE: =A0 /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
perl-5.8.8-r36/image/usr/share/man/man3/Net::Whois::ARIN::Network.3pm
> NOTE: Running task 913 of 922 (ID: 3,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_populate_sysroot)
> NOTE: Running task 914 of 922 (ID: 18,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_package_write_ipk)
> Packaged contents of libnet-whois-arin-perl-dbg into
> /home/vdubhack/overo-oe/tmp/deploy/glibc/ipk/armv7a/libnet-whois-arin-per=
l-dbg_0.11-r1.6_armv7a.ipk
> Packaged contents of libnet-whois-arin-perl into
> /home/vdubhack/overo-oe/tmp/deploy/glibc/ipk/armv7a/libnet-whois-arin-per=
l_0.11-r1.6_armv7a.ipk
> NOTE: Not creating empty archive for libnet-whois-arin-perl-doc-0.11-r1.6
> Packaged contents of libnet-whois-arin-perl-dev into
> /home/vdubhack/overo-oe/tmp/deploy/glibc/ipk/armv7a/libnet-whois-arin-per=
l-dev_0.11-r1.6_armv7a.ipk
> NOTE: Not creating empty archive for libnet-whois-arin-perl-static-0.11-r=
1.6
> NOTE: Not creating empty archive for libnet-whois-arin-perl-locale-0.11-r=
1.6
> NOTE: Running task 915 of 922 (ID: 5,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_package_write)
> NOTE: Running task 916 of 922 (ID: 4,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_qa_staging)
> NOTE: Running task 917 of 922 (ID: 6,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_package_stage)
> NOTE: Running task 918 of 922 (ID: 16,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_distribute_sources)
> NOTE: Running task 919 of 922 (ID: 7,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_package_stage_all)
> NOTE: Running task 920 of 922 (ID: 10,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_build)
> NOTE: Running task 921 of 922 (ID: 17,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_rm_work)
> NOTE: Running task 922 of 922 (ID: 8,
> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-pe=
rl_0.11.bb,
> do_rm_work_all)
> NOTE: Tasks Summary: Attempted 922 tasks of which 903 didn't need to
> be rerun and 0 failed.
>

Sorry guess I need to go to sleep here is the recipe I built without
the depends, the first one is the ones it says it needs in CPAN, here
the one that I built and installed::

DESCRIPTION =3D "Net::Whois::ARIN   	whois arin "
SECTION =3D "libs"
LICENSE =3D "Perl"
PR =3D "r1"

SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TC/TCAINE/Net-Whois-A=
RIN-${PV}.tar.gz"

S =3D "${WORKDIR}/Net-Whois-ARIN-${PV}"

inherit cpan

BBCLASSEXTEND=3D"native"

SRC_URI[md5sum] =3D "a5aee39187c6272acd2a77e30847fdef"
SRC_URI[sha256sum] =3D
"d47a6720ff265674cbd918d866c73221be9916d81e1c30ccdb0d49e6b45110e8"


