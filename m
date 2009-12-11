Received: from mail-yw0-f199.google.com ([209.85.211.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NJ13g-00048U-BS
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 09:41:07 +0100
Received: by ywh37 with SMTP id 37so680527ywh.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 00:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=ZAOfOWDb8xp3Tuw8GO96G3pyvVuw8Cim5qsBUvBGY5o=;
	b=N5XHQE/jQOAYwLIWh9N+NFKFcNBn9XbffOXwQVT6/gAWXZJoit1vFGMSaiq7QMs48q
	kw8ugVZbdpwBV+WHLZitH+0WinytXHGCzmxM6FZyKabB5I7kEkhfRc7+hFp5M5dnxdXW
	Nw1QRQOahZl7UA/Kr4bNOvJer4v6O1JWDKW7I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=cvnZ/0EJyeLTLneAdr1mFa3gMdcffVRWsDhjWieffRLeBuRxY5+cEALkK6hpjryxv/
	StWoRr4leTogolNNNGSLRvJkLDAcLauakIQ+MGQNKfakBmHbxpREy6vE2XRY4bJvPQy2
	7kwgujdYCDH0KeRqBC87gEI9KZtInoT6NHxYI=
MIME-Version: 1.0
Received: by 10.101.169.1 with SMTP id w1mr1806824ano.21.1260520761153; Fri, 
	11 Dec 2009 00:39:21 -0800 (PST)
Date: Fri, 11 Dec 2009 09:39:21 +0100
Message-ID: <ac9c93b10912110039u28303201t5a762e715ed53ceb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.199
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: multiple DISTRO's in tmp
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
X-List-Received-Date: Fri, 11 Dec 2009 08:41:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

I bumped upon the following issue.

Normally I use angstrom as distro, but this time I needed a small
image to be used in an initramfs.
In order to achieve that I changed DISTRO in my local.conf to minimal
(tried minimal-uclibc first, but that would complain before generating
packages, probably due to a mismatch between my target (powerpc) and
uclibc (I refrained from sidetracking to dig into it)).

However, when trying to build minimal, it immediately complained about
DISTRO_PR (minimal does not have DISTRO_PR, which you may find a bug,
but anyway that is what exists now).
I had to put it in a new tmp dir.

However, I was wondering: wouldn't it be nice to allow multiple
distro's in one tmp dir (so that e.g. if they share the same version
of a recipe (like m4-native or os), this does not need to be
recompiled?

If this is considered to be a good plan what would be the best way to
achieve this?

Frans


