Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hq2lI-0004NP-Lj
	for openembedded-devel@openembedded.org; Mon, 21 May 2007 09:57:01 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l4L7u7ox015366 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2007 09:56:08 +0200
Message-ID: <46515099.6070006@dominion.kabel.utwente.nl>
Date: Mon, 21 May 2007 09:56:09 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <463C9EA9.2060302@dominion.kabel.utwente.nl>	<464F3AC8.5000804@dominion.kabel.utwente.nl>
	<1179605582.5852.9.camel@localhost.localdomain>
In-Reply-To: <1179605582.5852.9.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: make do_install and do_deploy a PACKAGE_FUNC
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
X-List-Received-Date: Mon, 21 May 2007 07:57:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Sat, 2007-05-19 at 19:58 +0200, Koen Kooi wrote:
>> Koen Kooi schreef:
>>> Hi,
>>>
>>> Lately there have been several problems with files not getting packaged, because users
>>> resumed builds after a failure. Richard has come up with a fix:
>>>
>>> http://www.rpsys.net/openzaurus/temp/oe-install-change.patch
>>>
>>> The only bug with that patch is that do_deploy fails, which can be solved by making that a
>>>  PACKAGE_FUNC as well.
>>>
>>> What do you think about that?
>> So this is bugfree and can go in immediately?
> 
> I'm in two minds about this.
> 
> An alternative is we stop populate_packages() moving files around,
> copying them instead. This means deploy can run after install, install
> can be a separate task and builds should continue where they left of if
> interrupted during the packaging phase.
> 
> Opinions?

The copy-don't-move approach sounds good.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGUVCZMkyGM64RGpERAoEMAJ4rFonlztzdou+L5L79M1Rk1hzn8gCePSjP
qXJHJlIfgDOSd+SkD1Bei1c=
=mo1f
-----END PGP SIGNATURE-----


