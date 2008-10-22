Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KsgI1-00027O-RZ
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 18:10:29 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1KsgHa-0003QI-C0
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 16:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 22 Oct 2008 16:10:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Oct 2008 16:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Oct 2008 18:07:22 +0200
Message-ID: <gdnj3q$ei6$2@ger.gmane.org>
References: <20081022141057.GA8564@dodger.lab.datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081015 Shredder/3.0b1pre
In-Reply-To: <20081022141057.GA8564@dodger.lab.datenfreihafen.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Some review for the stefan/xo-support branch
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
X-List-Received-Date: Wed, 22 Oct 2008 16:10:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-10-2008 16:10, Stefan Schmidt wrote:
> Hello.
>
> I just pushed a branch which adds a machine file for the XO, aka OLPC, laptop
> and a kernel recipe for it.
>
> This allows me to build images for the xo machine in Angstrom.
>
> I don't see how these commits could break anything, but as it is my first
> machine I would like to get some review/acks before pushing it into the main
> tree.
>
> Only three commits:
> http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=f5fbcf7e4e0228e10fa2c29f802ea0eaabf7a202
> http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=eff435600359d5f13d846be1480de73e8837133d
> http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=ed58062633bdba98098044e94ffce9207300e4be

One comment:

+PV = "2.6-olpc+git${SRCREV}"

That should be:

2.6.34+gitr${SRCREV}

regards,

Koen



