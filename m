Received: from mailrelay04.sunrise.ch ([194.158.229.47]
	helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@vollmann.ch>) id 1R0b9F-0005xQ-TF
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 17:31:45 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	p85FQxdm000661; Mon, 5 Sep 2011 17:26:59 +0200
Message-ID: <4E64EA36.4090505@vollmann.ch>
Date: Mon, 05 Sep 2011 17:26:46 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Thunderbird/3.1.13
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <loom.20110905T160251-647@post.gmane.org>
	<09D9BE2AC4AA764DABAA8C91E48D819E02DBCEC1DE@DEMCHP99E35MSX.ww902.siemens.net>
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819E02DBCEC1DE@DEMCHP99E35MSX.ww902.siemens.net>
Subject: Re: Open Embedded and Gumstix
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
X-List-Received-Date: Mon, 05 Sep 2011 15:31:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/11 16:39, Aeschbacher, Fabrice wrote:
> We do this kind of thing by using 'packaged-staging':
>
> - compile the toolchain once on one computer (e.g. 'bitbake meta-toolchain')
> - copy the resulting staging dir ( ${PSTAGE_DIR} )
>   somewhere ( e.g. http://server/pstage )
> - Set PSTAGE_MIRROR in your local.conf (e.g. PSTAGE_MIRROR = http://server/pstage/ )
>
> When then  building on another computer, pre-built packages will be fetched from PSTAGE_MIRROR and not rebuilt. This will drastically speed up build times.
Be aware though that if those machines are not identical
(32/64-bit, different Ubuntu versions, different library versions),
this might break silently.
So it's safer to pre-build and save your packages once for each
machine separately.
But then this will only speed up subsequent builds on the same machine.

   Detlef


