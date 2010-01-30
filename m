Received: from mail-yx0-f180.google.com ([209.85.210.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NbAiQ-0003ZN-2Z
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 11:38:13 +0100
Received: by yxe10 with SMTP id 10so2565996yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 02:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=JqFlLRhfllZo+b4y473dsjoQWtLq9C9EJEjqBE3sIZI=;
	b=QJztYKRUSVgL262tWenhbBqks4z8ShZ9D7+8Of14WpNb16ejkOvKYUU6QM5mGDrsGG
	c4Z9jCQEKIumoAWd40dKqjo14QvEK1eGZL7pY8ywD3O7hCdEnfVe0uzEN3tdC7y8Gd3Z
	7ps3ppwlpADeKTddOB14E9F8kEm08r9bdjf7M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=fvtymd+2hI8557rt5SStYFC7IpoQbBvJu8JSQmWMLyOnaJp5zs4nqALMyIUSBS/7ux
	6+k9c9OiO6lwtIzwk5HhJW6Rc9Jn1MFcC0n3x9pd8Q9n2Iqn5zjgZ0pCeGBiVEJF+x6Q
	Ebwj6QyEUEcV8cGHIKXX6ojwo/92RMyyv/Y9o=
MIME-Version: 1.0
Received: by 10.101.132.14 with SMTP id j14mr2464511ann.58.1264847745239; Sat, 
	30 Jan 2010 02:35:45 -0800 (PST)
Date: Sat, 30 Jan 2010 11:35:45 +0100
Message-ID: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.180
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: {RFC] console-image.bb
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
X-List-Received-Date: Sat, 30 Jan 2010 10:38:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Today I bumped into console-image and noticed the following:

IMAGE_INSTALL = "task-base \
            ${ANGSTROM_EXTRA_INSTALL} \
            ${SPLASH} \
            ${ZZAPSPLASH} \

Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
DISTRO_EXTRA_INSTALL ?
This under the assumption that console-image is a distro independent recipe.

Or, in case this is an angstrom specific recipe shouldn't it be better
named angstrom-console-image ?

your views are appreciated :-)

Frans


