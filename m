Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HPcl9-0000SC-7h
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2007 11:55:39 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 709711F5FBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2007 05:55:38 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by out1.internal (MEProxy); Fri, 09 Mar 2007 05:55:38 -0500
X-Sasl-enc: JJLhrtXiJiKlKD1AMcRT285nFBsOSHSDsVMJCwfqCTIJ 1173437738
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 0BACC1109F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2007 05:55:37 -0500 (EST)
Message-ID: <45F13D02.9090402@whitby.id.au>
Date: Fri, 09 Mar 2007 21:24:58 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45E77A73.5020800@protium.com>	<45E7F2C4.9030300@dominion.kabel.utwente.nl>
	<1172949738.5942.57.camel@localhost.localdomain>
In-Reply-To: <1172949738.5942.57.camel@localhost.localdomain>
Subject: [RFC] bogofeed creation
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
X-List-Received-Date: Fri, 09 Mar 2007 10:55:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

You all know what this is about, so I won't bother repeating the
arguments for or against.

Here is a proposed method of bogofeed creation.

> ============================================================
> --- packages/meta/package-index.bb      4f33564e2d11f46b7975676e5901b225190d4920
> +++ packages/meta/package-index.bb      bd6e82e439382919a03c936ef326e8de3149c27d
> @@ -27,6 +27,28 @@ do_build() {
>  do_build[dirs] = "${DEPLOY_DIR_IPK}"
>  do_build() {
>         set -ex
> +
>         rootfs_ipk_do_indexes
> +
> +       if [ "${DEPLOY_BUILD_BOGOFEED}" = "1" ]; then
> +
> +               rm -rf ${DEPLOY_DIR_IPK}/bogofeed
> +               mkdir ${DEPLOY_DIR_IPK}/bogofeed
> +
> +               for d in ${PACKAGE_ARCHS} ; do
> +                       if [ -e ${DEPLOY_DIR_IPK}/$d ] ; then
> +                               rm -rf ${DEPLOY_DIR_IPK}/$d/morgue
> +                               find ${DEPLOY_DIR_IPK}/$d -type f -name '*.ipk' \
> +                                       -exec cp '{}' ${DEPLOY_DIR_IPK}/bogofeed/ \;
> +                       fi
> +               done
> +
> +               touch ${DEPLOY_DIR_IPK}/bogofeed/Packages
> +               ipkg-make-index -r ${DEPLOY_DIR_IPK}/bogofeed/Packages \
> +                       -p ${DEPLOY_DIR_IPK}/bogofeed/Packages \
> +                       -l ${DEPLOY_DIR_IPK}/bogofeed/Packages.filelist \
> +                       -m ${DEPLOY_DIR_IPK}/bogofeed
> +       fi
> +
>         set +ex
>  }

Constructive comments welcome.  Other remarks to /dev/null please.

-- Rod


