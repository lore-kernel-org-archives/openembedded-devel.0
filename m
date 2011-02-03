Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1Pkv4a-0001AW-KX
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 10:01:52 +0100
Received: from [192.168.0.101] (91-64-83-241-dynip.superkabel.de
	[91.64.83.241])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 4D8091B10C0E;
	Thu,  3 Feb 2011 09:10:39 +0000 (UTC)
Message-ID: <4D4A6EC8.6050601@freyther.de>
Date: Thu, 03 Feb 2011 10:00:56 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch.de>
References: <4D4929CB.6040009@dresearch.de> <4D49552D.3010705@dresearch.de>
	<4D49584D.3010502@freyther.de> <4D4A61DE.8070808@dresearch.de>
In-Reply-To: <4D4A61DE.8070808@dresearch.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: profiling howto?
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
X-List-Received-Date: Thu, 03 Feb 2011 09:01:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/03/2011 09:05 AM, Steffen Sledz wrote:

> Hmmmm? This doesn't seem to work. :(
> 
> If local.conf contains this
>  ------------->snip<------------
>  PROFILE_OPTIMIZATION = "-pg"
> 
>  SELECTED_OPTIMIZATION_pn-libsoup = "${PROFILE_OPTIMIZATION}"
>  LDFLAGS_pn-libsoup =+ "-pg"
> 
>  SELECTED_OPTIMIZATION_pn-libgupnp = "${PROFILE_OPTIMIZATION}"
>  LDFLAGS_pn-libgupnp =+ "-pg"
> 
>  SELECTED_OPTIMIZATION_pn-libgssdp = "${PROFILE_OPTIMIZATION}"
>  LDFLAGS_pn-libgssdp =+ "-pg"
>  ------------->snip<------------

Just a general remark, using bitbake -e -b libsoup.bb you will see what
bitbake has as input and how it is expanding it... also look at OVERRIDES to
see if maybe something 'stronger' is winning.

For gprof... a couple of years back there was some work to make it work in the
cross compilation environment, I assume by default it will still try to create
the .gc* files in the path of your build directory.... you will most likely
need to create these on the device.


