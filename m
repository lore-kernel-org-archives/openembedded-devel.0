Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OKcm9-0005ts-7e
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 21:41:54 +0200
Received: by wyb32 with SMTP id 32so1191841wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 12:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=oom3fLErlVQYOk4pNqDlyYfpWSIBLqqVI5Bz8U6JsBY=;
	b=Vd4eVSu9kDnyrBSjC6sDM/cyzSvsiqQBRQOME9RAqzaPwQw41CiEK9sTeRfM683yx1
	VQ/u/2iz0dOVF3NPDumGFbU5pgFiG0xgq3MRGICrSEHc+UwDeIAVJr28Q6DEpw2OV1+i
	rzZ+dWrB6ffueuDQ1cfxaUo6S1l8toYsZgB04=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=GNoDRl2wQRc7gnaRlzgPovT8Xt2LzXCxK3FnRv0v3Q+5u6Zs4V79qvJCdqttFtlBA6
	S0iFxYT8l3HEa8QIOQrN2hxKorgi/2l1ehSTnbA8h8Da4RP5pagHhQ9ZYKfVcss8xFh8
	uoFOjz8J6EEWIP8oXqm8V0+DIPqmhdxOd0iXg=
MIME-Version: 1.0
Received: by 10.216.85.7 with SMTP id t7mr1101882wee.114.1275680255784; Fri, 
	04 Jun 2010 12:37:35 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.216.49.206 with HTTP; Fri, 4 Jun 2010 12:37:35 -0700 (PDT)
In-Reply-To: <1275504373-32623-1-git-send-email-cliff.brake@gmail.com>
References: <1275504373-32623-1-git-send-email-cliff.brake@gmail.com>
Date: Fri, 4 Jun 2010 15:37:35 -0400
X-Google-Sender-Auth: XRb_GVvghYM7Is-2X_ucbpQ518w
Message-ID: <AANLkTilBs6W1OMqbnKf9AujWBBGTWGyHo3Q3C9mr7URg@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] packaged-staging.bbclass: fix issue with no SRC_URI
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
X-List-Received-Date: Fri, 04 Jun 2010 19:41:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Below is the context for proposed patch.  Perhaps this will help
people review it.  I would like to get this pushed, so acks
appreciated.

4ad83f91 (Richard Purdie     2008-03-17 20:38:12 +0000 364)     echo
"Package: ${PSTAGE_PKGPN}"         >
${PSTAGE_TMPDIR_STAGE}/CONTROL/control
38f04328 (Richard Purdie     2008-03-14 11:38:00 +0000 365)     echo
"Version: ${PSTAGE_PKGVERSION}"    >>
${PSTAGE_TMPDIR_STAGE}/CONTROL/control
695ca198 (Richard Purdie     2008-02-19 12:08:38 +0000 366)     echo
"Description: ${DESCRIPTION}"      >>
${PSTAGE_TMPDIR_STAGE}/CONTROL/control
695ca198 (Richard Purdie     2008-02-19 12:08:38 +0000 367)     echo
"Section: ${SECTION}"              >>
${PSTAGE_TMPDIR_STAGE}/CONTROL/control
695ca198 (Richard Purdie     2008-02-19 12:08:38 +0000 368)     echo
"Priority: Optional"               >>
${PSTAGE_TMPDIR_STAGE}/CONTROL/control
695ca198 (Richard Purdie     2008-02-19 12:08:38 +0000 369)     echo
"Maintainer: ${MAINTAINER}"        >>
${PSTAGE_TMPDIR_STAGE}/CONTROL/control
38f04328 (Richard Purdie     2008-03-14 11:38:00 +0000 370)     echo
"Architecture: ${PSTAGE_PKGARCH}"  >>
${PSTAGE_TMPDIR_STAGE}/CONTROL/control
239d4346 (Koen Kooi          2008-04-11 07:39:51 +0000 371)
239d4346 (Koen Kooi          2008-04-11 07:39:51 +0000 372)     #
Protect against empty SRC_URI
3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 373)
srcuri=3D"${SRC_URI}"
3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 374)     if [
"$srcuri" =3D=3D "" ]; then
3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 375)
 srcuri=3D"OpenEmbedded"
