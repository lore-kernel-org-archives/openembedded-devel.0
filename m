Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OhNbE-0005VE-Tp
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 16:08:46 +0200
Received: by bwz8 with SMTP id 8so6139bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 07:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=uCTbaxRKIbkwDGDyWrSUsr1yemnl1SBkEAbBhdS3Kjs=;
	b=WWkmi0AprnPmGsMXz5imJueVicH//yZ3MoXByc3l+HnbQxJKSCraD1ZA5C9jq9Y4lW
	cxrOiIcJETJApuYZxeXD9kk4v3ZIBzialGJFCTvTdmpS1xvMh+PGqLpVaxCo1U2aGaOk
	Ec7IujNHlzBJ62eKAKbGPlHQHcWn3ORK4dRHA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xkE0EIzbVowuVP6QjK+OOy0qaabk8t8RuLoC4LM2cW5HEsWzRX1PGna6XSrK2o6NuL
	ZsNocv6ge9TNRQsECwsAOG14nPxGHvifA6qDxsgcjt2Q96P4vkON5CL/GPd3U6weGmAp
	Sq6azf5w6pbrtScsFQ2QScPikB2RyT5seRstc=
MIME-Version: 1.0
Received: by 10.204.152.8 with SMTP id e8mr147385bkw.2.1281103690304; Fri, 06 
	Aug 2010 07:08:10 -0700 (PDT)
Received: by 10.204.21.6 with HTTP; Fri, 6 Aug 2010 07:08:10 -0700 (PDT)
In-Reply-To: <4C5BDE5B.3050008@dcombus.com>
References: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
	<1280926084-7605-1-git-send-email-henri.bragge@dcombus.com>
	<AANLkTinnz+cB5Au1hMsniwFbCSjo-EaNWoR=9Xae4krA@mail.gmail.com>
	<loom.20100805T104704-558@post.gmane.org>
	<AANLkTik=13a7k7D1n=VfJnqO5DdPy5PUVdLdnDHtZh1d@mail.gmail.com>
	<AANLkTim41rfG5eqwrEu5goiqFZqhZK3XY2Pq=shdANTU@mail.gmail.com>
	<AANLkTincP+hP1RSsA+u5+HQ3xKLFgDkt7x4R-hN3kOsP@mail.gmail.com>
	<4C5BDE5B.3050008@dcombus.com>
Date: Fri, 6 Aug 2010 16:08:10 +0200
Message-ID: <AANLkTikjR5wxTzno2fJwtnDwVzDrQaMTVU=SiEbxHbCp@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 1/2] recipe for gsnmp-0.3.0
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
X-List-Received-Date: Fri, 06 Aug 2010 14:08:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Still one issue left:

I saw this warning when building another package:

/home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal/gsnmp.m4:4:
warning: underquoted definition of AM_PATH_GSNMP
/home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal/gsnmp.m4:4:
  run info '(automake)Extending aclocal'
/home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal/gsnmp.m4:4:
  or see http://sources.redhat.com/automake/automake.html#Extending-aclocal

I suggest a patch to resolve this.

Frans


