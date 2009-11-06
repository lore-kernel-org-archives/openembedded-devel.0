Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N6MD1-0001VF-TH
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 11:38:27 +0100
Received: by ywh7 with SMTP id 7so832682ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2009 02:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SM2G+dA/U5RRdyXAd38OMdOnVs5uqwSAh5WvqP5VP6Y=;
	b=sxATMFDB8QcqBV2RgfGV+or9mM5FMQDwTrMJ/PJoh4j6RUTR6UGxKd/NbsWNi2KrH6
	7Ol8dMIdVlcl9ncaCsSRJE4nK+xkxqdGaWWaruskedeKgNBck7ZAcioMvaUI5+oHNJoT
	mSWAFAi5RnSTF8iyurHdCY+5QIt6qb/3DlDL8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VUlWCHfaSlNqO30ZTsy9uMIc5+2boBgsoDP1v1iOGRIW5252liGDAKSIOl0KNwXmFD
	9h2Fp54RBFx4NBjaD1eReWcc6dD+6hBpZl97YuiEt385134gEJaYKn/+/HuzxR9nJ2qG
	+cqhsCgN6YMy15qTlbH9i/iRqO6Y4GD9QcqUc=
MIME-Version: 1.0
Received: by 10.100.237.9 with SMTP id k9mr3906656anh.139.1257503829476; Fri, 
	06 Nov 2009 02:37:09 -0800 (PST)
In-Reply-To: <217663.38369.qm@web112503.mail.gq1.yahoo.com>
References: <ac9c93b10911060006x1a60e677ic6f2c192eedc176d@mail.gmail.com>
	<217663.38369.qm@web112503.mail.gq1.yahoo.com>
Date: Fri, 6 Nov 2009 11:37:09 +0100
Message-ID: <ac9c93b10911060237i44b0d886qccfb0d64f94ae6ec@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: mysql 5
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
X-List-Received-Date: Fri, 06 Nov 2009 10:38:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/6 gagan singh <gagan2172@yahoo.com>:
> Great work Frans
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 There is mysql 5.0.67=A0 version with almost finished=
 recipe for OE.
> http://209.85.229.132/search?q=3Dcache:P0cKZWGWiMwJ:projects.linuxtogo.or=
g/pipermail/openembedded-devel/2008-September/006249.html+mysql+5.0+OE&cd=
=3D3&hl=3Den&ct=3Dclnk&gl=3Duk
>
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 The issue comes up =A0as I was trying to =
run mythtv on beagle board =A0Sql 5.0 was minimum requirement for mythtv .2=
1 .I somehow managed to get mysql 5.0.67 =A0get cross complied and run with=
 mythtv .21 on beagle board.=A0=A0=A0 But I suspect my work around (skippin=
g some runtime tests at two places during cross compilation)
> =A0was not a proper fix so=A0 keep to myself. =A0Perhaps some OE experts =
can port that recipe properly on OE.
>

Thiere is also some work for 5.0 in the bug tracker.
http://bugs.openembedded.org/show_bug.cgi?id=3D4577
Not sure how good or how complete it is.

Frans


