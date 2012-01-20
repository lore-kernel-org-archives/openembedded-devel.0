Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RoCni-00041H-Kz for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 12:38:34 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RoCgH-00007V-Ub for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 12:30:53 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2012 12:30:53 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2012 12:30:53 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 Jan 2012 12:30:38 +0100
Message-ID: <jfbj8u$t2v$1@dough.gmane.org>
References: <cover.1327002701.git.anders@chargestorm.se>
	<ba787e718994267f09ff11b8b4122d536175bffc.1327002701.git.anders@chargestorm.se>
	<jfa3vv$3ks$1@dough.gmane.org>
	<CAP9ODKoOkSrjWi27BT2Rv9v5oM37fP5fL5oLH8oDB54QJLdczg@mail.gmail.com>
	<jfb56e$f67$1@dough.gmane.org>
	<CAE4k23_pqVFr+VTtnVAqEQh0xqNfoF94py+p-4VkzwX7MCCiBA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <CAE4k23_pqVFr+VTtnVAqEQh0xqNfoF94py+p-4VkzwX7MCCiBA@mail.gmail.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe][PATCH v4 2/2] systemd: conditionally RRECOMMENDS kbd*
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
X-List-Received-Date: Fri, 20 Jan 2012 11:38:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-01-12 09:01, Anders Darander schreef:
> On Fri, Jan 20, 2012 at 08:30, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> Op 20-01-12 04:33, Otavio Salvador schreef:
>>> On Thu, Jan 19, 2012 at 20:03, Koen Kooi
>>> <koen@dominion.thruhere.net> wrote:
>>>> Op 19-01-12 20:53, Anders Darander schreef:
>>>>> Let the distro define a keyboard distro feature, to
>>>>> conditionally include kbd*. (Headless distros might not want to
>>>>> RRECOMMENDS kbd*).
>>>> 
>>>> DISTRO_FEATURES is the wrong thing for that, so I'm going to NAK
>>>> it.
>>>> 
>>> 
>>> What would be your suggestion for this then? I see no other
>>> alternative then distro feature.
>> 
>> See what needs kbd and split it out, like we did with vconsole.
>> Actually... git grep implies that vconsole is the bit that needs kbd
>> :)
> 
> Ah, so the RRECOMMENDS were never moved to the systemd-vconsole package
> when it was split? If that's the only thing depending on kbd, then sure,
> I'll get you a new patch moving the RRECOMMENDS on kbd* to 
> systemd-vconsole. Again, it'll take a few days before I get the time to
> do it.

r10 should fix the issue you were seeing, let me know if it needs other changes.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8ZUFwACgkQMkyGM64RGpGmJQCeLArWlncBhmKtJuys+uU9wWvc
fBsAnjSVPp59H+xUJmEnc9rxMplHwZoR
=l4IL
-----END PGP SIGNATURE-----



