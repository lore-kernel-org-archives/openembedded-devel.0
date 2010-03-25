Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NuhZ3-0001yo-C7 for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 08:33:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NuhVz-0006jn-Ke for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 08:30:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 08:30:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 08:30:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 25 Mar 2010 08:28:02 +0100
Message-ID: <hof3a2$dtj$1@dough.gmane.org>
References: <201003211505.39554.roman@khimov.ru>	<201003242026.22169.roman@khimov.ru>	<201003241841.01034.marcin@juszkiewicz.com.pl>
	<201003242055.50066.roman@khimov.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <201003242055.50066.roman@khimov.ru>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 01/44] cpan-base: add perl version to PR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Mar 2010 07:33:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-03-10 18:55, Roman I Khimov wrote:
> В сообщении от Среда 24 марта 2010 20:41:00 автор Marcin Juszkiewicz написал:
>> Dnia środa, 24 marca 2010 o 18:26:16 Roman I Khimov napisał(a):
>>> OK. Pushed perl 5.10.1, everybody, have fun!
>>
>> 18:39 hrw@home:angstrom$ bitbake perl
>> NOTE: Handling BitBake files: - (0975/8143) [11 %]NOTE: <type
>> 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType' objects
>>  while evaluating:
>> r0${@perl_get_version_suffix(d)}
>> NOTE: <type 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType'
>> objects while evaluating:
>> ${PN}-${EXTENDPE}${PV}-${PR}
>> NOTE: <type 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType'
>> objects while evaluating:
>> ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}
>> NOTE: <type 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType'
>> objects while evaluating:
>> ${WORKDIR}/callweaver-1.2-${CWRCV}/contrib/ogi-perl/callweaver-perl-0.0.1
>> NOTE: <type 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType'
>> objects while evaluating:
>> ${S}
>> ERROR: cannot concatenate 'str' and 'NoneType' objects while parsing
>> /home/hrw/devel/oe/openembedded/recipes/callweaver/callweaver-perl.bb
>> NOTE: Handling BitBake files: - (3827/8143) [46 %]NOTE: <type
>> 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType' objects
>>  while evaluating:
>> r2${@perl_get_version_suffix(d)}
> 
> (0_0)
> Never had that and just tried, nothing like that, test setup is Angstrom for 
> qemuarm.

I think this is the same problem as we have with KERNEL_VERSION. IIRC we
cheat a bit and write out a file in staging with the version.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLqxCBMkyGM64RGpERAttaAKCsWP+WLeWIRkSZBfiaqUrT15L1QgCcDvIZ
gN3dYKQn5EjTC4lqqqu5cX4=
=Oaop
-----END PGP SIGNATURE-----



