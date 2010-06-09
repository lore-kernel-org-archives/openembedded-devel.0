Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMR54-0005uv-VA
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 21:36:57 +0200
Received: by fxm9 with SMTP id 9so4013773fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 12:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=YhXnAMPl3E/cQGiJXzBndb6ZP0IA6BK1ZK0M55nDwBU=;
	b=mW05oMInNYqziTdfym7ashUJyh3SJew7BXUtXX9yyPXWw3vh5qvWJszmovtfNezUp6
	iwfyRdfCD5GW4Uuxk1VfaGU9ZEWm58/pYuE6ev0bP7rxhXf37GTpRjgQ4amIo2sFks2b
	w67Z03CwQ+7dK9+Uq9fyXtEFTnS1PY2Dj+448=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=a4PYATehWNhBZqCzJAMOL+ffYiwqOI/TaN0pLXmWH4687Lv2VNV6eZ2zckbkYD1lR+
	yUziSFh7NETPPVxhcxN7scKUbP3k1xO0LlewF9p3u08Z5CjXwmfbqsGqP0BgKps65UdQ
	vsYMA8YwLRAz0dGYmTYjcCOoOMCVAGcFqr8JE=
Received: by 10.223.24.130 with SMTP id v2mr18323823fab.61.1276111952874;
	Wed, 09 Jun 2010 12:32:32 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id y12sm5311130faj.17.2010.06.09.12.32.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 12:32:32 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMR10-0001T8-Qn; Wed, 09 Jun 2010 21:32:42 +0200
Date: Wed, 9 Jun 2010 21:32:42 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100609193242.GR14941@mx.loc>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
	<1276103437-2755-4-git-send-email-rep.dot.nop@gmail.com>
	<1276109098.4424.9.camel@lenovo.internal.reciva.com>
	<20100609185240.GP14941@mx.loc>
	<1276111093.4424.21.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1276111093.4424.21.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] busybox: picking IPv6 per default is not up to the package
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
X-List-Received-Date: Wed, 09 Jun 2010 19:36:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 09, 2010 at 08:18:13PM +0100, Phil Blundell wrote:
>On Wed, 2010-06-09 at 20:52 +0200, Bernhard Reutner-Fischer wrote:
>> On Wed, Jun 09, 2010 at 07:44:58PM +0100, Phil Blundell wrote:
>> >On Wed, 2010-06-09 at 19:10 +0200, Bernhard Reutner-Fischer wrote:
>> >> diff --git a/recipes/busybox/busybox-1.15.3/micro/defconfig b/recipes/busybox/busybox-1.15.3/micro/defconfig
>> >> index 8431d19..f6eaa6d 100644
>> >> --- a/recipes/busybox/busybox-1.15.3/micro/defconfig
>> >> +++ b/recipes/busybox/busybox-1.15.3/micro/defconfig
>> >> @@ -608,7 +608,7 @@ CONFIG_TIME=y
>> >>  #
>> >>  # Networking Utilities
>> >>  #
>> >> -CONFIG_FEATURE_IPV6=y
>> >> +# CONFIG_FEATURE_IPV6 is not set
>> >>  CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
>> >>  # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
>> >>  # CONFIG_ARP is not set
>> >
>> >This change doesn't look very desirable to me.  What's the reason for
>> >it?
>> 
>> As long as you don't have ipv6 in distro features somehow, ipv6 will
>> not be available. See introductory message of this series.
>
>Ah, so you're saying that ipv6 is missing from micro's DISTRO_FEATURES?

yes, like from any other distro, and like ipv4 or nls etc..

>If that's the case then it's just a bug: presumably it's been harmless
>in the past because very few packages care about it.  Irrespective of
>that, the intended behaviour is that micro should be IPv6-enabled and
>turning it off in busybox does not seem like a good idea.
>
>Actually, a quick "grep -ri ipv6" in conf/distro didn't turn up any
>matches at all

exactly. Thus my RFC for feature/dep handling heuristics.

>                so enabling IPv6 by DISTRO_FEATURES doesn't seem to be
>terribly well entrenched at the moment.  If it were to be introduced
>then I suspect it would need to be a negative property (i.e. the feature
>would be "no ipv6") in order to not break all the existing distros.

I disagree. Distros should be fixed to ask for or require a feature if
they require it.
For a nice way to flag packages with HANDLED_FEATURES, see conversation
with kergoth from today, around 18:00 UTC.


