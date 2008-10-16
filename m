Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KqYuI-0005Xa-Oy
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 21:53:14 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KqYuF-0003Kj-61
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 19:53:11 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 19:53:11 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 19:53:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 16 Oct 2008 21:53:04 +0200
Message-ID: <gd8630$66f$1@ger.gmane.org>
References: <1224184795.4235.133.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <1224184795.4235.133.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Thu, 16 Oct 2008 19:53:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-10-2008 21:19, Phil Blundell wrote:
> I discovered today that xorg-xserver-common.inc has:
>
> RDEPENDS_${PN} = "hal"
>
> which seems a bit undesirable.  I propose to remove this hard-wired
> dependency; any DISTRO who wants to keep it can specify that in their
> own config file.
>
> Any objections?

Yes. Recent xservers need hal for various input systems to work 
correctly. So instead of crippling the xserver you can keep a crippled 
version in your personal tree or overlay.

The rdepends is there because someone has split out libhal main hal 
package, having hal dependant apps break for not being able to contact 
the hal daemon.



