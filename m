Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NHgYY-0003yj-8d for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 17:35:29 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NHgWy-0001QT-9K
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 17:33:48 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 17:33:48 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 17:33:48 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 07 Dec 2009 17:33:26 +0100
Message-ID: <hfjaon$111$1@ger.gmane.org>
References: <4B1D222A.90105@kernelconcepts.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <4B1D222A.90105@kernelconcepts.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] gtk+ and fonts
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
X-List-Received-Date: Mon, 07 Dec 2009 16:35:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-12-09 16:41, Florian Boor wrote:
> Hi,
>
> our current GTK+ packages recommend a single Truetype font (ttf-dejavu-sans).
> This might pull in a quite large font collection that might be different from
> what the user wants. For a Japanese image e.g. you might not want these at all
> or you might just want different fonts (like the Android ones).
>
> I would be fine removing this RRECOMMENDS entry without any replacement. Another
> option would be to create a virtual provider for basic ttf fonts and define a
> matching run time dependency.
>
> What do you think?

I added that RECOMMENDS years ago to ensure people have a working 
system. Are you volunteering to fix up all images and tasks containing 
gtk+ apps to include at least one font?
In your japanese android usecase people can just install their favourite 
japanese font and use BAD_RECOMMENDATIONS to uninstall ttf-deja-sans at 
do_rootfs time.

I fail to see how your proposals don't regress things for the majority 
of our current users.


regards,

Koen



