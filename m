Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UVekw-0004PO-Sg for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 11:16:01 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UVeTj-0004bJ-3V for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 10:58:03 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 10:58:03 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 10:58:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 26 Apr 2013 10:57:57 +0200
Message-ID: <kldfig$pmn$1@ger.gmane.org>
References: <1366816884-32023-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRSGhfmbBwUo-y4nTvHjnn_FoMjNH=ps83sTKbZUkyucaw@mail.gmail.com>
	<kldcsp$uep$1@ger.gmane.org>
	<20130426084324.GL5538@jama.dyndns-home.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
In-Reply-To: <20130426084324.GL5538@jama.dyndns-home.com>
X-Enigmail-Version: 1.5.1
Subject: Re: [PATCH] lxdm: fix postinst-code
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
X-List-Received-Date: Fri, 26 Apr 2013 09:16:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 26-04-13 10:43, Martin Jansa schreef:
> On Fri, Apr 26, 2013 at 10:12:14AM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 26-04-13 09:50, Andreas Müller schreef:
>>> On Wed, Apr 24, 2013 at 5:21 PM, Andreas Müller 
>>> <schnitzeltony@googlemail.com> wrote:
>>>> Exiting postinst code leaves systemd.bbclass offline postinst code 
>>>> unexecuted, causes postinst not to finish at first boot
>>>> (lxdm.service is not aliased to display-manager.service -> started
>>>> much too early) and is not neccesary: language preparation can be
>>>> done offline.
>>>> 
>>>> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> ---
>>> This unbreaks 1st boot postinst issue - so I would like to see it
>>> also in dylan (of course also in master :).
>> 
>> \o/
> 
> Not sure what this ascii art means,

It's a cheer: http://en.wikipedia.org/wiki/List_of_emoticons

 but if it's something about pushing
> stuff through narrow bottleneck, then I plan to push more stuff to master
> after this jenkins job is finished: NOTE: Running task 6924 of 26342
> 
> I was trying to test at least qemuarm/qemux86 before branching and there 
> was a lot of rebuilds... More ACKs on patches on ML helps a lot.

Still rebuilding dylan branches for a few machines to test, on a laptop :/

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRekGVMkyGM64RGpERAnKjAJwJnAm6slXhV+ITveWLx7t7+0vEWACfY8XO
FgeL+JHAcYJoyocoFx86Bi4=
=9PL9
-----END PGP SIGNATURE-----



