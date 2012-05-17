Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SV6jm-0001vl-H1 for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 21:51:50 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SV6a3-00080E-BX for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 21:41:47 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 21:41:47 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 21:41:47 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 17 May 2012 21:41:30 +0200
Message-ID: <jp3k9b$p58$1@dough.gmane.org>
References: <CALbNGRRSxKD_QqhCbLH=aRj3S0PEyTmQs9j8Lgg-5EObqMypxQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <CALbNGRRSxKD_QqhCbLH=aRj3S0PEyTmQs9j8Lgg-5EObqMypxQ@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: meta-systemd
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
X-List-Received-Date: Thu, 17 May 2012 19:51:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-05-12 15:07, Andreas Müller schreef:
> Hi
> 
> happy to see this happen I have few questions on what is planned.
> 
> In README is written:
> 
>> And we're working to break the dependency on this one:
>> 
>> URI: git://git.openembedded.org/meta-openembedded
> 
> Maybe it is a misunderstanding but I would expect for contents of this
> layer
> 
> * systemd.bbclass * all from meta-oe/recipes-core/systemd * bbappends for
> all recipes with systemd support.
> 
> Is this correct?

Correct. The bbappends will likely cause dependencies on non-oecore layers,
but so be it. We might need to set the unbreak-me flag for missing bb files
that match our bbappends.
Unless people actually start reporting the bugs they encounter by including
meta-oe...
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPtVRqAAoJEHZqAkdh1vT6qjkP/AhrJZpWNUqgIwQP/+lnBw8G
jC+KbkzXePDcmHAP+Mcn5QASei2nE36yolfocKRD3BOsKz8Km4neF7S2275N691T
0NwBygn0qA/Vb7KUs/hvmK1lQr5T71VM9in9uSGMp15Yyn7RDxfwaJRgllFxUfKC
5z0el87MVjqvTMzgcJBF5ScTloilGUQg9PZKhV2N7JlrNtfkMKpVU/Sd9aqcxXQl
bQPQkTZOAOTOQISpTyZJwb8UCjoQQ9V+fyhwwHbmqVtrJfjEDLUo417HBK7jKL6G
ck1NA8Z5lhJLcPS9uv4DcIMeiG0Rx0kVZvdxhBQ/bM6zbwitps3/+OMDlKtn7DHt
cE7uVP26lykWnQsNSjxr0Q+J0s1Z3CjAt02rSEuL8mplDHsum9ppLd6ZUCjnIxSD
JD4e+mJbTP10GJOaK9xwxovSwwVRf2GQTisypRXxiwG8soZTvOpyTTBL+biXt7Sh
nsabkTAKy56L0kpyyDYwksD67/+yENdfy42FsWP9A5J5EFk0xNVWLJ/1BnEIq/Ju
exmvoLoXvN3pktzZ2cD+OovvEPcFpfzek6vQVBVqsDbYDdpPLp6qQSylhzgBMO/0
P8PqfQr/RQ2zfOVe9s6N8GUa4RX9TCgwDJJh/501atJIHbNK9oQ682Ht5se8i51c
3muIKSlHE1xco28BthvE
=2YeO
-----END PGP SIGNATURE-----



