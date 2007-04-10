Received: from [89.149.220.217] (helo=mail.kynisk.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <repvik@kynisk.com>) id 1HbJjQ-0000Cx-3o
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 19:02:12 +0200
Received: from [192.168.1.23] (44.84-48-58.nextgentel.com [84.48.58.44])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kynisk.com (Postfix) with ESMTP id 5018E1BF29B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2007 19:02:14 +0200 (CEST)
From: =?utf-8?q?=C3=98yvind_Repvik?= <repvik@kynisk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2007 19:02:04 +0200
User-Agent: KMail/1.9.5
References: <461BB515.7030108@balister.org>
In-Reply-To: <461BB515.7030108@balister.org>
MIME-Version: 1.0
Message-Id: <200704101902.04699.repvik@kynisk.com>
Subject: Re: RFC: U-Boot package clean up
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2007 17:02:12 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 10 April 2007 18:02, Philip Balister wrote:
> Currently we have a uboot directory and a uboot-utils directory in the
> metadata. I would like to consolidate these into one directory called
> u-boot (to match the source file naming convention).
>
> At the same time, I would like to delete some old versions of u-boot bb
> files. I'd like to keep 1.1.6, 1.2.0, and the git bb files.
>
> I created the LABEL.2006.06.30.2020 file for the omap5912osk machine, it
> is no longer needed as release version of u-boot support the hardware now.
>
> Does anyone know about the other u-boot targets?
>
This is for the openmoko phone, I believe.
> uboot-gta01_svn.bb

These are recently added by me, for PPC-based linkstations:
>   u-boot-linkstationppc
>   u-boot-linkstationppc_git.bb

I think I moved uboot-utils away from the uboot-utils directory and into=20
u-boot. Either way, it's not quite done yet. I'll take a look at them and=20
remove whichever one is "wrong".
>   uboot-utils_1.1.2.bb <- This is PR5 and the one in the uboot-utils is P=
R4


=C3=98yvind


