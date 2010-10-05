Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <palisv@gmail.com>) id 1P320g-0002qr-Kh
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 09:32:27 +0200
Received: by iwn2 with SMTP id 2so7935859iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9QDJ7BMiqhshhxIkeSgswjBB/SxMUF2ARlM/jUHeZ8s=;
	b=woTaSpNf8LOX32IZSemHdLzU1dwWuZC5Bxw+y18cx4n4xI9IOeBsz8b5u+ASl8RwuV
	HZSJhx+GH7/FAbWSnM/2qXSiGwuW0Da6EJdDihelSSh8qwwkW1W2jfcbuVR2lp97ogrZ
	4QwAlGFFA+q1OLQOAbClJJ6tePaiFEn+nd+Jo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YbLlX4tjPzBEcYN3JfRFII05GaiB9vA2Y2btGlcbVkJNXyvzImcLZWca9qPUuQz6t9
	lavLe77hqhQ0PLEzsgCiU1lkI8W6b0g/uNfPXg9Wdhww+SxomVFFsM5YB55KYM5IwzmT
	BHHMYh5t1SK/cOdY1TEX9TJbOgdqVT5IBeBSU=
MIME-Version: 1.0
Received: by 10.231.157.195 with SMTP id c3mr11598512ibx.155.1286263925981;
	Tue, 05 Oct 2010 00:32:05 -0700 (PDT)
Received: by 10.231.171.137 with HTTP; Tue, 5 Oct 2010 00:32:05 -0700 (PDT)
In-Reply-To: <AANLkTi=X_E_B54Wrm7SDCTDJ1t2usFDAwj-99r_tDn0E@mail.gmail.com>
References: <AANLkTi=X_E_B54Wrm7SDCTDJ1t2usFDAwj-99r_tDn0E@mail.gmail.com>
Date: Tue, 5 Oct 2010 09:32:05 +0200
Message-ID: <AANLkTin3ykUbVfGwqghAjRPnPx12LLimmrrtnzoS0Fat@mail.gmail.com>
From: Patrik Lindergren <palisv@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: palisv@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: eglibc, do_package error: too old kernel
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
X-List-Received-Date: Tue, 05 Oct 2010 07:32:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Tjenare, Anton

Hur =E4r l=E4get?

B=F6rjar du k=F6ra mer Linux nu? :-)

Sj=E4lva eglibc paketet verkar vara inte helt moget i OpenEmbedded, f=E5r
sj=E4lv fel p=E5 det n=E4r jag k=F6r det emot en 2.6.34 k=E4rna och qemu. M=
en d=E5
=E4r det ett annat fel.
Om det =E4r bara f=F6r att f=E5 ig=E5ng en grund milj=F6 s=E5 kan fungerar =
glibc
r=E4tt okey dock s=E5 blir den st=F6rre.

Skall fixa eglibc strax men h=E5ller p=E5 att fixa till systemd (kolla
g=E4rna upp det riktigt h=E4ftig ers=E4ttare till init m.m) f=F6rst. Proble=
met
med systemd nu =E4r att den har beroende emot GTK+ (fast den beh=F6ver
igentligten bara glib om man skippar den grafiska frontend:en).

Mvh
Patrik Lindergren

2010/10/5 Anton Sergienko <anton.sergienko@gmail.com>:
> Hello!
> I'm getting an error during packaging of eglibc:
>
> bitbake -f -c package eglibc
> NOTE: Handling BitBake files: / (7082/7082) [100 %]
> Parsing of 7082 .bb files complete (6614 cached, 468 parsed). 7273 target=
s,
> 322 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 426 of 426 (ID: 8,
> /build/openembedded/openembedded/recipes/eglibc/eglibc_2.11.bb, do_packag=
e)
> NOTE: package eglibc-2.11-r14.7+svnr10690: task do_package: Started
> NOTE: preparing tree for binary locale generation
> FATAL: kernel too old
> ERROR: Task 8 (/build/openembedded/openembedded/recipes/eglibc/
> eglibc_2.11.bb, do_package) failed with exit code '1'
> NOTE: generating locale en_US (UTF-8)
> NOTE: package eglibc-2.11-r14.7+svnr10690: task None: Failed
> ERROR: localedef returned an error (command was
> PATH=3D"/build/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux/us=
r/i686/bin:/build/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux/u=
sr/sbin:/build/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux/usr/=
bin:/build/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux/sbin:/bu=
ild/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux//bin:/build/ope=
nembedded/bitbake/bin:/usr/lib64/mpi/gcc/openmpi/bin:/bin:/usr/local/bin:/u=
sr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/opt/kde3/bin:/usr/lib/m=
it/bin:/usr/lib/mit/sbin:/usr/lib/qt3/bin"
> I18NPATH=3D"/build/openembedded/build/tmp_angstrom.7/work/i686-angstrom-l=
inux/eglibc-2.11-r14.7+svnr10690/locale-tree/usr/share/i18n"
> qemu-i386 -s 1048576 -r 2.6.24 -L
> /build/openembedded/build/tmp_angstrom.7/work/i686-angstrom-linux/eglibc-=
2.11-r14.7+svnr10690/locale-tree
> -E
> LD_LIBRARY_PATH=3D/build/openembedded/build/tmp_angstrom.7/work/i686-angs=
trom-linux/eglibc-2.11-r14.7+svnr10690/locale-tree/lib
> /build/openembedded/build/tmp_angstrom.7/work/i686-angstrom-linux/eglibc-=
2.11-r14.7+svnr10690/locale-tree/bin/localedef
> --force --old-style --no-archive
> --prefix=3D/build/openembedded/build/tmp_angstrom.7/work/i686-angstrom-li=
nux/eglibc-2.11-r14.7+svnr10690/locale-tree
> --inputfile=3D/usr/share/i18n/locales/en_US --charmap=3DUTF-8 en_US).
>
>
>
> Seems to be something wrong with kernel version supplied in qemu's
> arguments.
>
> //Anton
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


