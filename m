Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O7NsT-00081I-52 for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 09:09:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O7Nod-0001aX-8A for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 09:05:43 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 09:05:43 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 09:05:43 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 29 Apr 2010 09:05:31 +0200
Message-ID: <hrbb3r$dkf$1@dough.gmane.org>
References: <4BD5BE2F.7030407@mwester.net>	<1272491340.3865.806.camel@trini-m4400>
	<z2jb6ebd0a51004281652pc34c3e99zb1b54788fd5213d3@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <z2jb6ebd0a51004281652pc34c3e99zb1b54788fd5213d3@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Fix: stage hidden files as well
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
X-List-Received-Date: Thu, 29 Apr 2010 07:09:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-04-10 01:52, Chris Larson wrote:
> On Wed, Apr 28, 2010 at 2:49 PM, Tom Rini <tom_rini@mentor.com> wrote:
> 
>> On Mon, 2010-04-26 at 11:24 -0500, Mike Westerhof wrote:
>>> The following patch is a proposed patch to fix the problem where hidden
>>> files are sometimes missed during staging.  A specific example is that
>>> the symbolic link ".config" is not copied to the kernel staging area,
>>> which causes madwifi-ng to fail to build.
>>>
>>> diff --git a/classes/staging.bbclass b/classes/staging.bbclass
>>> index 32038a5..cb19cb9 100644
>>> --- a/classes/staging.bbclass
>>> +++ b/classes/staging.bbclass
>>> @@ -35,6 +35,13 @@ sysroot_stage_dir() {
>>>         if [ -d "$src" ]; then
>>>                 mkdir -p "$dest"
>>>                 cp -fpPR "$src"/* "$dest"
>>> +               # Get hidden files as well, but carefully
>>> +               for i in "$src"/.*
>>> +               do
>>> +                       if [ "$i" != "$src"/. -a "$i" != "$src"/.. ];
>> then
>>> +                              cp -fpPR "$i" "$dest"
>>> +                       fi
>>> +               done
>>>         fi
>>>  }
>>>
>>> If anyone has a better way to address the copy operations above, that
>>> would be great.
>>
>> So, I said this on IRC, but more formally, how about just for i in
>> "$src"/.??* do as this lets us know we don't have '.' or '..', and if we
>> skip out on '.a' or something being installed, that reeks of a bug in
>> the program in question that should be fixed anyways (and would
>> catch .config and others).
> 
> 
> Alternatively, could for i in "$src".[a-zA-Z]*, I doubt we care about
> dotfiles starting with a number.

rm_work needs a similar fix. In webkit gtk we set S to WORKDIR and
rm_work skips the 2 gigabyte .libs directory.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL2S+6MkyGM64RGpERAgmlAJ4yDKxJ/JDNf71meEOkVK+iUHPXpQCgt1ex
U3fzV/UiLdmSYklkcU1seMw=
=bpD4
-----END PGP SIGNATURE-----



