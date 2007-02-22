Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HK8fw-0001Gb-Ki
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 08:47:36 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1M7lVox022228 for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 08:47:31 +0100
Message-ID: <45DD4A91.3060909@dominion.kabel.utwente.nl>
Date: Thu, 22 Feb 2007 08:47:29 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45DCC76A.7000002@dominion.kabel.utwente.nl>	<45DCCAEB.9010603@dominion.kabel.utwente.nl>
	<455328392.20070222094353@gmail.com>
In-Reply-To: <455328392.20070222094353@gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: QA issues with pkgconfig files
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
X-List-Received-Date: Thu, 22 Feb 2007 07:47:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Koen,
> 
> Thursday, February 22, 2007, 12:42:51 AM, you wrote:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
> 
>> Koen Kooi schreef:
> 
>>> Possible solutions:
>>>
>>> 1) set PKG_CONFIG_PATH to ${STAGING_LIBDIR}/pkgconfig
>>>    +easy fix
>>>    -requires to re-run do_pupulate_staging for all packages
>>> 2) symlink one dir to the other
>>>    +fixes hardcoded paths
>>>    -requires manual intervention to fixup files present and/or complete rebuild
>>> 3) have pkgconfig.bbclass delete one dir each run
>>>    -requires every packages that has .pc files to inherit pkgconfig
>>>    -ugly
>>>    -error-prone
>>>
>>> Do you have any other solutions, and if not, which solution do you prefer?
> 
>> 4) have pkgconfig.bbclass sed _every_ .pc file in staging each run.
> 
>   Why staging? 

Because the problem only manifests itself in staging. Have a look at pkgconfig.bbclass and
you can see why.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF3UqRMkyGM64RGpERAhAqAJ9SaJ4nGMeadURDP9Ag2WRlLxbmcgCeJIWI
6KoDZcJ8JlnwqYGq8d7wb84=
=bwuZ
-----END PGP SIGNATURE-----


