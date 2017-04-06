Return-Path: <oliver.graute@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 33DF877A87
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 14:41:06 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id t20so65659878wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZU5KOaoW7MxBQ5iNOOtYRkOFm6GDQcQp8VSiyDtKbCk=;
	b=TysgVL8WSQTu8vl4DaU73LKtVSQvFFPl/hUSk1z/m2qGmyPle6uBfMmjfhgO7oIuhX
	/vKmjFgYgiJJ7oZNFOEZKFr8trZSqZATgFiQPKXxfTGpvRt1E1xKOd3UCQYkzk4K/Zwm
	TBVp1E20sAyTjhB0xUx2XBVtYvHZYiGN9pIF1SVpt8oSmXaHMYqfF0hTFzZ9QNBSBUSH
	+ijdSwJZeJYbP4qyq9CESGtnI19oA89m0R85S1FnAEnkiinQ/+LbWnJ0hXW+gMOzZ3Wg
	TdsBPeZCLYTfu0B0PPuHqIkGAxuRnKfROLqhtrTxnJggldMxJn5G86o95pid6ubFhwmQ
	yaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZU5KOaoW7MxBQ5iNOOtYRkOFm6GDQcQp8VSiyDtKbCk=;
	b=F21DIHXgerHodSliYTmRKFpE+ROZw3/V4yE6tr9O/Ap94iW8FgfRT8d3Xp2lmJ39wS
	ZWbKpr6wkYA/zrPN9WiyN6ew9IFKOQPRWBXS/aZ6Q8Jkfk+fRsqCH+oF7kAFpcL6nsNb
	Fi50DPlOkDGHxtFyzwIwRB0DXA/5QBrxXT0bGpBw7FjenVO/fIEUN53QjZjJyKPkfOSi
	YKr592jc581jG7qD0m8CEgKpHnJdWrlXJjaWiz2xmiTuiaD6SHJwOoM45M539MG3NqjV
	EvWSoaS/wR6vTo5N4IgSYYh7ynURPvgbiApRqjhSrcJ4Z91J9y7TOdHTxNULb4pwjmwL
	uuYw==
X-Gm-Message-State: AFeK/H3iGrdlyNUo1fLjvXo2lMabREB4Wq5CN6DwxHQ0kGbs5gOslgpJg3iw6Zl2a5BDow==
X-Received: by 10.223.173.23 with SMTP id p23mr3668460wrc.116.1491489667144;
	Thu, 06 Apr 2017 07:41:07 -0700 (PDT)
Received: from localhost (x55b0f93f.dyn.telefonica.de. [85.176.249.63])
	by smtp.gmail.com with ESMTPSA id
	b66sm2401451wrd.29.2017.04.06.07.41.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 06 Apr 2017 07:41:06 -0700 (PDT)
Date: Thu, 6 Apr 2017 16:17:30 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170406141730.GB17864@graute-opti>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20170405134010.GA18688@graute-opti>
	<CAMKF1sq7vX1rwFL062BB_8UXeCxzQcdyr=PsZsUvEsfwqs-QjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq7vX1rwFL062BB_8UXeCxzQcdyr=PsZsUvEsfwqs-QjA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] [PATCH] unbound: this patch adds unbound to meta-networking
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
X-List-Received-Date: Thu, 06 Apr 2017 14:41:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 05/04/17, Khem Raj wrote:
> On Wed, Apr 5, 2017 at 6:40 AM, Oliver Graute <oliver.graute@gmail.com> wrote:
> > +HOMEPAGE = "https://www.unbound.net/"
> > +SECTION = "net"
> > +LICENSE = "BSD"
> 
> Can you see which clause it is ? it will make it more clear

is this BSD-4-Clause?
https://unbound.nlnetlabs.nl/svn/trunk/LICENSE

