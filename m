Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NgJRS-0004wy-Jl
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 15:57:57 +0100
Received: by pwi5 with SMTP id 5so265886pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 06:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=LdRgRdbxCrnDts+/1TFbjEBH3dmT9vo/mtjiRkJEbOU=;
	b=jOz4zozEugB+9BDx3dmZnQoeDJvBwL9JvkuFCo/IF+bjFCCQubNRerW8Jk8+k9aB7O
	W9d5X8XOsjZinS6ihyzGImPwxi7zfBn7sD+VGjBJr88HkMFRpDIOLPN/+hYInvNPmLiT
	XP4be6sPgVM88ffPgBxt/pgU5SRXqqmwsHVsY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=exrjYW3TiIt9Hb0ppiyWcEQPIiYVNYiKvgHmjl+ApIXm8EtNaX5JPRB8hJSJAoAIal
	IUDDuWFRxKaCtXx4C24Sv750KJyyv9pjzJosrdY5bCPB/7MsyoK4hkU+sShAL5UKnU+S
	1/uANK3W2Xp3I1ZNUU3Ectg9Ila3uTH1U2LU0=
MIME-Version: 1.0
Received: by 10.114.6.1 with SMTP id 1mr1930050waf.104.1266072917458; Sat, 13 
	Feb 2010 06:55:17 -0800 (PST)
Date: Sat, 13 Feb 2010 15:55:17 +0100
Message-ID: <ac9c93b11002130655p454b5931od630b58e995772a1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: {RFC} rootfs directory path
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
X-List-Received-Date: Sat, 13 Feb 2010 14:57:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Currently the rootfs ends up in ${TMPDIR}/work/rootfs/console-image
(at least if I bake console-image).
When dealing with multiple systems and either doing a parallel build
or keep the rootfs that could lead to inconsistent/faulty situations.
Shouldn't the dir be something like
${TMPDIR}/work/rootfs/$DISTRO}-${MACHINE}/console-image or so
(or maybe $DISTRO/$MACHINE or the other way around).

How do you feel about it (and what would be the preferred path?)

Frans


