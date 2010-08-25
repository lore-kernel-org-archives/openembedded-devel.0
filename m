Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OoN9t-0001mh-QA
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 23:05:30 +0200
Received: by gxk2 with SMTP id 2so386078gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 14:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=lMO9XqUDXps4mvaYoGT/xIWiqYoQG7Kj2q7C4UiOv4g=;
	b=gzxCjohg5a4n3G1XZBSkCLynx2tcZr09EePoRyL1aeLa870FAZDE0pePB7naXSKPB2
	KtwEKGWdZtJSrKUMre1kYvVWPRHqysyYRk7ChK+CZLbb6Xft1lUd3eaMEHwdfw+9rFSP
	kdu3kQfEio1X9OeHr2bWgU1XuYIUhdFeBep88=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=fuWsCwVS43sQl5TvPi0R5Xj9Gdt1kdJ45wwln2NjdoK1NhQ5Y7dxZCOaIE8Ilm/Hkp
	vW7iMUm29pq+YNFeFxQ+YZzraaBPUz7haWkWGa/m62AitBy04tcSLH9wZCC2/+YeFt1F
	679owKAvxBhIIYvqnko//guLPAVs/+QoxSiIs=
MIME-Version: 1.0
Received: by 10.151.63.19 with SMTP id q19mr9273793ybk.292.1282770291226; Wed,
	25 Aug 2010 14:04:51 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 25 Aug 2010 14:04:51 -0700 (PDT)
Date: Wed, 25 Aug 2010 23:04:51 +0200
Message-ID: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: how to add file to SRC_URI for target only
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
X-List-Received-Date: Wed, 25 Aug 2010 21:05:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Is it possible to add a file to SRC_URI for target only in a combined
native/target recipe?

Of course I know I can fully redefine SRC_URI, but I feel that is less
desirable.
The issue is that the target recipe needs an additional patch that the
native recipe cannot use.

Or do we need to introduce an _target suffix?

Guess an intermediate variable also could do the trick.
E.g.

PATCH = "xx.patch"
PATCH_virtclass-native = ""
SRC_URI = "source and files and patches ${PATCH}"

not really ideal either.

I saw some other places where we need to tweak similarly with DEPENDS
e.g.
DEPENDS = "x"
DEPENDS_virtclass-natvie = ""

guess here _target could help too.

Any ideas/comments/patches/... ?

Frans


