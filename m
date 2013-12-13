Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF81610D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 14:46:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Dec 2013 06:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,479,1384329600"; d="scan'208";a="451864539"
Received: from junemccl-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.17])
	by orsmga002.jf.intel.com with ESMTP; 13 Dec 2013 06:45:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <joe@deserted.net>
Date: Fri, 13 Dec 2013 14:45:41 +0000
Message-ID: <1435450.p1CJVYi6V9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20131213143433.GB4683@deserted.net>
References: <1386874857-8596-1-git-send-email-joe@deserted.net>
	<27197377.bBKUcS7Jmv@helios> <20131213143433.GB4683@deserted.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] vsftpd: install volatiles file based on init system
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
X-List-Received-Date: Fri, 13 Dec 2013 14:46:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 13 December 2013 09:34:36 Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH] vsftpd: install volatiles file based on init system] On 13.12.13 (Fri 10:33) Paul Eggleton wrote:
> > I think there might be a problem with this: the DISTRO_FEATURES options
> > aren't mutually exclusive - both can be enabled at the same time (usually
> > where you want sysvinit for some rescue/initramfs image and systemd for
> > the main image).
> 
> That's a good point and I probably should've at least made mention of it
> in my email.  I'd thought about it (thought I try to only have either
> sysvinit or systemd enabled in a configuration at a time, multiple init
> systems running concurrently make my teeth itch) but I had thought that
> in this case vsftpd would only be relying on one of them (preferring
> systemd if available) to create the volatiles.  Since I try very hard
> not to be in the scenario where I include both, though, I could be
> overlooking a case here.  Do you think I should be doing something more
> like this:
> 
> 62    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> 63        install -d ${D}/${sysconfdir}/tmpfiles.d
> 64        install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/tmpfiles.d/99_vsftpd
> 65    fi
> 66    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> 67        install -d ${D}/${sysconfdir}/default/volatiles
> 68        install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/default/volatiles/99_vsftpd
> 69    fi

Assuming it's OK to have both of these when both options are on (I haven't
tried it myself), that would seem to be the right thing to do.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

