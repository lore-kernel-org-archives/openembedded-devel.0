Received: from [209.85.219.212] (helo=mail-ew0-f212.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1McRX8-0005x3-KP
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 00:15:30 +0200
Received: by ewy8 with SMTP id 8so331775ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2009 14:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=cvy+HKEiCF98OXwhPyd1UT5lDmTGRZrTDVnsNGYnr9k=;
	b=TrFhT3eBtn1087tvAN4Mla/d8hEj/+13gOsU2CqvGjbi8zrP0N8U931guIGunO5l8L
	TnzkH2bb4fh52DBK82RTB3fv3w99XQnEXWwW6Nha+Oil+Ngiye60zdYsXkrt9RnX/1sy
	jCWYmenlZSM+rVq8Se5vxsrFqTYVVqEqB9Oxw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=d4EkDO57DMndxE9Rmhl9jgq3/BgRNLPHBahvrKGycIAoELagE+UVppyR0zesZDW9tI
	uPfJq8VVuLoNV2Wi/urNDy1WqAexrpMpsPUC9jH6NqtjpsyokTEiPPivJrlmuw89SOIx
	ULSGPjzvG4lOMZbzgN3QkiLatfSUL0nohvQ/g=
MIME-Version: 1.0
Received: by 10.216.71.19 with SMTP id q19mr718385wed.65.1250373522207; Sat, 
	15 Aug 2009 14:58:42 -0700 (PDT)
Date: Sat, 15 Aug 2009 23:58:42 +0200
Message-ID: <d1b08f940908151458q6402d54akc9b00f6687261f19@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Rebuild from packaged staging: issues with do_package_update_index_ipk
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
X-List-Received-Date: Sat, 15 Aug 2009 22:15:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm testing rebuild from packaged staging (cleaning all in /tmp but
/pstage) and I was stopped by a new issue with package_ipk.bbclass:

+ ipkgarchs='all any noarch arm  armv4 armv4t armv5te c7x0'
+ '[' '!' -z '' ']'
+ touch /oe/build/tmp/deploy/glibc/ipk/Packages
touch: cannot touch `/oe/build/tmp/deploy/glibc/ipk/Packages': No such
file or directory

Basically if you remove the /ipk dir the script will fail...perhaps
adding a mkdir -p would help.

Any opinion?

Regards

Andrea


