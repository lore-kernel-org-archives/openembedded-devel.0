Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gh2ri-0003Ue-RZ
	for openembedded-devel@openembedded.org; Mon, 06 Nov 2006 12:42:11 +0100
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kA6BenLr016146 for <openembedded-devel@openembedded.org>;
	Mon, 6 Nov 2006 12:40:49 +0100
Message-ID: <454F1F41.7060501@dominion.kabel.utwente.nl>
Date: Mon, 06 Nov 2006 12:40:49 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200611061111.13491.valentin.longchamp@epfl.ch>	<454F0DCA.7040202@dominion.kabel.utwente.nl>
	<200611061221.28202.valentin.longchamp@epfl.ch>
In-Reply-To: <200611061221.28202.valentin.longchamp@epfl.ch>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Problem in building compiler
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
X-List-Received-Date: Mon, 06 Nov 2006 11:42:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Valentin Longchamp schreef:
> Koen Kooi wrote:
> 
>> Does the same error happen with MACHINE=mx31ads and DISTRO=angstrom-2007.1
>> ? I recommend using that configuration and adding 'branding' later on when
>> it's proven to work.
>>
> 
> Sorry for the double-post, but it looks like the attached error file didn't 
> make it through the mailing-list this time. So I past it here (and attach it 
> once more).
> 
> So the config file, tells to use glibc-2.5, but the compilation fails on the 
> same package (glibc-intermediate).
> 
> The error is visible in the attach error log.
> 

>> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
>> |rk/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angstr
>> |om-linux-gnueabi/sysd-sorted-tmp mawk: scripts/gen-sorted.awk: line 19:
>> | regular expression compile failed (bad class -- [], [^] or [) /[^
>> | mawk: scripts/gen-sorted.awk: line 19: syntax error at or near ]
>> | mawk: scripts/gen-sorted.awk: line 19: runaway regular expression /, "",

For some reason glibc needs 'gawk' and breaks with 'mawk' (which is the default on
debian). Could you try installing gawk? A recent .dev tree should warn you about that[1].

regards,

Koen


[1]
http://www.openembedded.org/viewmtn/revision.psp?id=0c89fbedbb59ef7e1b229b833813e59080b4952a
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD4DBQFFTx9AMkyGM64RGpERAhsAAJwL725GpVVWoUB26GZlutIpNR//OACXWHKj
yfFGVBu0i93HaGCP7Pcg1Q==
=plsI
-----END PGP SIGNATURE-----


