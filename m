Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1Rcf9f-000352-O5
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Dec 2011 16:29:31 +0100
Received: by wibhq7 with SMTP id hq7so1016709wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2011 07:22:29 -0800 (PST)
Received: by 10.216.131.155 with SMTP id m27mr7238758wei.19.1324308149025;
	Mon, 19 Dec 2011 07:22:29 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id eg7sm26229785wib.8.2011.12.19.07.22.27
	(version=SSLv3 cipher=OTHER); Mon, 19 Dec 2011 07:22:28 -0800 (PST)
Message-ID: <4EEF56B3.7000909@dresearch-fe.de>
Date: Mon, 19 Dec 2011 16:22:27 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Tom Rini <tom.rini@gmail.com>
References: <cover.1323862499.git.sledz@dresearch-fe.de>
	<CA+M6bXk57+wbvAzkLrZVDPCvhGFLH8A-A3ESNnW_-Yk=TiDfLw@mail.gmail.com>
	<4EE995AB.5090503@dresearch-fe.de>
	<4EEEE51E.6040306@dresearch-fe.de>
	<CA+M6bXn5CCfETj1qctbPyCt5qB4=9em-K2af78x0W6QEA2ZxsQ@mail.gmail.com>
In-Reply-To: <CA+M6bXn5CCfETj1qctbPyCt5qB4=9em-K2af78x0W6QEA2ZxsQ@mail.gmail.com>
X-Enigmail-Version: 1.3.4
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/5] pull request 20111214
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
X-List-Received-Date: Mon, 19 Dec 2011 15:29:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.12.2011 15:39, Tom Rini wrote:
> On Mon, Dec 19, 2011 at 12:17 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> On 15.12.2011 07:37, Steffen Sledz wrote:
>>> Am 14.12.2011 19:07, schrieb Tom Rini:
>>>> On Wed, Dec 14, 2011 at 4:40 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>>>>> Hi Tom,
>>>>>
>>>>> please pull these 5 commits cherry-picked from oe.dev.
>>>>> All of them are bugfixes and tested in our own environment.
>>>>>
>>>>> Thx,
>>>>> Steffen
>>>>>
>>>>> The following changes since commit 9826895e30baa597a5ec433cc0ebd52f5f6c8796:
>>>>>
>>>>>  Merge remote-tracking branch 'upstream/2011.03-maintenance' into sledz/maintenance (2011-12-09 14:06:08 +0100)
>>>>>
>>>>> are available in the git repository at:
>>>>>
>>>>>  git://git.openembedded.org/openembedded sledz/maintenance
>>>>>  http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=sledz/maintenance
>>>>>
>>>>> Stefan Schmidt (2):
>>>>>  llvm2.7_2.7: Add patch for build errors on newer gcc / glibc
>>>>>    combinations
>>>>>  llvm2.7_2.7.bb: Update patch to use c++ include style.
>>>>>
>>>>> Steffen Sledz (3):
>>>>>  live555: replace version 20110314 with 20111120
>>>>>  icedtea6-native: fix problem on build hosts with linux kernel 3.x
>>>>>  openjdk: fix problem on build hosts with linux kernel 3.x
>>>>
>>>> Only 1 2 and 3 made it to the ML.
>>>
>>> Please have a second look. They all should be there.
>>>
>>>> 1 and 2 are fine.  For 3, we should
>>>> grab the old file (someone must have a copy) and stick that on
>>>> sources.openembedded.org.
>>>
>>> The version replacement is not just for the well known live555 download problem. It fixes some other problems too. Also the version introduced by this patch is already uploaded to sources.openembedded.org and the angstrom mirrors.
>>
>> Ping!
> 
> Sorry for the delay.  Especially since I'm now going to ask you to
> rebase the branch.  Here's what I get after merging your request:
> $ git log --oneline origin..
> b6cc3be87 Merge branch 'sledz/maintenance' of git://git.openembedded.org/openemb
> eda1aaf openjdk: fix problem on build hosts with linux kernel 3.x
> 4500148 icedtea6-native: fix problem on build hosts with linux kernel 3.x
> cb5b2fb live555: replace version 20110314 with 20111120
> 3904feb llvm2.7_2.7.bb: Update patch to use c++ include style.
> a992bc4 llvm2.7_2.7: Add patch for build errors on newer gcc / glibc combination
> 9826895 Merge remote-tracking branch 'upstream/2011.03-maintenance' into sledz/m
> ebb70fd gypsy: update to latest upstream version 0.8, and remove version 0.7
> 69186cf gypsy: move generic SRC_URI part to gypsy.inc
> 7f9e803 gypsy: fix packaging of DBus starter script
> 45b8af8 rsyslog: change path for config includes to /etc/rsyslog.d
> 77a5200 Revert "gypsy: fix packaging of DBus starter script"
> 105f8ae Revert "gypsy: move generic SRC_URI part to gypsy.inc"
> 701d1cb Revert "gypsy: update to latest upstream version 0.8, and remove version
> 593bb51 Revert "rsyslog: change path for config includes to /etc/rsyslog.d"
> de3065d gypsy: update to latest upstream version 0.8, and remove version 0.7
> dbb8899 gypsy: move generic SRC_URI part to gypsy.inc
> 9bef377 gypsy: fix packaging of DBus starter script
> 772286e Merge remote-tracking branch 'upstream/2011.03-maintenance' into sledz/m
> ef52795 rsyslog: change path for config includes to /etc/rsyslog.d
> 
> I'm sure it's all unintentional.

The pull request contains the last five commits only ("The following changes since commit 9826895e30baa597a5ec433cc0ebd52f5f6c8796").

Maybe i need some help in using git here. How should i prepare my branch to fulfil your requirements?

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


