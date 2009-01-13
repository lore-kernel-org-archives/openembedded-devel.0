Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LMjaw-0004qJ-QH
	for openembedded-devel@openembedded.org; Tue, 13 Jan 2009 14:46:14 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LMjUb-0004dT-Nw
	for openembedded-devel@openembedded.org; Tue, 13 Jan 2009 13:39:41 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 13 Jan 2009 13:39:41 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 13 Jan 2009 13:39:41 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 13 Jan 2009 14:39:27 +0100
Message-ID: <gki5if$jm$1@ger.gmane.org>
References: <496C9495.40003@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <496C9495.40003@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: allow subdir for SRC_URI entries
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
X-List-Received-Date: Tue, 13 Jan 2009 13:46:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-01-09 14:18, Robert Schuster wrote:
> Hi folks,
> I desperately need this patch. ;)
>
> It allows one to specify ";subdir=<DIR>" in SRC_URI entries. Having the
> effect that the respective file is either unpacked or copied into that
> very directory which is treated as:
>
> ${WORKDIR}/<DIR>
>
> It is not really ${WORKDIR} but the cwd when do_unpack is run. In most
> cases this is ${WORKDIR}. If it is something else the recipe writer will
> have a reason for that.
>
> With this patch we can finally deal easily with tarbombs.

I have another use case:

Multiple git:// uris in SRC_URI.

When building ffmpeg from git you need to checkout libswscale from git 
as well and move it in ${S}, which breaks since *every* git repo is put 
in WORKDIR/git

While speaking about the git fetcher:

foo_2.0+git.bb: git://foo/bar;branch=pm
foo_2.1+git.bb: git://foo/bar;branch=master

That will trigger a russian roulette which branch it's going to fetch or 
unpack, you can end up with 2.1+git trying to checkout the pm branch.

regards,

koen



