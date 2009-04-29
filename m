Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lz0QA-0007ew-01
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 05:25:19 +0200
Received: by qw-out-1920.google.com with SMTP id 9so809755qwj.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 20:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:user-agent:x-url:x-attribution:date:message-id
	:mime-version:content-type;
	bh=XNAbH2/Cu8B0GSZPtItkYet3+SfyzYHYYr+4Ra8W9gY=;
	b=AMadTSnCAPAcDs3awcws6gis84liu/UkZfSFmY2R7HNPYj1x49J2GO84YNxgmmx8zp
	/FoN8B0gyt9W1+SDFzGorvJkFwZnQ3T3mY9ccakNRbGHLnYumXqQf9G/PB1LS+077wpt
	VhsmXDcP5cd9JmXjg1gG144+n2xhMoGfYR5fw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:user-agent:x-url:x-attribution
	:date:message-id:mime-version:content-type;
	b=ahi7tFE7PBdfZX0Ki9dEFdxURltRvAATZhAqheFA4+jWyXoQKPQQo56k0673T3tk2K
	JQTOIATpIJHSQzmRAPlFWmh4PMqtwn9nd8PLmsvA3qFanMr8CdHdwUWZjGLWu5vmpuBc
	YDwSQrr5QLZfe7/S6pXO2KnoY2ImPbdxnB03I=
Received: by 10.220.98.65 with SMTP id p1mr14581452vcn.103.1240975204457;
	Tue, 28 Apr 2009 20:20:04 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 9sm1412895ywf.19.2009.04.28.20.20.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Apr 2009 20:20:04 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id B3FEDC4988D; Wed, 29 Apr 2009 00:20:18 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Development Mailing List
	<openembedded-devel@lists.openembedded.org>
Organization: O.S. Systems Ltda.
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.92 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Wed, 29 Apr 2009 00:20:18 -0300
Message-ID: <87r5zckux9.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 29 Apr 2009 03:25:21 -0000
Content-Type: text/plain; charset=us-ascii

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

[ To easy PatchWork people I preferred to use a pull request and let
  people to review the branch. Once people ack it, I do the pull on the
  dev tree. ]

The following changes since commit 6422fe2b0a110c3a611c0e98cd96b489d4f11880:
  Andrea Adami (1):
        linux-kexecboot.inc: force CONFIG_KEXEC=y just in case  - no runtime changes, no PR BUMP

are available in the git repository at:

  git://projetos.ossystems.com.br/git/users/otavio/org.openembedded.dev.git master

Otavio Salvador (11):
      gtk-engines: add 2.18.1
      machine/geode[gl]x: use more optimization while compiling
      acpid: add 1.0.8 (with netlink support)
      hal-info: add 20080414
      python-pycups: add
      checksums.ini: add flash-plugin
      checksums.ini: add sun-jdk
      checksums.ini: firefox-l10n-pt-br
      system-config-printer: add to provide python-cupshelpers to hal-cups-utils
      hal-cups-utils: add
      cups: split backends and models

 conf/checksums.ini                                 |   36 +
 conf/machine/geodegx.conf                          |    4 +-
 conf/machine/geodelx.conf                          |   15 +-
 .../include/{tune-geodegx.inc => tune-geode.inc}   |    3 +-
 conf/machine/include/tune-geodelx.inc              |    9 -
 recipes/acpid/acpid/event.c.diff                   |   43 +
 recipes/acpid/acpid/fixfd.diff                     |   12 +
 recipes/acpid/acpid/netlink.diff                   | 2797 ++++++++++++++++++++
 recipes/acpid/acpid_1.0.8.bb                       |    6 +
 recipes/cups/cups.inc                              |   13 +-
 recipes/cups/cups_1.2.12.bb                        |    2 +-
 recipes/cups/cups_1.2.7.bb                         |    6 +-
 recipes/cups/cups_1.3.8.bb                         |    2 +-
 recipes/gtk-engines/gtk-engines_2.18.1.bb          |   30 +
 recipes/hal/hal-cups-utils_0.6.19.bb               |   23 +
 recipes/hal/hal-info_20090414.bb                   |    1 +
 recipes/python/python-pycups_1.9.45.bb             |   16 +
 .../system-config-printer_1.1.7.bb                 |   19 +
 18 files changed, 3009 insertions(+), 28 deletions(-)
 rename conf/machine/include/{tune-geodegx.inc => tune-geode.inc} (66%)
 delete mode 100644 conf/machine/include/tune-geodelx.inc
 create mode 100644 recipes/acpid/acpid/event.c.diff
 create mode 100644 recipes/acpid/acpid/fixfd.diff
 create mode 100644 recipes/acpid/acpid/netlink.diff
 create mode 100644 recipes/acpid/acpid_1.0.8.bb
 create mode 100644 recipes/gtk-engines/gtk-engines_2.18.1.bb
 create mode 100644 recipes/hal/hal-cups-utils_0.6.19.bb
 create mode 100644 recipes/hal/hal-info_20090414.bb
 create mode 100644 recipes/python/python-pycups_1.9.45.bb
 create mode 100644 recipes/system-config-printer/system-config-printer_1.1.7.bb

- -- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Processed by Mailcrypt 3.5.8+ <http://mailcrypt.sourceforge.net/>

iEYEARECAAYFAkn3x28ACgkQLqiZQEml+FXOtACePlcTXnFtweZFTkkUI/w0/U5x
kaQAn2/MawjivKbWCSYuz5yvW6dqwqOx
=vJ6e
-----END PGP SIGNATURE-----


