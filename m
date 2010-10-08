Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4JU0-0005p1-4n
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 22:24:01 +0200
Received: by iwn7 with SMTP id 7so118332iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 13:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=5hcgl+nrMXS4pBzvPsDHe2/0L8RRaPFmKRLWf7iR0Ps=;
	b=mawcTZ9t8BHKLnyTdWRLxAi5Bbgee9fhDb27Jhq76cqCNdNOx44c5LlSr7fmF4EOTO
	VOxBQmQSe7uG7fwdZpFjq31cwmYJpKxedX8kWLUnHq7OZn6MqfyX8dYziHg/yRv58wjd
	xjtLHAKOk9pU7oCJxb6Uzqmi8ECbzZncIE4sk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=bT/zgYlrFjagdQPucWG/zFQCI17D83X0GNWXbFNPGx0JHHEi58dzCtTALmz1w7bxTc
	Pk07ySA70bvhbYDme3pgmtRsaDWk5tdUIpabIqZrnpGPKTDHmfQPnwoRtWvYMEy/T4KE
	8dO1rFfCOvGP/z8N/sMzoIvWCS6oYIj7X1YZI=
MIME-Version: 1.0
Received: by 10.231.157.207 with SMTP id c15mr2619718ibx.143.1286569411696;
	Fri, 08 Oct 2010 13:23:31 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 8 Oct 2010 13:23:31 -0700 (PDT)
Date: Fri, 8 Oct 2010 22:23:31 +0200
Message-ID: <AANLkTin=ucR4=4zJQg=thwRbqehhCzRa-DE6NwCGb76R@mail.gmail.com>
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
Subject: recipy_sanity experiment
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
X-List-Received-Date: Fri, 08 Oct 2010 20:24:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

as a test I decided to run recipe_sanity on our tree, and here are the results
There are 1801 warnings:

    954 candidate for removal of S
    373 LICENSE should be defined to something other than default (unknown)
    181 RDEPENDS should be RDEPENDS_${PN}
     91 candidate for removal of FILESDIR
     74 candidate for removal of PV
     49 native or cross recipe with non-empty PACKAGES
     11 RRECOMMENDS should be RRECOMMENDS_${PN}
      6 candidate for removal of FILESPATH
      4 LICENSE should be set
      1 DESCRIPTION should be set

Rest are for overwrites of a variable like:
      4 rename of variable 'FILES_${PN}' to 'FILES_orinoco-modules'
overwrote existing value '/lib/modules/' with '/etc /lib/modules'.
There are about 25 different lines of this (total about 50 lines)

Not sure exactly what should be done about it. I can fix some of them,
but not too sure about the rename thing
and the removal of S is often because there is an S = xyz_${PN} line
in an inc file

Anyway, wanted to know the results (and here they are).
I  can provide more detailed info if needed

Have fun! Frans


