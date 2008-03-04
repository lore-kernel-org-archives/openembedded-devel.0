Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JWUta-0000Ah-D4
	for openembedded-devel@openembedded.org; Tue, 04 Mar 2008 12:01:27 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JWUsL-0007HY-7Y
	for openembedded-devel@openembedded.org; Tue, 04 Mar 2008 11:00:01 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 04 Mar 2008 11:00:01 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 04 Mar 2008 11:00:01 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 04 Mar 2008 11:59:49 +0100
Message-ID: <fqja36$kha$1@ger.gmane.org>
References: <c384c5ea0803021104s4470cb31o45e1295b7564e876@mail.gmail.com>	<fqevf6$8tq$1@ger.gmane.org>	<c384c5ea0803040119u47de4827ib0b173cd09a39297@mail.gmail.com>	<c384c5ea0803040208g54d59ffenf53b467fef4745da@mail.gmail.com>
	<c384c5ea0803040231s735efcb5yfe8aecf71bd94f5a@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <c384c5ea0803040231s735efcb5yfe8aecf71bd94f5a@mail.gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: content addressable fetching of packages, through MD5SUM or SHA1SUM?
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
X-List-Received-Date: Tue, 04 Mar 2008 11:01:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
| In trying to improve our package fetching robustness, a package
| crawler. (I still wonder if no such thing already exists...)

A small addition:

|       if [ $2 == $FILE_MD -a $3 == $FILE_SHA ]; then
|         echo "[VALIDATED]" $FILE_MD $FILE_SHA $URI$FILE

else
~        echo "[REJECTED]" $FILE_MD $FILE_SHA $URI$FILE

|       fi

You can view the output of it running against the angstrom source mirror at:

http://www.angstrom-distribution.org/unstable/sources/likewise-crawler-output.txt

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHzSulMkyGM64RGpERAgieAJ9KoOZfZJcSDOkul/a7wkCDX18GSQCeLRKj
X+d8btJ0J/yB2f0YjhgUWCI=
=mjr7
-----END PGP SIGNATURE-----



