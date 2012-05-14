Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1STtRb-00081u-9C
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 13:28:03 +0200
Received: by lags15 with SMTP id s15so3199248lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 04:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=rdmYaPyYVCcz42dNVFUSfQ4BE6FWND06jFls8Kvglyo=;
	b=l1BXj6wxy1qfi+voywi+GRYwnFz5xtESqAh7jERp3O3KJ2WOa5d7jvzzIQujtqesDt
	4X3QwMvl7w6NGr7i+K2YX6/zyMf2n5LVDykCgiJpoTPlYIuqS2BgxxMVR7YBxr98mmB1
	8MXdWRzeNwnkmIGXsj7HsT7IDeGb2LU9pAPy3VZkaZD4b2Ci2XZnuspy9s4s+W4ESdR0
	/tunLhJTNNkb9aMc1/1S5OeC4ozjcBQpnNXGAR5r3uz/KcqNv4PLecUYH1I9Xg3FDgtA
	3wFXm8DNC38LdYdoYUORsK4fQh9ntCjTFZwoevPSNs9FB+65a018VbshRsySRa05Thns
	pvQg==
MIME-Version: 1.0
Received: by 10.112.32.35 with SMTP id f3mr3459039lbi.47.1336994284189; Mon,
	14 May 2012 04:18:04 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Mon, 14 May 2012 04:18:04 -0700 (PDT)
Date: Mon, 14 May 2012 13:18:04 +0200
Message-ID: <CADZ6=avMrT89BZA=awFOhCQFMhTDo1n67ZQya7J3Z9BSQeZHqw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlCJavq6pPLMLVSHAh76l1oyLSMrO0LA3W0mZ9QDF0r1UVkd+gV4ghPithovJ2ypJiLboVo
Subject: New kmod {libdir} breaks udev 182 build
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
X-List-Received-Date: Mon, 14 May 2012 11:28:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi guys,

I've got an issue with
openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, with the way
{libdir} is set in line 19:

libdir =3D "${base_libdir}"

"git blame" claims this was added by Khem Raj on 2012-05-08. This line
causes libkmod to put its pkgconfig ".pc" file in the staging area at
"/lib/pkgconfig/libkmod.pc". This is sad because other recipes would
only look at /usr/lib/pkgconfig/ and /usr/share/pkgconfig.

Take meta-openembedded/meta-oe/recipes-core/udev/udev_182.bb, for
example. The build predictably fails with

checking for KMOD... no
configure: error: Package requirements (libkmod >=3D 5) were not met:

No package 'libkmod' found


So what's the right thing do do here? Use a different package install
path for libkmod, or point udev to /lib/pkgconfig by extending its
PKG_CONFIG_PATH correspondingly?

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


