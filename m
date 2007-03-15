Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HRoVK-0000X3-4I
	for openembedded-devel@openembedded.org; Thu, 15 Mar 2007 12:52:22 +0100
Received: from dominion.dominion.void (dominion.kabel.utwente.nl
	[130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l2FBqCLr015146 for <openembedded-devel@openembedded.org>;
	Thu, 15 Mar 2007 12:52:13 +0100
Received: from www-data by dominion.dominion.void with local (Exim 4.60)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HRoVB-0001fW-Gw
	for openembedded-devel@openembedded.org; Thu, 15 Mar 2007 12:52:13 +0100
Received: from 189.16.225.25 ([189.16.225.25]) 
	by dominion.kabel.utwente.nl (IMP) with HTTP 
	for <koen@localhost>; Thu, 15 Mar 2007 12:52:13 +0100
Message-ID: <1173959533.45f9336d50790@dominion.kabel.utwente.nl>
Date: Thu, 15 Mar 2007 12:52:13 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@openembedded.org
References: <45F92746.2020608@whitby.id.au>
In-Reply-To: <45F92746.2020608@whitby.id.au>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.6
X-Originating-IP: 189.16.225.25
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Bad gcc packaging (libgcc-s1 instead of libgcc1)
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
X-List-Received-Date: Thu, 15 Mar 2007 11:52:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Quoting Rod Whitby <rod@whitby.id.au>:

> I'm getting a libgcc-s1 package emitted by gcc_4.1.1.bb instead of the
> normal libgcc1.

The situation is a bit more nuanced: gcc (non-cross) never emitted libgcc1,
gcc-cross did. So gcc_4.bb was not packaging its libgcc as it should have.


>  This is poisoning all builds that depend on libgcc1,
> and is polluting the slugos feeds with bad dependencies.

That is correct and indeed very annoying.

> I believe it is caused by the patch in
>
http://lists.linuxtogo.org/pipermail/openembedded-commits/2007-March/004007.html
>
> I have tested reverting that patch locally, and the libgcc-s1 package
> was not emitted.
>
> So I wish to revert that patch.

Please properly fix it by having gcc emit libgcc1 instead, otherwise your native
gcc package won't work properly if gcc-cross was a different version (which is
not a common case, but still). I think putting a construction like
gcc-package-cross.inc has:

python do_package() {
        if bb.data.getVar('DEBIAN_NAMES', d, 1):
                bb.data.setVar('PKG_libgcc', 'libgcc1', d)
        bb.build.exec_func('package_do_package', d)
}

in gcc-package.inc should work. Could you test that?

Sorry for breaking everyones packages.

regards,

Koen


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


