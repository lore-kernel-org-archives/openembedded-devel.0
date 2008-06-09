Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K5elY-0002Dz-JX
	for openembedded-devel@openembedded.org; Mon, 09 Jun 2008 12:38:20 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K5egO-0007JN-Cw
	for openembedded-devel@openembedded.org; Mon, 09 Jun 2008 10:33:00 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 09 Jun 2008 10:33:00 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 09 Jun 2008 10:33:00 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 09 Jun 2008 12:32:47 +0200
Message-ID: <g2j0sf$gs1$1@ger.gmane.org>
References: <g2h415$pk1$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052703)
In-Reply-To: <g2h415$pk1$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: pkg_postinst_* not working anymore -> broken packages
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
X-List-Received-Date: Mon, 09 Jun 2008 10:38:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Hi,
>
> Lately I have been wondering why things like avahi and umount don't work
> properly any more in angstrom 2008, and I found out why:
>
> OE (and/or bitbake) ignores pkg_postinst_*

FWIW, if you see a recipe doing this:

pkg_postinst() {
  <content>
}

then kill it with fire! pkg_postinst() will apply to *each* and *every* 
entry in PACKAGES, so ${PN}-dev and ${PN}-doc as well as ${PN}-dbg will 
get the postinsts in their control files.



