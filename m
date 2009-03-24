Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lm8fM-00087p-6f
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 16:35:48 +0100
Received: by gxk18 with SMTP id 18so6361596gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 08:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gzCQHjwQ42+5XNeRCo3/7bwV2lBrVLZQXIgBqnuxNNo=;
	b=YAPcHWhB+GZDN9s+4Oy9K4Dr/12iRXYoZQ5n6fQeRfRiw4mEtxx8YoABKpleCX2FJi
	LrziKgmf+tBcs7/HOdSazJDVIcyBYx/Pd15mLfSmcbAh6R3briWrEY4luBr0353NqKfv
	RDmScTXcRxgzL872aj8rClJa7h+avU3k2IE9Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OCrW80GL1FJP2qVUcWs7ZqvAwlkTTXHlpNmW8Ln7ZQiatCTkyOhieq9n7DfCqhYjai
	MmBs5PL0Dh8C16ra6pxCSrrbNMmJiBsqSEhje9srYW+fNj29yD93aJ9LZMnVnOd72/7J
	6Y/zzYzIW8oG8WX4YQtQb4MlUYZrgzX7tuZlU=
MIME-Version: 1.0
Received: by 10.151.45.2 with SMTP id x2mr15167716ybj.109.1237908856272; Tue, 
	24 Mar 2009 08:34:16 -0700 (PDT)
In-Reply-To: <alpine.DEB.1.00.0903191100190.9107@localhost.localdomain>
References: <alpine.DEB.1.00.0903191100190.9107@localhost.localdomain>
Date: Tue, 24 Mar 2009 11:34:16 -0400
Message-ID: <f96d234e0903240834x79f7534cr6a22a899cc6350af@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] doc/usermanual/chapters: Replace references to packages dir with recipes dir.
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
X-List-Received-Date: Tue, 24 Mar 2009 15:35:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Applied thanks.

The automatic update of the docs on the OE website is running again.
It was down for about a week after a workstation rebuild.

Thanks,
Cliff

