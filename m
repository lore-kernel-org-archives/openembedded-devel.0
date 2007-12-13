Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1J2fbB-00071V-Tg
	for openembedded-devel@openembedded.org; Thu, 13 Dec 2007 05:23:02 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1J2fWp-00009t-Jw
	for openembedded-devel@openembedded.org; Thu, 13 Dec 2007 04:18:31 +0000
Received: from grante.dsl.visi.com ([208.42.141.248])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 13 Dec 2007 04:18:31 +0000
Received: from grante by grante.dsl.visi.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 13 Dec 2007 04:18:31 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Grant Edwards <grante@visi.com>
Date: Thu, 13 Dec 2007 04:18:24 +0000 (UTC)
Message-ID: <fjqbqg$3td$1@ger.gmane.org>
References: <fjq200$d43$1@ger.gmane.org> <4760A2AD.8050709@gmail.com>
	<19c1b8a90712121930i73dcf071wff373d0d9e4fc6c6@mail.gmail.com>
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: grante.dsl.visi.com
User-Agent: slrn/0.9.8.1 (Linux)
Sender: news <news@ger.gmane.org>
Subject: Re: Why is package external-toolchain-1.0 failing?
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
X-List-Received-Date: Thu, 13 Dec 2007 04:23:02 -0000

On 2007-12-13, Khem Raj <raj.khem@gmail.com> wrote:

> Can you attach your local conf file that you might have created.

I believe that the key is this line:

>>> NOTE: multiple providers are available for virtual/arm-angstrom-linux-binutils (external-toolchain, binutils-cross);
>>> NOTE: consider defining PREFERRED_PROVIDER_virtual/arm-angstrom-linux-binutils

I added a line in local.conf to set the preferred provider for
virtual/arm-angstrom-linux-binutils to binutils-cross, and now
things appear to be building (it's been building for an hour or
so now, which is way farther than it got before).

For some reason the example local.conf.sample incudes the
following

  PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
  PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
  PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"

but doesn't doesn't select binutils-cross. I would suggest
adding this line to local.conf.sample:

  PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}binutils:binutils-cross"

Or at least mentioning it on the "Getting Started" page,
because if you follow the steps on that page exactly, it won't
work unless you add the above line to local.conf.

-- 
Grant




