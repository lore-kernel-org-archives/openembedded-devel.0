Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H2lT0-00026h-Mg
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jan 2007 10:34:26 +0100
Received: by nf-out-0910.google.com with SMTP id l24so7642737nfc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jan 2007 01:33:06 -0800 (PST)
Received: by 10.49.10.3 with SMTP id n3mr7443999nfi.1167989579763;
	Fri, 05 Jan 2007 01:32:59 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id a23sm95573771nfc.2007.01.05.01.32.59;
	Fri, 05 Jan 2007 01:32:59 -0800 (PST)
Date: Fri, 5 Jan 2007 11:33:13 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1725097716.20070105113313@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <459E18AF.5040308@dominion.kabel.utwente.nl>
References: <76520598.20070105093334@gmail.com>
	<459E18AF.5040308@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: Fixing ipkg-make-index slowness
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
X-List-Received-Date: Fri, 05 Jan 2007 09:34:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Friday, January 5, 2007, 11:21:51 AM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Paul Sokolovsky schreef:

>> 
>> Richard, what were the reasons for such conservative file matching?
>> Filename matching should be just enough, as per OE convention, any
>> package source changes leading to changes in the package metadata must
>> lead to bumping of package recipe's PR, and that in turn updates package
>> filename.

> It isn't enough. If you repackages the exact same files at a later date, the timestamps in
> the tarball have changed, and hence the md5 will be different. When a user will download a
> package ipkg will check the md5sum present in the index and abort if it doesn't match.

  Then we probably need to separate image building from feed
creation/setup. IIRC, i-m-i currently run during image building
too, and it steals precious minutes from each developer (vs
distro/feed maintainer) multiple times a day. Having Packages
to be updated only by explicit "bitbake package-index" seems
like good compromise and corresponds to the docs which suggest
to do that explicitly.

> regards,

> Koen

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



