Received: from ey-out-1920.google.com ([74.125.78.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1O5IHp-0000P6-60
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 14:47:13 +0200
Received: by ey-out-1920.google.com with SMTP id 26so797092eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Apr 2010 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=kFI5Kchiwc6i1CyQJlCFxOxpJByzLhAAk7gqxYELbb4=;
	b=lkRcWl4K6l4XD+YFihAcqZpaPNzpqJKCx+nsGae1ubGwwh80JIcv9hnsKqaDiAppJf
	aWWiS0b9e+ZSRpTKelwyBh6qbnOEMx1FZA6WyboIYDjznh+jm9vYKA5jbYDhYmWDYZok
	4pBQpiG89FlwdKjjtnlBP7/n97S3s14l0Jf8g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ImNMzLf+rTJGMswsYrWdCSWjK75TjBdNk0ivIFM/Oc5870NL18NiPU77f0JqMt5CoT
	rBvAfF4/dYXE8R8kw4cTRGcpZfyyTfbX8jQwUa1kcD65hcWoxvBsVt3dvAsMqocU9cXe
	uurTXny0RSt1PiHPRMc4za8qT5uPzkjLYq2I4=
MIME-Version: 1.0
Received: by 10.213.19.136 with HTTP; Fri, 23 Apr 2010 05:43:38 -0700 (PDT)
Date: Fri, 23 Apr 2010 14:43:38 +0200
Received: by 10.213.79.76 with SMTP id o12mr5435960ebk.19.1272026618899; Fri, 
	23 Apr 2010 05:43:38 -0700 (PDT)
Message-ID: <v2vbc36f8ed1004230543g82e60ae9o9d85f5853396e418@mail.gmail.com>
From: Mickael Chazaux <mickael.chazaux@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.148
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: populate_staging_postamble fails
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
X-List-Received-Date: Fri, 23 Apr 2010 12:47:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I had this error a few times in file
/home/mchazaux/projet/OE/angstrom-dev/work/telematic-board-angstrom-linux-g=
nueabi/linux-2.6.33-r70/temp/log.populate_staging_postamble.24667
:


Traceback (most recent call last):
  File "/home/mchazaux/projet/OE/openembedded/recipes/stage-manager/files/s=
tage-manager",
line 79, in <module>
    cache =3D read_cache(options.cachefile)
  File "/home/mchazaux/projet/OE/openembedded/recipes/stage-manager/files/s=
tage-manager",
line 34, in read_cache
    cache[data[0]]['ts'] =3D int(data[1])
IndexError: list index out of range

In fact sometimes I hit in "no space left on device" errors, so the
cachefile /home/mchazaux/projet/OE/angstrom-dev/deploy/glibc/pstage/stamp-c=
ache-staging
may get corrupted, with just one field on the line and not the 2
others, resulting in bitbake crashing.

Following patch adds error handling.

Regards,

Mickael Chazaux

Adeneo Embedded - Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=C3=A9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41


