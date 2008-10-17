Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KqspF-0000Y5-1W
	for openembedded-devel@openembedded.org; Fri, 17 Oct 2008 19:09:21 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kqsp7-0001zm-HA
	for openembedded-devel@openembedded.org; Fri, 17 Oct 2008 17:09:13 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 17 Oct 2008 17:09:13 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 17 Oct 2008 17:09:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 17 Oct 2008 19:09:04 +0200
Message-ID: <gdagrg$8l5$1@ger.gmane.org>
References: <1224184795.4235.133.camel@lenovo.internal.reciva.com>	<87fxmwqpe5.fsf@neumann.lab.ossystems.com.br>	<1224233468.30790.125.camel@mill.internal.reciva.com>
	<200810171755.28288.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <200810171755.28288.mickey@vanille-media.de>
Sender: news <news@ger.gmane.org>
Subject: Re: xserver-xorg rdepends
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
X-List-Received-Date: Fri, 17 Oct 2008 17:09:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-10-2008 17:55, Michael 'Mickey' Lauer wrote:
> Phil wrote:
>> Historically, the general policy for RDEPENDS has been that it should
>> list only those packages which are absolutely required for the software
>> in question to do anything useful.  For example, shared libraries
>> without which you can't run the binary at all; interpreters without
>> which you can't invoke the script; supporting datafiles without which
>> the program will immediately crash, that kind of thing.  If the program
>> can run and do at least something useful without a given package being
>> installed, we have not usually considered it to be a hard dependency.
>> These kinds of "soft dependencies" have traditionally been a matter of
>> DISTRO and/or MACHINE policy, being handled either through task
>> packages, PACKAGE_INSTALL, RRECOMMENDS, or some similar mechanism.
>
> I agree. Consider this a vote for turning this into a RRECOMMENDS or dropping
> it completely.

You're a bit behind the times :)

http://gitweb.openembedded.net/?p=openembedded.git;a=commit;h=ada680d9ac7180986f600f223b6ec01c7796dff8




