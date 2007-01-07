Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H3WMA-0002cA-BQ
	for openembedded-devel@openembedded.org; Sun, 07 Jan 2007 12:38:30 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l07Banox015975 for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Jan 2007 12:36:51 +0100
Message-ID: <45A0DB4D.3040104@dominion.kabel.utwente.nl>
Date: Sun, 07 Jan 2007 12:36:45 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1H1X7P-0006QB-FN@linuxtogo.org>	<20070102002938.GA5825@stygia.hyboria>	<1167757388.5592.15.camel@localhost.localdomain>	<459A987C.9050902@dominion.kabel.utwente.nl>	<20070102202458.GB5825@stygia.hyboria>
	<459E5E3A.5030709@dominion.kabel.utwente.nl>
In-Reply-To: <459E5E3A.5030709@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev aspell: fix compilation for	powerpc
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
X-List-Received-Date: Sun, 07 Jan 2007 11:38:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Graeme Gregory schreef:
>> On Tue, Jan 02, 2007 at 06:38:04PM +0100, Koen Kooi wrote:
>>> Can we agree that .la files shouldn't contain references to tmp/work? Any volunteers for
>>> adding the necessary logic to the appropriate bbclass?
>>>
>>> regards,
>>>
>> I think adding some sed along the lines of this in gcc staging should
>> cure the problem. As I beleive the "wrongness" leaks out of gcc when
>> libtool starts making other .la files (it seem to just concatentate
>> lines from dependant .la files)
> 
>> sed -e "s|dependency_libs\s*=\s*.*|dependency_libs = '
>> -L${CROSS_DIR}/${HOST_SYS}/lib -lgcc_s -lc -lgcc_s -lm -lgcc_s -lc
>> -lgcc_s '|"
> 
>> I have previously used this in my build personally to fix such problems,
>> but would appreciate someone giving a second look over and someone
>> familiar with the appropriate .bbclasses to put it in the right place.
> 
> I think this can go into the do_stage_append() method of packages/gcc/gcc3-build-cross.inc
> for libgcc, libgcc_s, libstdc++ and libsupc++.

Tested for libstc++ and libsupc++ and committed.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFoNtNMkyGM64RGpERAvSaAJ9U93Vk8WkySw/T5go7lOJBS2bypQCeIMhO
jM27KV4se99PFDWJwEReyLc=
=lcIp
-----END PGP SIGNATURE-----


