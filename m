Received: from [209.85.219.166] (helo=mail-ew0-f166.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LiA39-0006k9-Kt
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 17:15:55 +0100
Received: by ewy10 with SMTP id 10so2821824ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=Esq+sKs0CxkxmSJRv51a/sfbv6umRMi3Lff+ysT3AKU=;
	b=ExnSW+HjhjhctoK7H0TyOAuKzNeMZ0vFi5kYlHO+6IaRlxsIEEX8X/wQN6vjsUNPD5
	HEEjaj4ak4PwFUUuZqMB0Si+eWBbAmoLJQSxbvp+C9c7AcKcYv490Y4bC6bUqo8Fsuqh
	g+e/l27YnO6LLxTEg6N0WCK6Ty/8Mzf6Rntfo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=uzP75CWn7MGC/e1HySRbshiA7ic+uYn8yfbjmhqMAI4rCF6Zl52xqld3cfRD7Thqom
	/vT//3R0t65fEZC5YjTZlH49BlWGuh5T7bxDjoZ+r3IZ0KuJ2mPDD6rt1iDEK79PkLpK
	B5mkHCtxbV8k2sa7QOLswFWjI1xOxcp7iF3hU=
MIME-Version: 1.0
Received: by 10.210.120.7 with SMTP id s7mr1032981ebc.78.1236960933876; Fri, 
	13 Mar 2009 09:15:33 -0700 (PDT)
Date: Fri, 13 Mar 2009 17:15:33 +0100
Message-ID: <ac9c93b10903130915m4b445d3ga007d036d9bd9888@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: bitbake warning on opensuse
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
X-List-Received-Date: Fri, 13 Mar 2009 16:15:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Not sure if this should go here, but if I bake a recipe on opensuse 11.1 I get:

/home/frans/oe/bitbake/lib/bb/COW.py:29: DeprecationWarning: the sets
module is deprecated
  import types, sets

Is there a fix for this (or where should I report this)?
For now I just ignored it.

The same error is also reported for ubuntu 8.04.2 (under vmplayer)

Frans


