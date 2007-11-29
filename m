Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IxpXF-0007B3-82
	for openembedded-devel@openembedded.org; Thu, 29 Nov 2007 20:58:57 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lATJtmnk006096; Thu, 29 Nov 2007 20:55:48 +0100
Message-ID: <474F1943.50308@student.utwente.nl>
Date: Thu, 29 Nov 2007 20:55:47 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <d543f5920711290953x75c79b84gbb5bfdce83bfc324@mail.gmail.com>
	<1196363431.6917.29.camel@localhost.localdomain>
In-Reply-To: <1196363431.6917.29.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: poky@o-hand.com
Subject: Re: [poky] Syntax for requiring a dependency task's deploy	phase to be finished
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
X-List-Received-Date: Thu, 29 Nov 2007 19:59:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Thu, 2007-11-29 at 11:53 -0600, Matt Hoosier wrote:
>> I'm trying to build a kernel containing an initramfs linked directly
>> into the kernel binary. This is inspired by the recent discussion
>> here: building a minimal image with IMAGE_FSTYPE set to cpio.
>>
>> I need to be sure that by the time the kernel's do_compile task
>> executes, the minimal image has been deploy to ${DEPLOY_DIR}/image.
>> What's the right way to write this dependency?
> 
> If I understand correctly you want something like
> 
> do_compile[depends] += "minimal-image:do_deploy"
> 
> inside the kernel recipe where "minimal-image" is the name of the image
> recipe.

And make sure *nothing* in that image depends on a kernel at buildtime,
otherwise bitbake will start spewing incomprehensible backtraces :)
A better approach would be to write a bbclass that takes a kernel image
and initramfs and glues those together.

regards,

Koen



- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHTxlDMkyGM64RGpERAhg8AJ9suIHZD8NIXvyK0+FwvVQe1iJoxgCeLMKd
u9K/J91oaRA6WV16kTlpaOs=
=yZ7f
-----END PGP SIGNATURE-----


