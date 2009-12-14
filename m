Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NKI1d-00076X-7f
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 22:00:16 +0100
Received: (qmail 24135 invoked by uid 1003); 14 Dec 2009 20:58:26 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 14 Dec 2009 20:58:26 -0000
Message-ID: <4B26A6F0.6040706@balister.org>
Date: Mon, 14 Dec 2009 15:58:24 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0912140512120.21693@localhost>	<20091214102214.GM3601@jama>
	<alpine.LFD.2.00.0912141041310.29685@localhost>
In-Reply-To: <alpine.LFD.2.00.0912141041310.29685@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: test build just finished, three failed package builds
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
X-List-Received-Date: Mon, 14 Dec 2009 21:00:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/2009 10:42 AM, Robert P. J. Day wrote:
> On Mon, 14 Dec 2009, Martin Jansa wrote:
>
>> On Mon, Dec 14, 2009 at 05:13:32AM -0500, Robert P. J. Day wrote:
>>>
>>>    just this minute, my latest build attempt for beagle demo image off
>>> of dev branch produced:
>>>
>>> ERROR: '/home/rpjday/oe/openembedded/recipes/mesa/mesa-dri_7.0.3.bb' failed
>> We probably need those patches from DJWillis
>> http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=e6f17d1cc03bdd90c575b7e2bd482932e53ba9c0
>> http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=60b64bead81643e5c97c29abc4574c66398b3ebb
>> http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=f8b4d26e7cfe06bfc8474df50035b886045a0324
>> http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=de272c2db0e37b72bfa55268a2e383c906ee0680
>> http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=63144b3bb0e035d3f8109fb907bb018694f2a9f0
>>
>> Or I can set PREFERRED_PROVIDER_virtual/libgl to "mesa" instead of
>> "mesa-dri" in compatibility_providers.conf or maybe it should be set on
>> distro/machine level.
>
>    if someone pushes some patches for the current build fails on
> fedora, mention that here and i'll be happy to pull and retest the dev
> branch.

I've cherry-picked these from openpandora. If it builds, or at least 
gets past mesa stuff, I'll push.

Philip


