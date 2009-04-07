Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LrExZ-0000wn-Eo
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 19:20:36 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LrEui-0001Ge-Is
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 17:16:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 07 Apr 2009 17:16:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 07 Apr 2009 17:16:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 07 Apr 2009 19:16:33 +0200
Message-ID: <grg1ph$14n$1@ger.gmane.org>
References: <1239117404-2263-1-git-send-email-dhuggins@cs.cmu.edu>	<20090407164400.GD2195@smtp.west.cox.net>
	<49DB854A.4070908@cs.cmu.edu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <49DB854A.4070908@cs.cmu.edu>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	FB_WORD1_END_DOLLAR, RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] fix GCC 4.3.3 sources in stable/2009 branch
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
X-List-Received-Date: Tue, 07 Apr 2009 17:20:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-04-09 18:54, David Huggins-Daines wrote:
> Tom Rini wrote:
>>
>> First, this is fixed in .dev now, by fixing all of the gcc recipes
>> (except for csl ones) to use ${GNU_MIRROR} and updating the checksums
>> file. Second, ftp.gnu.org/gnu is correct as 'pub' is just a symlink to
>> '.'.
> Yeah, actually, after trying to rebuild, I agree. Changing bitbake.conf
> is a very bad idea.
>
> However I still think the changes to the gcc recipes and checksums.ini
> should be merged into the stable branch, otherwise it is not possible to
> build any recent versions of GCC (and in particular, thumb support seems
> not to work properly without using 4.3.3)

Anyone is free to send a patch to this mailinglist to add to stable. 
It's really easy:

Powerbook-3:openembedded koen$ cat contrib/mail-diff.sh
#!/bin/sh

# This script will fetch an 'mbox' patch from patchwork and git am it
# usage: mail-diff.sh <rev>
# example: 'pw-am.sh 3a485444f0dd07fd2315769db3f6f46e3972134e'

PATCHNAME="$(git format-patch -s -1 $1)"
sed -i -e 's:\[PATCH:\[STABLE\]\[PATCH:g' $PATCHNAME
git send-email --from "Koen Kooi <k.kooi@student.utwente.nl>" --to 
openembedded-devel@lists.openembedded.org $PATCHNAME
rm $PATCHNAME

regards,

Koen



