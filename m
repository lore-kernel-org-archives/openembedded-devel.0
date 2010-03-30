Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NwfZw-0001IO-RK
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 19:50:18 +0200
Received: by pvc30 with SMTP id 30so1033516pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 10:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=GJkjGwKIwNwaWWyHucft/K1HGSsKczHfEfGVR5Cj/vA=;
	b=OJgKZ/gD8vhKpoAC78KK07cnsHj74dEfEo5JiFa5pWm0qf9EW9svCan0zLFGjq8aLo
	DfyE400NHEagThMtrf8AT7cRC3mcEitjs+BhU4xSJZGzHRmElqjmijzkagUlY/ypky6Q
	ft4GgkR0R8m88TT6mvlUfpOrX91VUIQqe0nA4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=LwYYiQ4qmJRAcHcy+geFPkhi6r12XA5cEiXW2yUAW9+Z7E/6cP+Ls2b6Wf7ZtglSWM
	bSSSsLW8BnjgGyC1R1YUqJg3aHjaXr57AjDrQoMZfHPoUWjoMxyfg2CdmsJ05mukZJFn
	yQ9bCaldgjFcK0Wp91NXQ7CWdqma/q8I2uo3U=
MIME-Version: 1.0
Received: by 10.231.32.66 with HTTP; Tue, 30 Mar 2010 10:47:00 -0700 (PDT)
In-Reply-To: <1269958983.6277.37.camel@trini-m4400>
References: <1269886592-669-1-git-send-email-k.kooi@student.utwente.nl>
	<1269958983.6277.37.camel@trini-m4400>
Date: Tue, 30 Mar 2010 10:47:00 -0700
Received: by 10.114.33.32 with SMTP id g32mr458611wag.173.1269971220538; Tue, 
	30 Mar 2010 10:47:00 -0700 (PDT)
Message-ID: <19c1b8a91003301047o5ccd93e5v32779d478b071825@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [PATCH] gcc-cross: fix gfortran -> g77 linking logic
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
X-List-Received-Date: Tue, 30 Mar 2010 17:50:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2010 at 7:23 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On Mon, 2010-03-29 at 20:16 +0200, Koen Kooi wrote:
>> From: Koen Kooi <koen@openembedded.org>
>
> Acked-by: Tom Rini <tom_rini@mentor.com>

Looks good.

 Acked-by: Khem Raj <raj.khem@gmail.com>

>
>>
>> ---
>> =A0recipes/gcc/gcc-configure-cross.inc | =A0 13 +++++++++++++
>> =A0recipes/gcc/gcc-package-cross.inc =A0 | =A0 14 ++++++++------
>> =A02 files changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/recipes/gcc/gcc-configure-cross.inc b/recipes/gcc/gcc-confi=
gure-cross.inc
>> index 1c37de8..7dde9de 100644
>> --- a/recipes/gcc/gcc-configure-cross.inc
>> +++ b/recipes/gcc/gcc-configure-cross.inc
>> @@ -51,5 +51,18 @@ do_stage_append () {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i "s|dependency_libs\s*=3D\s*.*|depende=
ncy_libs=3D'-L${CROSS_DIR}/${TARGET_SYS}/$d ${LIBGCCS_VAR} -lc -lm '|" ${CR=
OSS_DIR}/${TARGET_SYS}/$d/libsupc++.la || true
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i "s|dependency_libs\s*=3D\s*.*|depende=
ncy_libs=3D'-L${CROSS_DIR}/${TARGET_SYS}/$d ${LIBGCCS_VAR} -lc -lm '|" ${CR=
OSS_DIR}/${TARGET_SYS}/$d/libstdc++.la || true
>> =A0 =A0 =A0 done
>> +
>> + =A0 =A0# Link gfortran to g77 to satisfy not-so-smart configure or har=
d coded g77
>> + =A0 =A0# gfortran is fully backwards compatible. This is a safe and pr=
actical solution.
>> + =A0 =A0if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
>> + =A0 =A0 =A0 =A0 =A0 currdir=3D"$PWD"
>> + =A0 =A0 =A0 =A0 =A0 cd ${CROSS_DIR}/bin/
>> + =A0 =A0 =A0 =A0 =A0 ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g7=
7 || true
>> + =A0 =A0 =A0 =A0 =A0 if [ -d ${CROSS_DIR}/${TARGET_SYS}/bin/ ] ; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cd ${CROSS_DIR}/${TARGET_SYS}/bin/
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ln -sf gfortran g77 || true
>> + =A0 =A0 =A0 =A0 =A0 fi
>> + =A0 =A0 =A0 =A0 =A0 cd $currdir
>> + =A0 =A0fi
>> =A0}
>>
>> diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package=
-cross.inc
>> index 6c4f9bb..0f91861 100644
>> --- a/recipes/gcc/gcc-package-cross.inc
>> +++ b/recipes/gcc/gcc-package-cross.inc
>> @@ -63,16 +63,18 @@ do_install () {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${TARGET_PREFIX}strip ${D}${target_libdi=
r}/libg2c.so.* || true
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${TARGET_PREFIX}strip ${D}${target_base_=
libdir}/libgcc_s.so.* || true
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${TARGET_PREFIX}strip ${D}${target_libdi=
r}/libgfortran*.so* || true
>> - =A0 =A0 fi
>> + =A0 =A0 =A0 fi
>>
>> =A0 =A0 =A0 =A0 # Link gfortran to g77 to satisfy not-so-smart configure=
 or hard coded g77
>> =A0 =A0 =A0 =A0 # gfortran is fully backwards compatible. This is a safe=
 and practical solution.
>> - =A0 =A0 =A0 if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
>> + =A0 =A0 =A0 if [ -f ${D}${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; t=
hen
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0currdir=3D"$PWD"
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0cd ${CROSS_DIR}/bin/
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0cd ${D}${CROSS_DIR}/bin/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ln -sf ${TARGET_PREFIX}gfortran ${TARGET_=
PREFIX}g77 || true
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0cd ${CROSS_DIR}/${TARGET_SYS}/bin/
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0ln -sf gfortran g77 || true
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0if [ -d ${CROSS_DIR}/${TARGET_SYS}/bin/ ] ;=
 then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cd ${CROSS_DIR}/${TARGET_SYS}/bin/
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ln -sf gfortran g77 || true
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cd $currdir
>> - =A0 =A0 =A0 fi
>> + =A0 =A0 =A0 =A0fi
>> =A0}
>
>
> --
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


