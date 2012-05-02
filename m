Received: from mx194.callplus.net.nz ([202.180.66.194]
	helo=mxi2.callplus.net.nz) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roystonvasey@slingshot.co.nz>) id 1SPft0-0007hs-AB
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 22:10:54 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ap4EANeRoU/LYgoS/2dsb2JhbABEtCaCCQEBAQEDAQEBBQIeEjQXAQUGFAQBASggDgEeCQkBBBMLBYd8DJlQhkuacxOQdQSTT4NAjzGCfQ
X-IronPort-AV: E=Sophos;i="4.75,519,1330858800"; d="scan'208";a="261829082"
Received: from smtp.connexionz.co.nz (HELO mikepad) ([203.98.10.18])
	by ismtp2.tranzpeer.net with ESMTP; 03 May 2012 08:01:08 +1200
From: "R U Local" <roystonvasey@slingshot.co.nz>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 3 May 2012 08:01:06 +1200
Message-ID: <007601cd289e$4f859230$ee90b690$@slingshot.co.nz>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac0onUNas4id0gnKQ9ub7/znelK0fA==
Subject: angstrom-version failing and fix
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
X-List-Received-Date: Wed, 02 May 2012 20:10:54 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-nz

Dear List,
Just moved to oe-core from classic, great work by the way.

My build fails in angstrom-version do_install.
The format of the text returned by get_layers has un-escaped " characters.
The text is then used in quoted strings which upsets echo.
The problem exists on Ubuntu 11.10 and 12.04.

This is my fix: -
--- a/meta-angstrom/recipes-angstrom/angstrom/angstrom-version.bb
2012-05-02 11:36:46.417273264 +1200
+++ b/meta-angstrom/recipes-angstrom/angstrom/angstrom-version.bb
2012-04-30 10:47:16.559055882 +1200
@@ -12,7 +12,7 @@
 
 def get_layers(bb, d):
 	layers = (bb.data.getVar("BBLAYERS", d, 1) or "").split()
-	layers_branch_rev = ["%-17s = \"%s:%s\"" % (os.path.basename(i), \
+	layers_branch_rev = ["%-17s = \\\"%s:%s\\\"" % (os.path.basename(i),
\
 		base_get_metadata_git_branch(i, None).strip().strip('()'), \
 		base_get_metadata_git_revision(i, None)) \
 			for i in layers]

Cheers Mike.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Koen
Kooi
Sent: Thursday, 3 May 2012 06:54
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe 1/1] lxc : Add recipe for building Linux
Containers tools.

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 02-05-12 19:45, Philip Balister schreef:
> Linux containers are a lightweight virtualization system.
> 
> Compile tested on F15 and lightly run tested on a pandaboard.
> 
> Signed-off-by: Philip Balister <philip@balister.org> --- 
> meta-oe/recipes-extended/lxc/lxc_git.bb |   21 +++++++++++++++++++++ 1
> files changed, 21 insertions(+), 0 deletions(-) create mode 100644 
> meta-oe/recipes-extended/lxc/lxc_git.bb
> 
> diff --git a/meta-oe/recipes-extended/lxc/lxc_git.bb
> b/meta-oe/recipes-extended/lxc/lxc_git.bb new file mode 100644 index
> 0000000..8f22e77 --- /dev/null +++
> b/meta-oe/recipes-extended/lxc/lxc_git.bb @@ -0,0 +1,21 @@ +SUMMARY = 
> "Linux Containers tools" +DESCRIPTION = "Linux containers are a light 
> weight isolation system for Linux." +HOMEPAGE = 
> "http://lxc.sourceforge.net" +LICENSE = "LGPLv2.1"

Move LIC_FILES_CHKSUM to here

> + +PV = "0.8.0-rc2"

That violates the versioning policy

> + +RDEPENDS_${PN} = "perl perl-modules"

That needs to go below do_install() and specify the actual modules it needs,
not the blanket meta-package.

Speaking of lxc, have you tried systemd-nspawn to launch containers yet?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPoYLZAAoJEHZqAkdh1vT6aSkP/icOR0X1LViS570mPPq2AVuN
f2eFS33G0ozGu6ZMJGgoQ788Hbzi4cBb53jTek1UDjJbRu34pwpEMJJFuKQB53m+
S66ayFiiEBMeTm8YttY/XscJBR07FP/T1ZDhAJJEdd8P4UOqQG7hee46SyeH7NIX
dFKwahfIbfVHjnV5Ub46UzuDYEPMSiJFtsFWE6AeNg7y2rPcCjAKpaTRI8UjDCFk
G9VkptMHoShSHRechYELIgMPpUrVw8JgGX0KBmAsK0GedKtgBFmr3pa1g3y6uORn
oVlUJOzUo5vxOkcNaL6wg06q3IomUNemQX70pF8Oy89DV7FqhPM95/pOL3B/89DR
+qEuJreGW/fQJUiZVX252YhY+dzVb+JZJObtiDMOxfJMyA9AG1YoATFtOGOTYJT/
3gCwEVs0N5LIP/KF9Ox9205+qtEn5uJzmxy7ZQp5SuNx5skxJL0OyPufm/Tpr6/T
6cDeEVsKKTEYXNiqIxOvG9LlnVWy/v+DgqHCCxEVs9MlCizC0dghE4kslcsAYd9S
fK5PzuFLb9IcLTDIwRIUuSsaj7Z9L8Y7L24daFlfIGblDn8jAlxTXn8OuheRvFSh
q8csWl6KuTFoQ1TvEsF3wg/B6UdFyCb1Vtj+0t4ekcSzLNlUrhaXJG0IJ6kDC/Pm
wfS4dMFyAcBfDXqjSCeN
=Cv0C
-----END PGP SIGNATURE-----


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

__________ Information from ESET NOD32 Antivirus, version of virus signature
database 7105 (20120502) __________

The message was checked by ESET NOD32 Antivirus.

http://www.eset.com





