Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OshKB-0006TK-0q
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 21:26:23 +0200
Received: (qmail 5524 invoked by uid 503); 6 Sep 2010 19:47:35 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 6 Sep 2010 19:47:35 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 6 Sep 2010 21:25:13 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 6 Sep 2010 21:25:12 +0200
Message-ID: <4C854014.4040001@eukrea.com>
Date: Mon, 06 Sep 2010 21:25:08 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.8) Gecko/20100802 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283799112-7092-1-git-send-email-eric@eukrea.com>
	<AANLkTi=deo+Lhpy1UCwkzi15dPuUE=6K7cx+qKaPE4t4@mail.gmail.com>
In-Reply-To: <AANLkTi=deo+Lhpy1UCwkzi15dPuUE=6K7cx+qKaPE4t4@mail.gmail.com>
X-Ovh-Tracer-Id: 4618441419690650953
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake: lib/bb/fetch/hg: fix fetching from a mercurial repository
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
X-List-Received-Date: Mon, 06 Sep 2010 19:26:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 06/09/2010 21:20, Frans Meulenbroeks a écrit :
> 2010/9/6 Eric Bénard<eric@eukrea.com>:
>> * without this fix, we get :
>> updating working directory
>> 74 files updated, 0 files merged, 0 files removed, 0 files unresolved
>> abort: There is no Mercurial repository here (.hg not found)!
>>
>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>> Tested-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
>> ---
>>   lib/bb/fetch/hg.py |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/lib/bb/fetch/hg.py b/lib/bb/fetch/hg.py
>> index d075638..bb156ed 100644
>> --- a/lib/bb/fetch/hg.py
>> +++ b/lib/bb/fetch/hg.py
>> @@ -138,6 +138,7 @@ class Hg(Fetch):
>>         # Even when we clone (fetch), we still need to update as hg's clone
>>         # won't checkout the specified revision if its on a branch
>>          updatecmd = self._buildhgcommand(ud, d, "update")
>> +        os.chdir(ud.moddir)
>>          bb.msg.debug(1, bb.msg.domain.Fetcher, "Running %s" % updatecmd)
>>          runfetchcmd(updatecmd, d)
>>
>> --
>> 1.6.3.3
>
> I understood from Eric that even with this patch one needs mercurial
> installed on the host.
> I did install it before, and have not tested without it, but with
> mercurial installed and this patch hg recipes (like ushare) work.
>
if mercurial is not installed on the host, the error is :
/usr/bin/env: hg: No such file or directory

Eric


