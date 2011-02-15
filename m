Received: from mail-bw0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpSQh-0005aV-Ka
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 22:27:27 +0100
Received: by bwz10 with SMTP id 10so869129bwz.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 13:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=6phUeuAYWD+WiUJKeSTZ4BoOlMkCLBmd0lmuzi15OY0=;
	b=ip7T5jl7FSlIBWSDQSXBkvw3zbuPBINWqSL4/OU0SshfhKCOHD1olNjnd9UfVUNe8y
	1u5dcNxJZjW+V7mzFvinJbfpcRgUzDtKIe4MY5PURDt94k5lf14xY9TcQ1Fo8lOX5NCW
	XeNJY5Hjg+8FnFUuvo68/Be6p4uEnrfjpPZ0U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=qszYwp6Ch5y16xcfyVAHQ0GPn16rjbC9U8XZfAvG6tdkSD/yXnnJr5NnvjlAVsUumU
	PkYaB6Vsv+HQ1w/ts7BYmt4n3J8CVk2dVPBeFZ0kcuqTB32m6//Lu5/guVSGAosUpgcs
	it1yWbrJfrooz+4a+xHQSEJAr4uLkvgm8wKQc=
MIME-Version: 1.0
Received: by 10.204.50.196 with SMTP id a4mr108517bkg.213.1297805171408; Tue,
	15 Feb 2011 13:26:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 15 Feb 2011 13:26:11 -0800 (PST)
Date: Tue, 15 Feb 2011 21:26:11 +0000
X-Google-Sender-Auth: JAIGXcH-IYNGJQWJZpfQFopBxXM
Message-ID: <AANLkTimSjWURf8gMrVZGd==xCH3jnWEG_=G8EMfsdbW1@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Pull request from O.S. Systems tree
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
X-List-Received-Date: Tue, 15 Feb 2011 21:27:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

We have been working forward to get our required changes into OE and
currently following ones are queued up for merging. Those fix/improve
the issues we found while working in our layer and have been in use
for some time without problems.

The following changes since commit 5f3bc5b423e00089e97c7a1657760f67bf20aa34=
:

  spojegui: bump SRCREV and remove upstream applied desktop file fixes
for QA issues (2011-02-15 16:57:05 +0100)

are available in the git repository at:
  git://projetos.ossystems.com.br/git/users/otavio/org.openembedded.dev.git
master

Otavio Salvador (13):
      xkeyboard-config: avoid recipe code duplication and depends on
intltool-native
      python-dbus: update to 0.83.2 and fix rpath to use absolute path
      cups: drop unused versions
      cups: merge cups.inc into cups 1.2.12 recipe
      cups: merge cups14.inc into cups 1.4.4 recipe
      cups: add textonly filter and split packages
      libinih: add
      cdparanoia (svn): use build variables to fix packaging when
using empty prefix
      sdk.bbclass: cache ${libdir} as ${target_libdir}
      qt4-tools-sdk: use host include headers for dbus
      cmake: drop 2.6.4 as it is not used by any distro
      cmake: update from 2.8.2 to 2.8.3
      distro/micro.conf: drop exec_prefix_native since it is unused

 classes/sdk.bbclass                                |    1 +
 conf/distro/micro.conf                             |    1 -
 recipes/cdparanoia/cdparanoia_svn.bb               |    8 +-
 .../fix_fortify_source_compilation.patch           |   32 -----
 .../dont-run-cross-binaries.patch                  |    0
 recipes/cmake/cmake-native_2.6.4.bb                |   10 --
 ...cmake-native_2.8.2.bb =3D> cmake-native_2.8.3.bb} |    4 +-
 .../{cmake-sdk_2.8.2.bb =3D> cmake-sdk_2.8.3.bb}     |    4 +-
 recipes/cmake/cmake_2.6.4.bb                       |   11 --
 recipes/cmake/{cmake_2.8.2.bb =3D> cmake_2.8.3.bb}   |    6 +-
 recipes/cups/cups-1.1.23/strftime_fix.patch        |   26 ----
 .../cups/cups-1.3.8/use_echo_only_in_init.patch    |   11 --
 recipes/cups/cups-1.4.3/configure.patch            |  117 ----------------=
