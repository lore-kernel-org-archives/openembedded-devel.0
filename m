Received: from [64.233.182.184] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HK8cI-0001CV-Us
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Feb 2007 08:43:50 +0100
Received: by nf-out-0910.google.com with SMTP id l24so442202nfc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2007 23:43:50 -0800 (PST)
Received: by 10.49.92.18 with SMTP id u18mr3093025nfl.1172130228903;
	Wed, 21 Feb 2007 23:43:48 -0800 (PST)
Received: from CUBE ( [77.122.177.58])
	by mx.google.com with ESMTP id p20sm4963445nfc.2007.02.21.23.43.48;
	Wed, 21 Feb 2007 23:43:48 -0800 (PST)
Date: Thu, 22 Feb 2007 09:43:53 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <455328392.20070222094353@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <45DCCAEB.9010603@dominion.kabel.utwente.nl>
References: <45DCC76A.7000002@dominion.kabel.utwente.nl>
	<45DCCAEB.9010603@dominion.kabel.utwente.nl>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 22 Feb 2007 07:43:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Thursday, February 22, 2007, 12:42:51 AM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Koen Kooi schreef:

>> Possible solutions:
>> 
>> 1) set PKG_CONFIG_PATH to ${STAGING_LIBDIR}/pkgconfig
>>    +easy fix
>>    -requires to re-run do_pupulate_staging for all packages
>> 2) symlink one dir to the other
>>    +fixes hardcoded paths
>>    -requires manual intervention to fixup files present and/or complete rebuild
>> 3) have pkgconfig.bbclass delete one dir each run
>>    -requires every packages that has .pc files to inherit pkgconfig
>>    -ugly
>>    -error-prone
>> 
>> Do you have any other solutions, and if not, which solution do you prefer?

> 4) have pkgconfig.bbclass sed _every_ .pc file in staging each run.

  Why staging? Shouldn't we add sanitize_XXX(filename) where XXX is
any type of file insane.bbclass checks for, and call it around
do_install? Plus, add sanitize_XXX_recursive() for lazy folks, who
will search for broken stuff in install dir itself - just like insane
currently does, except it will fix it on spot ;-)

> regards,


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



