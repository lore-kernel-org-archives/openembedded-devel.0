Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Nd5Sl-0002ID-4o
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 18:25:58 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KXB00ERYUXM2WF1@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	04 Feb 2010 11:22:47 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6C1F314AF60; Thu,
	04 Feb 2010 12:22:34 -0500 (EST)
Date: Thu, 04 Feb 2010 12:22:34 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100204172234.GA5641@denix.org>
References: <1265247822-20734-1-git-send-email-denis@denix.org>
	<1265302671.25338.57.camel@conroy-linux>
MIME-version: 1.0
In-reply-to: <1265302671.25338.57.camel@conroy-linux>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] meta-toolchain: make SDK relocatable by	using $SDK_PATH var in env setup script
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
X-List-Received-Date: Thu, 04 Feb 2010 17:25:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 04, 2010 at 11:57:51AM -0500, Chris Conroy wrote:
> On Wed, 2010-02-03 at 20:43 -0500, Denys Dmytriyenko wrote:
> > Do not hard-code SDK location into all the libtool's .la files and other
> > libtool, pkg-config and opkg service variables and aliases. Use $SDK_PATH
> > environment variable instead, which is set once in the main environment-setup
> > script, allowing easy SDK relocation by adjusting a single variable.
> > 
> > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > ---
> >  recipes/meta/meta-toolchain.bb |   25 ++++++++++++++-----------
> >  1 files changed, 14 insertions(+), 11 deletions(-)
> > 
> > diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
> > index a8c27ec..2855fde 100644
> > --- a/recipes/meta/meta-toolchain.bb
> > +++ b/recipes/meta/meta-toolchain.bb
> > @@ -119,10 +119,10 @@ do_populate_sdk() {
> >  
> >  	# Fix or remove broken .la files
> >  	for i in `find ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS} -name \*.la`; do
> > -		sed -i 	-e "/^dependency_libs=/s,\([[:space:]']\)${base_libdir},\1${SDKPATH}/${TARGET_SYS}${base_libdir},g" \
> > -			-e "/^dependency_libs=/s,\([[:space:]']\)${libdir},\1${SDKPATH}/${TARGET_SYS}${libdir},g" \
> > -			-e "/^dependency_libs=/s,\-\([LR]\)${base_libdir},-\1${SDKPATH}/${TARGET_SYS}${base_libdir},g" \
> > -			-e "/^dependency_libs=/s,\-\([LR]\)${libdir},-\1${SDKPATH}/${TARGET_SYS}${libdir},g" \
> > +		sed -i 	-e "/^dependency_libs=/s,\([[:space:]']\)${base_libdir},\1\$SDK_PATH/\$TARGET_SYS${base_libdir},g" \
> > +			-e "/^dependency_libs=/s,\([[:space:]']\)${libdir},\1\$SDK_PATH/\$TARGET_SYS${libdir},g" \
> > +			-e "/^dependency_libs=/s,\-\([LR]\)${base_libdir},-\1\$SDK_PATH/\$TARGET_SYS${base_libdir},g" \
> > +			-e "/^dependency_libs=/s,\-\([LR]\)${libdir},-\1\$SDK_PATH/\$TARGET_SYS${libdir},g" \
> >  			-e 's/^installed=yes$/installed=no/' $i
> >  	done
> >  	rm -f ${SDK_OUTPUT}/${SDKPATH}/lib/*.la
> > @@ -137,13 +137,16 @@ do_populate_sdk() {
> >  	# Create environment setup script
> >  	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup
> >  	touch $script
> > -	echo 'export PATH=${SDKPATH}/bin:$PATH' >> $script
> > -	echo 'export LIBTOOL_SYSROOT_PATH=${prefix}/${TARGET_SYS}' >> $script
> > -	echo 'export PKG_CONFIG_SYSROOT_DIR=${SDKPATH}/${TARGET_SYS}' >> $script
> > -	echo 'export PKG_CONFIG_PATH=${SDKPATH}/${TARGET_SYS}${libdir}/pkgconfig' >> $script
> > -	echo 'export CONFIG_SITE=${SDKPATH}/site-config' >> $script
> > -	echo "alias opkg='LD_LIBRARY_PATH=${SDKPATH}/lib ${SDKPATH}/bin/opkg-cl -f ${SDKPATH}/${sysconfdir}/opkg-sdk.conf -o ${SDKPATH}'" >> $script
> > -	echo "alias opkg-target='LD_LIBRARY_PATH=${SDKPATH}/lib ${SDKPATH}/bin/opkg-cl -f ${SDKPATH}/${TARGET_SYS}${sysconfdir}/opkg.conf -o ${SDKPATH}/${TARGET_SYS}'" >> $script
> > +	echo 'export SDK_PATH=${SDKPATH}' >> $script
> > +	echo 'export TARGET_SYS=${TARGET_SYS}' >> $script
> > +	echo 'export PATH=$SDK_PATH/bin:$PATH' >> $script
> > +	echo 'export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
> > +	echo 'export LIBTOOL_SYSROOT_PATH=$SDK_PATH/$TARGET_SYS' >> $script
> > +	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
> > +	echo 'export PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
> > +	echo 'export CONFIG_SITE=$SDK_PATH/site-config' >> $script
> > +	echo "alias opkg='LD_LIBRARY_PATH=$SDK_PATH/lib $SDK_PATH/bin/opkg-cl -f $SDK_PATH/${sysconfdir}/opkg-sdk.conf -o $SDK_PATH'" >> $script
> > +	echo "alias opkg-target='LD_LIBRARY_PATH=$SDK_PATH/lib $SDK_PATH/bin/opkg-cl -f $SDK_PATH/$TARGET_SYS${sysconfdir}/opkg.conf -o $SDK_PATH/$TARGET_SYS'" >> $script
> >  
> >  	# Add version information
> >  	versionfile=${SDK_OUTPUT}/${SDKPATH}/version
> 
> The fact that both SDK_PATH and SDKPATH exist and apparently mean
> different things seems very wrong to me. IMHO one should be removed or

First of all, they are the same. Check conf/bitbake.conf:

SDKPATH = "${SDK_PATH}"

Second, ask RP why he introduced SDKPATH, when we had SDK_PATH for years (my 
guess - that's what is used in Poky, so makes porting changes easier):

7c2bd627 (Richard Purdie  2009-11-12 11:51:18 +0000 342) SDKPATH = "${SDK_PATH}"

> renamed since having them both will be a source of confusion.
> 
> It should probably be ${SDK_PATH} instead of $SDK_PATH in your changes.

You missed the whole point of the patch. It really should be $SDK_PATH

> Does this really make the SDK relocatable? I thought there were still
> major issues with relocating GCC.

GCC built from OE may still have relocation problems - haven't checked lately.
But it doesn't mean that's the only use case scenario... There is also 
external toolchain option, as well as building SDK without the toolchain.
Both of those cases were tested with the above change for several months now.

-- 
Denys


