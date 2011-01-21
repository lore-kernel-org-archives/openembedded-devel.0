Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PgEBh-0002JG-Pj
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 11:25:49 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ag4FAELuOE1bdWOb/2dsb2JhbACWSI8Pvl2FUASORIIN
X-IronPort-AV: E=Sophos;i="4.60,357,1291590000"; d="scan'208";a="322425771"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 21 Jan 2011 11:24:54 +0100
Received: from [95.61.238.167] (helo=lit.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PgEAo-0003WY-65
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 11:24:54 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PgEAa-0007ax-HB
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 11:24:40 +0100
Date: Fri, 21 Jan 2011 11:24:40 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110121102440.GB7400@lit.local.igalia.com>
References: <20110120103126.GB26640@lit.local.igalia.com>
	<AANLkTinrGpmXqWx8a4AULZduXpQC57VDA40=Z69wu9Dw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinrGpmXqWx8a4AULZduXpQC57VDA40=Z69wu9Dw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: native-sdk-image do_rootfs() fails
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
X-List-Received-Date: Fri, 21 Jan 2011 10:25:49 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jan 20, 2011 at 07:04:05PM +0300, Yury Bushmelev wrote:
> 2011/1/20 Víctor M. Jáquez L. <vjaquez@igalia.com>:
> > I'm trying to build a native-sdk-image for pandaboard, both with
> > angstrom-linux-gnueabi and external csl toolchains. Both builds failed in the
> > same point:
> >
> > | Configuring sysvinit.
> > | Collected errors:
> > |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-sdk-native:
> > |  *    virtual-libc-dev *
> > |  * opkg_install_cmd: Cannot install package task-sdk-native.
> > |  * resolve_conffiles: Existing conffile /media/DISK/angstrom-setup-scripts/build/tmp-angstrom_2008_1/rootfs/native-sdk-image/etc/device_table is different from the conffile in the new package. The new conffile will be placed at /media/DISK/angstrom-setup-scripts/build/tmp-angstrom_2008_1/rootfs/native-sdk-image/etc/device_table-opkg.
> > | ERROR: Function do_rootfs failed
> >
> > I don't know how to deal with this issue. Any advice?
> 
> I have built native-sdk-image twice (for qemuarm and for qemux86) this
> week w/o problems, but for minimal distro.

I'm trying to build an image for the pandaboard but I faced this same issue: 

http://comments.gmane.org/gmane.comp.handhelds.openembedded/4065

(the linux-omap4 kernel compilation broke because of "Error: selected
processor does not support ARM mode `smc #0'")

So I moved back the binutils version to 2.20.1

vmjl


