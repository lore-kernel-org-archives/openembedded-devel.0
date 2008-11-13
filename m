Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1L0fJs-0002t3-K6
	for openembedded-devel@openembedded.org; Thu, 13 Nov 2008 17:45:25 +0100
Received: (qmail 2388 invoked by uid 813007); 13 Nov 2008 16:43:20 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Nov 2008 16:43:20 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Nov 2008 17:43:17 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27; KDE/4.1.2; x86_64; ; )
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<gf76q2$le2$1@ger.gmane.org> <49184199.90100@balister.org>
In-Reply-To: <49184199.90100@balister.org>
MIME-Version: 1.0
Message-Id: <200811131743.18880.openembedded@haerwu.biz>
Subject: Re: [PATCH] checksums.ini: correct wrong checksums
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
X-List-Received-Date: Thu, 13 Nov 2008 16:45:25 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Monday 10 of November 2008 15:13:45 Philip Balister napisa=B3(a):

> I'd like to see one commit per checksum change with the details in
> the commit message. This we we can easily find when I package
> checksum changed. This way we can easily identifu when the source
> changed but the version number did not.

I have 1212 new entries for checksums.ini file. Do you want 1212 commits=20
or just one?

How I got such amount? Simple - account on machine with FastEthernet=20
hooked to the Internet + some hours of shell/bitbake work:

for recipe in $OEROOT/packages/*/*.bb
do
  bitbake -b $recipe -cfetch
done

Of course with OE_ALLOW_INSECURE_DOWNLOADS=3D1 set to not get failures=20
just because some entries are missing.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://blog.haerwu.biz/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




