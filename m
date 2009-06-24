Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJakJ-0004p2-2C
	for openembedded-devel@openembedded.org; Thu, 25 Jun 2009 00:15:11 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MJaZS-00028V-Kd
	for openembedded-devel@openembedded.org; Wed, 24 Jun 2009 22:03:58 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 24 Jun 2009 22:03:58 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 24 Jun 2009 22:03:58 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 25 Jun 2009 00:03:46 +0200
Message-ID: <h1u7s2$b8l$1@ger.gmane.org>
References: <1245871136.5939.3.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245871136.5939.3.camel@utx.utx.cz>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] introduction of virtual/libusb0
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
X-List-Received-Date: Wed, 24 Jun 2009 22:15:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-06-09 21:18, Stanislav Brabec wrote:
> Hallo.
>
> I plan to submit attached patch to oe.dev to fix clash of libusb-compat
> and libusb in recipes by introduction of virtual/libusb0.
>
> libusb-compat and libusb provide exactly the same API and ABI using a
> different back-end, and applications should work with both of them
> without recompilation.

Why not statically link in the old libusb0 to those broken apps? We do 
that for gnuradio (in a hacky way, but it can be made generic) and it 
works well.

regards,

Koen



