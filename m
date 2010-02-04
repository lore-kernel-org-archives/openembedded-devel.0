Received: from emailgateway.hillcrestlabs.com ([12.173.51.132])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1Nd548-0001fU-4S
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 18:00:31 +0100
X-AuditID: 0a1e000a-b7bfcae000000dfe-5f-4b6afc96ba3d
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265247822-20734-1-git-send-email-denis@denix.org>
References: <1265247822-20734-1-git-send-email-denis@denix.org>
Date: Thu, 04 Feb 2010 11:57:51 -0500
Message-Id: <1265302671.25338.57.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] meta-toolchain: make SDK relocatable by using $SDK_PATH var in env setup script
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
X-List-Received-Date: Thu, 04 Feb 2010 17:00:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2010-02-03 at 20:43 -0500, Denys Dmytriyenko wrote:
> Do not hard-code SDK location into all the libtool's .la files and other
> libtool, pkg-config and opkg service variables and aliases. Use $SDK_PATH
> environment variable instead, which is set once in the main environment-setup
> script, allowing easy SDK relocation by adjusting a single variable.
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  recipes/meta/meta-toolchain.bb |   25 ++++++++++++++-----------
>  1 files changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
> index a8c27ec..2855fde 100644
> --- a/recipes/meta/meta-toolchain.bb
> +++ b/recipes/meta/meta-toolchain.bb
> @@ -119,10 +119,10 @@ do_populate_sdk() {
>  
>  	# Fix or remove broken .la files
>  	for i in `find ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS} -name \*.la`; do
> -		sed -i 	-e "/^dependency_libs=/s,\([[:space:]']\)${base_libdir},\1${SDKPATH}/${TARGET_SYS}${base_libdir},g" \
> -			-e "/^dependency_libs=/s,\([[:space:]']\)${libdir},\1${SDKPATH}/${TARGET_SYS}${libdir},g" \
> -			-e "/^dependency_libs=/s,\-\([LR]\)${base_libdir},-\1${SDKPATH}/${TARGET_SYS}${base_libdir},g" \
> -			-e "/^dependency_libs=/s,\-\([LR]\)${libdir},-\1${SDKPATH}/${TARGET_SYS}${libdir},g" \
> +		sed -i 	-e "/^dependency_libs=/s,\([[:space:]']\)${base_libdir},\1\$SDK_PATH/\$TARGET_SYS${base_libdir},g" \
> +			-e "/^dependency_libs=/s,\([[:space:]']\)${libdir},\1\$SDK_PATH/\$TARGET_SYS${libdir},g" \
> +			-e "/^dependency_libs=/s,\-\([LR]\)${base_libdir},-\1\$SDK_PATH/\$TARGET_SYS${base_libdir},g" \
> +			-e "/^dependency_libs=/s,\-\([LR]\)${libdir},-\1\$SDK_PATH/\$TARGET_SYS${libdir},g" \
>  			-e 's/^installed=yes$/installed=no/' $i
>  	done
>  	rm -f ${SDK_OUTPUT}/${SDKPATH}/lib/*.la
> @@ -137,13 +137,16 @@ do_populate_sdk() {
>  	# Create environment setup script
>  	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup
>  	touch $script
> -	echo 'export PATH=${SDKPATH}/bin:$PATH' >> $script
> -	echo 'export LIBTOOL_SYSROOT_PATH=${prefix}/${TARGET_SYS}' >> $script
> -	echo 'export PKG_CONFIG_SYSROOT_DIR=${SDKPATH}/${TARGET_SYS}' >> $script
> -	echo 'export PKG_CONFIG_PATH=${SDKPATH}/${TARGET_SYS}${libdir}/pkgconfig' >> $script
> -	echo 'export CONFIG_SITE=${SDKPATH}/site-config' >> $script
> -	echo "alias opkg='LD_LIBRARY_PATH=${SDKPATH}/lib ${SDKPATH}/bin/opkg-cl -f ${SDKPATH}/${sysconfdir}/opkg-sdk.conf -o ${SDKPATH}'" >> $script
> -	echo "alias opkg-target='LD_LIBRARY_PATH=${SDKPATH}/lib ${SDKPATH}/bin/opkg-cl -f ${SDKPATH}/${TARGET_SYS}${sysconfdir}/opkg.conf -o ${SDKPATH}/${TARGET_SYS}'" >> $script
> +	echo 'export SDK_PATH=${SDKPATH}' >> $script
> +	echo 'export TARGET_SYS=${TARGET_SYS}' >> $script
> +	echo 'export PATH=$SDK_PATH/bin:$PATH' >> $script
> +	echo 'export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
> +	echo 'export LIBTOOL_SYSROOT_PATH=$SDK_PATH/$TARGET_SYS' >> $script
> +	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
> +	echo 'export PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
> +	echo 'export CONFIG_SITE=$SDK_PATH/site-config' >> $script
> +	echo "alias opkg='LD_LIBRARY_PATH=$SDK_PATH/lib $SDK_PATH/bin/opkg-cl -f $SDK_PATH/${sysconfdir}/opkg-sdk.conf -o $SDK_PATH'" >> $script
> +	echo "alias opkg-target='LD_LIBRARY_PATH=$SDK_PATH/lib $SDK_PATH/bin/opkg-cl -f $SDK_PATH/$TARGET_SYS${sysconfdir}/opkg.conf -o $SDK_PATH/$TARGET_SYS'" >> $script
>  
>  	# Add version information
>  	versionfile=${SDK_OUTPUT}/${SDKPATH}/version

The fact that both SDK_PATH and SDKPATH exist and apparently mean
different things seems very wrong to me. IMHO one should be removed or
renamed since having them both will be a source of confusion.

It should probably be ${SDK_PATH} instead of $SDK_PATH in your changes.

Does this really make the SDK relocatable? I thought there were still
major issues with relocating GCC.


--Chris




