Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QaEm7-0005wY-G3
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jun 2011 00:22:58 +0200
Received: by pzk36 with SMTP id 36so2326257pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jun 2011 15:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=CaLcli2+5a3ButhDCCdKZaqxu0G828ZOv2tQLiWAh/U=;
	b=tkWg+jSEfjzeSFNogzN+xmjAuHNdU+v1QRCJGObyPMNGLgI11foy3I6Mevu8gE54dg
	4TkypxkzCCmzbDu5XAmnv6CTllt2eqYUSpoKv0JElkJVX74a7R4UB4QvvcVlEBLHqbEK
	xIg36voGUEafNk2zX25oWLLZri0jNM1IwL1ts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=PNZkPqEQjsc2RMF4J0W7v47A+1q1hnFTCVVFrh+CD7s5JcxRmF01oPNJzE6g72DhxR
	fQX9xKbXm92Z62/zCcIGuM09Zw6edzrpwQwvf43x0vLPteIycHKBYxCWsFirEO+oYVr1
	saarqsElhXo0m7yafKJCVe6IwJFMSYjwjzcWk=
MIME-Version: 1.0
Received: by 10.142.7.3 with SMTP id 3mr784628wfg.137.1308953817152; Fri, 24
	Jun 2011 15:16:57 -0700 (PDT)
Received: by 10.142.142.18 with HTTP; Fri, 24 Jun 2011 15:16:56 -0700 (PDT)
Date: Sat, 25 Jun 2011 00:16:56 +0200
Message-ID: <BANLkTi=v9LLYcw-Z-AjTr08iEiB2tBgDsQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Bitbake master vs. openembedded classic
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
X-List-Received-Date: Fri, 24 Jun 2011 22:22:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm still working with oe-dev on the KKK (klibc, kexec, kexecboot)
which will be hopefully soon ready for oe-core.
Trying a build from scratch after fresh pull breaks on gettext-native.

Fresh oe.dev doesn't cope with bitbake master.
I sent bitbake back to "HEAD is now at ea0ca90 cooker.py: Drop
duplicate parseCommandLine call" and things works as before.

Maybe next time I'll try to bisect pulling  bitbake 1.13.1

Just FYI

Andrea


