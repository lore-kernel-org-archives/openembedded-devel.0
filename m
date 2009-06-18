Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MHDv4-0003Zw-Ux
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 11:28:32 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MHDkt-0003GF-0H
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 10:17:59 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MHDks-00061q-QS
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 10:17:58 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1245267720-13612-2-git-send-email-khimov@altell.ru>
References: <1245267720-13612-1-git-send-email-khimov@altell.ru>
	<1245267720-13612-2-git-send-email-khimov@altell.ru>
Date: Thu, 18 Jun 2009 10:17:58 +0100
Message-Id: <1245316678.25995.9.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Thu, 18 Jun 2009 09:28:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 23:41 +0400, Roman I Khimov wrote:
> +			PACK_COUNT=`ls -t ${DEPLOY_DIR_IPK}/$ipk_path/ | head -n 4 | grep Packages | wc -l`
> +			if [ -e ${DEPLOY_DIR_IPK}/$ipk_path/ -a "$PACK_COUNT" != "4" ] ; then 

This test seems a little bit fragile.  How about something like:

NEWEST_PACKAGE=`ls -t ${DEPLOY_DIR_IPK}/$ipk_path/*.ipk | head -n 1`
if [ -n "$NEWEST_PACKAGE" ] && [ "$NEWEST_PACKAGE" -nt
"${DEPLOY_DIR_IPK}/$ipk_path/Packages" ]; then
 ...

instead?  Or, perhaps even better, teach ipkg-make-index to do this
checking for itself and just return immediately if there's no work for
it to do.

p.




