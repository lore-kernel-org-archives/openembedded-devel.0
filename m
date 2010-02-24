Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NkO7i-0006kf-G3
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 21:46:26 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYD00GPU5KFKW31@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	24 Feb 2010 14:43:28 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CD1C414AF60; Wed,
	24 Feb 2010 15:43:26 -0500 (EST)
Date: Wed, 24 Feb 2010 15:43:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100224204326.GA9601@denix.org>
References: <1267039367-8677-1-git-send-email-Martin.Jansa@gmail.com>
MIME-version: 1.0
In-reply-to: <1267039367-8677-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] testlab.bbclass: use opkg.conf from staging, always specify tmp_dir in opkg-cl call with -t parameter
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
X-List-Received-Date: Wed, 24 Feb 2010 20:46:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Feb 24, 2010 at 08:22:47PM +0100, Martin Jansa wrote:
> * Use opkg.conf from staging in the same way as do_rootfs does
> * When option tmp_dir is used in opkg.conf installed on rootfs then it's
>   used also in do_rootfs call and points to probably non-existent directory
>   on buildhost like /var/lib/opkg/tmp.
> * The value of tmp_dir from rootfs is used even with another config file
>   specified with -c parameter
> * Before this, it was using default value (/tmp) on buildhost, now it will use
>   own "${IMAGE_ROOTFS}-tmp" and remove it after do_rootfs finish
>   (usually already empty inside, cleaned by opkg itself)
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Looks fine to me.

Acked-by: Denys Dmytriyenko <denis@denix.org>


> ---
>  classes/testlab.bbclass |   13 +++++++++----
>  1 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/classes/testlab.bbclass b/classes/testlab.bbclass
> index fc923c5..e6c9c8e 100644
> --- a/classes/testlab.bbclass
> +++ b/classes/testlab.bbclass
> @@ -24,26 +24,31 @@
>  do_testlab() {
>  if [ -e  ${IMAGE_ROOTFS}/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" = "full" ] ; then
>  
> +	IPKG_TMP_DIR="${IMAGE_ROOTFS}-tmp"
> +	IPKG_ARGS="-f ${STAGING_ETCDIR_NATIVE}/opkg.conf -o ${IMAGE_ROOTFS} -t ${IPKG_TMP_DIR}"
> +
>  	TESTLAB_DIR="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-testlab"
>          mkdir -p ${TESTLAB_DIR}/
> +        mkdir -p ${IPKG_TMP_DIR}/
>  	ls -laR ${IMAGE_ROOTFS} > ${TESTLAB_DIR}/files-in-image.txt 	
>       
>  	echo > ${TESTLAB_DIR}/installed-packages.txt
>  	echo -e "digraph depends {\n    node [shape=plaintext]" > ${TESTLAB_DIR}/depends.dot
>  
> -	for pkg in $(opkg-cl -f ${IMAGE_ROOTFS}/etc/opkg -o ${IMAGE_ROOTFS} list_installed | awk '{print $1}') ; do 
> -		opkg-cl -f ${IMAGE_ROOTFS}/etc/opkg -o ${IMAGE_ROOTFS} info $pkg | awk '/Package/ {printf $2"_"} /Version/ {printf $2"_"} /Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt
> +	for pkg in $(opkg-cl ${IPKG_ARGS} list_installed | awk '{print $1}') ; do 
> +		opkg-cl ${IPKG_ARGS} info $pkg | awk '/Package/ {printf $2"_"} /Version/ {printf $2"_"} /Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt
>  
> -    		for depends in $(opkg-cl -f ${IMAGE_ROOTFS}/etc/opkg -o  ${IMAGE_ROOTFS} info $pkg | grep Depends) ; do 
> +    		for depends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep Depends) ; do 
>          		echo "$pkg OPP $depends;" | grep -v "(" | grep -v ")" | grep -v Depends | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
>      		done
>      		
> -		for recommends in $(opkg-cl -f ${IMAGE_ROOTFS}/etc/opkg -o ${IMAGE_ROOTFS} info $pkg | grep Recom) ; do
> +		for recommends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep Recom) ; do
>          		echo "$pkg OPP $recommends [style=dotted];" | grep -v "(" | grep -v ")" | grep -v Recom | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
>      		done
>  	done
>  
>  	echo "}" >>  ${TESTLAB_DIR}/depends.dot
> +	rm -rf ${IPKG_TMP_DIR}
>  	
>  	grep -v kernel_2 ${TESTLAB_DIR}/depends.dot | grep -v kernel_image > ${TESTLAB_DIR}/depends-nokernel.dot
>  	grep -v libc6 ${TESTLAB_DIR}/depends-nokernel.dot | grep -v libgcc > ${TESTLAB_DIR}/depends-nokernel-nolibc.dot
> -- 
> 1.7.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


