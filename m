Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ikn2a-0007s2-S4
	for openembedded-devel@openembedded.org; Wed, 24 Oct 2007 22:41:25 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9OKY0Uo004571 for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2007 22:34:01 +0200
Message-ID: <471FAC3D.7030301@student.utwente.nl>
Date: Wed, 24 Oct 2007 22:34:05 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <4510693243.20071017152524@vanille-media.de>	<471729ED.9080208@student.utwente.nl>	<1192708743.6158.25.camel@localhost.localdomain>	<471C8BF4.1050206@student.utwente.nl>	<1193063767.6088.54.camel@localhost.localdomain>	<471CC31D.2010401@student.utwente.nl>
	<1193077473.6088.68.camel@localhost.localdomain>
In-Reply-To: <1193077473.6088.68.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Cleaning up SDK/Toolchain
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
X-List-Received-Date: Wed, 24 Oct 2007 20:41:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Mon, 2007-10-22 at 17:34 +0200, Koen Kooi wrote:
>> Richard Purdie schreef:
>>> * Each machine could have its own staging area. To do that you'd have to
>>> make the populate staging stamp machine specific. That is possible
>>> although bitbake might require some tweaks and it would have
>>> implications for rm_work.
>> In essence it would make multimachine unimachine :(
> 
> Not necessarily. Only the populate_staging task would be machine
> specific, not the all the tasks.
> 
> With the staging changes I'm thinking of, do_populate_staging basically
> becomes a file copy. For the numbers of files we're talking about, it
> should be fast. rm_work would still work as long as it preserved the
> image directory under work...

So:

* rm_work deletes ${S} when used
* do_clean deletes ${WORKDIR} when used and kills stamps
* do_stage() copies files from ${WORKDIR}/image/ to staging/machine-tuple/

did I understand that correctly?

regards,

Koen



> 
>>> * We implement packaged staging and only stage the dependencies needed
>>> for each package.
>> That would be a better approach. Graeme, do you still want to have a
>> shot at implementing a unionfs based approach?
> 
> Hmm. Does that need root privs?
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHH6w9MkyGM64RGpERAsPdAKCYsjAOTF+R5zmCnEjr7cqsodJiWQCfWhG7
ZUKW4Ca9hANBG+LC5j/ejJE=
=edFM
-----END PGP SIGNATURE-----


