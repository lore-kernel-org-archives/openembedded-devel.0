Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HOFfr-0003vv-6y
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 17:04:31 +0100
Received: from [130.89.139.19] (wlan139019.mobiel.utwente.nl [130.89.139.19])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l25G3hLr021603; Mon, 5 Mar 2007 17:03:43 +0100
Message-ID: <45EC3F5C.1010005@dominion.kabel.utwente.nl>
Date: Mon, 05 Mar 2007 17:03:40 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45E6EA03.8040804@dominion.kabel.utwente.nl>	<20070304221355.GM25845@prithivi.gnumonks.org>	<45EBF776.3090505@dominion.kabel.utwente.nl>	<1173104599.5842.62.camel@localhost.localdomain>	<20070305143506.GF25845@prithivi.gnumonks.org>
	<1173109595.5842.88.camel@localhost.localdomain>
In-Reply-To: <1173109595.5842.88.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: distro-devel@lists.openmoko.org
Subject: Re: Merging openmoko into OE
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
X-List-Received-Date: Mon, 05 Mar 2007 16:04:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Mon, 2007-03-05 at 15:35 +0100, Harald Welte wrote:
>> On Mon, Mar 05, 2007 at 02:23:19PM +0000, Richard Purdie wrote:

>>>>> 7) related: reimplement ipkg backend to use some indexed database. It's
>>>>>    just too slow
>>> Are we talking about on device use or use during image generation? On
>>> device is tricky but there are simple ways of speeding up image
>>> generation that just need implementation.
>> image generation is not an issue at all.  
>>
>> We're talking about on-device use which is way too slow for our needs,
>> especially considering the number of packages and that we'll have a GUI
>> application in front/on top, in addition to that.
>>
>> If there are existing plans/ideas in this area, or somebody with some
>> ipkg background has a good proposal and wants to implement it as paid
>> contractor, this would be the time to talk about it.
> 
> I think lots of people, me included have looked at the ipkg code and
> wanted to see it rewritten with something like a sqlite backend rather
> than parsing its ascii files all the time.

Ipkg got 2x faster when turning up the memory bus to 200MHz, so a large part is spent
copying few megs worth of lists to and from memory. On 64MB devices a big part of the
slowness comes from OOM and swapping :(

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF7D9cMkyGM64RGpERAt5wAKCEklyebJUEcO/092Gi52yCuO/0mACfdYD1
vNn7+1m87O7GJjbG2DC32Xs=
=66b3
-----END PGP SIGNATURE-----


