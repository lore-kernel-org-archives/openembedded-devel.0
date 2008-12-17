Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LCx73-0002ZO-81
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 15:10:57 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LCx2a-0005rb-EO
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 14:06:20 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 17 Dec 2008 14:06:20 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Dec 2008 14:06:20 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Dec 2008 15:06:10 +0100
Message-ID: <gib10j$i28$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081211 Shredder/3.0b2pre
Sender: news <news@ger.gmane.org>
Subject: [RFC] collapse commits in branches to easy review
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
X-List-Received-Date: Wed, 17 Dec 2008 14:10:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I want to propose that when people want to have a branch reviewed for 
merging that has a lot of commits (e.g. more than 30) that the commits 
get 'collapsed' to one diff per recipe/directory or per functional 
change. Collapsing it would be something like:

git diff .dev .merges | diffsplit

and then writing a simple script that cats the remaing files together 
based on directory (e.g. awk -F- {if $1==$2 then cat file to $3.diff)}. 
The diffsplit script can be found at [1].

If you have a functional change (e.g. like PR -> FILEPR) that can of 
course stay in one diff.

If review branches get organized like this we can more easily review 
them and suggest changes.

We will loose some history this way, but branches can get merged faster 
and it would stop huge piles of crap going in, which IMO outweighs the 
downsides.

Big branches CANNOT be merged without proper review, but I don't think 
anyone wants to review a few hundred commits :/

So, what do you think about this?


regards,

Koen


[1] http://www.pathname.com/~quinlan/software/diffsplit/diffsplit