239d4346 (Koen Kooi          2008-04-11 07:39:51 +0000 376)     fi
3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 377)     echo
"Source: ${SRC_URI}"               >>
${PSTAGE_TMPDIR_STAGE}/CONTROL/control
3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 378)
3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 379)     # Deal
with libtool not supporting sysroots
3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 380)     # Need
to remove hardcoded paths and fix these when we install the
3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 381)     #
staging packages.

This is the change where the code got changed:

 	# Protect against empty SRC_URI
-	if [ "${SRC_URI}" !=3D "" ] ; then	=09
-		echo "Source: ${SRC_URI}"               >>
${PSTAGE_TMPDIR_STAGE}/CONTROL/control
-	else
-		echo "Source: OpenEmbedded"               >>
${PSTAGE_TMPDIR_STAGE}/CONTROL/control
+	srcuri=3D"${SRC_URI}"
+	if [ "$srcuri" =3D=3D "" ]; then
+		srcuri=3D"OpenEmbedded"
 	fi
+	echo "Source: ${SRC_URI}"               >>
${PSTAGE_TMPDIR_STAGE}/CONTROL/control

It appears that the above patch is what broke it.  The proposed fix is
in the previous email below.

Thanks,
Cliff


On Wed, Jun 2, 2010 at 2:46 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> From: Cliff Brake <cbrake@bec-systems.com>
>
> Currently with srctree, we get errors like the following:
> | + srcuri=3D
> | + '[' '' =3D=3D '' ']'
> | + srcuri=3DOpenEmbedded
> | + echo 'Source: '
> | ++ find /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-=
angstrom-linux-gnueabi/autotools-demo-1.0-28-g3a96627-r0/staging-pkg '(' -n=
ame '*.la' -o -name '*-config' ')' -type f
> | + stage-manager-ipkg-build -o 0 -g 0 /scratch/oe/oe-build/oe/build/angs=
trom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-28-g=
3a96627-r0/staging-pkg /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/ps=
tage/angstromglibc
> | *** Error: CONTROL/control is missing field Source
> | The Source field contain the URL's or filenames of the source code and =
any patches
> | used to build this package. =A0Either gnu-style tarballs or Debian sour=
ce packages
> | are acceptable. =A0Relative filenames may be used if they are distribut=
ed in the same
> | directory as the .ipk file.
> |
> | ipkg-build: Please fix the above errors and try again.
> | ERROR: Function staging_packager failed
> NOTE: package autotools-demo-1.0-28-g3a96627-r0: task do_package_stage: F=
ailed
> ERROR: TaskFailed event exception, aborting
>
> This patch fixes that issue.
>
> Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
> ---
> =A0classes/packaged-staging.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.=
bbclass
> index 83f3578..6413afb 100644
> --- a/classes/packaged-staging.bbclass
> +++ b/classes/packaged-staging.bbclass
> @@ -374,7 +374,7 @@ staging_packager () {
> =A0 =A0 =A0 =A0if [ "$srcuri" =3D=3D "" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0srcuri=3D"OpenEmbedded"
> =A0 =A0 =A0 =A0fi
> - =A0 =A0 =A0 echo "Source: ${SRC_URI}" =A0 =A0 =A0 =A0 =A0 =A0 =A0 >> ${=
PSTAGE_TMPDIR_STAGE}/CONTROL/control
> + =A0 =A0 =A0 echo "Source: ${srcuri}" =A0 =A0 =A0 =A0 =A0 =A0 =A0 >> ${P=
STAGE_TMPDIR_STAGE}/CONTROL/control
>
> =A0 =A0 =A0 =A0# Deal with libtool not supporting sysroots
> =A0 =A0 =A0 =A0# Need to remove hardcoded paths and fix these when we ins=
tall the
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


