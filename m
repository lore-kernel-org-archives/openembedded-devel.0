Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K7A5d-00041l-Fh
	for openembedded-devel@openembedded.org; Fri, 13 Jun 2008 16:17:18 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K7A5R-0004Bv-Bs
	for openembedded-devel@openembedded.org; Fri, 13 Jun 2008 14:17:05 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 13 Jun 2008 14:17:05 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Jun 2008 14:17:05 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 13 Jun 2008 16:16:53 +0200
Message-ID: <g2tvgn$unq$1@ger.gmane.org>
References: <1213345201.13942.3.camel@dax.rpnet.com>	<74d0deb30806130306tf5ca604t7238ab26d715e03@mail.gmail.com>
	<f96d234e0806130543u7fb1e71an1f75c50a76c0d859@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008060303)
In-Reply-To: <f96d234e0806130543u7fb1e71an1f75c50a76c0d859@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 13 Jun 2008 14:17:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Cliff Brake wrote:
> On Fri, Jun 13, 2008 at 6:06 AM, pHilipp Zabel<philipp.zabel@gmail.com>  wrote:
>> On Fri, Jun 13, 2008 at 10:20 AM, Richard Purdie<rpurdie@rpsys.net>  wrote:
>>> As always, there is a but. This change is conditional on being able to
>>> come up with a sensible commit and review policy for OE.dev. The core
>>> team does feel that the metadata quality has dropped over time in some
>>> areas and we need to have a better review process. The change to an SCM
>>> with good branch support is a vital part of this but not the only part.
>>>
>>> We've not made any decisions on what the commit/review policy should be,
>>> this is open for discussion. We're thinking it may take the form of some
>>> kind of kernel style Signed-off-by: tags and a switch to a partially
>>> pull based model rather than just push based as we use monotone so more
>>> than one developer handles any given change.
>> Personally, I'd like to see every patch to OE being sent to and
>> reviewed on the mailing list.
>> About a pull based model, wouldn't we need something like the kernels'
>> subsystem maintainers to share the load? Seeing that there already
>> seems to be a serious manpower problem, who would have the time to do
>> that?
>
> One of the differences with the OE meta data is that its structure is
> rather flat instead of a nice hierarchy like the kernel.  Another
> problem is an update in one of the core components can often have
> unforeseen consequences in other packages.  So I don't think there is
> any substitute for a lot of testing.  A lot of the work to keep it all
> going is simply busy-work -- updating URI's, adding new versions of
> packages, etc, so I would hate to slow that down.  How about coming up
> with a list of directories/files that need mail list review:
>
> - classes
> - conf/bitbake.conf
> - conf/distro
> - packages/images
> - packages/tasks
> - packages/linux/linux.inc
> - packages/glibc/
> ....
>
> Perhaps with everything else (machines, random packages), it would be
> strongly advised that you get sign-off from the maintainer of that
> recipe if listed.  This would help encourage the maintainers to stay
> involved.

That won't work, since people will 'accidentally' misread the list to 
avoid review.




