Received: from [91.198.206.2] (helo=mail.smartlink.ee)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kalev@smartlink.ee>) id 1Kl1Ut-0008Jj-4V
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Oct 2008 15:12:07 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.smartlink.ee (Postfix) with ESMTP id C14D630EC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 16:07:59 +0300 (EEST)
Received: from mail.smartlink.ee ([127.0.0.1])
	by localhost (mail.smartlink.ee [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CnpS5rd2NMM5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 16:07:58 +0300 (EEST)
Received: from [192.168.2.59] (wumpus.smartlink [192.168.2.245])
	by mail.smartlink.ee (Postfix) with ESMTP id 64E2130D6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 16:07:58 +0300 (EEST)
Message-ID: <48E3762E.6000203@smartlink.ee>
Date: Wed, 01 Oct 2008 16:07:58 +0300
From: Kalev Lember <kalev@smartlink.ee>
User-Agent: Thunderbird 2.0.0.17 (X11/20080926)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48E36C18.4090504@smartlink.ee>
	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>
In-Reply-To: <873ajglc0d.fsf@neumann.lab.ossystems.com.br>
Subject: Re: git master not updating
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
X-List-Received-Date: Wed, 01 Oct 2008 13:12:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Otavio Salvador wrote:
> Kalev Lember <kalev@smartlink.ee> writes:
>
>   
>> Hello,
>>
>> http://gitweb.openembedded.net/?p=org.openembedded.dev.git;a=summary
>> The master head of org.openembedded.dev is not updating. I already
>> spotted two bug reports (4584 and 4590) which reported issues that were
>> fixed in monotone 4 days ago, but never got into git master.
>>     
>
> org.openembedded.dev branch is up to date. I'm using it.
>
>   
Well yes, but if you just do:
git clone git://git.openembedded.net/org.openembedded.dev

you'll end up on master branch, which is not updating.

$ git clone git://git.openembedded.net/org.openembedded.dev
Initialized empty Git repository in
/home/kalev/tmp/org.openembedded.dev/.git/
remote: Counting objects: 172765, done.
remote: Compressing objects: 100% (66031/66031), done.
remote: Total 172765 (delta 117875), reused 155868 (delta 106016)
Receiving objects: 100% (172765/172765), 81.65 MiB | 1116 KiB/s, done.
Resolving deltas: 100% (117875/117875), done.
Checking out files: 100% (20330/20330), done.
$ cd org.openembedded.dev/
$ git status
# On branch master
nothing to commit (working directory clean)
$ git log | head
commit af6706689123f82a525f2f716cbc54b3e9154814
Author:  <koen@openembedded.org>
Date:   Fri Sep 26 16:03:59 2008 +0000

    feed browser: add screenshot support, update angstrom sample config

commit 44b0c01116c767d57a648981f8d57133fefc7954
Author:  <koen@openembedded.org>
Date:   Fri Sep 26 15:04:45 2008 +0000


-- 
Kalev


