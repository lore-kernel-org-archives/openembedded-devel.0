Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HKVQg-0006ZF-0e
	for openembedded-devel@openembedded.org; Fri, 23 Feb 2007 09:05:22 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1N85JLr027563 for <openembedded-devel@openembedded.org>;
	Fri, 23 Feb 2007 09:05:19 +0100
Message-ID: <45DEA03E.8070903@dominion.kabel.utwente.nl>
Date: Fri, 23 Feb 2007 09:05:18 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45D98799.1080309@dominion.kabel.utwente.nl>	<200702191259.25200.openembedded@hrw.one.pl>	<45D9984C.6090705@dominion.kabel.utwente.nl>	<45DAAEF4.50701@dominion.kabel.utwente.nl>	<45DAFC38.40000@dominion.kabel.utwente.nl>
	<1172197564.5203.11.camel@localhost.localdomain>
In-Reply-To: <1172197564.5203.11.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: splitting deploy/ipk into subarchs
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
X-List-Received-Date: Fri, 23 Feb 2007 08:05:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matthias Hentges schreef:
> Am Dienstag, den 20.02.2007, 14:48 +0100 schrieb Koen Kooi:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Koen Kooi schreef:
>>
>>> Marcin and I merged a slightly different version of this today.
>> As some people found out, their upload scripts broke with this change. I'm sorry that
>> happened, but those scripts are more easily fixed than ipkg-utils :(
>> Due to bug in ipkg-utils being I haven't been using a straight rsync for a while now, so
>> for the curious:
> 
> Why not make this change optional via a variable 
> (ie: SPLIT_DEPLOYDIR_IPK = -1 to turn it off) ?
> 
> The current version breaks local OE feeds

People's feeds are outside the scope of OE. Repeat after me: deploy never was, isn't and
never will be a feed.

> and requires needless post-processing.

As I pointed out before, you needed postprocessing anyway due to bugs in ipkg and
ipkg-utils, so your point is moot.


> A slugos deploy dir looks like this now:
> 
> all
> armv5te
> i686
> ixp4xxle
> 
> I honestly don't see any advantage to the previous mode of operation.

Go read the openembedded-devel list some time.


> If
> it is needed for unique situations 

No

> like the rare case of a multi-machine build

Apart from that now being the point, it actually isn't rare, the majority of the
(maintained) distros in OE use it (celinux. generic, angstrom, openmoko, openzaurus,
slugos and jline).

> it should be off by default and - by all means - optional.

No it should not. Next time respond to the RFCs instead of starting some uninformed rant
afterward.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF3qA+MkyGM64RGpERAsq1AJ9jkjFqiolnJWv/Mul6S59sCG2gZwCcDWRi
WEqSA0lYqeEuhz/9vBImS00=
=EmZ6
-----END PGP SIGNATURE-----


