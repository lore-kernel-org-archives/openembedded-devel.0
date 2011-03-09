Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Px745-0002G4-JD
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 01:15:45 +0100
Received: by vws4 with SMTP id 4so6970vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2011 16:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=fq2/DssahqdFPCizqPGU81jqsXJQ3tYxG9rNPSMRhbw=;
	b=Y3rjgJuwFj2VNGvi8DhDDD4ug88pT/Qvj1MUnmu5pX8JvnrScau3b4qWtPoN/4EUtb
	Hr0nfSfHOpezPTBDI6zkWLp5BZYfftJz/m+dVC5HjTBeMDx41fkteqFaJ5XEJplgUISx
	BwCsQ9ArmbtOIkUkMrfiL/kM7ibr1IK2EAc8s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=MukXcENUsYM0U0n985IilFQAw5H3K7z9M+XknQWcLK/uBW7zckEB1o2a+3fe5HT8ny
	Eko2s88zM+7XMw0Q9WPVkxgIy5leqXTBSrIyAPJDI3/0uVVhVkzRiPyhvoJPtU8SvBQ/
	QoikGUvImBNV2zbJp/wuC5uR09nyC71f6ni5s=
MIME-Version: 1.0
Received: by 10.52.159.3 with SMTP id wy3mr8361196vdb.289.1299629650406; Tue,
	08 Mar 2011 16:14:10 -0800 (PST)
Received: by 10.52.164.39 with HTTP; Tue, 8 Mar 2011 16:14:10 -0800 (PST)
Date: Wed, 9 Mar 2011 01:14:10 +0100
Message-ID: <AANLkTikBSTnFxn-h+BgD1fcuOmKPsP6Q8bVZ+R7_HUkW@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: mtd-utils - issues with flash_eraseall -j
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
X-List-Received-Date: Wed, 09 Mar 2011 00:15:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

with the previous mtd-utils-1.3.1 I could do ' flash_eraseall -j
/dev/mtd3' on my Zaurus/armv5te.

With v. 1.4.1 (and 1.4.2 fwiw) I see following errors:

...
flash_erase: error!: /dev/mtd3: MTD writeoob failure
                        error 22 (Invalid argument)
Erasing 16 Kibyte @ 43f0000 -- 99% complete libmtd: error!: unaligned address 7
1237640, mtd3 page size is 512
flash_erase: error!: /dev/mtd3: MTD writeoob failure
                        error 22 (Invalid argument)
Erasing 16 Kibyte @ 43f4000 -- 99% complete libmtd: error!: unaligned address 7
1254024, mtd3 page size is 512
...

Anybody can confirm the issue?

Regards

Andrea


