Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PU0sV-00027m-Ld
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 18:47:31 +0100
Received: by iyj18 with SMTP id 18so1243071iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 09:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=nKHsvvVCRa9FDxruV59WfnWShBqw+jM44iFsTh7r88k=;
	b=FN2WD9T4ggywYBlEEytx+a/hXWmZH8OU2mUg03/Ia7LNN0U2R+POfiIf2zJHOVzFmu
	TdZYTRjiXPi0+1TOFT9qJ2DiiP+bttuUmryNdn22X/Izm9h/SrHh73+1rSZ6nZwtU8PJ
	rsAvVnMxnu/ovjjW1WyRudIKJ+/CPC1Eehoeg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tY4HYmRl1qWIB7PcNtN0dPX6RYUDatJwzlzKZx3Jaa/vd3fY0kuX/dlpHXqXt36sGA
	hzBMXzX1bM888jCj04Elm3uVFhlO9q4OsQjn8XGmy5OmGm6IUOYwA/Ac0yTTXhDriN7Y
	0Ra6udZ1V3YMq/7wrkej73g/uj2sfKnurPOSc=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr2160587ibc.7.1292694444913; Sat, 18
	Dec 2010 09:47:24 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sat, 18 Dec 2010 09:47:24 -0800 (PST)
In-Reply-To: <AANLkTin7ujqZuJx=xi=msr20Cc8dkYQLHb77qAkB9c8D@mail.gmail.com>
References: <AANLkTim1ZFrjZuvJgKGB-+2wTNUAx5cdiNsRXK8bvRf9@mail.gmail.com>
	<AANLkTimkoAmu_Qy=t635mP3ufHTqhUbQbr4PTpMjFBLq@mail.gmail.com>
	<AANLkTin7ujqZuJx=xi=msr20Cc8dkYQLHb77qAkB9c8D@mail.gmail.com>
Date: Sat, 18 Dec 2010 18:47:24 +0100
Message-ID: <AANLkTimQXsP8NMRmDoWGNaUYGhsouaYyvLZ7UC7TsCM3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake git head issue
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
X-List-Received-Date: Sat, 18 Dec 2010 17:47:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

for the record,

with the aid of Chris and Robert we managed to pin this down to a bug
in python.
Apparently python 2.6.2 as I had is too old.
python 2.6.6 is fine

Chris and Robert, thanks for your help!

Frans


