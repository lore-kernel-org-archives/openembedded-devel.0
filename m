Return-Path: <joe@deserted.net>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id C6D0C65E39
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 12:38:54 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id l13so962485iga.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 05:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=IT/iR5nsZlZ5kaWHXOQGokytpCGakxARbC1FK4lE6AE=;
	b=mYeVfBlsswf+e/U9GckBgx/909nWzfzl6P5L1wIPiXp006Kz2r4a1yRPLT1HJmfnyu
	KyTqs0kUd7aaEDbIv55N8OtV9gc7tSg1TBkjY59MQEj+r7apIc4BVWy8SrDTQ/IgGsPu
	hi9VMM19d93HFQIuHwdt7bCWGatrnPNADPOZjqtDGIJTNquEFU07TiVXD03d6Ff4gC7A
	+viRPl5ER5VGncDqw4tEFp51YU/XUom26o971fn7MnkCTj71SCux5qK4GrBpPaawWTfC
	zYy8bFEhRAphZ1Y5zUeLdx69KvIzKIlZcg4kc2SfH4mv2ca9yEndEQvuzGr/LDSLcChK
	G4bg==
X-Gm-Message-State: ALoCoQlEcZsCjWQuBDxxQBe5lknhJStHyfJduwWick/EuYhKRVhD8L6Z2OhDCbpFGJJMGHJ/CYtu
MIME-Version: 1.0
X-Received: by 10.50.109.202 with SMTP id hu10mr6951162igb.1.1401885534946;
	Wed, 04 Jun 2014 05:38:54 -0700 (PDT)
Sender: joe@deserted.net
Received: by 10.42.81.130 with HTTP; Wed, 4 Jun 2014 05:38:54 -0700 (PDT)
In-Reply-To: <lmmhei$ufg$1@ger.gmane.org>
References: <1401205819-21761-1-git-send-email-maxim.uvarov@linaro.org>
	<lmmhei$ufg$1@ger.gmane.org>
Date: Wed, 4 Jun 2014 08:38:54 -0400
X-Google-Sender-Auth: IOD1BsusNBEsKaahBJ1J0qKxIl4
Message-ID: <CANBf+V03377zoxEsbqdHZRJKkxymYb+j=fLRJvFXvsaiLjSvxQ@mail.gmail.com>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] update snort to 2.9.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jun 2014 12:38:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 4, 2014 at 3:21 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Maxim Uvarov schreef op 27-05-14 17:50:
>> 1. looks like snort dropped reference to barnyard2. At least it's missing
>> in configure. Also download link to barnyard2 is not available now. Drop
>> this package. 2. update snort version from 2.9.4.6 to 2.9.6.0. 3. fix
>> libdnet paths.
>
> Can you please split such patches in 2 parts next time? If someone wants to
> resurrect barnyard it will downgrade snort :/

Good point, I should've asked for that too.  FWIW, though, I don't
think barnyard2, as it existed in tree, was particularly
resurrect-able.  The download link is dead and the little bit of
searching I did around didn't turn up anything except the github
project.  I didn't see an explicit announcement about it, but it looks
like nobody is distributing release tarballs of barnyard2 anymore so I
didn't think there was a lot of value in preserving the old recipe, as
any new recipe would seem to need to be git-based.  :-/

-J.

