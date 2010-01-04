Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NRpHV-0003OD-Kw
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 16:55:49 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o04FneLZ028721 for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Jan 2010 15:49:40 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nudGa3NvZzFx
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2010 15:49:40 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o04FnZoP028693
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Jan 2010 15:49:36 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11001032331g641d1015hb7191696fdf5bb65@mail.gmail.com>
References: <ac9c93b11001030833v6236cb2ew11627fb47a6d7fa8@mail.gmail.com>
	<1262552980.2553.104.camel@lenovo.internal.reciva.com>
	<ac9c93b11001032331g641d1015hb7191696fdf5bb65@mail.gmail.com>
Date: Mon, 04 Jan 2010 15:56:05 +0000
Message-Id: <1262620565.8748.246.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qmake issue
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
X-List-Received-Date: Mon, 04 Jan 2010 15:55:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2010-01-04 at 08:31 +0100, Frans Meulenbroeks wrote:
> Yeah figured out after a brief discussion on #oe that they probably
> didn't need to be staged.
> 
> Actually the recipe does not contain any staging, so this is a side
> effect of the new automated staging.
> It could well be that other,  non qmake recipes also suffer from this.
> 
> The fix for mythtv is probably to have an empty do_stage()
> 
> However as a general rule the -L and -I flags to staging should be
> last, not first.
> And, ideally, when building a recipe the old contents from that
> package in staging should be removed first.
> By removing that we avoid the problem that if rX adds a file A to
> staging and rY does not do so any more, the file A still remains in
> staging (although perhaps incompatible with what rY made.

If packaged staging is enabled this should happen already...

Cheers,

Richard



