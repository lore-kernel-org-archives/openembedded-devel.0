Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OxKRv-0003g7-7e for openembedded-devel@lists.openembedded.org;
	Sun, 19 Sep 2010 16:01:00 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OxKR2-0005t8-Ex for openembedded-devel@lists.openembedded.org;
	Sun, 19 Sep 2010 16:00:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Sep 2010 16:00:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Sep 2010 16:00:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 19 Sep 2010 15:56:43 +0200
Message-ID: <i754qr$jk1$2@dough.gmane.org>
References: <1284810428-19013-1-git-send-email-fransmeulenbroeks@gmail.com>	<i74kqu$skg$1@dough.gmane.org>
	<AANLkTi=Dyj-ZxNi9+12YEYLrj5nRE7FhukZb--U8S=QK@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <AANLkTi=Dyj-ZxNi9+12YEYLrj5nRE7FhukZb--U8S=QK@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] clutter: moved COMPATIBLE_MACHINE to clutter-common.inc
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
X-List-Received-Date: Sun, 19 Sep 2010 14:01:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-09-10 15:48, Frans Meulenbroeks wrote:
> 2010/9/19 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 18-09-10 13:47, Frans Meulenbroeks wrote:
>>> moved COMPATIBLE_MACHINE from clutter.inc to clutter-common.inc
>>> the other recipes all DEPEND on clutter but do not have a COMPATIBLE_MACHINE
>>> defined, but of course do not work for other machines.
>>> This patch moves COMPATIBLE_MACHINE to clutter-common.inc which is
>>> included by all other inc file and so it applies to all
>>
>> NAK! Only clutter itself has the need for COMPATIBLE_MACHINE (actually,
>> only virtual/egl needs it, clutter can drop COMPATIBLE_MACHINE), gst,
>> gtk and box2d are generic libraries that do NOT need it.
>>
> 
> They are not generic as they have a DEPENDS = "clutter".

They will link against any clutter you throw at it and only depend on
the build arch (e.g. armv7a), so they are generic.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMlhabMkyGM64RGpERAhJeAJ9IdlOH6PlfkUvW5q1rq0Z9L506aACdFE0O
muxfMTetpvVqx+5iLJK9vg0=
=G0j5
-----END PGP SIGNATURE-----



