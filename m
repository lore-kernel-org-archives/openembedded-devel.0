Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J1eZB-00050c-H3
	for openembedded-devel@openembedded.org; Mon, 10 Dec 2007 10:04:47 +0100
Received: from Powerbook-2.local (vpn006034.vpn.utwente.nl [130.89.6.34])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBA90Wfr019892 for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2007 10:00:34 +0100
Message-ID: <475D0030.2050704@student.utwente.nl>
Date: Mon, 10 Dec 2007 10:00:32 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1J1deN-00080d-OX@linuxtogo.org>
In-Reply-To: <E1J1deN-00080d-OX@linuxtogo.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev Integrate helper scripts into	meta-toolchain-openmoko.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2007 09:04:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

john_lee commit schreef:
> Integrate helper scripts into meta-toolchain-openmoko.

Note that if you distribute the result you violate the GPL and MIT licenses.

If you include files from OE, you need to include COPYING.MIT as well,
if you include parts of a GPL'ed project, you need to include the license..

Probably more problems, but this is what I found after eyeballing the
scripts for a few seconds.


> Author: john_lee@openmoko.com
> Branch: org.openembedded.dev
> Revision: 4dc379aab7427cdddc45871616c34a79875f1b3f
> ViewMTN: http://monotone.openembedded.org/revision/info/4dc379aab7427cdddc45871616c34a79875f1b3f
> Files:
> 1
> packages/openmoko-spaces
> packages/openmoko-spaces/openmoko-toolchain-scripts_svn.bb
> packages/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
> packages/tasks/task-toolchain-openmoko-sdk.bb
> Diffs:
> 
> #
> # mt diff -r76ea1207ddbc877a1858eddac5d821f6cd0bc4ee -r4dc379aab7427cdddc45871616c34a79875f1b3f
> #
> # 
> # 
> # add_dir "packages/openmoko-spaces"
> # 
> # add_file "packages/openmoko-spaces/openmoko-toolchain-scripts_svn.bb"
> #  content [9ca964cafabb093788ba8d42e42e6cd2c4c01437]
> # 
> # patch "packages/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb"
> #  from [78905ac03fe3db35fb352b69c6d94fa42889ce6a]
> #    to [542bd7c20a1c55763795a9ed029a70b90c8810cf]
> # 
> # patch "packages/tasks/task-toolchain-openmoko-sdk.bb"
> #  from [7af4fab2e6a807dcffa21e3e435c72702f5f2e0f]
> #    to [c8861d63c40205aa7501e8801f328f1b0ec46a99]
> # 
> ============================================================
> --- packages/openmoko-spaces/openmoko-toolchain-scripts_svn.bb	9ca964cafabb093788ba8d42e42e6cd2c4c01437
> +++ packages/openmoko-spaces/openmoko-toolchain-scripts_svn.bb	9ca964cafabb093788ba8d42e42e6cd2c4c01437
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "Convenient scripts to be used with openmoko toolchain."
> +PACKAGE_ARCH = "all"
> +
> +SRC_URI = "svn://svn.openmoko.org/developers/john_lee;module=toolkit;proto=http"
> +SRC_URI += "svn://svn.openmoko.org/trunk/src/target/OM-2007.2/applications;module=openmoko-sample2;proto=http"
> +
> +SRCREV="3563"
> +FILES_${PN} = "/"
> +
> +do_install () {
> +	(find ${WORKDIR} -type d -name ".svn" | xargs rm -rf) || true
> +	install -m 755 -d ${D}/share
> +	cp -dr ${WORKDIR}/toolkit/* ${D}
> +	cp -dr ${WORKDIR}/openmoko-sample2 ${D}/share
> +}
> ============================================================
> --- packages/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb	78905ac03fe3db35fb352b69c6d94fa42889ce6a
> +++ packages/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb	542bd7c20a1c55763795a9ed029a70b90c8810cf
> @@ -8,7 +8,7 @@ FILESDIR = "${@os.path.dirname(bb.data.g
>  # Avoid circular dependencies from package_ipk.bbclass
>  PACKAGES = ""
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/ipkg-utils"
> -INSTALL += "arfile.py"
> +INSTALL += "ipkg-list-fields arfile.py"
>  
>  do_stage() {
>          for i in ${INSTALL}; do
> ============================================================
> --- packages/tasks/task-toolchain-openmoko-sdk.bb	7af4fab2e6a807dcffa21e3e435c72702f5f2e0f
> +++ packages/tasks/task-toolchain-openmoko-sdk.bb	c8861d63c40205aa7501e8801f328f1b0ec46a99
> @@ -25,4 +25,5 @@ RDEPENDS_${PN} = "\
>      libmokoui2-dev \
>      libmokopanelui2-dev \
>      libmokojournal2-dev \
> +    openmoko-toolchain-scripts \
>  "
> 
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
> 


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHXQAwMkyGM64RGpERAgKVAJoCnzLrrD0o4+HM5qUhpYwWnr0ceQCgslmx
vusYOIVlt8qmhx0Kzq59eRw=
=tJ43
-----END PGP SIGNATURE-----


