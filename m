Received: from [134.245.248.209] (helo=miraculix.informatik.uni-kiel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <haf@informatik.uni-kiel.de>) id 1LBr8z-000057-1l
	for openembedded-devel@openembedded.org; Sun, 14 Dec 2008 14:36:25 +0100
X-Virus-Scanned: amavisd-new at informatik.uni-kiel.de
Received: from falbala.informatik.uni-kiel.de (falbala [134.245.248.202])
	by miraculix.informatik.uni-kiel.de (8.14.3/8.14.3) with ESMTP id
	mBEDVeV2020461
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-devel@openembedded.org>;
	Sun, 14 Dec 2008 14:31:45 +0100 (MET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=informatik.uni-kiel.de; s=ifi-200807; t=1229261505; bh=FgNwi5w/UV
	wbQnvN93GGXKhffHXmDQJau0GbrkLVtSw=; h=Message-ID:Date:Subject:From:
	To:MIME-Version:Content-Type:Content-Transfer-Encoding; z=Received
	:=20from=20legendre.informatik.uni-kiel.de=20(legendre=20[134.245.2
	48.200])=0D=0A=09by=20falbala.informatik.uni-kiel.de=20(8.13.8+Sun/
	8.13.8)=20with=20ESMTP=20id=20mBEDVeUa018252=0D=0A=09(version=3DTLS
	v1/SSLv3=20cipher=3DDHE-RSA-AES256-SHA=20bits=3D256=20verify=3DNO)=
	0D=0A=09for=20<openembedded-devel@openembedded.org>=3B=20Sun,=2014=
	20Dec=202008=2014:31:40=20+0100=20(MET)|Received:=20(from=20www@loc
	alhost)=0D=0A=09by=20legendre.informatik.uni-kiel.de=20(8.13.8+Sun/
	8.12.6/Submit)=20id=20mBEDVeO8014395=3B=0D=0A=09Sun,=2014=20Dec=202
	008=2014:31:40=20+0100=20(MET)|X-Authentication-Warning:=20legendre
	.informatik.uni-kiel.de:=20www=20set=20sender=20to=20haf@informatik
	.uni-kiel.de=20using=20-f|Received:=20from=2082.82.137.144=0D=0A=20
	=20=20=20=20=20=20=20(SquirrelMail=20authenticated=20user=20haf)=0D
	=0A=20=20=20=20=20=20=20=20by=20www.informatik.uni-kiel.de=20with=2
	0HTTP=3B=0D=0A=20=20=20=20=20=20=20=20Sun,=2014=20Dec=202008=2014:3
	1:40=20+0100=20(MET)|Message-ID:=20<3bf8d295b93f5530b9b067526afbc30
	7.squirrel@www.informatik.uni-kiel.de>|Date:=20Sun,=2014=20Dec=2020
	08=2014:31:40=20+0100=20(MET)|Subject:=20md5sum=20mismatch=20for=20
	ipkg=20packages|From:=20"Hauke=20Fuhrmann"=20<haf@informatik.uni-ki
	el.de>|To:=20openembedded-devel@openembedded.org|User-Agent:=20Squi
	rrelMail/1.4.17|MIME-Version:=201.0|Content-Type:=20text/plain=3Bch
	arset=3Diso-8859-1|Content-Transfer-Encoding:=208bit|X-Priority:=20
	3=20(Normal)|Importance:=20Normal; b=nbm9DbVaIEfL7K8SOTaBJDUO9icNPH
	8NBB+eS97YSz1FApfvd3bVWJUPz/sNfqEM4LxQzC7wZBbt0MLRE8CUBfnP8VozpQFAY
	Pn56Xb9d1oxAQmheUW75ExfNbX+DO9j1ur3vLdqmRSkYb9AtjpgNFoYSs3SGWd88K1a
	vIaFxwk=
Received: from legendre.informatik.uni-kiel.de (legendre [134.245.248.200])
	by falbala.informatik.uni-kiel.de (8.13.8+Sun/8.13.8) with ESMTP id
	mBEDVeUa018252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 14 Dec 2008 14:31:40 +0100 (MET)
Received: (from www@localhost)
	by legendre.informatik.uni-kiel.de (8.13.8+Sun/8.12.6/Submit) id
	mBEDVeO8014395; Sun, 14 Dec 2008 14:31:40 +0100 (MET)
X-Authentication-Warning: legendre.informatik.uni-kiel.de: www set sender to
	haf@informatik.uni-kiel.de using -f
Received: from 82.82.137.144 (SquirrelMail authenticated user haf)
	by www.informatik.uni-kiel.de with HTTP;
	Sun, 14 Dec 2008 14:31:40 +0100 (MET)
Message-ID: <3bf8d295b93f5530b9b067526afbc307.squirrel@www.informatik.uni-kiel.de>
Date: Sun, 14 Dec 2008 14:31:40 +0100 (MET)
From: "Hauke Fuhrmann" <haf@informatik.uni-kiel.de>
To: openembedded-devel@openembedded.org
User-Agent: SquirrelMail/1.4.17
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-Null-Tag: b3c2a36d980460991550417eb6630811
Subject: md5sum mismatch for ipkg packages
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
X-List-Received-Date: Sun, 14 Dec 2008 13:36:25 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi there,

I have encountered md5sum mismatches for ipkg packages, of which the info
says that you are the maintainer.
Maybe you can give me a hint how to solve this:

I try to install a raid1 array on my device. I'm trying
to install the raid kernel modules. I get the following
errors. Is there anything wrong with the packages? I already did that
update several times.
Any hints for a embedded newby?

Hauke

# ipkg install kernel-module-md
Installing kernel-module-md (2.4.22.l2.3r63-r21) to root...
Downloading
http://ipkg.nslu2-linux.org/feeds/unslung/modules/cross/stable/kernel-module-md_\
2.4.22.l2.3r63-r21_nslu2be.ipk
Nothing to be done
Collected errors:
Package kernel-module-md md5sum mismatch. Either the ipkg or the package
index are corrupt. Try 'ipkg update'.

# ipkg install kernel-module-raid1
Installing kernel-module-raid1 (2.4.22.l2.3r63-r21) to root...
Downloading
http://ipkg.nslu2-linux.org/feeds/unslung/modules/cross/stable/kernel-module-rai\
d1_2.4.22.l2.3r63-r21_nslu2be.ipk
Nothing to be done
Collected errors:
Package kernel-module-raid1 md5sum mismatch. Either the ipkg or the
package index are corrupt. Try 'ipkg update'.




