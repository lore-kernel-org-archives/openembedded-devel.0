Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OCVZB-0000WQ-Qn for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:22:58 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OCVVO-0006Nj-KW for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:19:02 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 12:19:02 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 12:19:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 13 May 2010 12:18:51 +0200
Message-ID: <hsgjmb$6q5$1@dough.gmane.org>
References: <AANLkTinbdSQqop_YbzlaGsWGQllBIrq5w-l4WPqUReW6@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <AANLkTinbdSQqop_YbzlaGsWGQllBIrq5w-l4WPqUReW6@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: udev static
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
X-List-Received-Date: Thu, 13 May 2010 10:22:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-05-10 12:03, Raffaele Recalcati wrote:
> Using udev 141 in nfs I had frequently a very long delay after the message
> "Starting udev".
> If I do a ctrl-c the system goes on.
> But sometimes there are some devices lacking, obviously.
> 
> So I look inside udev and I saw many udev rules in /etc/udev/rules.d
> directory.
> 
> I know that Angstrom is focused for a general purpose usage, but in my
> embedded case I don't need it and I prefer a quick boot with fix devices
> create.

It boots a lot quicker when not using NFS :)

> What I'll need is to trigger automount of usb serial, SD card, usb pen, and
> similar things.
> So I have modified udev to populate, similarly to udev-static-devices.bb,
> the /dev directory mounted.
> I also notice the DEVCACHE functionality, that it seems a little bit
> dangerouse in my case.
> My idea is to create a new recipe, named udev-static, in which I'll use
> udev-static-device and than I'll put only some rule as example using RUN
> udev function.
> 
> It is a good idea?

I think it would be better to move all the udev rules to subpackages and
RRECOMMEND then for the main udev package. That way you use
BAD_RECOMMENDATIONS to exclude them at image time.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL69ILMkyGM64RGpERAhrbAJ924Rtf+5KzZ4Q26x9nVfC7BGqnwQCfdvEo
SQLyPqeELJtaijaPhV/eteA=
=Q8W1
-----END PGP SIGNATURE-----



