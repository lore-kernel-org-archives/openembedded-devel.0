Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H1nbb-0005aK-OR
	for openembedded-devel@openembedded.org; Tue, 02 Jan 2007 18:39:19 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l02Hc5Lr027713 for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Jan 2007 18:38:06 +0100
Message-ID: <459A987C.9050902@dominion.kabel.utwente.nl>
Date: Tue, 02 Jan 2007 18:38:04 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1H1X7P-0006QB-FN@linuxtogo.org>	<20070102002938.GA5825@stygia.hyboria>
	<1167757388.5592.15.camel@localhost.localdomain>
In-Reply-To: <1167757388.5592.15.camel@localhost.localdomain>
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
X-List-Received-Date: Tue, 02 Jan 2007 17:39:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Tue, 2007-01-02 at 00:29 +0000, Graeme Gregory wrote:
>> On Tue, Jan 02, 2007 at 01:03:03AM +0100, koen commit wrote:
>>>  inherit autotools
>>>  
>>> +export CXXFLAGS += "-lstdc++"
>>> +
>>>  do_compile_prepend() {
>>>  	install ${WORKDIR}/mk-dirs_h.py ${S}/common/mk-dirs_h
>>>  }
>>>
>> As this package seems to work for other platforms, isnt the bug
>> elsewhere. I dont like this sort of unexplained "fix" for one particular
>> platform. This type of "fix" to me just dirties the metadata.
> 
> I'll second that. Lets try and fix bugs properly please...

Can we agree that .la files shouldn't contain references to tmp/work? Any volunteers for
adding the necessary logic to the appropriate bbclass?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFmph7MkyGM64RGpERAtFzAJ0SAeHm6UECh4o/3iQFni2I0zNjXwCfY/oK
EakpuS2x8qfY9x1Y7W1NRTw=
=W5xB
-----END PGP SIGNATURE-----


