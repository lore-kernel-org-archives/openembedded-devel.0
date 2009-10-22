Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N14NX-0000cL-Uj for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 22:35:27 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N14Ma-0008Uu-0P
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 22:34:24 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 22:34:23 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 22:34:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 22 Oct 2009 22:33:58 +0200
Message-ID: <hbqfjn$4m0$1@ger.gmane.org>
References: <4AE0B157.80807@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <4AE0B157.80807@gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Question about bluez4 and PROVIDES_append_angstrom
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
X-List-Received-Date: Thu, 22 Oct 2009 20:35:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-10-09 21:24, Marco Cavallini wrote:

> This modification looks (to me) related to bluez4 and Angstrom only and
> I wonder why some package recipes (bluez4*.bb) contains some lines that
> strictly ties them to Angstrom distribution breaking other distributions.
>
> Files I found are the following:
> recipes/bluez/bluez4_4.35.bb:PROVIDES_append_angstrom =
>   " bluez-utils bluez-libs"
> recipes/bluez/bluez4_4.37.bb:PROVIDES_append_angstrom =
>   " bluez-utils bluez-libs"
> recipes/bluez/bluez4.inc:PROVIDES_append_angstrom =
>   " bluez-utils-dbus bluez-utils bluez-libs"

It would only 'break' for 'other' distros if they manually enable 
'angstrom' as override. If they do so, they do it at their own risk.
Some grepping shows only DISTRO=openmoko does that and I haven't heard 
any complaints about bluez from those users.
Also, that override only works if you set a PREFERRED_PROVIDER as well.

Having said that, why do you keep blaming angstrom for kaelios problems? 
I keep getting reports (second or third hand info, I admit) about you 
badmouthing angstrom on IRC, which seems to be in fashion lately, but I 
would prefer people to do badmouthing with *actual* problems instead of 
projecting their own. It's not angstroms fault if you missed a few lines 
when copy/pasting from it.

Koen



