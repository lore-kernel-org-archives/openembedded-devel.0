Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD036D6F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2019 13:05:01 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id k21so25547648edq.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2019 06:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Lr4W9eOFbXkMnKBJ+HN+isnlHRZT3IIkB0mdXr9ofQA=;
	b=YSwoodKbottZ4bzFVxzCvZpXzNi5YYvggwFO4uQTEe25Ti4vfTMilVFUM0V3k7m73J
	PNcSygyzmHPwDOXQyFRcjsKzTWrfjU1oQ0qSwhH4a/7qeETUXwmEyWE6KQqLpngVDOhI
	/KmzxpNZz2NGfLTPnlnMVmOPNzBo22mUZWGHHEY2m2zbMyWewEXFIybU2oEI2O7x8Quh
	dYfZXv6zLqDodIDUY4O3bEG0YPFPG8oDVTgtZutU5nhv/RGrX+UIQrwXgTgXyLvc+tOz
	dwdZwS9ovbwL9+3ZQvGCk2PSthz9VyE5GXPgAS740n6kqtvONqVMJO6JnHw5BbrgfoXh
	jqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Lr4W9eOFbXkMnKBJ+HN+isnlHRZT3IIkB0mdXr9ofQA=;
	b=AjgBE8dm4XPcCbnDDrIP2K3pmslfa1mOFaDBaxkxmXgP6TIy29E4UOoKnVFj1NA7kY
	wKjDn0o/CaAd9SSTZbX4QiVm81c4mg/b2RTIEsLWgVj+RqVoX7GgW5suPVsTTP0C/apq
	HDjw/PqXltFGYvU3YvB2l9O1is2AU1A3f6wf4Z3yTBgs+zpWxAQFY4Ujm8f1+jVBQb5x
	9/7IVnYwYSgBTPc7F8a2YaTt7MPQoGsY3OA2o/hO1EUmNsODvOW3olEsz9VQYjcoUVYm
	/fa9cZBZH755Ut2zG9AiOELjNY2j8EPO6enRMGZxxjqjF2qXgPe6eVzrlyOWKRnG+ltK
	4GJQ==
X-Gm-Message-State: APjAAAUXQ4E9Vc4SIkIkk3yZKmihUVtw+eQlur5t2+DLySLgikroHLSY
	V93zn1m/inZrQa5nEajx+zqNWXHd4dWY64TD+x4=
X-Google-Smtp-Source: APXvYqzfAVnj6xpeZLHG6m/CTKLqmWPCu008MhVoz1RspRuL32eou8CqkkmmGURbSQ7oTpL6GH99DAKcu6wIrhFnO2I=
X-Received: by 2002:a17:906:e95:: with SMTP id
	p21mr30387163ejf.205.1563368702185; 
	Wed, 17 Jul 2019 06:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
	<a853162aa82bf2c1723190f00fc6ad608ab21fc8.1561696450.git.timothy.t.orling@linux.intel.com>
In-Reply-To: <a853162aa82bf2c1723190f00fc6ad608ab21fc8.1561696450.git.timothy.t.orling@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Jul 2019 15:04:57 +0200
Message-ID: <CA+chaQfnfvnSjEJbKoEf7gtF-FaM0rfNoRVWiJtSPcfuR+s4oQ@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/9] libdbi-perl: fix dependencies
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
X-List-Received-Date: Wed, 17 Jul 2019 13:05:01 -0000
Content-Type: text/plain; charset="UTF-8"

This causes libdbi-perl-native to depend on target perl again, why did you
revert the fix from:
http://git.openembedded.org/meta-openembedded/commit/?id=eb868d056d15a56596cbf6ed3a4b66b054f2d563
?

 === Comparing signatures for task do_populate_sysroot.sigdata between
qemux86 and qemux86copy ===
ERROR: libdbi-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86 and qemux86copy
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile: build/cache/prserv.sqlite3, IP:
127.0.0.1, PORT: 38307, PID: 13970
Hash for dependent task perl/perl_5.30.0.bb.do_populate_sysroot
changed from e3a38726fc849347a14b574ef52a59f5578632accbf70259a6ffd09fea54dc4e
to de2eb1fa749aab50f0e99c144a875bd50025fbb6299723f2e7ad28b49bbadf78
Unable to find matching sigdata for
oe-core/meta/recipes-devtools/perl/perl_5.30.0.bb.do_populate_sysroot
with hash de2eb1fa749aab50f0e99c144a875bd50025fbb6299723f2e7ad28b49bbadf78

ERROR: 1 errors found in
sstate-diff/1563367471/signatures.qemux86copy.do_populate_sysroot.sigdata.log



On Fri, Jun 28, 2019 at 7:00 AM Tim Orling <timothy.t.orling@linux.intel.com>
wrote:

> * Fix RDEPENDS, drop class-target (dependencies are the same for native)
> * Reorganize recipe to best practices
> * Add ptest dependencies
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  .../perl/libdbi-perl_1.642.bb                 | 38 +++++++++++++++----
>  1 file changed, 31 insertions(+), 7 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> index ff4a9d0610..77991bd158 100644
> --- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> +++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> @@ -7,13 +7,6 @@ database interface independent of the actual database
> being used. \
>  HOMEPAGE = "http://search.cpan.org/dist/DBI/"
>  SECTION = "libs"
>  LICENSE = "Artistic-1.0 | GPL-1.0+"
> -RDEPENDS_${PN}_class-target = " \
> -    perl-module-carp \
> -    perl-module-exporter \
> -    perl-module-exporter-heavy \
> -    perl-module-dynaloader \
> -"
> -
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
>
>  SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
> @@ -34,4 +27,35 @@ do_install_prepend() {
>         rm -rf ${B}/t/z*.t
>  }
>
> +RDEPENDS_${PN} = " \
> +    perl-module-carp \
> +    perl-module-exporter \
> +    perl-module-exporter-heavy \
> +    perl-module-dynaloader \
> +    perl-module-io-dir \
> +    perl-module-scalar-util \
> +    perl-module-universal \
> +"
> +
> +RDEPENDS_${PN}-ptest = " \
> +    ${PN} \
> +    perl-module-b \
> +    perl-module-benchmark \
> +    perl-module-cwd \
> +    perl-module-data-dumper \
> +    perl-module-encode \
> +    perl-module-encode-byte \
> +    perl-module-encode-encoding \
> +    perl-module-file-copy \
> +    perl-module-file-path \
> +    perl-module-lib \
> +    perl-module-perlio \
> +    perl-module-perlio-scalar \
> +    perl-module-perlio-via \
> +    perl-module-sdbm-file \
> +    perl-module-storable \
> +    perl-module-test-more \
> +    perl-module-utf8 \
> +    "
> +
>  BBCLASSEXTEND = "native"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

