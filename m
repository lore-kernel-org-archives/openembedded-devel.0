Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZjDh-0003qS-3d
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 09:55:27 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZjBc-0002Dh-10
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 08:53:16 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 08:53:16 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 08:53:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Thu, 13 Mar 2008 09:53:06 +0100
Message-ID: <fraq1i$k6k$1@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>	<20080311114938.GM30267@ibawizard.net>	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>	<20080311145739.GN30267@ibawizard.net>	<1205250588.4521.111.camel@dax.rpnet.com>	<20080312014945.4783ae6a@widy.localdomain>	<1205280598.16531.26.camel@dax.rpnet.com>	<20080312024408.44d9192e@widy.localdomain>	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>	<fr997r$aat$1@ger.gmane.org>	<c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>	<1205358843.4530.22.camel@dax.rpnet.com>
	<fr9n05$sm7$1@ger.gmane.org>
	<1205369061.4530.65.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1205369061.4530.65.camel@dax.rpnet.com>
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
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Thu, 13 Mar 2008 08:55:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:

| You basically said that if you hadn't run "mtn propagate" every X days
| you would have had an unmergable mess?

I didn't say that, because that isn't true

| The dreambox branch is unmergable because this hasn't been done?

Actually the dreambox branch *is* mergable once you fix up the
non-content conflicts[1].

How do you get a non-content conflict: a file gets added on both
branches seperately, so on each branch it gets a different node-id.
Solution: 'mtn mv' or 'mtn drop' the file.

What has happened in the dreambox branch: updates weren't done with
propagate, but by copying over files and 'mtn add -R ; mtn commit'-ing them.

The problem is that mtn developers fail to accept that silently merging
node-ids is OK when the *contents* are the same.

regards,

Koen

[1] there are a lot of them
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH2OtyMkyGM64RGpERAmKFAJwLaMVc8G9bJuiYu2R39e7uIsOCEgCgsS+N
4wJwVmPa50Rj5cDiTuebTV4=
=2ccG
-----END PGP SIGNATURE-----



