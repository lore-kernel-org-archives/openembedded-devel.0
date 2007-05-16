Received: from [66.249.82.235] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HoDuB-0007MM-0P
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2007 09:26:39 +0200
Received: by wx-out-0506.google.com with SMTP id s14so80980wxc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2007 00:26:22 -0700 (PDT)
Received: by 10.90.90.16 with SMTP id n16mr7435566agb.1179300382645;
	Wed, 16 May 2007 00:26:22 -0700 (PDT)
Received: by 10.90.50.5 with HTTP; Wed, 16 May 2007 00:26:22 -0700 (PDT)
Message-ID: <c384c5ea0705160026x5965bad9w9d2d0587ae574853@mail.gmail.com>
Date: Wed, 16 May 2007 09:26:22 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20070516031329.GA5205@twibble.org>
MIME-Version: 1.0
References: <464613B3.8090003@dominion.kabel.utwente.nl>
	<46461B73.8070900@trolltech.com>
	<46461D72.4020206@dominion.kabel.utwente.nl>
	<20070516031329.GA5205@twibble.org>
Subject: Re: uclibc 0.9.29 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 May 2007 07:26:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Jamie,

On 5/16/07, Jamie Lenehan <lenehan@twibble.org> wrote:
> On Sat, May 12, 2007 at 10:02:58PM +0200, Koen Kooi wrote:

> For now I'd like to see a
>
>   mtn -e mv uclibc-0.9.29/angstrom/uClibc.distro uclibc-0.9.29/uClibc.distro
>
> and then only add distro based configuration if it turns out to be
> really needed by some distro. This'll also gives us a default
>
And that generic distro configuration would probably be a full
configuration (i.e. most options enabled) so that it would work for
most packages depending on C library functionality (or glibc
compatibility).

Distro's can optionally tune down the .distro by either:
- providing their own .distro
- mangling the resulting .config

Regards,
-- 
Leon


