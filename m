Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Lmcx7-0005cg-4J
	for openembedded-devel@openembedded.org; Thu, 26 Mar 2009 00:56:09 +0100
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx03.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LmcvX-0005xr-4u
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 18:54:31 -0500
Message-ID: <49CAC438.2020907@dls.net>
Date: Wed, 25 Mar 2009 18:54:32 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>	<49C9347C.7010309@balister.org>	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>	<49C94647.2040401@gmail.com>	<ac9c93b10903250151v6ea0586bv461debbe36f42ac7@mail.gmail.com>	<gqd31s$5vk$1@ger.gmane.org>	<49CA5638.1050000@dls.net>	<gqdlka$cbd$1@ger.gmane.org>	<ac9c93b10903251507u4e1edf78u4dbb1b2c7a318789@mail.gmail.com>
	<49CAAFDC.3070004@bolloretelecom.eu>
In-Reply-To: <49CAAFDC.3070004@bolloretelecom.eu>
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 23:56:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Jeremy Lainé wrote:
>>> Empty TMPDIR is only once case we should test for, I've seen many times that
>>> a 'populated' TMPDIR creates bugs, e.g. midori picking up libhildon to
>>> mention a recent one. So 'always build from empty TMPDIR' will leave serious
>>> and harder to trackdown bugs unnoticed.
>> Test with unpopulataed TMPDIR and test with maximal populated TMPDIR ?
> 
> Speaking of populated TMPDIR, is there a notion of conflicts for staging? If two packages
> want to put the same file into staging, will we barf an error or silently ignore it?

It silently ignores it.

As a current example, unless distros have taken special care with libusb
and libusb1, they will suffer from exactly this problem, with the
library that is staged determined by which recipe is built most recently.

-Mike (mwester)


