Received: from [64.233.166.182] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1K419b-0003v7-Sx
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jun 2008 00:08:24 +0200
Received: by py-out-1112.google.com with SMTP id y77so209216pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2008 15:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=Nc1W5pDAmk6MM3BCgxumFruTktzrOoqmnDi4jQoXcKI=;
	b=ep/piiYDiJ7sfCkB+HOdJI4uBGxRWQwyad1ErTlmuxMUbQGrKertWWPI/vjvQC04kK
	rFAFwr5GqBHNKPC+Wy8nik45OMXfjF/QrPcm4wauWg2DgvnmT+u+67fH6XsDEO1v13Vl
	Sd552XM/zW8wvgo3hVHIN/0aeCEDjkY/0iwKE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=MTYvYICP82snWy+id2LP+cT0AZxTKLsbjy+rGTRmlo/82adwIWAgyu6q5rwtlH/twC
	RMKsSarTN8bXqrO3ZDXNUqgYHjjYGEQBm+nBl9uP5t7nE7PUR8JhH80z66MJr110uDXa
	nx7GeyVJAUIBX46Paa48OTX0HREPThbZl8r/Y=
Received: by 10.115.14.1 with SMTP id r1mr723898wai.139.1212617028032;
	Wed, 04 Jun 2008 15:03:48 -0700 (PDT)
Received: by 10.114.77.18 with HTTP; Wed, 4 Jun 2008 15:03:47 -0700 (PDT)
Message-ID: <d1b08f940806041503j30d3192fj3607d2071886131b@mail.gmail.com>
Date: Thu, 5 Jun 2008 00:03:47 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] patches for angstrom 2008.1 - c7x0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 04 Jun 2008 22:08:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

oebug 3428 preferred xserver-kdrive-imageon for c7x0
oebug 4304 c7x0 wont resume using linux-rp_2.6.23
oebug 4118 udev-118 failed to create device nodes on Tosa ... (and c7x0)

#
# old_revision [bcb31dc3c95419caf9e78af08f99256c5965175e]
#
# patch "conf/distro/include/angstrom-2008-preferred-versions.inc"
#  from [45c7ad8dae151667ad4090f51315c58cf1e5a31b]
#    to [fa49e84959c21907c43b99aa1f28e3f64cd7f640]
#
# patch "conf/machine/include/zaurus-2.6.inc"
#  from [f56c5d7f00ad90430d1cfa3e9ff6283245f5e5c6]
#    to [a16d4ce273d75cc872c36b59bb08b5bf781820e2]
#
# patch "packages/linux/linux-rp_2.6.24.bb"
#  from [4782fd14fc4ea11a863598f899afcf59024885eb]
#    to [3848fa5aa42012b46af0a9c10e3841d51c11dd2e]
#
============================================================
--- conf/distro/include/angstrom-2008-preferred-versions.inc	45c7ad8dae151667ad4090f51315c58cf1e5a31b
+++ conf/distro/include/angstrom-2008-preferred-versions.inc	fa49e84959c21907c43b99aa1f28e3f64cd7f640
@@ -7,6 +7,6 @@ PREFERRED_VERSION_pulseaudio 	= "0.9.9"
 PREFERRED_VERSION_pango 	= "1.18.3"
 PREFERRED_VERSION_pixman	= "0.10.0"
 PREFERRED_VERSION_pulseaudio 	= "0.9.9"
-PREFERRED_VERSION_udev 		= "118"
+PREFERRED_VERSION_udev 		= "092"
 PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
 PREFERRED_VERSION_dropbear 	= "0.50"
============================================================
--- conf/machine/include/zaurus-2.6.inc	f56c5d7f00ad90430d1cfa3e9ff6283245f5e5c6
+++ conf/machine/include/zaurus-2.6.inc	a16d4ce273d75cc872c36b59bb08b5bf781820e2
@@ -19,6 +19,7 @@ PREFERRED_PROVIDER_virtual/xserver = "xs

 PREFERRED_PROVIDER_virtual/kernel = "linux-rp"
 PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
+PREFERRED_PROVIDER_virtual/xserver_c7x0 = "xserver-kdrive-imageon"

 PCMCIA_MANAGER ?= "pcmciautils"

============================================================
--- packages/linux/linux-rp_2.6.24.bb	4782fd14fc4ea11a863598f899afcf59024885eb
+++ packages/linux/linux-rp_2.6.24.bb	3848fa5aa42012b46af0a9c10e3841d51c11dd2e
@@ -6,6 +6,7 @@ DEFAULT_PREFERENCE_tosa = "1"
 DEFAULT_PREFERENCE_collie = "1"
 DEFAULT_PREFERENCE_qemux86 = "1"
 DEFAULT_PREFERENCE_tosa = "1"
+DEFAULT_PREFERENCE_c7x0 = "1"

 # Handy URLs
 # git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;protocol=git;tag=ef7d1b244fa6c94fb76d5f787b8629df64ea4046