On Thu, Mar 19, 2009 at 2:02 PM, Theodore A. Roth <taroth@gmail.com> wrote:
>
> ---
> =A0docs/usermanual/chapters/common_use_cases.xml | =A0 =A06 +-
> =A0docs/usermanual/chapters/features.xml =A0 =A0 =A0 =A0 | =A0 =A08 ++--
> =A0docs/usermanual/chapters/getting_oe.xml =A0 =A0 =A0 | =A0 =A06 +-
> =A0docs/usermanual/chapters/metadata.xml =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0docs/usermanual/chapters/recipes.xml =A0 =A0 =A0 =A0 =A0| =A0 30 +++++=
++-------
> =A0docs/usermanual/chapters/usage.xml =A0 =A0 =A0 =A0 =A0 =A0| =A0 50 +++=
+++++++++------------
> =A06 files changed, 51 insertions(+), 51 deletions(-)
>
> diff --git a/docs/usermanual/chapters/common_use_cases.xml b/docs/userman=
ual/chapters/common_use_cases.xml
> index 4497683..143cbe0 100644
> --- a/docs/usermanual/chapters/common_use_cases.xml
> +++ b/docs/usermanual/chapters/common_use_cases.xml
> @@ -252,10 +252,10 @@ export LOCALDIR=3D$PWD/secret-isv
>
> =A0 =A0 =A0 =A0 <screen>
> =A0DL_DIR =3D "${OEDIR}/sources"
> -BBFILES :=3D "${OEDIR}/openembedded/packages/*/*.bb ${LOCALDIR}/packages=
/*/*.bb"
> +BBFILES :=3D "${OEDIR}/openembedded/recipes/*/*.bb ${LOCALDIR}/recipes/*=
/*.bb"
> =A0BBFILE_COLLECTIONS =3D "upstream local"
> -BBFILE_PATTERN_upstream =3D "^${OEDIR}/openembedded/packages/"
> -BBFILE_PATTERN_local =3D "^${LOCALDIR}/packages/"
> +BBFILE_PATTERN_upstream =3D "^${OEDIR}/openembedded/recipes/"
> +BBFILE_PATTERN_local =3D "^${LOCALDIR}/recipes/"
> =A0BBFILE_PRIORITY_upstream =3D "5"
> =A0BBFILE_PRIORITY_local =3D "10"
> =A0BBMASK =3D ""
> diff --git a/docs/usermanual/chapters/features.xml b/docs/usermanual/chap=
ters/features.xml
> index 8eecaa9..3cbf1d8 100644
> --- a/docs/usermanual/chapters/features.xml
> +++ b/docs/usermanual/chapters/features.xml
> @@ -39,10 +39,10 @@
> =A0 =A0 <para>This section is a stub, help us by expanding it</para>
>
> =A0 =A0 <para><screen>
> -BBFILES :=3D "${OEDIR}/openembedded/packages/*/*.bb ${LOCALDIR}/packages=
/*/*.bb"
> +BBFILES :=3D "${OEDIR}/openembedded/recipes/*/*.bb ${LOCALDIR}/recipes/*=
/*.bb"
> =A0BBFILE_COLLECTIONS =3D "upstream local"
> -BBFILE_PATTERN_upstream =3D "^${OEDIR}/openembedded/packages/"
> -BBFILE_PATTERN_local =3D "^${LOCALDIR}/packages/"
> +BBFILE_PATTERN_upstream =3D "^${OEDIR}/openembedded/recipes/"
> +BBFILE_PATTERN_local =3D "^${LOCALDIR}/recipes/"
> =A0BBFILE_PRIORITY_upstream =3D "5"
> =A0BBFILE_PRIORITY_local =3D "10"
> =A0</screen></para>
> @@ -75,4 +75,4 @@ MACHINE_FEATURES =3D "kernel26 apm alsa pcmcia bluetoot=
h irda usbgadget"
>
> =A0 =A0 <para>This section is a stub, help us by expanding it</para>
> =A0 </section>
> -</chapter>
> \ No newline at end of file
> +</chapter>
> diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/ch=
apters/getting_oe.xml
> index d71ea71..ed7fd11 100644
> --- a/docs/usermanual/chapters/getting_oe.xml
> +++ b/docs/usermanual/chapters/getting_oe.xml
> @@ -232,7 +232,7 @@ $ vi build/conf/local.conf</screen>
> =A0 =A0 =A0 =A0 distribution and the Openmoko gta01 machine:
>
> =A0 =A0 =A0 =A0 <screen>
> -BBFILES =3D "${OEBASE}/openembedded/packages/*/*.bb"
> +BBFILES =3D "${OEBASE}/openembedded/recipes/*/*.bb"
> =A0DISTRO =3D "angstrom-2008.1"
> =A0MACHINE =3D "om-gta01"</screen>
> =A0 =A0 =A0 </para>
> @@ -297,11 +297,11 @@ MACHINE =3D "om-gta01"</screen>
> =A0 =A0 <para>To build a single package, bypassing the long parse step (a=
nd
> =A0 =A0 =A0 therefore its dependencies -- use with care):
>
> - =A0 =A0 =A0<screen>$ bitbake -b $OEBASE/openembedded/packages/blah/blah=
.bb</screen>
> + =A0 =A0 =A0<screen>$ bitbake -b $OEBASE/openembedded/recipes/blah/blah.=
bb</screen>
> =A0 =A0 </para>
>
> =A0 =A0 <para>There are a few groups of special recipes located in subdir=
ectories
> - =A0 =A0 =A0of the <filename>$OEBASE/openembedded/packages/</filename>
> + =A0 =A0 =A0of the <filename>$OEBASE/openembedded/recipes/</filename>
> =A0 =A0 =A0 directory. These groups are:
>
> =A0 =A0 =A0 <variablelist>
> diff --git a/docs/usermanual/chapters/metadata.xml b/docs/usermanual/chap=
ters/metadata.xml
> index 54fb523..3e76b2d 100644
> --- a/docs/usermanual/chapters/metadata.xml
> +++ b/docs/usermanual/chapters/metadata.xml
> @@ -65,7 +65,7 @@
> =A0 =A0 =A0 =A0 </varlistentry>
>
> =A0 =A0 =A0 =A0 <varlistentry>
> - =A0 =A0 =A0 =A0 =A0<term><filename>packages/</filename></term>
> + =A0 =A0 =A0 =A0 =A0<term><filename>recipes/</filename></term>
> =A0 =A0 =A0 =A0 =A0 <listitem>
> =A0 =A0 =A0 =A0 =A0 =A0 <para>Conatins all of the
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 <application>BitBake</application> <filename>=
.bb</filename>
> diff --git a/docs/usermanual/chapters/recipes.xml b/docs/usermanual/chapt=
ers/recipes.xml
> index c1ca456..1107873 100644
> --- a/docs/usermanual/chapters/recipes.xml
> +++ b/docs/usermanual/chapters/recipes.xml
> @@ -1081,9 +1081,9 @@ ${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/files:${FILE_=
DIRNAME}"</screen></para>
>
> =A0 =A0 =A0 <para>First we'll create the myhelloworld.c file and a readme=
 file.
> =A0 =A0 =A0 We'll place this in the files subdirectory, which is one of t=
he places
> - =A0 =A0 =A0that is searched for file:// URI's:<screen>mkdir packages/my=
helloworld
> -mkdir packages/myhelloworld/files
> -cat &gt; packages/myhelloworld/files/myhelloworld.c
> + =A0 =A0 =A0that is searched for file:// URI's:<screen>mkdir recipes/myh=
elloworld
> +mkdir recipes/myhelloworld/files
> +cat &gt; recipes/myhelloworld/files/myhelloworld.c
> =A0#include &lt;stdio.h&gt;
>
> =A0int main(int argc, char** argv)
> @@ -1092,11 +1092,11 @@ int main(int argc, char** argv)
> =A0 =A0 =A0 =A0 return 0;
> =A0}
> =A0^D
> -cat &gt; packages/myhelloworld/files/README.txt
> +cat &gt; recipes/myhelloworld/files/README.txt
> =A0Readme file for myhelloworld.
> =A0^D</screen></para>
>
> - =A0 =A0 =A0<para>Now we have a directory for our recipe, packages/myhel=
loworld, and
> + =A0 =A0 =A0<para>Now we have a directory for our recipe, recipes/myhell=
oworld, and
> =A0 =A0 =A0 we've created a files subdirectory in there to store our loca=
l files.
> =A0 =A0 =A0 We've created two local files, the C source code for our hell=
oworld
> =A0 =A0 =A0 program and a readme file. Now we need to create the bitbake
> @@ -1186,7 +1186,7 @@ PR =3D "r0"</screen></para>
> =A0 =A0 =A0 </itemizedlist>
>
> =A0 =A0 =A0 <para>We'll consider this release 0 and version 0.1 of a prog=
ram called
> - =A0 =A0 =A0helloworld. So we'll name the recipe myhelloworld_0.1.bb:<sc=
reen>cat &gt; packages/myhelloworld/myhelloworld_0.1.bb
> + =A0 =A0 =A0helloworld. So we'll name the recipe myhelloworld_0.1.bb:<sc=
reen>cat &gt; recipes/myhelloworld/myhelloworld_0.1.bb
> =A0DESCRIPTION =3D "Hello world program"
> =A0PR =3D "r0"
>
> @@ -1203,13 +1203,13 @@ do_install() {
> =A0 =A0 =A0 =A0 install -m 0644 ${WORKDIR}/README.txt ${D}${docdir}/myhel=
loworld
> =A0}
> =A0^D</screen>Now we are ready to build our package, hopefully it'll all =
work
> - =A0 =A0 =A0since it's such a simple example:<screen>~/oe%&gt; bitbake -=
b packages/myhelloworld/myhelloworld_0.1.bb
> + =A0 =A0 =A0since it's such a simple example:<screen>~/oe%&gt; bitbake -=
b recipes/myhelloworld/myhelloworld_0.1.bb
> =A0NOTE: package myhelloworld-0.1: started
> =A0NOTE: package myhelloworld-0.1-r0: task do_fetch: started
> =A0NOTE: package myhelloworld-0.1-r0: task do_fetch: completed
> =A0NOTE: package myhelloworld-0.1-r0: task do_unpack: started
> -NOTE: Unpacking /home/lenehan/devel/oe/local-packages/myhelloworld/files=
/helloworld.c to /home/lenehan/devel/oe/build/titan-glibc-25/tmp/work/myhel=
loworld-0.1-r0/
> -NOTE: Unpacking /home/lenehan/devel/oe/local-packages/myhelloworld/files=
/README.txt to /home/lenehan/devel/oe/build/titan-glibc-25/tmp/work/myhello=
world-0.1-r0/
> +NOTE: Unpacking /home/lenehan/devel/oe/local-recipes/myhelloworld/files/=
helloworld.c to /home/lenehan/devel/oe/build/titan-glibc-25/tmp/work/myhell=
oworld-0.1-r0/
> +NOTE: Unpacking /home/lenehan/devel/oe/local-recipes/myhelloworld/files/=
README.txt to /home/lenehan/devel/oe/build/titan-glibc-25/tmp/work/myhellow=
orld-0.1-r0/
> =A0NOTE: package myhelloworld-0.1-r0: task do_unpack: completed
> =A0NOTE: package myhelloworld-0.1-r0: task do_patch: started
> =A0NOTE: package myhelloworld-0.1-r0: task do_patch: completed
> @@ -1354,7 +1354,7 @@ tmp/work/myhelloworld-0.1-r0/install/myhelloworld/u=
sr/bin/myhelloworld: ELF 32-b
> =A0 =A0 =A0 of building an autotools based packages.</para>
>
> =A0 =A0 =A0 <para>Let's take a look at the tuxnes recipe which is an exam=
ple of a
> - =A0 =A0 =A0very simple autotools based recipe:<screen>%~oe&gt; cat pack=
ages/tuxnes/tuxnes_0.75.bb
> + =A0 =A0 =A0very simple autotools based recipe:<screen>%~oe&gt; cat reci=
pes/tuxnes/tuxnes_0.75.bb
> =A0DESCRIPTION =3D "Tuxnes Nintendo (8bit) Emulator"
> =A0HOMEPAGE =3D "http://prdownloads.sourceforge.net/tuxnes/tuxnes-0.75.ta=
r.gz"
> =A0LICENSE =3D "GPLv2"
> @@ -3366,7 +3366,7 @@ do_configure() {
> =A0 =A0 via the <command>PV</command> variable).</para>
>
> =A0 =A0 <para>For example if we were to ask bitbake to build procps and t=
he
> - =A0 =A0following packages are available:<screen>~/oe%&gt; ls packages/p=
rocps
> + =A0 =A0following packages are available:<screen>~/oe%&gt; ls recipes/pr=
ocps
> =A0procps-3.1.15/ =A0 =A0procps-3.2.1/ =A0 =A0procps-3.2.5/ =A0 =A0procps=
-3.2.7/ =A0 =A0procps.inc
> =A0procps_3.1.15.bb =A0procps_3.2.1.bb =A0procps_3.2.5.bb =A0procps_3.2.7=
.bb
> =A0~/oe%&gt;</screen>then we would expect it to select version
> @@ -3397,7 +3397,7 @@ procps_3.1.15.bb =A0procps_3.2.1.bb =A0procps_3.2.5=
.bb =A0procps_3.2.7.bb
> =A0 =A0 version until it works. By adding:<screen>DEFAULT_PREFERENCE =3D =
"-1"</screen>to
> =A0 =A0 the recipe this is what will happen. Bitbake will now ignore this=
 version
