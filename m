Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LMmUK-0001Js-Tb
	for openembedded-devel@openembedded.org; Tue, 13 Jan 2009 17:51:36 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LMmNy-0003r7-9p
	for openembedded-devel@openembedded.org; Tue, 13 Jan 2009 16:45:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 13 Jan 2009 16:45:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 13 Jan 2009 16:45:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 13 Jan 2009 17:40:58 +0100
Message-ID: <gkig6q$alf$2@ger.gmane.org>
References: <c16a574a0901130824w742cc8bera0f17d66d12c0e1@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <c16a574a0901130824w742cc8bera0f17d66d12c0e1@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Request for inclusion of euphony_0.1.1.bb to the tree
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
X-List-Received-Date: Tue, 13 Jan 2009 16:51:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-01-09 17:24, thomasg wrote:
> Hi,
>
> I've written a small application I'd like to have added to OE.
> It has no influence on other packages, so there shouldn't be any problems.
> Because I don't know if the OE mailman delivers attached files
> properly I'll just add a link to the .bb.
> You can find it on: http://projects.gstaedtner.net/euphony/euphony_0.1.1.bb
> As you can see the name of the application is "Euphony" :)
> If there are any further questions, feel free to reply.
> I'm not really sure if this is the right place to ask for this, but I
> was told in #oe that oe-devel is the right place to go.

You don't need to inherit pkgconfig if you don't stage anything. And 
even if you did, setting AUTOTOOLS_STAGE_PKGCONFIG = "1"
  would be preferable over pkgconfig.bbclass

regards,

Koen