--
 recipes/cups/cups-1.4.3/skip_tools.patch           |   51 --------
 .../cups/cups-1.4.3/use_echo_only_in_init.patch    |   11 --
 recipes/cups/cups-1.4.4/text.convs                 |    6 +
 recipes/cups/cups-1.4.4/textonly                   |  124 ++++++++++++++++=
++++
 recipes/cups/cups-1.4.4/textonly.ppd               |   47 ++++++++
 recipes/cups/cups.inc                              |   89 --------------
 recipes/cups/cups14.inc                            |   83 -------------
 recipes/cups/cups_1.1.23.bb                        |   51 --------
 recipes/cups/cups_1.2.12.bb                        |   92 ++++++++++++++-
 recipes/cups/cups_1.2.7.bb                         |   80 -------------
 recipes/cups/cups_1.3.8.bb                         |   11 --
 recipes/cups/cups_1.4.3.bb                         |   15 ---
 recipes/cups/cups_1.4.4.bb                         |  122 ++++++++++++++++=
+--
 recipes/libinih/libinih_git.bb                     |   14 +++
 ...python-dbus_0.83.0.bb =3D> python-dbus_0.83.2.bb} |   10 +-
 recipes/qt4/qt4-tools-sdk.inc                      |    8 +-
 recipes/xkeyboard-config/xkeyboard-config.inc      |   18 +++
 recipes/xkeyboard-config/xkeyboard-config_1.4.bb   |   18 +---
 recipes/xkeyboard-config/xkeyboard-config_1.8.bb   |   18 +---
 recipes/xkeyboard-config/xkeyboard-config_git.bb   |   17 +---
 33 files changed, 441 insertions(+), 675 deletions(-)
 delete mode 100644
recipes/cmake/cmake-2.6.4/fix_fortify_source_compilation.patch
 rename recipes/cmake/{cmake-2.8.2 =3D>
cmake-2.8.3}/dont-run-cross-binaries.patch (100%)
 delete mode 100644 recipes/cmake/cmake-native_2.6.4.bb
 rename recipes/cmake/{cmake-native_2.8.2.bb =3D> cmake-native_2.8.3.bb} (5=
6%)
 rename recipes/cmake/{cmake-sdk_2.8.2.bb =3D> cmake-sdk_2.8.3.bb} (56%)
 delete mode 100644 recipes/cmake/cmake_2.6.4.bb
 rename recipes/cmake/{cmake_2.8.2.bb =3D> cmake_2.8.3.bb} (91%)
 delete mode 100644 recipes/cups/cups-1.1.23/strftime_fix.patch
 delete mode 100644 recipes/cups/cups-1.3.8/use_echo_only_in_init.patch
 delete mode 100644 recipes/cups/cups-1.4.3/configure.patch
 delete mode 100644 recipes/cups/cups-1.4.3/skip_tools.patch
 delete mode 100644 recipes/cups/cups-1.4.3/use_echo_only_in_init.patch
 create mode 100644 recipes/cups/cups-1.4.4/text.convs
 create mode 100644 recipes/cups/cups-1.4.4/textonly
 create mode 100644 recipes/cups/cups-1.4.4/textonly.ppd
 delete mode 100644 recipes/cups/cups.inc
 delete mode 100644 recipes/cups/cups14.inc
 delete mode 100644 recipes/cups/cups_1.1.23.bb
 delete mode 100644 recipes/cups/cups_1.2.7.bb
 delete mode 100644 recipes/cups/cups_1.3.8.bb
 delete mode 100644 recipes/cups/cups_1.4.3.bb
 create mode 100644 recipes/libinih/libinih_git.bb
 rename recipes/python/{python-dbus_0.83.0.bb =3D> python-dbus_0.83.2.bb} (=
71%)
 create mode 100644 recipes/xkeyboard-config/xkeyboard-config.inc


--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


