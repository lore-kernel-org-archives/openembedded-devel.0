Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GKEoU-00049K-56
	for openembedded-devel@openembedded.org; Mon, 04 Sep 2006 15:48:34 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k84Djqw4000519 for <openembedded-devel@openembedded.org>;
	Mon, 4 Sep 2006 15:45:53 +0200
Message-ID: <44FC2E10.2020807@dominion.kabel.utwente.nl>
Date: Mon, 04 Sep 2006 15:45:52 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.5 (Macintosh/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <E1GKCrb-0005hO-P4@linuxtogo.org>	<1157373682.16945.61.camel@gandalf.tm.informatik.uni-frankfurt.de>	<44FC28C6.5040800@dominion.kabel.utwente.nl>
	<1157377129.16945.80.camel@gandalf.tm.informatik.uni-frankfurt.de>
In-Reply-To: <1157377129.16945.80.camel@gandalf.tm.informatik.uni-frankfurt.de>
X-Enigmail-Version: 0.94.0.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Improving consistency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2006 13:48:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
<snip>

>> Is it possible to have a 'bitbake sanitize <provider>' command that will output a
>> sanitized .bb? It doesn't have to be perfect, but some aid in this tedious task would be
>> helpfull.
> 
> That depends. I have been thinking about this for quite some time,
> because
> I really would like to have such a thing. We already have a bit of the
> infrastructure
> in place, but the one thing missing is that once the metadata is parsed,
> we lose
> a) order and b) source statements (pointers to a .bb or even better the
> textual entity
> that was the source for a certain statement).

What about a simple script that sorts DESCRIPTION, LICENSE, do_install(), etc? That would
make an excellent addition to the contrib/ dir in the repo.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFE/C4QMkyGM64RGpERAuiCAJ9uoQsw5vGcp4rPn6oAGZ8f3VAhPQCdHvM2
tlWuFqVTBeYyUaXxd3CdQLQ=
=jl9c
-----END PGP SIGNATURE-----


