Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pi20W-0002Ht-WA
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 10:49:45 +0100
Received: by iyj18 with SMTP id 18so203847iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 01:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=Sm33llHHfRghtHSdWerff0PJ05u4Aljnwma4qlU6DjM=;
	b=nq0DxKSSbP4T3XIYhxwrXGfOteYTNmczFENgqZGXd89EvTVBlsPpSWmfr/BkZPTcsj
	cyyK4316EeYL2ajMojq9OW3pRSyEZEf6sKWxbpJJw+vVeihRBfTP7hLPNuB7kdIEWPCh
	8l3VQachrjrjaWa+M2B1Vw8i1G8aFrLkK1obs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=BaB7d/LoVQllWduRR89ggfYGRr2XI+4g8N9HKdc3loD6x8eZN+0jKYtOGZ7rfP8n3X
	ZBjKpCef214KYdLDWqSqTNCwYwCqKYpaq5i57ZW4zfdw/Jkqs99ZZNVdhGcUSeI6b5rb
	uJQG0y4/UnC0e3oLseD0HPrxfp9fuTEVefp4w=
MIME-Version: 1.0
Received: by 10.231.19.201 with SMTP id c9mr7896762ibb.183.1296035334216; Wed,
	26 Jan 2011 01:48:54 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Wed, 26 Jan 2011 01:48:54 -0800 (PST)
Date: Wed, 26 Jan 2011 10:48:54 +0100
Message-ID: <AANLkTinEdQ4zqc4vPZpRAh0LebKQJbrAjOmfWZY0HUYd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: staging_packager failing, anyone any idea
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
X-List-Received-Date: Wed, 26 Jan 2011 09:49:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Kicked off a build on our autobuilder (git head, minimal, 64bit ubuntu
host) and I get the following error (and similar ones at other
places).
At least some of the failing recipes did build for me yesterday at
home (32 bit opensuse host)

NOTE: package pixman-0.21.4-r5.0: task do_package_stage: Started
ERROR: Logfile of failure stored in: /dev/null
Log data follows:
NOTE: package pixman-0.21.4-r5.0: task staging_packager: Failed
ERROR: Function 'staging_packager' failed (see /dev/null for further
information)
ERROR: Task 7024
(/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/xorg-lib/pixman_0.21.4.bb,
do_package_stage) failed with exit code '1'

Anyone an idea on what is wrong?
Frans


