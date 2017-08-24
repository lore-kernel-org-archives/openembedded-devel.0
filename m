Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2987177D01
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 01:28:54 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id w27so1531111pge.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 18:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=7XsciF/YgQJo2VEOoHRfaPNKJVxiOPLXWNSWf6bfK04=;
	b=sEosztqPnGmYAv43ScevaTqteoW00nunNjCp9klJFr1Ayfs/Ns5AAJwgy4r2t2qsHC
	/GL8usUYlYKBRpsy4KubG0yMGhzasm/Wxlf9nm8hBHvj5azo8CIc8Bh0xZUlt+AnUr0c
	lLERwj9T9pz17FwwdDhSrhe+WJVQSEcHypIJQBFb0+nUzeXv3XOeftEmXpvWEZsmd4yR
	oBDG2bhAM41/fUDMrXAtR5fQgR05WFCPUgjO03kdqmo0QlKufm4jc9KCnxQ7jxVBa/lr
	TjwWGOzgFSdLTCIFRKC5cbXd4ivffVTIqzygIOMUiS/K5b9jJK3007EfIU1MZTRJP4dq
	BQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=7XsciF/YgQJo2VEOoHRfaPNKJVxiOPLXWNSWf6bfK04=;
	b=jFTAja6vM3XJY69AB+OiN4ZZQeQpK34qjljAeK5S6bR0AnR+aH4Py2xk5dbLd2IM6E
	QHciQSHa34GWNdoodIBg+fr/WJozivxXvhhIsGwUXGH7FdxZuQrZLH/s0ZDw2/e0DrpM
	bqgaE+OFrN2H8QiWTfCvDt7gVXcC0a+2uwkK7Y2aHUEds73o6puX8wAG6i7VneMflJbs
	deC4d3h7iU8JtFR3/6+rkHqwzVHC+jPe0uDMK0wMj+E0KU5MtaUCgiKkeYpZsF4x180F
	aNvmQtdPNsuzqRI/EIX4rlrCoW2MPMC1F5N1cAjfkP+OeeE7IxbXQ2Wu2oGOH9vLMuQF
	TzeA==
X-Gm-Message-State: AHYfb5hIIHRITS/yn83xTjpllAKJAD1BFmrF5Y4QcB1ZyhoNFE2hpzMS
	egaM1VW2w8CKp7emfuW1OiIP+5FSgA==
X-Received: by 10.98.152.155 with SMTP id d27mr4671382pfk.245.1503538136505;
	Wed, 23 Aug 2017 18:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20170822142141.9783-1-Martin.Jansa@gmail.com>
	<0b21ced3-5976-da19-7329-a3f7945d16f6@windriver.com>
In-Reply-To: <0b21ced3-5976-da19-7329-a3f7945d16f6@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Aug 2017 01:28:46 +0000
Message-ID: <CAMKF1spviOb3g-EMMWec1SfKQ74AGeo6E7=RbPaUYB-PFBWvJQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-systemd][PATCH] meta-systemd: remove this now pretty empty layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Aug 2017 01:28:55 -0000
Content-Type: text/plain; charset="UTF-8"

Indeed it's great I have been testing master-next and nothing is surprising
this far

On Wed, Aug 23, 2017 at 4:54 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2017-08-22 10:21 AM, Martin Jansa wrote:
> > * the upgrade path from original meta-systemd still isn't provided
> >    by oe-core, but hopefully there are only a few remaining users
> >    of this layer.
> > * some BSPs probably still use systemd-machine-units, but they should
> >    push it to oe-core instead of depending on this layer just for this
> >    one recipe
>
> Martin,
>
> Since you aren't getting much feedback on these removals,
> I thought I'd say that this is excellent, albeit brutal, clean-up!
>
> I guess it's good news that no one is objecting.
>
> ../Randy
>
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta-systemd/README                                | 26
> ------------------
> >   meta-systemd/conf/layer.conf                       | 32
> ----------------------
> >   .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |  4 ---
> >   .../recipes-connectivity/avahi/avahi_%.bbappend    |  4 ---
> >   .../connman/connman_%.bbappend                     |  3 --
> >   .../dhcp/dhcp/dhclient.service                     | 13 ---------
> >   .../recipes-connectivity/dhcp/dhcp_%.bbappend      | 24
> ----------------
> >   .../recipes-connectivity/ofono/ofono_%.bbappend    |  5 ----
> >   .../openssh/openssh_%.bbappend                     |  3 --
> >   .../wpa-supplicant/wpa-supplicant_%.bbappend       |  3 --
> >   .../recipes-core/busybox/busybox_%.bbappend        |  3 --
> >   .../oe-core/recipes-core/dbus/dbus_%.bbappend      |  3 --
> >   .../recipes-core/dropbear/dropbear_%.bbappend      |  4 ---
> >   .../recipes-core/systemd/systemd_%.bbappend        |  3 --
> >   .../recipes-core/util-linux/util-linux_%.bbappend  |  3 --
> >   .../oe-core/recipes-extended/at/at_%.bbappend      |  4 ---
> >   .../recipes-extended/cronie/cronie_%.bbappend      |  3 --
> >   .../recipes-extended/lighttpd/lighttpd_%.bbappend  |  3 --
> >   .../recipes-extended/rpcbind/rpcbind_%.bbappend    |  3 --
> >   .../systemd/systemd-machine-units_1.0.bb           | 13 ---------
> >   20 files changed, 159 deletions(-)
> >   delete mode 100644 meta-systemd/README
> >   delete mode 100644 meta-systemd/conf/layer.conf
> >   delete mode 100644
> meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-connectivity/avahi/avahi_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-connectivity/connman/connman_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service
> >   delete mode 100644
> meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-connectivity/ofono/ofono_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-connectivity/openssh/openssh_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-core/busybox/busybox_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-core/dbus/dbus_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-core/dropbear/dropbear_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-core/systemd/systemd_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-core/util-linux/util-linux_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-extended/at/at_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-extended/cronie/cronie_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_%.bbappend
> >   delete mode 100644
> meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_%.bbappend
> >   delete mode 100644 meta-systemd/recipes-core/systemd/
> systemd-machine-units_1.0.bb
> >
> ...
>
> --
> # Randy MacLeod.  WR Linux
> # Wind River an Intel Company
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

