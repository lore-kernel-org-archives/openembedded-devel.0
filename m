Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HaeAr-0003sG-Ou
	for openembedded-devel@openembedded.org; Sun, 08 Apr 2007 22:39:45 +0200
Received: from [130.89.6.144] (vpn006144.vpn.utwente.nl [130.89.6.144])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l38KdeLr001364 for <openembedded-devel@openembedded.org>;
	Sun, 8 Apr 2007 22:39:40 +0200
Message-ID: <46191FDD.1000406@dominion.kabel.utwente.nl>
Date: Sun, 08 Apr 2007 19:01:17 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46176E51.2030608@dominion.kabel.utwente.nl>
	<1176048832.5844.1.camel@localhost.localdomain>
In-Reply-To: <1176048832.5844.1.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] rm_work
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
X-List-Received-Date: Sun, 08 Apr 2007 20:39:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> Hi,
> 
> On Sat, 2007-04-07 at 12:11 +0200, Koen Kooi wrote:
>> I want to propose making rm_work inherited by default with the following changes:
>>
>> * a KEEP_WORK = "1" var in bitbake.conf so it is opt-in
>> * a KEEP_WORK_pn-${PN} option to mark packages in local.conf
>> * a KEEP_WORK option in recipes to mark them, e.g. for llvm
>>
>> Summary: it will default to 'off' (keep the workdir), but can be switched globally and per
>> package.
>>
>> In the last few weeks that I've used rm_work, I haven't found any big problems with it,
>> but as Graeme points out, there is no easy way to disable yet.
>>
>> What do you think?
> 
> As I see it, rm_work is a policy which can be applied by an individual
> or a distro. I don't think it should be mandatory but if certain distros
> wish to use it be default, that is up to them and I'm fine with that.

Right, my proposal does that, but skips the need to add it to INHERITS manually. It's a
small nuance, but not big enough to discuss further :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGGR9NMkyGM64RGpERAs8HAJ9TRAdrubJyaCt4ZALHVoLsIX8yowCglcVy
XWzFX4zfjMoX8wuSA/sBxqw=
=SvAE
-----END PGP SIGNATURE-----



