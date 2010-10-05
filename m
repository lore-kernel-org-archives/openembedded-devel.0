Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anton.sergienko@gmail.com>) id 1P31oG-0002e4-8I
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 09:19:37 +0200
Received: by iwn2 with SMTP id 2so7923217iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 00:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=m38aW5/2jnMqnOe+R1l3/CUfWiNsh0w3vDvmmKrB4PI=;
	b=FeNXO0I5EifqyLBn3Fpfthu2hyqNgMhKt4O9Hp+ElvN2ha3cK304qYudG5wFqozIeB
	C7bRHX0npNp/3s6U+dVIfNtJZcuwR6XKY8eVi1fDDlzejOat+QWmf32ODhZseTPt1UEV
	HxmPRpV3xLig5hABQqm8R6sJGoyxUSKJiaOBs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=NOBfAaEn5pXyTC14f36b7sEsoClvIbz9nRWVhia3zsnx42Ghkhw1jiYGV/WXQ7ZLS4
	FZXREioGiWSUrDP42Js6zDf7+W32t3hlxACX+q6S0gXly5JOY+0FJhdxrCRxx0CK9P/g
	cIoi+/DgkEZipnW/iF6Mvv/wFDCXlY4zQHiok=
Received: by 10.231.149.198 with SMTP id u6mr11654950ibv.7.1286263158977; Tue,
	05 Oct 2010 00:19:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.192.68 with HTTP; Tue, 5 Oct 2010 00:18:58 -0700 (PDT)
From: Anton Sergienko <anton.sergienko@gmail.com>
Date: Tue, 5 Oct 2010 09:18:58 +0200
Message-ID: <AANLkTi=X_E_B54Wrm7SDCTDJ1t2usFDAwj-99r_tDn0E@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: anton.sergienko@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: eglibc, do_package error: too old kernel
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
X-List-Received-Date: Tue, 05 Oct 2010 07:19:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello!
I'm getting an error during packaging of eglibc:

bitbake -f -c package eglibc
NOTE: Handling BitBake files: / (7082/7082) [100 %]
Parsing of 7082 .bb files complete (6614 cached, 468 parsed). 7273 targets,
322 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 426 of 426 (ID: 8,
/build/openembedded/openembedded/recipes/eglibc/eglibc_2.11.bb, do_package)
NOTE: package eglibc-2.11-r14.7+svnr10690: task do_package: Started
NOTE: preparing tree for binary locale generation
FATAL: kernel too old
ERROR: Task 8 (/build/openembedded/openembedded/recipes/eglibc/
eglibc_2.11.bb, do_package) failed with exit code '1'
NOTE: generating locale en_US (UTF-8)
NOTE: package eglibc-2.11-r14.7+svnr10690: task None: Failed
ERROR: localedef returned an error (command was
PATH=3D"/build/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux/usr/=
i686/bin:/build/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux/usr=
/sbin:/build/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux/usr/bi=
n:/build/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux/sbin:/buil=
d/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux//bin:/build/opene=
mbedded/bitbake/bin:/usr/lib64/mpi/gcc/openmpi/bin:/bin:/usr/local/bin:/usr=
/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/opt/kde3/bin:/usr/lib/mit=
/bin:/usr/lib/mit/sbin:/usr/lib/qt3/bin"
I18NPATH=3D"/build/openembedded/build/tmp_angstrom.7/work/i686-angstrom-lin=
ux/eglibc-2.11-r14.7+svnr10690/locale-tree/usr/share/i18n"
qemu-i386 -s 1048576 -r 2.6.24 -L
/build/openembedded/build/tmp_angstrom.7/work/i686-angstrom-linux/eglibc-2.=
11-r14.7+svnr10690/locale-tree
-E
LD_LIBRARY_PATH=3D/build/openembedded/build/tmp_angstrom.7/work/i686-angstr=
om-linux/eglibc-2.11-r14.7+svnr10690/locale-tree/lib
/build/openembedded/build/tmp_angstrom.7/work/i686-angstrom-linux/eglibc-2.=
11-r14.7+svnr10690/locale-tree/bin/localedef
--force --old-style --no-archive
--prefix=3D/build/openembedded/build/tmp_angstrom.7/work/i686-angstrom-linu=
x/eglibc-2.11-r14.7+svnr10690/locale-tree
--inputfile=3D/usr/share/i18n/locales/en_US --charmap=3DUTF-8 en_US).



Seems to be something wrong with kernel version supplied in qemu's
arguments.

//Anton

