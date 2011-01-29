Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PjCFY-0007yd-LT
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 15:58:04 +0100
Received: (qmail 2732 invoked by uid 503); 29 Jan 2011 15:00:20 -0000
Received: from b9.ovh.net (HELO mail193.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 29 Jan 2011 15:00:14 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Jan 2011 16:57:09 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 29 Jan 2011 16:57:07 +0200
Message-ID: <4D442ABF.6030507@eukrea.com>
Date: Sat, 29 Jan 2011 15:57:03 +0100
From: =?windows-1252?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296220547-14948-1-git-send-email-sujak.marek@gmail.com>	<4D430EA4.7000504@eukrea.com>	<AANLkTi=W1L5-7L_jdNhXNu8JsW09GGJ=bO0KTKrFb9Ek@mail.gmail.com>
	<20110129143154.GN2466@ibawizard.net>
In-Reply-To: <20110129143154.GN2466@ibawizard.net>
X-Ovh-Tracer-Id: 3081306571815693641
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH v2] barebox: patches for barebox 2010.10 to	support vmx25
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
X-List-Received-Date: Sat, 29 Jan 2011 14:58:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 29/01/2011 15:31, Petr Štetiar wrote:
> Marek Sujak<sujak.marek@gmail.com>  [2011-01-29 08:34:45]:
>
>> I have  a question about these commits.  Should i reset git to default state
>> (or clone it again) and then commit new files?  Or make commit that will
>> firstly remove these files and them upload them in correct order (firstly
>> raw support, then architecture depended patch)?
>
> If I understand your question correctly, than you don't need to clone/reset
> anything at all. You should just learn git-rebase or maybe just the
> git-cherry-pick for the beginning:
>
> $ git checkout -b oe-upstream origin/master
> $ git cherry-pick -n<hash of '[PATCH v2] barebox: added recipe for barebox v 2010.10'>
> $ vim barebox-recipe # remove the vmx25 bits from the recipe
> $ git add barebox-recipe&&  git commit -a -m 'barebox: added barebox 2010.10'
>
> $ git cherry-pick -n<hash of 'barebox: patches for barebox 2010.10 to support vmx25'>
> $ vim barebox-recipe # add vmx25 bits and vmx25 patch
> $ git add barebox-recipe barebox-vmx25-patch
> $ git commit -a -m 'barebox: add support for vmx25 machine'
>
> $ #test-build the changes now
> $ #git format v3 of your patchset
> $ #review the patches
> $ #git send the patches
>
> BTW, it's really a lot easier and faster with git-rebase, it's worth learning it.
>
yes, for "git rebase --interactive"
look : http://book.git-scm.com/4_interactive_rebasing.html

that will let you edit/amend your commits or squash them together or reorder 
them easily

Eric


