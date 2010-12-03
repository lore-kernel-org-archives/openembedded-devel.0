Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1POUuy-0007G8-Bn
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 13:39:16 +0100
Received: by gyd12 with SMTP id 12so4833790gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Dec 2010 04:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=CSutsNsI1zKDkfg5+u16DpDlP94uTq3xe+6B6sCc3lk=;
	b=OxSub5C0mupCGxKeKZG+O7J9ce9jNHEBy3leD0p62i1fW3xsYpiZuhY/hSn9OgecDH
	3j62OWaEaZXJnZjeEPM8GgKN0c9B6a9TbtVg31yPfcr7pDdheb73+RTdxKeLBVUGrcXO
	pCXrImGCJNC0ClSGCfoFHms34GWbn6FvMs0RA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=U7Sh5NqyEnxykyogCvPVuoj0LTiegHXKxJ4ZdMMvkeUe11V/Od/v9N2cwrKesTpT9H
	NKWplN4tc/GtIMCWzDuRGzZ0lBSiG9nkEEwZ2AzrauURlmGickTVlDp8vD86pzLrPWZg
	bDu0NdgXkvYZLjeguSdw/AsTPjRTheY1H/Qkc=
MIME-Version: 1.0
Received: by 10.231.13.203 with SMTP id d11mr1732139iba.157.1291379871642;
	Fri, 03 Dec 2010 04:37:51 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Fri, 3 Dec 2010 04:37:51 -0800 (PST)
Date: Fri, 3 Dec 2010 13:37:51 +0100
Message-ID: <AANLkTi=g1i2wB-9MKVh8AMctnFJVUccYFw0RYf600Tm-@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: release 2010-12: slugos does not build due to handhelds.org breakage
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
X-List-Received-Date: Fri, 03 Dec 2010 12:39:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Still get this on a clean build (machine nslu2le, distro slugos image
slugos-image, rm-ed downloads, sources.openembedded.org as premirror).

OTE: package ipkg-utils-native-1.6+cvs20050404-r25: task do_fetch: Started
NOTE: fetch http://anoncvs@sources.openembedded.org//ipkg-utils_anoncvs.handhelds.org__20060106.tar.gz
--2010-12-03 10:23:42--
http://anoncvs@sources.openembedded.org//ipkg-utils_anoncvs.handhelds.org__20060106.tar.gz
Resolving sources.openembedded.org... 140.211.169.165
Connecting to sources.openembedded.org|140.211.169.165|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-12-03 10:23:43 ERROR 404: Not Found.

cvs [checkout aborted]: connect to
anoncvs.handhelds.org(128.31.0.23):2401 failed: Connection refused

Frans

