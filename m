Return-Path: <behanw@converseincode.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id D74E96011B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 00:24:05 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id h68so20874907pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 17:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=converseincode.com; s=google;
	h=from:mime-version:subject:message-id:date:to;
	bh=k0YpLezZx9FaFostyX/atGuKZeWZpJuQihjRsl38C/c=;
	b=QIcNe+qj/I6MDrFGEAw9qQhwKa1cP9rD0912ACm4l6Hi//OBslz4hv3fhklsgU7ZPo
	dcziHE9LSGnmH9m3HEUXDzQm/+eyz/ATiPrPlRB+xbHtocWN+Y1tkqaspW+SykrtkmIE
	nO/4lGZ4JWn7MIbRs7KFPCQqZDOoz1w7LNr1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
	bh=k0YpLezZx9FaFostyX/atGuKZeWZpJuQihjRsl38C/c=;
	b=h6jfE2/nJ0TTVbNjm8JZzYDprRl6d654GlJbZIY3SkwZ5vEtBkuLivQRw74FteGDv2
	Tm5Cb8/cxmqw6aGdg/Leg4X9ywIVtfYmAySGJ1IJ2dI0zfnOY8mDP2c4WGFB7wqWIAf0
	Nzin3rAIhrVQ3KaajpJb78y4gerZ4dl0pOmHTxmNF3ZvCSKyptO1oG//BVrCwkWn0DPt
	JYPg2hnafSgd64Cl7iehhqUKYZ5CjvQSoS2EYtzZeo+PHdcZy6vVK8YweAGhC6YahaOz
	Sk5Z0gyLd/itZ4jQrF++7tU+UrFvs/+uvIonorCDgdhMq3RVBq8g4Yg66zIQsKOU3Tx5
	2sPQ==
X-Gm-Message-State: AHYfb5gcfFijXpl2CgQD+QVbEvYWW7c8JXu1Hb2+b4ExvW86N0tijRQG
	R5WUBPDAmHRMoLBlfTqMfw==
X-Received: by 10.84.231.197 with SMTP id g5mr6748469pln.152.1502238246769;
	Tue, 08 Aug 2017 17:24:06 -0700 (PDT)
Received: from [192.168.120.225] (d207-6-122-147.bchsia.telus.net.
	[207.6.122.147]) by smtp.gmail.com with ESMTPSA id
	r13sm4525204pfg.14.2017.08.08.17.24.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 17:24:05 -0700 (PDT)
From: Behan Webster <behanw@converseincode.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Message-Id: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
Date: Tue, 8 Aug 2017 17:24:04 -0700
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3273)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Alpha release of check-requirement.sh
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
X-List-Received-Date: Wed, 09 Aug 2017 00:24:05 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I maintain a script (ready-for.sh) which checks requirements for various =
courses I teach which makes sure you have the right computer, RAM, disk =
space available, and such in order to do the class. It also makes sure =
that the required packages for your $DISTRO are installed (supported =
distros are CentOS, Debian, Fedora, Mint, openSUSE, RHEL, SLES, Ubuntu, =
with some initial support for ArchLinux). It has a full test suite to =
make sure the package lists are valid and available for each of the =
distro. It also can output a JSON version of the requirements (if you =
want to extract requirements for something else like a webpage or =
document) and includes an auto-updater. Its designed to make getting =
ready for a specific course very easy for a new person. I also use it to =
debug setup issues on people=E2=80=99s computers over the phone or =
email.

One of the courses I maintain requirements for is the LF Yocto Project =
course. And recently I rebuilt the script into something more generic =
(check-requirements.sh) which specifically allows you to check for =
requirements for the various groupings of packages in the Yocto Project =
documentation.

I=E2=80=99ve made it initially available as an alpha release via =
https://cm.converseincode.com/cr/ <https://cm.converseincode.com/cr/> , =
and I plan to maintain it along with the script described above since =
they share so much of the same code.

The idea is that users would download and run this script once in order =
to make sure their machines are ready to build OE or Poky or whatever, =
instead of reading the setup document and manually installing all the =
packages. One would still have to clone the appropriate git repo to get =
a copy of OE or Poky after that.

As an example, here it is being run on an Ubuntu-16.04 machine which is =
missing packages for building the documentation. (Showing the YP =
requirements are boring, because this computer already meets those =
requirements because I build OE all the time). It is to be run as a =
normal user, but uses sudo internally when it needs to run privileged =
commands. In fact if you try to run it as root, it complains.

$ sudo ./check-requirements.sh=20
[sudo] password for behanw:=20
FAIL: Please don't run as root
NOTE: Sudo will be used internally by this script as required.

$ ./check-requirements.sh --list
Available (4) options:
  YPDOC - Requirements for Yocto Project Documentation
  YPGUI - Requirements for Yocto Project GUI
  YP - Requirements for Yocto Project
  YPST - Requirements for OpenEmbedded Self-Test

$ ./check-requirements.sh YPDOC
Checking that this computer is suitable for YPDOC: Requirements for =
Yocto Project Documentation
=
--------------------------------------------------------------------------=
------
PASS: CPU architecture is x86_64
PASS: 4 core CPU (good enough but 8 is preferred)
PASS: Your CPU appears powerful enough (currently at 23228 BogoMIPS =
cumulatively)
PASS: 6 GiB RAM
PASS: 158 GiB free disk space in /home/behanw
PASS: Linux distribution architecture is x86_64
PASS: Linux distribution is Ubuntu:amd64-16.04 (xenial)
PASS: Internet is available (which is required in this case)
=
--------------------------------------------------------------------------=
------
WARN: Some packages are missing
NOTE: Need to install: dblatex docbook-dsssl docbook-utils fop jadetex =
java-wrappers libavalon-framework-java libbatik-java libbsf-java =
libfontbox-java libfop-java libosp5 libostyle1c2 libsgmls-perl libsp1c2 =
libxmlgraphics-commons-java openjade sgmlspl sp texlive-bibtex-extra =
texlive-math-extra xmlto
You can install missing packages by running:
  ./check-requirements.sh --install YPDOC
or by:
  sudo apt-get --no-install-recommends install dblatex docbook-dsssl =
docbook-utils fop jadetex java-wrappers libavalon-framework-java =
libbatik-java libbsf-java libfontbox-java libfop-java libosp5 =
libostyle1c2 libsgmls-perl libsp1c2 libxmlgraphics-commons-java openjade =
sgmlspl sp texlive-bibtex-extra texlive-math-extra xmlto
=
--------------------------------------------------------------------------=
------
WARN: Your computer doesn't meet the stated requirements unless you can =
fix the above warnings.
WARN: You also have some missing packages.

$ ./check-requirements.sh --install YPDOC
Checking that this computer is suitable for YPDOC: Requirements for =
Yocto Project Documentation
=
--------------------------------------------------------------------------=
------
<snip>
=
--------------------------------------------------------------------------=
------
WARN: Some packages are missing
WARN: About to install: dblatex docbook-dsssl docbook-utils fop jadetex =
java-wrappers libavalon-framework-java libbatik-java libbsf-java =
libfontbox-java libfop-java libosp5 libostyle1c2 libsgmls-perl libsp1c2 =
libxmlgraphics-commons-java openjade sgmlspl sp texlive-bibtex-extra =
texlive-math-extra xmlto=20
Is that okay? [y/N]=20

Is this useful? Thoughts? Suggestions?

Give it a try and let me know what you think. It=E2=80=99s extensible, =
so adding other groupings of packages and such, or adding aliases for OE =
or something is all trivially done.

Thanks,

Behan=

