Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LaGMJ-0001Zc-Cd
	for openembedded-devel@openembedded.org; Thu, 19 Feb 2009 22:23:03 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LaGJz-0004Aj-To
	for openembedded-devel@openembedded.org; Thu, 19 Feb 2009 21:20:40 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 19 Feb 2009 21:20:39 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Feb 2009 21:20:39 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 19 Feb 2009 22:20:29 +0100
Message-ID: <gnkieu$k8b$1@ger.gmane.org>
References: <1235074713.6859.210.camel@alap>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <1235074713.6859.210.camel@alap>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] add autostart PACKAGE to paroli recipe
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
X-List-Received-Date: Thu, 19 Feb 2009 21:23:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-02-09 21:18, Angus Ainslie wrote:

> +       mkdir -p ${D}/home/root/.e/e/config/illume/
> +       install ${S}/data/module.illume.cfg
> ${D}/home/root/.e/e/config/illume/
> +       install ${S}/data/e.cfg ${D}/home/root/.e/e/config/illume/
> +       mkdir -p ${D}/home/root/.e/e/themes
> +       install ${S}/data/illume.edj ${D}/home/root/.e/e/themes

NACK, a package is NEVER EVER allowed to touch /home/*, NEVER. Caps used 
to get the point accross.

regards,

Koen



