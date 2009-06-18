Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MHFT2-0006Ui-4t
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 13:07:40 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MHFIp-0005X1-MV
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 11:57:07 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MHFIp-0006np-Ea
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 11:57:07 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1245319914-18496-1-git-send-email-khimov@altell.ru>
References: <1245316678.25995.9.camel@mill.internal.reciva.com>
	<1245319914-18496-1-git-send-email-khimov@altell.ru>
Date: Thu, 18 Jun 2009 11:57:06 +0100
Message-Id: <1245322626.25995.16.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH 2/3] package_ipk: optimize do_package_update_index_ipk
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
X-List-Received-Date: Thu, 18 Jun 2009 11:07:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-06-18 at 14:11 +0400, Roman I Khimov wrote:
> +		for ipk_path in $arch ${BUILD_ARCH}-$arch-sdk ${SDK_SYS}-sdk-$arch; do
> +			NEWEST_PACKAGE=`ls -t ${DEPLOY_DIR_IPK}/$ipk_path/*.ipk | head -n 1`
> +			if [ -n "$NEWEST_PACKAGE" ] && [ "$NEWEST_PACKAGE" -nt "${DEPLOY_DIR_IPK}/$ipk_path/Packages" ]; then
> +				touch ${DEPLOY_DIR_IPK}/$ipk_path/Packages
> +				ipkg-make-index -r ${DEPLOY_DIR_IPK}/$ipk_path/Packages -p ${DEPLOY_DIR_IPK}/$ipk_path/Packages -l ${DEPLOY_DIR_IPK}/$ipk_path/Packages.filelist -m ${DEPLOY_DIR_IPK}/$ipk_path/
> +			fi
> +		done

Thanks for the patch.  This looks good to me.

p.




