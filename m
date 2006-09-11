Received: from [81.255.54.11] (helo=mx.laposte.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <c.romain@laposte.net>) id 1GMe7c-0006tD-Eh
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Sep 2006 07:14:16 +0200
Received: from [192.168.2.2] (86.213.108.18) by mx.laposte.net (7.2.060.1)
	(authenticated as c.romain)
	id 44F4DDC800753877 for openembedded-devel@lists.openembedded.org;
	Mon, 11 Sep 2006 07:10:23 +0200
Message-ID: <4504E1CE.4020901@laposte.net>
Date: Mon, 11 Sep 2006 06:10:54 +0200
From: cyril Romain <c.romain@laposte.net>
User-Agent: Mail/News 1.5 (X11/20060114)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <20060910234900.GA25953@twibble.org>
In-Reply-To: <20060910234900.GA25953@twibble.org>
Subject: Re: sanitize.py
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Sep 2006 05:14:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jamie Lenehan wrote:
> Nice work on sanitize.py, I like it!
>
> Here's a few things I'd like to see changed:
>
> * For initscripts the order should be:
>
>   <snip>
>
> * It doesn't know about pre/post rm/install scripts (maybe it's not
>   meant to?):
>
>   ## Warning: unknown variable/routine "pkg_prerm_${PN} () {"
>   ## Warning: unknown variable/routine "        ${sysconfdir}/init.d/quagga stop"
>   ## Warning: unknown variable/routine "}"
>   ## Warning: unknown variable/routine "pkg_prerm_${PN}-ospfd () {"
>   ## Warning: unknown variable/routine "        ${sysconfdir}/init.d/quagga stop ospfd"
>   ## Warning: unknown variable/routine "}"
>
>   

Hi Jamie,

Thanks you for your feedback.
I'll work on that asap and keep in touch with you.

FYI, the sanitize script script is going to be part of the bittest 
content_checker.

Stay tuned,

  Cyril