>
>>
>> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org> ---
>> .../barnyard2-1.8/barnyard2-cross-fix.patch        | 24
>> ---------------------- .../barnyard2/barnyard2_1.8.bb
>> | 18 ---------------- .../snort/{snort_2.9.4.6.bb => snort_2.9.6.0.bb}
>> |  8 ++++---- 3 files changed, 4 insertions(+), 46 deletions(-) delete
>> mode 100644
>> meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
>>
>>
> delete mode 100644 meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
>> rename meta-networking/recipes-connectivity/snort/{snort_2.9.4.6.bb =>
>> snort_2.9.6.0.bb} (89%)
>>
>> diff --git
>> a/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
>> b/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
>>
>>
> deleted file mode 100644
>> index 7b5a60c..0000000 ---
>> a/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
>>
>>
> +++ /dev/null
>> @@ -1,24 +0,0 @@ -Upstream-Status: Pending - -Index:
>> barnyard2-1.8/configure.in
>> -=================================================================== ----
>> barnyard2-1.8.orig/configure.in       2010-08-03 15:12:06.000000000 +0400 -+++
>> barnyard2-1.8/configure.in    2010-08-03 15:13:46.000000000 +0400 -@@ -73,7
>> +73,7 @@ -     # libpcap doesn't even LOOK at the timeout you give it
>> under Linux -     AC_DEFINE([PCAP_TIMEOUT_IGNORED],[1],[Define if pcap
>> timeout is ignored]) -     AC_SUBST(extra_incl) --
>> extra_incl="-I/usr/include/pcap" -+    extra_incl="-I=/usr/include/pcap"
>> -     ;; -   *-hpux10*|*-hpux11*) -     AC_DEFINE([HPUX],[1],[Define if
>> HP-UX 10 or 11]) -@@ -230,7 +230,7 @@ - # In case INADDR_NONE is not
>> defined (like on Solaris) - have_inaddr_none="no" - AC_MSG_CHECKING([for
>> INADDR_NONE]) --AC_RUN_IFELSE( -+AC_COMPILE_IFELSE( - [AC_LANG_PROGRAM( -
>> [[ - #include <sys/types.h> diff --git
>> a/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
>> b/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb deleted
>> file mode 100644 index 14acdac..0000000 ---
>> a/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb +++
>> /dev/null @@ -1,18 +0,0 @@ -DESCRIPTION = "Barnyard2 is a fork of the
>> original barnyard project, designed specifically for Snort's new unified2
>> file format" -HOMEPAGE = "http://www.securixlive.com/barnyard2/" -LICENSE
>> = "GPLv2" -LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe" -DEPENDS =
>> "libpcap" - -SRC_URI = " \ -
>> http://www.securixlive.com/download/barnyard2/${BP}.tar.gz \ -
>> file://barnyard2-cross-fix.patch \ -  " -SRC_URI[md5sum] =
>> "72fc6c490db6ea6a0f46c27d24998067" -SRC_URI[sha256sum] =
>> "1abfe6530d721debd98921421722b02c844c289564730b1e85729e4915b2bb7a" -
>> -inherit autotools pkgconfig - -EXTRA_OECONF = "--enable-prelude
>> --enable-gre --without-mysql" - -CONFFILES_${PN} =
>> "${sysconfdir}/barnyard2.conf" diff --git
>> a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
>> b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb similarity
>> index 89% rename from
>> meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb rename to
>> meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb index
>> acb1b1a..aba2850 100644 ---
>> a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb +++
>> b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb @@ -13,8
>> +13,8 @@ SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
>> file://0001-libpcap-search-sysroot-for-headers.patch \ "
>>
>> -SRC_URI[tarball.md5sum] = "4111df01a4f21bd1d328a18b76d625bd"
>> -SRC_URI[tarball.sha256sum] =
>> "cfaa5390b1840aaaa68a6c05a7077dd92cb916e6186a014baa451d43cdb0b3bc"
>> +SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659"
>> +SRC_URI[tarball.sha256sum] =
>> "3cc6c8a9b52f4c863a5736a73b4012aff340b50b5e002771b04d4877f47cd19e"
>>
>> inherit autotools  gettext  update-rc.d
>>
>> @@ -28,6 +28,8 @@ EXTRA_OECONF = " \ --enable-reload-error-restart \
>> --enable-targetbased \ --disable-static-daq \ +
>> --with-dnet-includes=${STAGING_INCDIR} \ +
>> --with-dnet-libraries=${STAGING_LIBDIR} \ "
>>
>> do_install_append() { @@ -69,5 +71,3 @@ FILES_${PN}-dev += " \
>> ${libdir}/snort_dynamicrules/*.so \ ${prefix}/src/snort_dynamicsrc \ " -
>> -RRECOMMENDS_${PN} += "barnyard2"
>>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFTjskSMkyGM64RGpERAsiWAKCB+yFIp/CqWoMdC3QZcSUs792MSQCeK3GF
> fcCWJ3C+bI38YKdNGQqvBTc=
> =hPu+
> -----END PGP SIGNATURE-----
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

