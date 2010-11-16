Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PITLa-0004Ht-5D
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 22:45:51 +0100
Received: by iwn38 with SMTP id 38so2620iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 13:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=WYgcVhAjhiAE7r3d1Iq6bvetB8W7H3Q1VPOdLxAb1Ws=;
	b=s+/RQS4IsFxp2XcpS5gL0yTN+VW7cSMAaMXXNm6zfXw6fJPO8RVKgTfxcvvp6qzTZa
	GtBfZHJQQtGUe3b0jrO08YZ/6rmFU2UEWgLNlFtzMTJUQJ7fkdTyBgkeH6IP5yj+oaSJ
	oPzDzN5KSzLGws0ezblIIGZznnOZhYg8PGNww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=nGGzziLTlYfLzzp9Tum/dhX/ejY+QtHXX7n9ggFlCNUQcCKX6BR+HdWXmtV2+qn+tT
	ZPzpe16Zv3RxDxYMbmsvXAUTqFcQhuD5U0bFce8ivNlU7XnVNFzqeBI9vBkSR3AAgjdQ
	1m/6zx8Z7Nq8hWNMNd6ULC1LTNJ+SzdM/Lh/c=
MIME-Version: 1.0
Received: by 10.231.17.203 with SMTP id t11mr6268837iba.1.1289943885138; Tue,
	16 Nov 2010 13:44:45 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Tue, 16 Nov 2010 13:44:45 -0800 (PST)
Date: Tue, 16 Nov 2010 22:44:45 +0100
Message-ID: <AANLkTimAqPZaYRHA9xy0pOVhpdwyFKq=LWuuMZRBq0N=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: PREFERRED_PROVIDER issue/question
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
X-List-Received-Date: Tue, 16 Nov 2010 21:45:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

When I am building mythtv-plugins for distro minimal I get:

NOTE: oestats: build 103602
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for runtime libmysqlclient
(mysql5, mysql)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libmysqlclient
NOTE: multiple providers are available for runtime
module-init-tools-depmod (module-init-tools, module-init-tools-cross)
NOTE: consider defining a PREFERRED_PROVIDER entry to match
module-init-tools-depmod
NOTE: Preparing runqueue

I tried to fix this by adding in my local.conf:

PREFERRED_PROVIDER_libmysqlclient_local = "mysql5"
PREFERRED_PROVIDER_module-init-tools-depmod_local = "module-init-tools"

However this did not help.

I've been focussing on getting the mysqlclient warning gone and did a
bitbake -v -v -v -D -D -D and got this:

DEBUG: sorted providers for mysql5-client are:
['/home/frans/oe/openembedded/recipes/mysql/mysql5_5.1.40.bb']
DEBUG: providers for libmysqlclient are: ['mysql5', 'mysql']
NOTE: checking PREFERRED_PROVIDER_mysql5
NOTE: checking PREFERRED_PROVIDER_mysql5-5.1.40
NOTE: checking PREFERRED_PROVIDER_mysql5-5.1.40-r5
NOTE: checking PREFERRED_PROVIDER_mysql
NOTE: checking PREFERRED_PROVIDER_mysql-4.1.22
NOTE: checking PREFERRED_PROVIDER_mysql-4.1.22-r7
DEBUG: sorted providers for libmysqlclient are:
['/home/frans/oe/openembedded/recipes/mysql/mysql5_5.1.40.bb',
'/home/frans/oe/openembedded/recipes/mysql/mysql_4.1.22.bb']


[...]

NOTE: multiple providers are available for runtime libmysqlclient
(mysql5, mysql)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libmysqlclient

So it seems to check PREFERRED_PROVIDER_mysql5 not (what I had
expected PREFERRED_PROVIDER_libmysqlclient)

Questions:
Is this a bug somewhere?
What should I do to pin my libmysqlclient?
Should we perhaps nuke the myql package ?

Your opinion is appreciated!
Frans


