Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Iuuso-0006Ib-RT
	for openembedded-devel@openembedded.org; Wed, 21 Nov 2007 20:05:13 +0100
Received: from Powerbook-2.local (vpn006015.vpn.utwente.nl [130.89.6.15])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lALJ2nZn003815 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 20:02:49 +0100
Message-ID: <474480D9.4090001@student.utwente.nl>
Date: Wed, 21 Nov 2007 20:02:49 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1IuZKt-0006pg-Ms@linuxtogo.org>	<47434BB3.2010705@student.utwente.nl>
	<1195667681.30926.11.camel@localhost.localdomain>
In-Reply-To: <1195667681.30926.11.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev Add cryptsetup: Stop forcing	your opinions onto other people!
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
X-List-Received-Date: Wed, 21 Nov 2007 19:05:15 -0000
X-List-Received-Date: Wed, 21 Nov 2007 19:05:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matthias Hentges schreef:

>>> +######################################################################################
>>> +######################################################################################
>>> +######################################################################################
>>> +######################################################################################
>> Please read (and follow) the styleguide and run the recipe through
>> OE-stylize.py to get an idea how it should look like.
> 
> Nice "style". With my layout, you at least had a sense about what does
> what, the entries were grouped for easy reading.
> 
> Your "style" does nothing more than remove any kind of possible grouping
> by deleting linefeeds left and right. Your "style" stinks.

It's not my style, it's the official OE style, which you would have
known if you had bothered to read the OE styleguide, as I said in my
original mail.
Oe-stylize.py showed a pile of other problems in your recipe on top of
those mentioned. So both the official style guide and the dedicated tool
back me up.

>>> +pkg_postinst() {
>>> +	if test "x$D" = "x"
>>> +	then 
>>> +		# Work around a problem in module ipk's, where depmod is not always
>>> +		# run after installing a kernel-module.
>>> +		test -x /sbin/depmod && /sbin/depmod -a
>>> +		/bin/true
>>> +	fi
>> And don't add such hacks, please remove it.
>>
> 
> The "hack" had a very valid purpose. 

Valid purpose or not, it doesn't belong in OE. By your reasoning we
should add all postinsts from all dependencies to each recipe. And *if*
postinst get mysteriously skipped, your hack isn't going to get
executed, is it?

> It worked around a very real bug

Yet a search in bugzilla for 'depmod' or 'postinst' yields no open bugs
on that.
The only 'bug' I know of is people using 'su' instead of 'su -' to
become root and (/usr)/sbin isn't in $PATH. That's PEBKAC, not an OE bug
or ipkg bug.

> Would be PLEASE STOP MESSING WITH OTHER PEOPLES FILES??

Not if those violate various *documented* OE policies and the author of
thw recipes in question refuses to comply with them.

> THIS IS NOT KOEN-EMBEDDED

No, this is OpenEmbedded, so follow the OE policies.

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHRIDZMkyGM64RGpERAurqAKC03wbfp+wiE1Vd6F49vM/h6N4ecwCfdVue
+P0il0YgJpgJFq03bl859IE=
=IUQI
-----END PGP SIGNATURE-----


