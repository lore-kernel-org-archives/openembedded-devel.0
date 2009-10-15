Received: from [209.85.211.203] (helo=mail-yw0-f203.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1MyWow-0005X6-Ik
	for openembedded-devel@openembedded.org; Thu, 15 Oct 2009 22:21:13 +0200
Received: by ywh41 with SMTP id 41so1263394ywh.0
	for <openembedded-devel@openembedded.org>;
	Thu, 15 Oct 2009 13:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=WR9DSx0CLjBuMbuUHefrZX6LaGbzsgyQKxMNm6Rrvfo=;
	b=e1ossNdOb+qTk0a/98jkmAXH8+sFpcJc+l1ULQjT0b/JtngBy1F8uaaFh4a5Gwa+7j
	YXvx8UybwHoUqPSzoFWBZPnjrrJdQK2pOLGBsvjno+LPQkXIEjiwv0j0avNcQMYsV0JW
	uRJqG2+/8A/z1Yw0tSqsHEhX0j+FKlD0lJNiM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=XE5WV+gLBS1hlterdChVFnZoG2oFqv1eJB5UfHeMwsM6vYtCVTyN1WMhjNP+fS9CrO
	zCFgOSpsFlQvaSN2l9oLX1NR7hs6QTwE00TPh/8NJExAvezymiIvS4mKl6grY4cT5mRN
	wtnzwESMOAJtp3uJBJXs18wDHQVqBFGFYLHcI=
MIME-Version: 1.0
Received: by 10.101.17.4 with SMTP id u4mr804580ani.62.1255638014000; Thu, 15 
	Oct 2009 13:20:14 -0700 (PDT)
Date: Thu, 15 Oct 2009 22:20:13 +0200
Message-ID: <ac9c93b10910151320t7c6064efqa6d8ad598ecd29d4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.203
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: how to get a new machine on the feeds?
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
X-List-Received-Date: Thu, 15 Oct 2009 20:21:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

As reported before I created a new machine conf for openrd-client.
This is a kirkwood (= armv5te) system.
I can make console-image and boot from it.
opkg also works with one exception:
If I do an opkg update it cannot find
http://www.angstrom-distribution.org/feeds/unstable/ipk/glibc/armv5te/machine/openrd-client/Packages.gz

Who can add this to the build system and to the feeds?

Thanks alot. Frans.


