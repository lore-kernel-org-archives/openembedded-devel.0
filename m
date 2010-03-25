Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1Nuoqm-00049m-3e
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 16:20:00 +0100
Received: by wwf26 with SMTP id 26so188746wwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=i8gDxUdLj0LWC8AUApOGVhs4DAzAXxF0k1Ghsz0Pceg=;
	b=j3iVhZs1ZyoDGz5Zxa2BIIbqOGAhPe89pvWfc//ppJKlhnfsND39VTq6vvhqyO25Z5
	HBln469eJrRznVZQlGQuTMzvADb0UPdVBDq06GMF6oLRAMfNCE+ZVql3jg78/W6bXYx0
	q3/Lo4qYQU3upb+GvS+E0abk0fU3mqpC2ZaUQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ugMVPil5hX8j9M0cTKAv8FkX0YDR3njOMEM/n4VmFJxjs/jYOgGkzbgxSxarGjqvC2
	kwYHtmD/GusHXf/+HcD8zM0K1L8NQzh1w6jAuT9JG4k3Nx7DDObhu0PGquh+9ob6hnZg
	HGSwZESQeWeaMURB68Fw3/dOrvuxFesJ6rBzs=
MIME-Version: 1.0
Received: by 10.216.93.68 with SMTP id k46mr1273468wef.104.1269530209158; Thu, 
	25 Mar 2010 08:16:49 -0700 (PDT)
Date: Thu, 25 Mar 2010 18:16:49 +0300
Message-ID: <48239d391003250816m3686a994h92fd5a115c3f47d4@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [SDK] meta-toolchain.bb generates very interesting environment-setup
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
X-List-Received-Date: Thu, 25 Mar 2010 15:20:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

$ cat /usr/local/angstrom/arm/environment-setup
export SDK_PATH=/usr/local/angstrom/arm
export TARGET_SYS=arm-angstrom-linux-gnueabi
export PATH=$SDK_PATH/bin:$PATH
export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH
export LIBTOOL_SYSROOT_PATH=$SDK_PATH/$TARGET_SYS
export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS
export PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS/usr/lib/pkgconfig
export CONFIG_SITE=$SDK_PATH/site-config
alias opkg='LD_LIBRARY_PATH=/lib /bin/opkg-cl -f //etc/opkg-sdk.conf -o '
alias opkg-target='LD_LIBRARY_PATH=/lib /bin/opkg-cl -f //etc/opkg.conf -o /'

A problem seems to be this code:

# Create environment setup script
        script=${SDK_OUTPUT}/${SDKPATH}/environment-setup
        touch $script
        echo 'export SDK_PATH=${SDKPATH}' >> $script
        echo 'export TARGET_SYS=${TARGET_SYS}' >> $script
        echo 'export PATH=$SDK_PATH/bin:$PATH' >> $script
        echo 'export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
        echo 'export LIBTOOL_SYSROOT_PATH=$SDK_PATH/$TARGET_SYS' >> $script
        echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
        echo 'export
PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
        echo 'export CONFIG_SITE=$SDK_PATH/site-config' >> $script
        echo "alias opkg='LD_LIBRARY_PATH=$SDK_PATH/lib
$SDK_PATH/bin/opkg-cl -f $SDK_PATH/${sysconfdir}/opkg-s
dk.conf -o $SDK_PATH'" >> $script
        echo "alias opkg-target='LD_LIBRARY_PATH=$SDK_PATH/lib
$SDK_PATH/bin/opkg-cl -f $SDK_PATH/$TARGET_SYS${
sysconfdir}/opkg.conf -o $SDK_PATH/$TARGET_SYS'" >> $script


it seems that $SDK_PATH in last two lines gets resolved instead of
being written literally. adding \ before $ in these lines seems to fix
this problem. Is it appropriate fix?

diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index 688995c..4f7ffda 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -145,8 +145,8 @@ do_populate_sdk() {
        echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
        echo 'export
PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
        echo 'export CONFIG_SITE=$SDK_PATH/site-config' >> $script
-       echo "alias opkg='LD_LIBRARY_PATH=$SDK_PATH/lib
$SDK_PATH/bin/opkg-cl -f $SDK_PATH/${sysconfdir}/opkg-sd
-       echo "alias opkg-target='LD_LIBRARY_PATH=$SDK_PATH/lib
$SDK_PATH/bin/opkg-cl -f $SDK_PATH/$TARGET_SYS${s
+       echo "alias opkg='LD_LIBRARY_PATH=\$SDK_PATH/lib
\$SDK_PATH/bin/opkg-cl -f \$SDK_PATH/${sysconfdir}/opkg
+       echo "alias opkg-target='LD_LIBRARY_PATH=\$SDK_PATH/lib
\$SDK_PATH/bin/opkg-cl -f \$SDK_PATH/$TARGET_SYS

        # Add version information
        versionfile=${SDK_OUTPUT}/${SDKPATH}/version


