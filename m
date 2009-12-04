Received: from mail-pz0-f182.google.com ([209.85.222.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NGQBp-0002TE-98
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 05:54:48 +0100
Received: by pzk12 with SMTP id 12so1985384pzk.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Dec 2009 20:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gIkYiE9digezVl0wqdVN1WU2dTqYkDVE/qxXkor8JQs=;
	b=rSqCc9ySSgBZqhoUo+dbCsSvQdwR3d8u4VYnK1x5DP8AMlLk5NqE0CHdoTXEKdop1+
	3CBgPSxwqa8S4XVDF71s50174/VpFGx7YqxzBFsW6AajkhVai00+UlmpXrp2oi/Nqiqf
	p1zJHP+RlkxZZaINi/ahDvv/yZGc8KRWnn5xk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=n94n3CkluRNqD94P3GGA5qp2JJdUr3IGbZI7L87U1vBX0ejxWoxHCLIVPVZmSDhE91
	WiF8ZaGf0lcU41V7iEN9m9zMbcQbOLrhx04kmcHrmekzyALbfJhf5INBGAeVX21l5vcW
	HiJhsDKorrz6p/qaG3VMjKP3l4wnWb4DsMgpI=
MIME-Version: 1.0
Received: by 10.142.75.21 with SMTP id x21mr304217wfa.150.1259902387673; Thu, 
	03 Dec 2009 20:53:07 -0800 (PST)
In-Reply-To: <4B18811D.8020206@mwester.net>
References: <4B18811D.8020206@mwester.net>
Date: Fri, 4 Dec 2009 15:23:07 +1030
Message-ID: <6ec4247d0912032053g5f4963a7t6280f5341cce12e8@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.182
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Commit 2fdf1aa1c869ea9deecee86206f49a2eca9d7c00 breaks opkg
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
X-List-Received-Date: Fri, 04 Dec 2009 04:54:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/12/4 Mike Westerhof <mike@mwester.net>:
> Commit 2fdf1aa1c869ea9deecee86206f49a2eca9d7c00 (Koen) breaks
> opkg-nogpg-nocurl. =A0I have no idea what else might be broken, but the
> fact that it removes all the critical patches that make it work on
> small-memory machines is the most obvious cause of the breakage.
>
> So what do you all want me to do about this? =A0We can revert the commit.
> Or someone can try to sort out a way to let opkg change without
> impacting the tiny-memory version of opkg (which will get more and more
> difficult as the two diverge). =A0Or I can just create
> opkg-nogpg-nocurl-slugos.bb in hopes that it won't get stomped on.
>
> Thanks,
> Mike (mwester)

Since slugos is at r160, perhaps adding those patches back in, with
maxrev=3D lines is best for now?

-Graham


