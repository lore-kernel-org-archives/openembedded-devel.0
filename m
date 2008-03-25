Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1JdxcL-0000jQ-DZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Mar 2008 02:06:21 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id B2207E2701
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2008 21:06:20 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Mon, 24 Mar 2008 21:06:20 -0400
X-Sasl-enc: 35Ge2izwN5osQMU7GKYiZp545pGdGnxYL3OimbjxcCIP 1206407180
Received: from [192.168.124.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id B868EDB6D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2008 21:06:19 -0400 (EDT)
Message-ID: <47E84FD1.3030401@whitby.id.au>
Date: Tue, 25 Mar 2008 11:35:21 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 0.95.6
Subject: Fix for ipkg->opkg transition breakage
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
X-List-Received-Date: Tue, 25 Mar 2008 01:06:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I have added the following line to rootfs_ipk.bbclass to allow distros 
that have not transitioned to using opkg in the target rootfs (as 
opposed to opkg being used by the build system to create the rootfs) to 
continue working as they did before with only an additional symlink's 
worth of space used in the rootfs and no change to the user experience.

============================================================
--- classes/rootfs_ipk.bbclass  c319cef6215ceb9e757092d0eb6ea8303cbaacad
+++ classes/rootfs_ipk.bbclass  f2e739e3ef76b513c9eded6b230ecdd3e8f71886
@@ -60,6 +60,9 @@ fakeroot rootfs_ipk_do_rootfs () {

         rm -f ${IMAGE_ROOTFS}${libdir}/opkg/lists/*

+       # Keep this line until package manager selection is implemented
+       ln -s opkg ${IMAGE_ROOTFS}${sysconfdir}/ipkg
+
         ${ROOTFS_POSTPROCESS_COMMAND}

         log_check rootfs

-- Rod


