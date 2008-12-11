Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LAiW7-0008Vh-3p
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 11:11:35 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LAiS8-00062N-EV
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 10:07:28 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 11 Dec 2008 10:07:28 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 11 Dec 2008 10:07:28 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 11 Dec 2008 11:07:18 +0100
Message-ID: <ghqoon$i0u$1@ger.gmane.org>
References: <20081210234910.GA16050@excalibur.local>
	<49405BD7.2010801@gmx.de>	<ghqjue$4fe$1@ger.gmane.org>
	<d1b08f940812110137g3369f156rfff59659b48b788f@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081205 Shredder/3.0b2pre
In-Reply-To: <d1b08f940812110137g3369f156rfff59659b48b788f@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Ship dbus config and dbus service activation files
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
X-List-Received-Date: Thu, 11 Dec 2008 10:11:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-12-08 10:37, Andrea Adami wrote:
> About connman, last time I built it I noticed it depends on
> 'resolvconf' which depends on 'bash'.
>
> Is it right?

It's right in so far that resolvconf is full of bashims. It would make 
more sense to use openresolv (http://roy.marples.name/node/343) to avoid 
dragging in bash. More to the point, OE's bash doesn't use u-a *and* 
doesn't register itself with /etc/shells, so resolvconf is broken.

regards,

Koen


>
>
> TIA
>
> Andrea




