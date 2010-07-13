Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OYYaN-0007gy-9b
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 08:03:20 +0200
Received: by bwz10 with SMTP id 10so3457043bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 22:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=Crzf6iP9F7sKMATtmc0fbQlhvwtj5ZvBqCGkpuUGnCw=;
	b=Um2QMCrmtaSbiHvv9LdQTJHHcKbkUxodTjV52pVMHNPLXeOzFZuY6wV34ASTvwoETj
	9KD4aBdjhKoqzveGcLQIqTlVM3mL3QVj5OfcxCkr3hsjeyxgaWLBFrP9eyo/XznH7tT4
	0vHc6pziaRb7+iJQB0Op2iNeAMnc9T8TxFJ8w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=Gz+ZQqNqBT8pFFQwa3hqxhtRo+JLV7HKz9gM0YBuSgM5I1e2xl5N8RiTbjkcNF4uC+
	FTXB8X7+pgLLmZ8VX9zGWwvNH3w+thXmnVSodtSypcXLrrKCPYxXh9BGjRjhJ+5dSLSN
	1z1vi23TaE+3eHPT7sXeZ4srDTYeE9enk54NM=
Received: by 10.204.56.84 with SMTP id x20mr1338793bkg.68.1279000704215;
	Mon, 12 Jul 2010 22:58:24 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id bq20sm22108291bkb.4.2010.07.12.22.58.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 12 Jul 2010 22:58:23 -0700 (PDT)
Date: Tue, 13 Jul 2010 07:57:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100713055751.GE15231@jama>
References: <4C2AC77A.70102@gmail.com> <4C2ACDE8.7080801@gmail.com>
	<AANLkTimjZRbz8vPEG4xJzzjuebgHitB3NdbqyCywWNdg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimjZRbz8vPEG4xJzzjuebgHitB3NdbqyCywWNdg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] opkg recipe overhaul - removal of opkg-nogpg and opkg-nogpg-nocurl.
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
X-List-Received-Date: Tue, 13 Jul 2010 06:03:20 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jul 13, 2010 at 02:46:09PM +0930, Graham Gower wrote:
> Bump.

Seems OK for SHR (we don't really need curl or gpg).

> On 30 June 2010 14:24, Graham Gower <graham.gower@gmail.com> wrote:
> > None of the distros in OE appear to want/need gpg or curl support in opkg;
> > so have opkg.inc remove them by default. This diff makes things more consistent
> > across all distros/tasks/images.
> >
> > The slugos recipe is kept intact and further divided from the more modern
> > recipes. The opkg-native recipe is the sane-srcrev version even when building
> > slugos, which should allow for changes to opkg related bbclasses without
> > breaking the slugos build.
> >
> > Build tested for qemumipsel/minimal-image and nslu2/slugos-image.
> > minimal-image builds 10% quicker in my setup and is 1mb smaller.
> > ---
> >
> > v2:
> >  A stray missing double quote makes the last patch a no go.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


