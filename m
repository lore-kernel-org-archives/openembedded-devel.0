Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L6Uas-0000rI-2D
	for openembedded-devel@openembedded.org; Sat, 29 Nov 2008 19:31:02 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L6UXg-0002vs-Jf
	for openembedded-devel@openembedded.org; Sat, 29 Nov 2008 18:27:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 29 Nov 2008 18:27:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 29 Nov 2008 18:27:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 29 Nov 2008 19:27:37 +0100
Message-ID: <ggs1ip$38h$1@ger.gmane.org>
References: <ggrstm$eh8$1@ger.gmane.org>
	<1227982104.23391.314.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <1227982104.23391.314.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: adduser question
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
X-List-Received-Date: Sat, 29 Nov 2008 18:31:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29-11-08 19:08, Phil Blundell wrote:
> On Sat, 2008-11-29 at 18:08 +0100, Koen Kooi wrote:
>> adduser --system adds UIDs<100 to /etc/passwd, which 'update-passwd'
>> will blow away, since they aren't in /usr/share/base-passwd/passwd.master
>>
>> Is this intended behaviour, and if not, how should it get fixed?
>
> Whether or not to use passwd.master and update-passwd is clearly a
> distribution choice.  Any distro which does want to use a
> centrally-administered master password file should, presumably, also
> configure adduser with an appropriate system UID range (for example,
> 100-999).  Depending on what implementation of adduser you are using,
> this might just be a case of adjusting adduser.conf or it might involve
> a recompile.
>
> For distros which don't desire to use passwd.master, the right solution
> is simply to refrain from installing or running update-passwd.  In this
> case it doesn't matter what UID range adduser is set up for.

Thanks for the explanation, I'll have a stab at adding a proper adduser 
since we only have the busybox one in OE. The busybox adduser doesn't 
seem to support adduser.conf nor UID ranges.

regards,

Koen



