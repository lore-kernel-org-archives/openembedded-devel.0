Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 34BF96DF3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2013 16:04:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Dec 2013 08:03:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,858,1378882800"; d="scan'208";a="449255876"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.196])
	by orsmga002.jf.intel.com with ESMTP; 09 Dec 2013 08:03:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Date: Mon, 09 Dec 2013 16:03:49 +0000
Message-ID: <35556909.VfM2a6CS5T@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <l84o5c$go8$1@ger.gmane.org>
References: <1386599847-32823-1-git-send-email-kirgene@gmail.com>
	<l84o5c$go8$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] udisks: updated to v2.1.1.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Dec 2013 16:04:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 09 December 2013 16:38:33 Koen Kooi wrote:
> Yevhen Kyriukha schreef op 09-12-13 15:37:
> > One patch was removed because changes are already exist in upstream
> > version. Added patch to turn libatasmart, polkit, acl and
> > libsystemd-login into optional dependencies.
> > 
> > Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com> ---
> > 
> > +DESCRIPTION = "A storage daemon that implements well-defined D-Bus
> > interfaces that can be used to query and manipulate storage devices."
> > +LICENSE = "GPLv2+" +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43" + +DEPENDS = "udev
> > dbus-glib glib-2.0" + +DEPENDS += "${@base_contains('DISTRO_FEATURES',
> > 'systemd', 'systemd', '', d)}" + +SRC_URI =
> > "http://udisks.freedesktop.org/releases/${P}.tar.bz2 \ +
> > file://optional-depends.patch" + +SRC_URI[md5sum] =
> > "80e03f312542b800cf3162254b202725" +SRC_URI[sha256sum] =
> > "013b09ff38aa256b89c01525771f4565cb088724d5c8c79b32e9f811e88086fb" +
> > +inherit autotools systemd + +PACKAGECONFIG[atasmart] =
> > "--enable-libatasmart,--disable-libatasmart,libatasmart"
> > +PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit"
> > +PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,libacl"
> > +PACKAGECONFIG[systemd-login] =
> > "--enable-libsystemd-login,--disable-libsystemd-login,systemd"
> 
> This is missing a default PACKAGECONFIG assignment to enable all that to
> have feature parity with the 1.x version.

Also, please use the -M option to git-send-email so that it's clear as to what 
has changed.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

