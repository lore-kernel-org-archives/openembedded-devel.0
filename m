Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4F21F72EB0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:20:03 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id t25-v6so1209882wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 02:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=myhU7A/T9fJLAyo0VmAmfpKI7aliZqaExUvy/6oH8qw=;
	b=rCkk/mEUD/GOS0k6N2BancHu4qYnoN0isbhjxP+eD1OaZSvKmoaGn4qZgNpO74RzPo
	3F8I09+fclbzG9Ijq9cSVpneCDYes3hkfM0Z0Av7dcj/O3BaSHkIHO3mJkLLOIuj/4cv
	md0BoA/kuuu8m15Cr6Bu1tbztty3ji0Yt+klbFLus6WBNFK3LGlNyhH/miiLRoPFqx4U
	fJbYY2Gv2rZyNaUfdzkwKbWherUCKwAV7zs2nArxghyPKZGwARnddNCgl63YO21Huu67
	J98bpyzu10AoCvLsZGQk+DsQM2Ko7awmxNvHrvFMZlHN6ThNjnZguJyLViPoopZbBsor
	nIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=myhU7A/T9fJLAyo0VmAmfpKI7aliZqaExUvy/6oH8qw=;
	b=dxj82MU32i2MKZFlnt/uiJ6HQ/k5XScL4RSV+f5qpKyR1kdLdfq386U1CJSd6pNt1y
	v5cZ0Uum3+Z+30+rM5jpR9K5D5q0kMbxr3x7+D95Hg89MmQ3H2zdsPGXyFY9D5PBI4RV
	Ta5d7HV2PbM6wpg35w4jgRdPktUOdIqd48IK9B8LtwiP46JgwDWgcjc/yH9LJn691Pjc
	aRMbmS1u2mynnbMUvRlS1oeZ74AZ6in19MWC8n5PAXUiJ2Gy+4YfLoXFYn8WjR9dOnR5
	Vr1tQAqCbXwzHCHfN/hdB9C5ZZZg+l23XwNFm/kzmY+4tnEXDVo1vALsKOKGkJbBMW+T
	jwBA==
X-Gm-Message-State: APzg51D+B0bLt1z5RVWos7irQmpFciMe9XHv1Cn4lGJMZj/ST/7iUhcr
	zZml72BoL1Z4EJeq4r8w7G7oFYuP65Scn2b7jaY=
X-Google-Smtp-Source: ANB0VdacXpItfdFiqZtf+4NlOTOazZee0J1m6xkvTnzhDyaCfImbh3BlbtivWhIxhx7SGgAURCozIXDVlRk3mrSvoOQ=
X-Received: by 2002:a1c:4887:: with SMTP id
	v129-v6mr725755wma.129.1535448004133; 
	Tue, 28 Aug 2018 02:20:04 -0700 (PDT)
MIME-Version: 1.0
Sender: rehsack@gmail.com
Received: by 2002:a5d:6511:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 02:20:03
	-0700 (PDT)
In-Reply-To: <CAMKF1sqL5N-kM++o2qroPxWJWB3gDKofLBDvs35v54Q4fh5kjA@mail.gmail.com>
References: <20180827132729.23213-1-sno@netbsd.org>
	<CAMKF1sqL5N-kM++o2qroPxWJWB3gDKofLBDvs35v54Q4fh5kjA@mail.gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Date: Tue, 28 Aug 2018 11:20:03 +0200
X-Google-Sender-Auth: ZquE0tRGKuEpTIR4b4SeX_W6Y9k
Message-ID: <CAANR1XE2vqjbEWdSW-pB6V4xDBh+z+JgAGK64A6uwRUp6P3k+w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH] libnet-ssleay-perl: Fix configure issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2018 09:20:03 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-27 18:44 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> On Mon, Aug 27, 2018 at 6:27 AM Jens Rehsack <sno@netbsd.org> wrote:
>>
>> Fix libnet-ssleay-perl tries to execute found openssl binaries
>> at the place of ${OPENSSL_PREFIX} and bailing out when either
>> binaries are missing or can't be executed. From cross-compiling
>> perspective, both is insane.
>>
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>>  .../no-exec-on-configure.patch                | 33 +++++++++++++++++++
>>  .../libnet/libnet-ssleay-perl_1.85.bb         |  8 +++--
>>  2 files changed, 39 insertions(+), 2 deletions(-)
>>  create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
>>
>> diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
>> new file mode 100644
>> index 000000000..6efa7d8f9
>> --- /dev/null
>> +++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
>> @@ -0,0 +1,33 @@
>> +--- a/inc/Module/Install/PRIVATE/Net/SSLeay.pm 2018-08-27 14:56:24.788544991 +0200
>> ++++ b/inc/Module/Install/PRIVATE/Net/SSLeay.pm 2018-08-27 15:00:12.847266331 +0200
>> +@@ -24,20 +24,7 @@
>> +     $self->requires_external_cc;
>> +
>> +     my $prefix = $self->find_openssl_prefix;
>> +-    my $exec   = $self->find_openssl_exec($prefix);
>> +-
>> +-    unless (-x $exec) {
>> +-        print <<EOM;
>> +-*** Could not find OpenSSL
>> +-    If it's already installed, please set the OPENSSL_PREFIX environment
>> +-    variable accordingly. If it isn't installed yet, get the latest version
>> +-    from http://www.openssl.org/.
>> +-EOM
>> +-        exit 0; # according http://wiki.cpantesters.org/wiki/CPANAuthorNotes this is best-practice when "missing library"
>> +-    }
>> +-
>> +-    $self->check_openssl_version($prefix, $exec);
>> +-    my $opts = $self->ssleay_get_build_opts($prefix, $exec);
>> ++    my $opts = $self->ssleay_get_build_opts($prefix);
>> +
>> +     $self->makemaker_args(
>> +         CCCDLFLAGS => $opts->{cccdlflags},
>> +@@ -58,7 +45,7 @@
>> + }
>> +
>> + sub ssleay_get_build_opts {
>> +-    my ($self, $prefix, $exec) = @_;
>> ++    my ($self, $prefix) = @_;
>> +
>> +     my $opts = {
>> +         lib_links  => [],
>> diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
>> index a0bb90e7d..6a116459e 100644
>> --- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
>> +++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
>> @@ -23,6 +23,7 @@ RDEPENDS_${PN} += "\
>>  "
>>
>>  SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
>> +           file://no-exec-on-configure.patch \
>>             file://run-ptest \
>>            "
>>  SRC_URI[md5sum] = "d602bdce4e0531c6efc276e3e429ca69"
>> @@ -32,9 +33,12 @@ S = "${WORKDIR}/Net-SSLeay-${PV}"
>>
>>  inherit cpan ptest
>>
>> -export OPENSSL_PREFIX="${STAGING_LIBDIR}"
>> +#EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR} LIBS='-L${STAGING_LIBDIR} -lcrypto -lssl -L${STAGING_BASELIBDIR} -lz'"
>>
>> -EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR} LIBS='-L${STAGING_LIBDIR} -lcrypto -lssl -L${STAGING_BASELIBDIR} -lz'"
>> +do_configure() {
>> +    export OPENSSL_PREFIX="${STAGING_DIR_TARGET}/usr"
>
> perhaps use STAGING_EXECPREFIXDIR

I dig for it ;)
But meanwhile - please check whether it helps ;)

>> +    cpan_do_configure
>> +}
>>
>>  do_install_ptest() {
>>      cp -r ${B}/t ${D}${PTEST_PATH}
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

