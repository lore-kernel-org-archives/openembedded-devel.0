Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nm2Gg-0004dU-Ow for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 10:50:27 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nm2Dt-0007MH-Tc for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 10:47:33 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 10:47:33 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 10:47:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 01 Mar 2010 10:47:20 +0100
Message-ID: <hmg2f8$usj$1@dough.gmane.org>
References: <1266605268-5957-1-git-send-email-clarson@kergoth.com>	<hmg0mh$ou0$1@dough.gmane.org>
	<hmg1p8$suj$1@dough.gmane.org>
	<20100301094515.GI30145@xora-desktop.xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <20100301094515.GI30145@xora-desktop.xora.org.uk>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] package.bbclass: when running 'file', be explicit about the path to the magic
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
X-List-Received-Date: Mon, 01 Mar 2010 09:50:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-03-10 10:45, Graeme Gregory wrote:
> On Mon, Mar 01, 2010 at 10:35:36AM +0100, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> I think I know what's happening.
>>
>> On my (debian) buildhost I have file 4.26. (Re)building file-native 5.04
>> gives me:
>>
>> ./staging/x86_64-linux/usr/share/misc/magic.mgc
>>
>> Graeme has file 5.03 on his buildhost and has
>>
>> ./staging/x86_64-linux/usr/share/file/magic
>>
>> So it seems that the buildhost contamination also affects file-native :(
>>
> Its not contamination, its just simply that file 5.XX moved its magic
> file to /usr/share/misc/
> 
> Im still building 4.21 for some reason so dont see this.

Bitbake 1.8.x? I'm using bitbake master from git, that has a different
sorting algo AIUI.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLi40oMkyGM64RGpERAjEIAJ4+rW+07FQBjx9std0w7ZE1tYcdtQCgtgI6
X6RRtXw6ttRVlMSfzyUAUBk=
=QSlm
-----END PGP SIGNATURE-----



