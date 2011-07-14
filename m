Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QhRZd-0003lD-U6 for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 21:27:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QhRVo-0004Wx-46 for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 21:23:52 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 21:23:52 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 21:23:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 14 Jul 2011 21:23:40 +0200
Message-ID: <ivnfns$uho$1@dough.gmane.org>
References: <1310626478-31452-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1310626478-31452-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe][PATCH] classes/testlab: Enhance to dump license information
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
X-List-Received-Date: Thu, 14 Jul 2011 19:27:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-07-11 08:54, Khem Raj schreef:
> It will now additionally create a new file which will contain list of licenses of installed packages in a given image.
> 
> The fix to get the package name is there because the packages which contains epoch PE in the version string were not being constructed correctly since opkg-cl would dump 'epoch:version' for Version string but the real ipk did not have 'epoch' in its name. e.g.
> 
> for armv5te/libopkg0_0.1.8+svnr609-r2_armv5te.ipk
> 
> Package: libopkg0 Version: 1:0.1.8+svnr609-r2
> 
> as you can see version contained in ipk is not containing the 'epoch'
> 
> so we have to eliminate 'epoch' from version we get from opkg-cl to for the installed ipk name correctly.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- meta-oe/classes/testlab.bbclass |    8 +++++++- 1 files changed, 7 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/classes/testlab.bbclass b/meta-oe/classes/testlab.bbclass index cd59782..fd37242 100644 --- a/meta-oe/classes/testlab.bbclass +++ b/meta-oe/classes/testlab.bbclass @@ -36,7 +36,10 @@ if [ -e  ${IMAGE_ROOTFS}/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" = "full" echo -e
> "digraph depends {\n    node [shape=plaintext]" > ${TESTLAB_DIR}/depends.dot
> 
> for pkg in $(opkg-cl ${IPKG_ARGS} list_installed | awk '{print $1}') ; do -		opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Package/ {printf $2"_"} /^Version/ {printf $2"_"} /^Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt 
> +		name=`opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Package/ {printf $2"_"}'` +		name=$name`opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk -F: '/^Version/ {printf $NF"_"}' | sed
> 's/^\s*//g'` +		name=$name`opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Archi/ {print $2".ipk"}'` +		echo $name >>${TESTLAB_DIR}/installed-packages.txt
> 
> for depends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep ^Depends) ; do echo "$pkg OPP $depends;" | grep -v "(" | grep -v ")" | grep -v "$pkg OPP Depends" | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot @@ -65,6 +68,9 @@ if [ -e
> ${IMAGE_ROOTFS}/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" = "full" du -k $(find ${DEPLOY_DIR_IPK} -name "$file") | head -n1 done | grep "\.ipk" | sed -e s:${DEPLOY_DIR_IPK}::g | sort -n -r | awk '{print $1 "\tKiB " $2}' > ${TESTLAB_DIR}/installed-package-sizes.txt
> 
> +	for file in $(cat ${TESTLAB_DIR}/installed-packages.txt) ; do +		echo "`find ${DEPLOY_DIR_IPK} -name "$file" | xargs opkg-list-fields | grep ^License | sed -e 's/^.*:[ \t]*//g'`" '=' $file +	done | awk -F= '{printf("%50s:%s\n", $1, $2)}' > ${TESTLAB_DIR}/installed-package-licenses.txt # Log
> results to a git controlled directory structure than can be pushed to a remote location if [ "${TESTLABLOG}" = "remote" ] && [ -n "${TESTLABREMOTEDIR}" ] ; then TESTLABLOGDIR="${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"

I like the idea, but I'm not fond of the formatting:

                                              MIT : angstrom-feed-configs_1.0-r15_qemuarm.ipk
                                              MIT : angstrom-task-boot_1.0-r1_qemuarm.ipk
                                              MIT : angstrom-version_v2011.07-core-r9_qemuarm.ipk
                               GPLv2+ & LGPLv2.1+ : avahi-daemon_0.6.30-r4_armv5te.ipk
                               GPLv2+ & LGPLv2.1+ : avahi-systemd_0.6.30-r4_armv5te.ipk

[..]

                       GPLv2 & LGPLv2 & BSD & MIT : libext2fs2_1.41.14-r1_armv5te.ipk
GCC RUNTIME LIBRARY EXCEPTION & GPLv2 & GPLv3 & LGPLv2.1 & LGPLv3 : libgcc1_4.5-r39.1+svnr175127_armv5te.ipk
                               GPLv2+ & LGPLv2.1+ : libgcrypt11_1.4.6-r0_armv5te.ipk
                               LGPLv2+ & BSD & PD : libglib-2.0-0_2.28.8-r2_armv5te.ipk

As you can see it breaks with stupidly long licenses like gcc. I'm wondering if we shouldn't just add an extra column in install*packages*.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOH0I8MkyGM64RGpERAkT+AJ4h2TQz0kfhB8Gr90S+zyFl66vruACgn/9K
s1qBVPCzyTzj6+tJpbDylyc=
=E1O3
-----END PGP SIGNATURE-----



