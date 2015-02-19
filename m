Return-Path: <jatedev@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id E9AB46B6B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 15:44:49 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id i13so6171714qae.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 07:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=aioposn7wPr+OYBQWkRm6dc2VKFcpFma6/Py5sWxnjI=;
	b=siAISrDR94VtaIXduM9uS43NlafI8wSkVD1iVLa85e/677MeQUngV7N2AIbCvlAwuM
	6wLl1uPTWRB/f8V5IkY/3aUDLvwOPNrn76m9GPSqW2zbh+53u8SfZRmBEFb2HZYJdoL6
	vcp+2nPUoF7DAsnTgdYeoHo97KFJ978CytoOIN4j1Z10nD3ynr5iwK04g5rUltS2CUgb
	TN8fepf0xxJ0hk/YmlUyM9QTxqiA6HtadZWT/BDRxTkoK6aEB6lqeL9DG4x2jQG5LMLv
	NCFPhMbMGI6YeNs5wA/eHBp8iAnxq647qev9S4rV3ZJjMbghfVZQ6yuLXEu1kVmsdgol
	4PfQ==
MIME-Version: 1.0
X-Received: by 10.140.44.69 with SMTP id f63mr12613207qga.3.1424360690253;
	Thu, 19 Feb 2015 07:44:50 -0800 (PST)
Received: by 10.140.20.42 with HTTP; Thu, 19 Feb 2015 07:44:50 -0800 (PST)
Date: Thu, 19 Feb 2015 10:44:50 -0500
Message-ID: <CAPphmgZyhombVZXZWqyH7+3kqEXJTdPrpghW2i5FhwmnVSx35Q@mail.gmail.com>
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [dora][meta-networking] ntp, pps-tools: backported ntp 4.2.8 upgrade to dora
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Feb 2015 15:44:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ntp, pps-tools: backported ntp 4.2.8 upgrade to dora

Backport ntp 4.2.8 to dora. This includes ntpd 4.2.8 and its security fixes=
.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
----
The following changes since commit e75ae8f50af3effe560c43fc63cfd1f39395f011=
:

  gdal: fix sqlite, expat and libtiff detection (2014-12-03 15:13:24 +0100)

are available in the git repository at:

  https://github.com/jatedev/meta-oe dora-ntp-4.2.8

for you to fetch changes up to f8819bd7c07e7ffe9dbfcb83de2b8639145cb8b8:

  pps-tools: add recipe (2015-02-18 14:20:20 -0500)

----------------------------------------------------------------
Chen Qi (1):
      ntp: make daemon run under ntp:ntp

Chong Lu (1):
      ntp: add sntp.service for sntp package

Jack Mitchell (1):
      ntp: fix incorrect pidfile handling in ntpd init script

Joe MacDonald (1):
      ntpd: update config file comments

Paul Eggleton (3):
      ntp: upgrade to 4.2.8
      ntp: fix file locations
      ntp: add explicit perl dependency to ntp-utils package

Peter Bigot (4):
      ntp: re-enable server debugging and control by PACKAGECONFIG
      ntp: add deterministic support for KPPS interface
      ntp: create and package ntp home directory
      pps-tools: add recipe

Philip Balister (1):
      ntp : Add cap to default PACKAGECONFIG options.

Qiang Chen (1):
      ntpd: make start-stop-daemon command available for ntpd

Roy Li (2):
      ntp: fix 60-ntpd.list path
      ntp: comment out the invalid server

Stefan Herbrechtsmeier (1):
      ntp: Fix the installed but not shipped issue of a systemd units file

Szombathelyi Gy=C3=B6rgy (1):
      ntp: fix perl path

Wenzong Fan (3):
      ntp: fix hardcode to /usr/bin/perl
      ntp: fix path to drift file
      ntp: add status for initscript

Xufeng Zhang (3):
      ntp: Running ntpd daemon as ntp:ntp
      ntp: Moving relevant files from /usr/bin to /usr/sbin
      ntp: Disable debugging by default

 .../recipes-support/ntp/files/openssl-check.patch  |   59 -------
 .../recipes-support/ntp/files/tickadj.c.patch      |   32 ----
 .../ntp/{files =3D> ntp}/ntp-4.2.4_p6-nano.patch     |    0
 .../ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch  |  168
++++++++++++++++++++
 .../recipes-support/ntp/{files =3D> ntp}/ntp.conf    |   13 +-
 .../recipes-support/ntp/{files =3D> ntp}/ntpd        |   36 ++++-
 .../recipes-support/ntp/ntp/ntpd.service           |    2 +-
 .../recipes-support/ntp/{files =3D> ntp}/ntpdate     |    6 +-
 .../ntp/{files =3D> ntp}/ntpdate.default             |    0
 .../recipes-support/ntp/ntp/sntp.service           |    2 +-
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |    6 -
 .../recipes-support/ntp/{ntp.inc =3D> ntp_4.2.8.bb}  |   58 +++++--
 meta-oe/recipes-support/pps-tools/pps-tools_git.bb |   16 ++
 13 files changed, 269 insertions(+), 129 deletions(-)
 delete mode 100644
meta-networking/recipes-support/ntp/files/openssl-check.patch
 delete mode 100644
meta-networking/recipes-support/ntp/files/tickadj.c.patch
 rename meta-networking/recipes-support/ntp/{files =3D>
ntp}/ntp-4.2.4_p6-nano.patch (100%)
 create mode 100644
meta-networking/recipes-support/ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.pat=
ch
 rename meta-networking/recipes-support/ntp/{files =3D> ntp}/ntp.conf (59%)
 rename meta-networking/recipes-support/ntp/{files =3D> ntp}/ntpd (56%)
 rename meta-networking/recipes-support/ntp/{files =3D> ntp}/ntpdate (87%)
 rename meta-networking/recipes-support/ntp/{files =3D> ntp}/ntpdate.defaul=
t
(100%)
 delete mode 100644 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
 rename meta-networking/recipes-support/ntp/{ntp.inc =3D> ntp_4.2.8.bb} (67=
%)
 create mode 100644 meta-oe/recipes-support/pps-tools/pps-tools_git.bb

