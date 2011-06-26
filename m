Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1Qalgd-00032c-OJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Jun 2011 11:31:27 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 4A0C1799015; Sun, 26 Jun 2011 11:27:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-071-243-109.pools.arcor-ip.net
	[88.71.243.109]) by gravedo.de (Postfix) with ESMTPSA id 8DE80799012
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jun 2011 11:27:50 +0200 (CEST)
Message-ID: <4E06FB94.7080300@gravedo.de>
Date: Sun, 26 Jun 2011 11:27:48 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0b2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1308951671.6255.14.camel@mattotaupa>
In-Reply-To: <1308951671.6255.14.camel@mattotaupa>
Subject: Re: libgisi: task compile fails with `posix-ext.vapi:7.5-7.30: error: `Posix' already contains a definition for `INET_ADDRSTRLEN'`
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
X-List-Received-Date: Sun, 26 Jun 2011 09:31:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 24.06.2011 23:41, Paul Menzel wrote:
> Dear OE folks,
>
>
> task compile of libgisi c993ee694ea98597d619a1ffae397d3416233354 fails
> with the following error using `minimal` for `MACHINE = "beagleboard"`.
>
>
>          /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/bin/valac -C --basedir .. --vapidir ../data --vapidir ../vapi --pkg glib-2.0 --pkg gio-2.0 --pkg libgisi --pkg posix --pkg posix-ext --header gisicomm.h --library gisicomm-0.0 gisicomm.vala
>          posix-ext.vapi:7.5-7.30: error: `Posix' already contains a definition for `INET_ADDRSTRLEN'
>              const int INET_ADDRSTRLEN;
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^
>          posix.vapi:476.2-476.34: note: previous definition of `INET_ADDRSTRLEN' was here
>                  public const int INET_ADDRSTRLEN;
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>          posix-ext.vapi:8.5-8.31: error: `Posix' already contains a definition for `INET6_ADDRSTRLEN'
>              const int INET6_ADDRSTRLEN;
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>          posix.vapi:478.2-478.35: note: previous definition of `INET6_ADDRSTRLEN' was here
>                  public const int INET6_ADDRSTRLEN;
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>          posix-ext.vapi:4.2-4.25: error: `Posix' already contains a definition for `inet_ntop'
>                  unowned string inet_ntop (int af, void* src, uint8[] dst);
>                  ^^^^^^^^^^^^^^^^^^^^^^^^
>          posix.vapi:485.2-485.25: note: previous definition of `inet_ntop' was here
>                  unowned string inet_ntop (int af, void* src, uint8[] dst);
>                  ^^^^^^^^^^^^^^^^^^^^^^^^
>          Compilation failed: 3 error(s), 0 warning(s)

We need to bump libgisi SRCREV to the latest one:

SRCREV = "ee474b2bf7a10b244d52f5333b195609003762cf"

As with the latest changes to libgisi the mentioned posix-ext is removed 
and it's using only posix as dependency.

Will provide a patch to fix this later.

regards,
Simon


