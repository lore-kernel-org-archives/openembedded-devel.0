Return-Path: <joelguittet@gmail.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id AAA9C6C3C2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Nov 2018 10:31:18 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id z80-v6so5102359ljb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Nov 2018 02:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=TGsQBWGRJBteP2TqTHQ7Qmdhs8loT09YzYADCY6GzgI=;
	b=gpKy4RBsCcQtKNfhVQ6nfhwxXEzbQ7VpBF28tjbFgafjhRqL3timNCMRb0r/XtqcsI
	BILXJMF44nqD9ppC44KcmhyhK/p0ZpcOATYYMvLeBtAkISY2vByyxUiCazt1ToXbJauV
	kgS2mRxX5LE8g8rHs7tk17Op77MFbx5sM7YGSWFUWODmgl8R0H/r0C29sg23NiL3avJ0
	jG6Iki62jrUKXCpoI/y44gEMVPHN40q+4s36D58TrQRZRXJ9cz2ZKOoGaggjdGKm19t2
	1lrAA6R8ofPav4C4VHQ6Ryt/DbnUHOSF2foybh2XFCgdxxTgTedhtLMMeEi3XLm9lhJj
	sAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=TGsQBWGRJBteP2TqTHQ7Qmdhs8loT09YzYADCY6GzgI=;
	b=k5MTFx1BcfnD32m/pg3I/XFkOoWW5oFseFOkZxOHC9cXLuAhziVOwwXOh0EbBzrPVT
	kzv/MY9E8kAJn8Akeb+nly6CuKpApntkEMXF+8wC5wlGP4vCyzzDaIFjJyM8y74lKCxk
	sSVbLBJN+KlWonFgjwtz2MKibqRnmmBEXNkQ4AKrLWg/kOEW0ew5ZYna2CUzceEiduPh
	2nFSqXvV2FsiCapIvpMMIAkkL7UYPL6YSfC97zRb7LhzM689Qlb71FPKEwUHcvqx5eD1
	y+WNa1/3PwOPii551jfdKPE+FXAFQbAQWYXGxfDkcg+ZyOSLmxzp56G0/fljVx3ADpwj
	meiQ==
X-Gm-Message-State: AGRZ1gJt/U3YF85WjYP4v0uNAt0ANy9d9KLVCO6HUE1up7vbsK0Y5RgF
	c1bdiIkZt0y9SnQQMUvVFOGItcdNMemkU1BOkapPfPda
X-Google-Smtp-Source: AJdET5dtth8TxTr1GakiL7u84SLoVKCERb0E/3U97koUAP6dwsM1fmf0Wn80p1tjTupaBS7wJHLRVKNktNzDauN0pzE=
X-Received: by 2002:a2e:88cf:: with SMTP id
	a15-v6mr9248362ljk.76.1541932278725; 
	Sun, 11 Nov 2018 02:31:18 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Jo=C3=ABl_Guittet?= <joelguittet@gmail.com>
Date: Sun, 11 Nov 2018 11:31:07 +0100
Message-ID: <CAOwy=POiTi7sAqU9szjbbUhC4AbPHpeTQtRcGe3bPEye7t=LrA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java] Unable to fetch icedtea7-native
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
X-List-Received-Date: Sun, 11 Nov 2018 10:31:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello guys!

Writing because of an issue I haven't before, but I have made absolutely no
change on my machine so this look very strange. I'm currently unable to
fetch icedtea7-native. I have relaunched bitbake several times, still the
same error.

bitbake error:

WARNING: Failed to fetch URL
http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/jdk/archive/d7e=
cb57d3c61.tar.gz;name=3Djdk;unpack=3Dfalse,
attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 4, no output
ERROR: Function failed: Fetcher failure for URL: '
http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/jdk/archive/d7e=
cb57d3c61.tar.gz;name=3Djdk;unpack=3Dfalse'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/kubuntu/yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/=
temp/log.do_fetch.12473
ERROR: Task 1133
(/home/kubuntu/yocto/build/../meta-java/recipes-core/icedtea/
icedtea7-native_2.1.3.bb, do_fetch) failed with exit code '1'

Full log:

DEBUG: Fetching
http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/jdk/archive/d7e=
cb57d3c61.tar.gz;name=3Djdk;unpack=3Dfalse
using
command '/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp
--no-check-certificate -P /home/kubuntu/yocto/build/downloads '
http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/jdk/archive/d7e=
cb57d3c61.tar.gz
''
DEBUG: Fetcher accessed the network with the command /usr/bin/env wget -t 2
-T 30 -nv --passive-ftp --no-check-certificate -P
/home/kubuntu/yocto/build/downloads '
http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/jdk/archive/d7e=
cb57d3c61.tar.gz
'
DEBUG: Running export SSH_AGENT_PID=3D"1441"; export
SSH_AUTH_SOCK=3D"/tmp/ssh-OZjYuOHE7U4r/agent.1180"; export
PATH=3D"/home/kubuntu/yocto/poky/scripts/native-intercept:/home/kubuntu/yoc=
to/poky/scripts:/home/kubuntu/yocto/build/tmp/sysroots/x86_64-linux/usr/bin=
/x86_64-linux:/home/kubuntu/yocto/build/tmp/sysroots/x86_64-linux/usr/bin:/=
home/kubuntu/yocto/build/tmp/sysroots/x86_64-linux/usr/sbin:/home/kubuntu/y=
octo/build/tmp/sysroots/x86_64-linux/usr/bin:/home/kubuntu/yocto/build/tmp/=
sysroots/x86_64-linux/sbin:/home/kubuntu/yocto/build/tmp/sysroots/x86_64-li=
nux/bin:/home/kubuntu/yocto/poky/scripts:/home/kubuntu/yocto/poky/bitbake/b=
in:/home/kubuntu/bin:/home/kubuntu/.local/bin:/usr/local/sbin:/usr/local/bi=
n:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin";
export HOME=3D"/home/kubuntu"; /usr/bin/env wget -t 2 -T 30 -nv --passive-f=
tp
--no-check-certificate -P /home/kubuntu/yocto/build/downloads '
http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/jdk/archive/d7e=
cb57d3c61.tar.gz
'
WARNING: Failed to fetch URL
http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/jdk/archive/d7e=
cb57d3c61.tar.gz;name=3Djdk;unpack=3Dfalse,
attempting MIRRORS if available

Then log indicates it tries mirrors but all fail.

When running the command in the log (i.e. '/usr/bin/env wget -t 2 -T 30 -nv
--passive-ftp --no-check-certificate -P /home/kubuntu/yocto/build/downloads
'
http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/jdk/archive/d7e=
cb57d3c61.tar.gz'')
in a new console, I successfully get the expected file and I have verified
both the MD5 and SHA256 which are OK so the initial URL is valid and should
succeed but it doesn't and the reason is not indicated.

Using poky and meta-openembedded branches fido.
Using meta-java branch morty at
commit 65bd3d6eaa6ae4e06f1c04efb493f448cf6d619b (no fido branch on
meta-java but I was able to use morty before so just keeping like that
actualy).

If any ideas to solve the issue...

Thanks
Joel

