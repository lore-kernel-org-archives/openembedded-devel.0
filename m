Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhRr4-00041k-Df
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 21:45:51 +0200
Received: by pvf24 with SMTP id 24so528555pvf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 12:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=INq0qmGWQAmTK8IyN2+AudOZM0MXzrPgIFOzxm72t7A=;
	b=GYqvQEc3jdMMLVAWp5luEQztoKFOW8Sx1LW3ZffBWbOK+i+tQ/psLIipsB3FRuuL1c
	Sccn3w2i9QR2M8tzGPya8fcq7+Jt+/ehRT/G0fBeIm2UAa/5QNr7d2n8BCpXBxy8vYB6
	i05il1li0cP0d2VnV3AWSi/VeAEfbj7PESRss=
Received: by 10.68.14.98 with SMTP id o2mr3519254pbc.10.1310672509102; Thu, 14
	Jul 2011 12:41:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Thu, 14 Jul 2011 12:41:18 -0700 (PDT)
In-Reply-To: <ivnfns$uho$1@dough.gmane.org>
References: <1310626478-31452-1-git-send-email-raj.khem@gmail.com>
	<ivnfns$uho$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Jul 2011 12:41:18 -0700
Message-ID: <CAMKF1spTH+AQK5V52QJ0WpUFqrXXNgcKq6N6A=ci0qbfzNWoDA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] classes/testlab: Enhance to dump license information
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
X-List-Received-Date: Thu, 14 Jul 2011 19:45:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2011 at 12:23 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 14-07-11 08:54, Khem Raj schreef:
>> It will now additionally create a new file which will contain list of li=
censes of installed packages in a given image.
>>
>> The fix to get the package name is there because the packages which cont=
ains epoch PE in the version string were not being constructed correctly si=
nce opkg-cl would dump 'epoch:version' for Version string but the real ipk =
did not have 'epoch' in its name. e.g.
>>
>> for armv5te/libopkg0_0.1.8+svnr609-r2_armv5te.ipk
>>
>> Package: libopkg0 Version: 1:0.1.8+svnr609-r2
>>
>> as you can see version contained in ipk is not containing the 'epoch'
>>
>> so we have to eliminate 'epoch' from version we get from opkg-cl to for =
the installed ipk name correctly.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- meta-oe/classes/testlab=
.bbclass | =C2=A0 =C2=A08 +++++++- 1 files changed, 7 insertions(+), 1 dele=
tions(-)
>>
>> diff --git a/meta-oe/classes/testlab.bbclass b/meta-oe/classes/testlab.b=
bclass index cd59782..fd37242 100644 --- a/meta-oe/classes/testlab.bbclass =
+++ b/meta-oe/classes/testlab.bbclass @@ -36,7 +36,10 @@ if [ -e =C2=A0${IM=
AGE_ROOTFS}/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" =3D "full" echo =
-e
>> "digraph depends {\n =C2=A0 =C2=A0node [shape=3Dplaintext]" > ${TESTLAB_=
DIR}/depends.dot
>>
>> for pkg in $(opkg-cl ${IPKG_ARGS} list_installed | awk '{print $1}') ; d=
o - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opkg-cl ${IPKG_ARGS} info $pkg | gre=
p -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Package/ {=
printf $2"_"} /^Version/ {printf $2"_"} /^Archi/ {print $2".ipk"}' =C2=A0>>=
 ${TESTLAB_DIR}/installed-packages.txt
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name=3D`opkg-cl ${IPKG_ARGS}=
 info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | a=
wk '/^Package/ {printf $2"_"}'` + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name=3D=
$name`opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(instal=
led\)\|\(unpacked\)\)" | awk -F: '/^Version/ {printf $NF"_"}' | sed
>> 's/^\s*//g'` + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0na=
me=3D$name`opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(i=
nstalled\)\|\(unpacked\)\)" | awk '/^Archi/ {print $2".ipk"}'` + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $name >>${TESTLAB_DIR}/installed-packa=
ges.txt
>>
>> for depends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep ^Depends) ; do ec=
ho "$pkg OPP $depends;" | grep -v "(" | grep -v ")" | grep -v "$pkg OPP Dep=
ends" | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:=
->:g' >> ${TESTLAB_DIR}/depends.dot @@ -65,6 +68,9 @@ if [ -e
>> ${IMAGE_ROOTFS}/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" =3D "full=
" du -k $(find ${DEPLOY_DIR_IPK} -name "$file") | head -n1 done | grep "\.i=
pk" | sed -e s:${DEPLOY_DIR_IPK}::g | sort -n -r | awk '{print $1 "\tKiB " =
$2}' > ${TESTLAB_DIR}/installed-package-sizes.txt
>>
>> + =C2=A0 =C2=A0 for file in $(cat ${TESTLAB_DIR}/installed-packages.txt)=
 ; do + =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "`find ${DEPLOY_DIR_IPK} -name "$f=
ile" | xargs opkg-list-fields | grep ^License | sed -e 's/^.*:[ \t]*//g'`" =
'=3D' $file + =C2=A0 done | awk -F=3D '{printf("%50s:%s\n", $1, $2)}' > ${T=
ESTLAB_DIR}/installed-package-licenses.txt # Log
>> results to a git controlled directory structure than can be pushed to a =
remote location if [ "${TESTLABLOG}" =3D "remote" ] && [ -n "${TESTLABREMOT=
EDIR}" ] ; then TESTLABLOGDIR=3D"${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME=
}"
>
> I like the idea, but I'm not fond of the formatting:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0MIT : angstrom-feed-configs_1.0-r15_qemuarm.ipk
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0MIT : angstrom-task-boot_1.0-r1_qemuarm.ipk
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0MIT : angstrom-version_v2011.07-core-r9_qemuarm.ipk
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPLv2+ & LGPLv2.1+ : avahi-daemon_0.6.30-r4=
_armv5te.ipk
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPLv2+ & LGPLv2.1+ : avahi-systemd_0.6.30-r=
4_armv5te.ipk
>
> [..]
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 GPLv2 & LGPLv2 & BSD & MIT : libext2fs2_1.41.14-r1_armv5te.ipk
> GCC RUNTIME LIBRARY EXCEPTION & GPLv2 & GPLv3 & LGPLv2.1 & LGPLv3 : libgc=
c1_4.5-r39.1+svnr175127_armv5te.ipk
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPLv2+ & LGPLv2.1+ : libgcrypt11_1.4.6-r0_a=
rmv5te.ipk
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LGPLv2+ & BSD & PD : libglib-2.0-0_2.28.8-r=
2_armv5te.ipk
>
> As you can see it breaks with stupidly long licenses like gcc.

yes. I tried several formats the license strings can go as long as 100
columns so I decided to use something average
I also thought of reversing the columns but ipk names can be
horrendously long as well.

I'm wondering if we shouldn't just add an extra column in install*packages*=
.

I am not averse to do that but it might be better telling if license
infos are in a file of its own. plus if we have to run
supposedly newer pass of some other feature then we wont be able to
use installed_packages.txt with our processing.

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFOH0I8MkyGM64RGpERAkT+AJ4h2TQz0kfhB8Gr90S+zyFl66vruACgn/9K
> s1qBVPCzyTzj6+tJpbDylyc=3D
> =3DE1O3
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


