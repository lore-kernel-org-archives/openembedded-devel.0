Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H1gxd-0001fT-CQ
	for openembedded-devel@openembedded.org; Tue, 02 Jan 2007 11:33:37 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l02AWRLr016630 for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Jan 2007 11:32:27 +0100
Message-ID: <459A34B9.1030703@dominion.kabel.utwente.nl>
Date: Tue, 02 Jan 2007 11:32:25 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1H1X7P-0006QB-FN@linuxtogo.org>
	<20070102002938.GA5825@stygia.hyboria>
In-Reply-To: <20070102002938.GA5825@stygia.hyboria>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev aspell: fix compilation for powerpc
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
X-List-Received-Date: Tue, 02 Jan 2007 10:33:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Graeme Gregory schreef:
> On Tue, Jan 02, 2007 at 01:03:03AM +0100, koen commit wrote:
>>  inherit autotools
>>  
>> +export CXXFLAGS += "-lstdc++"
>> +
>>  do_compile_prepend() {
>>  	install ${WORKDIR}/mk-dirs_h.py ${S}/common/mk-dirs_h
>>  }
>>
> As this package seems to work for other platforms, isnt the bug
> elsewhere.

I suspect it's due to broken .la files in cross/. Could you apply your sed fix?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFmjS5MkyGM64RGpERAjHKAKCZ1DUHJgk4eG9NSp/c2B4NtVmfDACcCEob
5PmZwAjBizHtxdzoaciX2UU=
=IaLn
-----END PGP SIGNATURE-----


