Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GNrvq-0006v1-8j
	for openembedded-devel@openembedded.org; Thu, 14 Sep 2006 16:11:10 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k8EE7Uw4029155 for <openembedded-devel@openembedded.org>;
	Thu, 14 Sep 2006 16:07:30 +0200
Message-ID: <45096222.1060907@dominion.kabel.utwente.nl>
Date: Thu, 14 Sep 2006 16:07:30 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.5 (Macintosh/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <20060914130233.GA10260@fh-wedel.de>
	<1158239761.5399.1.camel@localhost.localdomain>
In-Reply-To: <1158239761.5399.1.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.0.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: postinst jobs and "exit 1"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Sep 2006 14:11:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Thu, 2006-09-14 at 15:02 +0200, Martin Dietze wrote:
>>  lots of packages start their postinst jobs like this:
>>
>> | test -z "$D" || exit 1
>>
>> When creating firmware images using recent OE recipes (nylon
>> distro and mtx-2 hardware), this seems to cause problems,
>> either bitbake complains about "exit 1" in the log file when
>> doing the rootfs or lots of postinst jobs are not run after
>> installing the image. 
>>
>> Is the above test deprecated and should be replaced by
>> something not exit'ing at all? If yes, who is going to adapt
>> all the existing packages still doing this?
> 
> Packages do this if the postinst should run on the device and should not
> be during do_rootfs. If the postinst can be safely run during postinst,
> you wouldn't have a line like this.

isn't the 'if x$D == x' test preferred over the above test?[1]

regards,

Koen


[1] I really don't know

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFCWIiMkyGM64RGpERAq1mAJ0TI7T1qOlBi9tb7A8oPc6dmLwGdACffKeU
cPxJYtR3N37AylFrzjSniUA=
=N/7O
-----END PGP SIGNATURE-----