> > +do_install () {
> > +        install -d ${D}${bindir}
> > +        install -d ${D}${libdir}
> > +        install -d ${D}${sysconfdir}
> > +        install -m 644 -D ${S}/libunbound/unbound.h ${D}${includedir}/unbound.h
> > +        install -m 644 -D ${S}/doc/example.conf.in ${D}${sysconfdir}/unbound/unbound.conf
> > +        install -m 644 -D ${S}/contrib/unbound.service.in ${D}${libdir}/systemd/unbound.service
> > +        install -m 755 unbound ${D}${bindir}
> > +        install -m 755 unbound-anchor ${D}${bindir}
> > +        install -m 755 unbound-checkconf ${D}${bindir}
> > +        install -m 755 unbound ${D}${bindir}
> > +        install -m 755 unbound-control-setup ${D}${bindir}
> > +        install -m 755 unbound-host ${D}${bindir}
> > +        install -m 755 ${WORKDIR}/build/.libs/libunbound.so* ${D}${libdir}
> > +}
> 
> do this in a do_install_append()

this breaks my packaging. /usr/local/share and /usr/local/lib are not my
desired dirs. I prefer /usr/share and /usr/lib. I also don't need the
man pages. How do I put them into extra packacke?
Some clue to fix this the righty way?

ERROR: QA Issue: unbound: Files/directories were installed but not shipped in any package:
  /usr/local
  /usr/local/share
  /usr/local/lib
  /usr/local/include
  /usr/local/share/man
  /usr/local/share/man/man8
  /usr/local/share/man/man3
  /usr/local/share/man/man5
  /usr/local/share/man/man1
  /usr/local/share/man/man8/unbound-control-setup.8
  /usr/local/share/man/man8/unbound-checkconf.8
  /usr/local/share/man/man8/unbound-control.8
  /usr/local/share/man/man8/unbound-anchor.8
  /usr/local/share/man/man8/unbound.8
  /usr/local/share/man/man3/ub_strerror.3
  /usr/local/share/man/man3/ub_ctx_set_fwd.3
  /usr/local/share/man/man3/ub_wait.3
  /usr/local/share/man/man3/ub_result.3
  /usr/local/share/man/man3/ub_resolve.3
  /usr/local/share/man/man3/ub_ctx_create.3
  /usr/local/share/man/man3/ub_ctx_hosts.3
  /usr/local/share/man/man3/ub_ctx_data_add.3
  /usr/local/share/man/man3/ub_ctx_add_ta.3
  /usr/local/share/man/man3/ub_poll.3
  /usr/local/share/man/man3/ub_ctx_async.3
  /usr/local/share/man/man3/ub_ctx_debugout.3
  /usr/local/share/man/man3/ub_ctx.3
  /usr/local/share/man/man3/ub_resolve_free.3
  /usr/local/share/man/man3/ub_ctx_set_option.3
  /usr/local/share/man/man3/libunbound.3
  /usr/local/share/man/man3/ub_ctx_add_ta_file.3
  /usr/local/share/man/man3/ub_ctx_get_option.3
  /usr/local/share/man/man3/ub_resolve_async.3
  /usr/local/share/man/man3/ub_ctx_zone_remove.3
  /usr/local/share/man/man3/ub_ctx_print_local_zones.3
  /usr/local/share/man/man3/ub_ctx_zone_add.3
  /usr/local/share/man/man3/ub_ctx_resolvconf.3
  /usr/local/share/man/man3/ub_ctx_config.3
  /usr/local/share/man/man3/ub_cancel.3
  /usr/local/share/man/man3/ub_ctx_delete.3
  /usr/local/share/man/man3/ub_ctx_debuglevel.3
  /usr/local/share/man/man3/ub_ctx_data_remove.3
  /usr/local/share/man/man3/ub_fd.3
  /usr/local/share/man/man3/ub_ctx_trustedkeys.3
  /usr/local/share/man/man3/ub_process.3
  /usr/local/share/man/man5/unbound.conf.5
  /usr/local/share/man/man1/unbound-host.1
  /usr/local/lib/libunbound.la
  /usr/local/lib/libunbound.a
  /usr/local/lib/libunbound.so
  /usr/local/lib/libunbound.so.2
  /usr/local/lib/libunbound.so.2.4.4
  /usr/local/lib/.debug
  /usr/local/lib/.debug/libunbound.so.2.4.4
  /usr/local/include/unbound.h
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
unbound: 55 installed and not shipped files. [installed-vs-shipped]


Best regards,

Oliver

