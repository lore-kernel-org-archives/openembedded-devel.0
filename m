Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NurQa-0006G0-8R
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 19:05:09 +0100
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KZU007WVNE3L6E2@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	25 Mar 2010 13:01:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9438B14AF60; Thu,
	25 Mar 2010 14:01:15 -0400 (EDT)
Date: Thu, 25 Mar 2010 14:01:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100325180115.GD28005@denix.org>
References: <48239d391003250816m3686a994h92fd5a115c3f47d4@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <48239d391003250816m3686a994h92fd5a115c3f47d4@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [SDK] meta-toolchain.bb generates very interesting	environment-setup
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
X-List-Received-Date: Thu, 25 Mar 2010 18:05:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 25, 2010 at 06:16:49PM +0300, Sergey Lapin wrote:
> $ cat /usr/local/angstrom/arm/environment-setup
> export SDK_PATH=/usr/local/angstrom/arm
> export TARGET_SYS=arm-angstrom-linux-gnueabi
> export PATH=$SDK_PATH/bin:$PATH
> export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH
> export LIBTOOL_SYSROOT_PATH=$SDK_PATH/$TARGET_SYS
> export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS
> export PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS/usr/lib/pkgconfig
> export CONFIG_SITE=$SDK_PATH/site-config
> alias opkg='LD_LIBRARY_PATH=/lib /bin/opkg-cl -f //etc/opkg-sdk.conf -o '
> alias opkg-target='LD_LIBRARY_PATH=/lib /bin/opkg-cl -f //etc/opkg.conf -o /'
> 
> A problem seems to be this code:
> 
> # Create environment setup script
>         script=${SDK_OUTPUT}/${SDKPATH}/environment-setup
>         touch $script
>         echo 'export SDK_PATH=${SDKPATH}' >> $script
>         echo 'export TARGET_SYS=${TARGET_SYS}' >> $script
>         echo 'export PATH=$SDK_PATH/bin:$PATH' >> $script
>         echo 'export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
>         echo 'export LIBTOOL_SYSROOT_PATH=$SDK_PATH/$TARGET_SYS' >> $script
>         echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
>         echo 'export
> PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
>         echo 'export CONFIG_SITE=$SDK_PATH/site-config' >> $script
>         echo "alias opkg='LD_LIBRARY_PATH=$SDK_PATH/lib
> $SDK_PATH/bin/opkg-cl -f $SDK_PATH/${sysconfdir}/opkg-s
> dk.conf -o $SDK_PATH'" >> $script
>         echo "alias opkg-target='LD_LIBRARY_PATH=$SDK_PATH/lib
> $SDK_PATH/bin/opkg-cl -f $SDK_PATH/$TARGET_SYS${
> sysconfdir}/opkg.conf -o $SDK_PATH/$TARGET_SYS'" >> $script
> 
> 
> it seems that $SDK_PATH in last two lines gets resolved instead of
> being written literally. adding \ before $ in these lines seems to fix
> this problem. Is it appropriate fix?

Ah, interesting... It worked for me when the last two lines had double quotes 
inside single quotes. But to match RP's styling, I had to revert that to 
single quotes inside double quotes and it doesn't seem to work:

$ echo 'show "$SDK_PATH"'
show "$SDK_PATH"

$ echo "show '$SDK_PATH'"
show ''

I wonder if it would be Ok to revert back to the original quoting... Or is 
escaping with \ a better fix?

> diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
> index 688995c..4f7ffda 100644
> --- a/recipes/meta/meta-toolchain.bb
> +++ b/recipes/meta/meta-toolchain.bb
> @@ -145,8 +145,8 @@ do_populate_sdk() {
>         echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
>         echo 'export
> PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
>         echo 'export CONFIG_SITE=$SDK_PATH/site-config' >> $script
> -       echo "alias opkg='LD_LIBRARY_PATH=$SDK_PATH/lib
> $SDK_PATH/bin/opkg-cl -f $SDK_PATH/${sysconfdir}/opkg-sd
> -       echo "alias opkg-target='LD_LIBRARY_PATH=$SDK_PATH/lib
> $SDK_PATH/bin/opkg-cl -f $SDK_PATH/$TARGET_SYS${s
> +       echo "alias opkg='LD_LIBRARY_PATH=\$SDK_PATH/lib
> \$SDK_PATH/bin/opkg-cl -f \$SDK_PATH/${sysconfdir}/opkg
> +       echo "alias opkg-target='LD_LIBRARY_PATH=\$SDK_PATH/lib
> \$SDK_PATH/bin/opkg-cl -f \$SDK_PATH/$TARGET_SYS
> 
>         # Add version information
>         versionfile=${SDK_OUTPUT}/${SDKPATH}/version
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