> =A0 =A0 (since all of the existing versions have a preference of 0). Note=
 that you
> - =A0 =A0can still call bitbake directly on the recipe:<screen>bitbake -b=
 packages/procps/procps_4.0.0.bb</screen>This
> + =A0 =A0can still call bitbake directly on the recipe:<screen>bitbake -b=
 recipes/procps/procps_4.0.0.bb</screen>This
> =A0 =A0 enables you to test, and fix the package manually without having =
bitbake
> =A0 =A0 automatically select normally.</para>
>
> @@ -3406,7 +3406,7 @@ procps_3.1.15.bb =A0procps_3.2.1.bb =A0procps_3.2.5=
.bb =A0procps_3.2.7.bb
> =A0 =A0 example from glibc shows that this version has been disabled for =
the sh3
> =A0 =A0 architecture because it doesn't support sh3. This will force bitb=
ake to
> =A0 =A0 try and select one of the other available versions of glibc
> - =A0 =A0instead:<screen>packages/glibc/glibc_2.3.2+cvs20040726.bb:DEFAUL=
T_PREFERENCE_sh3 =3D "-99"</screen></para>
> + =A0 =A0instead:<screen>recipes/glibc/glibc_2.3.2+cvs20040726.bb:DEFAULT=
_PREFERENCE_sh3 =3D "-99"</screen></para>
> =A0 </section>
>
> =A0 <section id=3D"recipes_initscripts" xreflabel=3D"initscripts">
> @@ -3634,7 +3634,7 @@ which find
> =A0 =A0 =A0 =A0 <listitem>
> =A0 =A0 =A0 =A0 =A0 <para>The only directories that you can assume exist =
are those
> =A0 =A0 =A0 =A0 =A0 listed in the default volatiles file:
> - =A0 =A0 =A0 =A0 =A0<command>packages/initscripts/initscripts-1.0/volati=
les</command>.</para>
> + =A0 =A0 =A0 =A0 =A0<command>recipes/initscripts/initscripts-1.0/volatil=
es</command>.</para>
> =A0 =A0 =A0 =A0 </listitem>
>
> =A0 =A0 =A0 =A0 <listitem>
> @@ -3707,4 +3707,4 @@ which find
>
> =A0 =A0 <para></para>
> =A0 </section>
> -</chapter>
> \ No newline at end of file
> +</chapter>
> diff --git a/docs/usermanual/chapters/usage.xml b/docs/usermanual/chapter=
s/usage.xml
> index 9fe20fa..5dd00d6 100644
> --- a/docs/usermanual/chapters/usage.xml
> +++ b/docs/usermanual/chapters/usage.xml
> @@ -574,51 +574,51 @@ NOTE: Resolving missing task queue dependencies
> =A0NOTE: preferred version 2.5 of glibc not available (for item virtual/s=
h4-linux-libc-for-gcc)
> =A0NOTE: Preparing Runqueue
> =A0NOTE: Executing runqueue
> -NOTE: Running task 208 of 226 (ID: 11, /home/lenehan/devel/oe/build/tita=
n-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
> +NOTE: Running task 208 of 226 (ID: 11, /home/lenehan/devel/oe/build/tita=
n-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
> =A0 =A0 =A0 =A0 =A0 role=3D"bold">do_fetch</emphasis>)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_fetch</emp=
hasis>: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_fetch</emp=
hasis>: completed
> =A0NOTE: package lzo-1.08: completed
> -NOTE: Running task 209 of 226 (ID: 2, /home/lenehan/devel/oe/build/titan=
-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
> +NOTE: Running task 209 of 226 (ID: 2, /home/lenehan/devel/oe/build/titan=
-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
> =A0 =A0 =A0 =A0 =A0 role=3D"bold">do_unpack</emphasis>)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_unpack</em=
phasis>: started
> =A0NOTE: Unpacking /home/lenehan/devel/oe/sources/lzo-1.08.tar.gz to /hom=
e/lenehan/devel/oe/build/titan-glibc-25/tmp/work/lzo-1.08-r14/
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_unpack</em=
phasis>: completed
> =A0NOTE: package lzo-1.08: completed
> -NOTE: Running task 216 of 226 (ID: 3, /home/lenehan/devel/oe/build/titan=
-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
> +NOTE: Running task 216 of 226 (ID: 3, /home/lenehan/devel/oe/build/titan=
-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
> =A0 =A0 =A0 =A0 =A0 role=3D"bold">do_patch</emphasis>)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_patch</emp=
hasis>: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_patch</emp=
hasis>: completed
> =A0NOTE: package lzo-1.08: completed
> -NOTE: Running task 217 of 226 (ID: 4, /home/lenehan/devel/oe/build/titan=
-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
> +NOTE: Running task 217 of 226 (ID: 4, /home/lenehan/devel/oe/build/titan=
-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
> =A0 =A0 =A0 =A0 =A0 role=3D"bold">do_configure</emphasis>)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_configure<=
/emphasis>: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_configure<=
/emphasis>: completed
> =A0NOTE: package lzo-1.08: completed
> -NOTE: Running task 218 of 226 (ID: 12, /home/lenehan/devel/oe/build/tita=
n-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
> +NOTE: Running task 218 of 226 (ID: 12, /home/lenehan/devel/oe/build/tita=
n-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
> =A0 =A0 =A0 =A0 =A0 role=3D"bold">do_qa_configure</emphasis>)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_qa_configu=
re</emphasis>: started
> =A0NOTE: Checking sanity of the config.log file
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_qa_configu=
re</emphasis>: completed
> =A0NOTE: package lzo-1.08: completed
> -NOTE: Running task 219 of 226 (ID: 0, /home/lenehan/devel/oe/build/titan=
-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
> +NOTE: Running task 219 of 226 (ID: 0, /home/lenehan/devel/oe/build/titan=
-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
> =A0 =A0 =A0 =A0 =A0 role=3D"bold">do_compile</emphasis>)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_compile</e=
mphasis>: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_compile</e=
mphasis>: completed
> =A0NOTE: package lzo-1.08: completed
> -NOTE: Running task 220 of 226 (ID: 1, /home/lenehan/devel/oe/build/titan=
-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
> +NOTE: Running task 220 of 226 (ID: 1, /home/lenehan/devel/oe/build/titan=
-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
> =A0 =A0 =A0 =A0 =A0 role=3D"bold">do_install</emphasis>)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_install</e=
mphasis>: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_install</e=
mphasis>: completed
> =A0NOTE: package lzo-1.08: completed
> -NOTE: Running task 221 of 226 (ID: 5, /home/lenehan/devel/oe/build/titan=
-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
> +NOTE: Running task 221 of 226 (ID: 5, /home/lenehan/devel/oe/build/titan=
-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
> =A0 =A0 =A0 =A0 =A0 role=3D"bold">do_package</emphasis>)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_package</e=
mphasis>: started
> @@ -631,7 +631,7 @@ NOTE: Checking Package: lzo-locale
> =A0NOTE: DONE with PACKAGE QA
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_package</e=
mphasis>: completed
> =A0NOTE: package lzo-1.08: completed
> -NOTE: Running task 222 of 226 (ID: 8, /home/lenehan/devel/oe/build/titan=
-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
> +NOTE: Running task 222 of 226 (ID: 8, /home/lenehan/devel/oe/build/titan=
-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
> =A0 =A0 =A0 =A0 =A0 role=3D"bold">do_package_write</emphasis>)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_package_wr=
ite</emphasis>: started
> @@ -642,23 +642,23 @@ Packaged contents of lzo-dev into /home/lenehan/dev=
el/oe/build/titan-glibc-25/tm
> =A0NOTE: Not creating empty archive for lzo-locale-1.08-r14
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_package_wr=
ite</emphasis>: completed
> =A0NOTE: package lzo-1.08: completed
> -NOTE: Running task 223 of 226 (ID: 6, /home/lenehan/devel/oe/build/titan=
-glibc-25/packages/lzo/lzo_1.08.bb, do_populate_staging)
> +NOTE: Running task 223 of 226 (ID: 6, /home/lenehan/devel/oe/build/titan=
-glibc-25/recipes/lzo/lzo_1.08.bb, do_populate_staging)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_populate_s=
taging</emphasis>: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_populate_s=
taging</emphasis>: completed
> =A0NOTE: package lzo-1.08: completed
> -NOTE: Running task 224 of 226 (ID: 9, /home/lenehan/devel/oe/build/titan=
-glibc-25/packages/lzo/lzo_1.08.bb, do_qa_staging)
> +NOTE: Running task 224 of 226 (ID: 9, /home/lenehan/devel/oe/build/titan=
-glibc-25/recipes/lzo/lzo_1.08.bb, do_qa_staging)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_qa_staging=
</emphasis>: started
> =A0NOTE: QA checking staging
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_qa_staging=
</emphasis>: completed
> =A0NOTE: package lzo-1.08: completed
> -NOTE: Running task 225 of 226 (ID: 7, /home/lenehan/devel/oe/build/titan=
-glibc-25/packages/lzo/lzo_1.08.bb, do_distribute_sources)
> +NOTE: Running task 225 of 226 (ID: 7, /home/lenehan/devel/oe/build/titan=
-glibc-25/recipes/lzo/lzo_1.08.bb, do_distribute_sources)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_distribute=
_sources</emphasis>: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_distribute=
_sources</emphasis>: completed
> =A0NOTE: package lzo-1.08: completed
> -NOTE: Running task 226 of 226 (ID: 10, /home/lenehan/devel/oe/build/tita=
n-glibc-25/packages/lzo/lzo_1.08.bb, do_build)
> +NOTE: Running task 226 of 226 (ID: 10, /home/lenehan/devel/oe/build/tita=
n-glibc-25/recipes/lzo/lzo_1.08.bb, do_build)
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_build</emp=
hasis>: started
> =A0NOTE: package lzo-1.08-r14: task <emphasis role=3D"bold">do_build</emp=
hasis>: completed
> @@ -827,7 +827,7 @@ NOTE: build 200705041709: completed</screen><note>
>
> =A0 =A0 <para>To determine the full list of tasks available for a specifi=
c recipe
> =A0 =A0 you can run bitbake on the recipe and asking it for the full list=
 of
> - =A0 =A0available tasks:<screen>~%&gt; bitbake -b packages/perl/perl_5.8=
.8.bb -c listtasks
> + =A0 =A0available tasks:<screen>~%&gt; bitbake -b recipes/perl/perl_5.8.=
8.bb -c listtasks
> =A0NOTE: package perl-5.8.8: started
> =A0NOTE: package perl-5.8.8-r11: task do_listtasks: started
> =A0do_fetchall
> @@ -1020,27 +1020,27 @@ NOTE: package perl-5.8.8: completed
>
> =A0 =A0 <para>A typically development session might involve editing files=
 in the
> =A0 =A0 working directory and then recompiling until it all works:<screen=
>[<emphasis>... test ...</emphasis>]
> -~%&gt; bitbake -b packages/testapp/testapp_4.3.bb -c compile -D
> +~%&gt; bitbake -b recipes/testapp/testapp_4.3.bb -c compile -D
>
> =A0[<emphasis>... save a copy of main.c and make some changes ...</emphas=
is>]
> =A0~%&gt; vi tmp/work/testapp-4.3-r0/main.c
> -~%&gt; bitbake -b packages/testapp/testapp_4.3.bb -c compile -D -f
> +~%&gt; bitbake -b recipes/testapp/testapp_4.3.bb -c compile -D -f
>
> =A0[<emphasis>... create a patch and add it to the recipe ...</emphasis>]
> -~%&gt; vi packages/testapp/testapp_4.3.bb
> +~%&gt; vi recipes/testapp/testapp_4.3.bb
>
> =A0[<emphasis>... test from clean ...</emphasis>]
> -~%&gt; bitbake -b packages/testapp/testapp_4.3.bb -c clean
> -~%&gt; bitbake -b packages/testapp/testapp_4.3.bb
> +~%&gt; bitbake -b recipes/testapp/testapp_4.3.bb -c clean
> +~%&gt; bitbake -b recipes/testapp/testapp_4.3.bb
>
> =A0[<emphasis>... NOTE: How to create the patch is not covered at this po=
int ...</emphasis>]</screen></para>
>
> =A0 =A0 <para>Here's another example showing how you might go about fixin=
g up the
> - =A0 =A0packaging in your recipe:<screen>~%&gt; bitbake -b packages/test=
app/testapp_4.3.bb -c install -f
> -~%&gt; bitbake -b packages/testapp/testapp_4.3.bb -c stage -f
> + =A0 =A0packaging in your recipe:<screen>~%&gt; bitbake -b recipes/testa=
pp/testapp_4.3.bb -c install -f
> +~%&gt; bitbake -b recipes/testapp/testapp_4.3.bb -c stage -f
> =A0~%&gt; find tmp/work/testapp_4.3/install
> =A0...
> -~%&gt; vi packages/testapp/testapp_4.3.bb</screen>At this stage you play=
 with
> +~%&gt; vi recipes/testapp/testapp_4.3.bb</screen>At this stage you play =
with
> =A0 =A0 the <emphasis role=3D"bold">PACKAGE_</emphasis> and <emphasis
> =A0 =A0 role=3D"bold">FILES_</emphasis> variables and then repeat the abo=
ve
> =A0 =A0 sequence.</para>
> @@ -1103,7 +1103,7 @@ BB&gt;&gt; build net-snmp</screen>Note that you can=
 use wildcards in the
> =A0 =A0 =A0 =A0 =A0 =A0 role=3D"bold">devshell</emphasis>"</screen></para=
>
>
> =A0 =A0 =A0 <para>With the inclusion of this class you'll find that devsh=
ell is
> - =A0 =A0 =A0added as a new task that you can use on recipes:<screen>~%&g=
t; bitbake -b packages/lzo/lzo_1.08.bb -c listtasks
> + =A0 =A0 =A0added as a new task that you can use on recipes:<screen>~%&g=
t; bitbake -b recipes/lzo/lzo_1.08.bb -c listtasks
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task do_listtasks: started
> =A0<emphasis role=3D"bold">do_devshell</emphasis>
> @@ -1130,7 +1130,7 @@ NOTE: package lzo-1.08-r14: task do_listtasks: comp=
leted
> =A0NOTE: package lzo-1.08: completed</screen></para>
>
> =A0 =A0 =A0 <para>To bring up the devshell you call bitbake on a recipe a=
nd ask it
> - =A0 =A0 =A0for the devshell task:<screen>~%&gt; ./bb -b packages/lzo/lz=
o_1.08.bb -c devshell
> + =A0 =A0 =A0for the devshell task:<screen>~%&gt; ./bb -b recipes/lzo/lzo=
_1.08.bb -c devshell
> =A0NOTE: package lzo-1.08: started
> =A0NOTE: package lzo-1.08-r14: task do_devshell: started
> =A0[<emphasis>... devshell will appear here ...</emphasis>]
> @@ -1190,4 +1190,4 @@ bash: alias: `./configure': invalid alias name
>
> =A0 =A0 <para>[To be done]</para>
> =A0 </section>
> -</chapter>
> \ No newline at end of file
> +</chapter>
> --
> 1.5.4.3
>
> Sorry for the dup. I forget to put the subject on the previous post.
>
> Signed-off-by: Theodore A. Roth <taroth@gmail.com>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


