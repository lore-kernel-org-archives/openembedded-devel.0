Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NGU3Z-0004BS-Tj
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 10:02:32 +0100
Received: by bwz9 with SMTP id 9so1709576bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 01:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=F4Cy3pjM20uqj2avhBeMcgf7jx7m9qa53RWvGLLQhqw=;
	b=fwHSCyUTiBgNKCYb8aE16uaCM9+xPaF/gZiprqCttytpbpbxjbZzgb8KOGHtix/f48
	JQ+LNDzQXxmbgY+uX3KGbdFTIwbgLsu6JMTaJtwa/Hm0bgfN0dZ7Y2ITSDsroo4ndjzj
	l0aJTFR6DgqZcqr1dgKKPr9C0yguLKTOtmRTI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=hDfMqWtuJBN3Xkd5azJlNVmsHDF4ckRG/P8mO54W6wUWOSNAohz61stR0KmZ3JDrCX
	h5Ew7mz0ZlNPbQGgwxjw5zMF45qqDnp53LdfXKpO4i8MUZrNl0Y2d7WEYGKhjJbHQyUE
	EqtpeZDW/fOEnK7cdJVRFbjsbY2qb8Yb6GRi4=
Received: by 10.204.154.142 with SMTP id o14mr2883714bkw.125.1259917253070;
	Fri, 04 Dec 2009 01:00:53 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm1008528fxm.14.2009.12.04.01.00.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Dec 2009 01:00:51 -0800 (PST)
Date: Fri, 4 Dec 2009 10:00:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091204090048.GA3233@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] sane-providers.inc with default providers for all distributions
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
X-List-Received-Date: Fri, 04 Dec 2009 09:02:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would like to create new file conf/distro/include/sane-providers.inc
where we could store all default providers.

Every distro should include this file and probably should drop own
PREFERRED_PROVIDERS if preferring same provider as sane-providers.inc.

I already prepared something, but not sure if its worth finishing. So I
need your opinion.

With this file it would be easier to add PROVIDES to new recipe while
forcing old provider in sane-providers for all other distributions
(something like what happen with fso-apm in shr).

Maybe it will be nice to have all options in comment above the default
provider.

I would use weak assignments in this file, but it means that this file
needs to be included after all distro prefered providers, because distro
config use weak assignments too (and also other includes like eglibc.inc).

As opkg have patch from cworth now I would add
PROVIDERS=update-alternatives to opkg and change preferred u-a provider
to opkg (removing 2 u-a scripts on target).

This process seems a bit error prone to me, so I can prepare patch for
shr and angstrom where I can test with rebuild that "nothing" changed.
For other distributions it would be nice to include sane-providers by
distro maintainers.

Can I go ahead and send patches for this or do you see some dead-end as
with SRCPV? :).

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


