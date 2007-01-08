Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H42S3-0002Xz-Sp
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 22:54:43 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l08LqxLr004942; Mon, 8 Jan 2007 22:52:59 +0100
Message-ID: <45A2BD37.7020901@dominion.kabel.utwente.nl>
Date: Mon, 08 Jan 2007 22:52:55 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: gtk-devel-list@gnome.org
References: <45A27A56.1030907@dominion.kabel.utwente.nl>	
	<1168278614.6655.0.camel@localhost>	
	<45A28709.6040609@dominion.kabel.utwente.nl>
	<1168283637.5781.9.camel@home>
In-Reply-To: <1168283637.5781.9.camel@home>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: Patch to make cross-compiling easier with libtool
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
X-List-Received-Date: Mon, 08 Jan 2007 21:54:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Behdad Esfahbod schreef:
> On Mon, 2007-01-08 at 13:01 -0500, Koen Kooi wrote:
> Gustavo J. A. M. Carneiro schreef:
>>>> On Seg, 2007-01-08 at 18:07 +0100, Koen Kooi wrote:
>>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>>> Hash: SHA1
>>>>>
>>>>> Hi,
>>>>>
>>>>> When adding gtk+ 2.10.7 to OpenEmbedded today I had to rediff a few patches and this one
>>>>> seemed usefull to have upstream:
>>>>>
>>>>> http://www.openembedded.org/repo/org.openembedded.dev/packages/gtk+/gtk+-2.10.7/hardcoded_libtool.patch
>>>>  BTW, maybe it's more correct to use $(LIBTOOL) instead
>>>> of ./$host_alias-libtool ?
> No idea, sorry.
> 
>> How is ./$host_alias-libtool supposed to work?  I don't
>> see ./i386-redhat-linux-libtool in my Gtk+ tree.  The answer is one of
>> $(LIBTOOL)

ok

>> or "use your libtoolize and run autogen.sh to get the
>> correct ./libtool".

That's what we do (gnu-confize, libtoolize, autoreconf) and gives me $host-alias-libtool

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFor03MkyGM64RGpERAikcAKC5ip3Y0YPRovDtJ79MMgp7EETU2wCdHjP8
/uSehGD4NzYyQ0+KWaNfGEM=
=ooPb
-----END PGP SIGNATURE-----


