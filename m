Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PfroE-0006kS-3c
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 11:32:06 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AucFADCeN01bdWOb/2dsb2JhbACWNo8OvhWFUASQTw
X-IronPort-AV: E=Sophos;i="4.60,350,1291590000"; d="scan'208";a="719757682"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 20 Jan 2011 11:31:26 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1Pfrna-0006g1-ML
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 11:31:26 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1Pfrna-0003V0-HC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 11:31:26 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1Pfrna-0007bb-Ca
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 11:31:26 +0100
Date: Thu, 20 Jan 2011 11:31:26 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110120103126.GB26640@lit.local.igalia.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: native-sdk-image do_rootfs() fails
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
X-List-Received-Date: Thu, 20 Jan 2011 10:32:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm trying to build a native-sdk-image for pandaboard, both with
angstrom-linux-gnueabi and external csl toolchains. Both builds failed in the
same point:

| Configuring sysvinit.
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-sdk-native:
|  * 	virtual-libc-dev *
|  * opkg_install_cmd: Cannot install package task-sdk-native.
|  * resolve_conffiles: Existing conffile /media/DISK/angstrom-setup-scripts/build/tmp-angstrom_2008_1/rootfs/native-sdk-image/etc/device_table is different from the conffile in the new package. The new conffile will be placed at /media/DISK/angstrom-setup-scripts/build/tmp-angstrom_2008_1/rootfs/native-sdk-image/etc/device_table-opkg.
| ERROR: Function do_rootfs failed

I don't know how to deal with this issue. Any advice?

vmjl


