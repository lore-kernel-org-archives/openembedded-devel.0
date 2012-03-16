Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S8dBj-0005f7-MO
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Mar 2012 20:51:47 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 3F65DF81267; Fri, 16 Mar 2012 13:43:01 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 3289BF81262;
	Fri, 16 Mar 2012 13:42:48 -0600 (MDT)
Message-ID: <4F6397B8.9010506@mlbassoc.com>
Date: Fri, 16 Mar 2012 13:42:48 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1331754944.git.Martin.Jansa@gmail.com>
	<7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
	<CALbNGRSPmMZ2MGutnXuJtwerv=y8BDGiQnBUK-Lh6nk+5y9a1A@mail.gmail.com>
	<CALbNGRTG+FrLjeNWhJn3Cz_qQT=e7tZRx4kKEgGrxM9QvdywCA@mail.gmail.com>
In-Reply-To: <CALbNGRTG+FrLjeNWhJn3Cz_qQT=e7tZRx4kKEgGrxM9QvdywCA@mail.gmail.com>
Subject: Re: [meta-oe][meta-efl][PATCH 1/5] midori: upgrade to 0.4.4
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
X-List-Received-Date: Fri, 16 Mar 2012 19:51:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012-03-15 04:47, Andreas M=FCller wrote:
> On Thu, Mar 15, 2012 at 11:21 AM, Andreas M=FCller
> <schnitzeltony@googlemail.com>  wrote:
>> On Wed, Mar 14, 2012 at 8:59 PM, Martin Jansa<martin.jansa@gmail.com> =
 wrote:
>>> * custom waf to fix dirty vala version was dropped
>>> * I've fixed our vala to stop reporting dirty even for valid released=
 tarballs
>>>   so you can still get dirty version but it's not so common to keep t=
his ugly binary here.
>>> * disable PARALLEL_MAKE to improve our chances agains build hangs
>>>   (btw fedora is doing the same
>>>    http://osdir.com/ml/scm-fedora-commits/2011-11/msg04672.html)
>>>
>>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>>> ---
>>>   meta-oe/recipes-connectivity/midori/midori/waf     |  Bin 92569 -> =
 0 bytes
>>>   .../recipes-connectivity/midori/midori_0.4.3.bb    |   13 ---------=
----
>>>   .../recipes-connectivity/midori/midori_0.4.4.bb    |    8 ++++++++
>>>   3 files changed, 8 insertions(+), 13 deletions(-)
>>>   delete mode 100755 meta-oe/recipes-connectivity/midori/midori/waf
>>>   delete mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.3=
.bb
>>>   create mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.4=
.bb
>>>
>> I wanted to test this but task do_compile seems to run forever (now
>> for 1,5h) and I have an empty log.do_compile. Any pointers where to
>> look after?
>>
> I did cleansstate and rebuild midori with success now. I had similar
> from time to time but with task do_configure.

I have a machine which hangs every time in do_configure, even when I run
it by hand.  It always hangs here:
   Checking for program intltool-merge         : /home/local/p60_test/tmp=
/sysroots/i686-linux/usr/bin/intltool-merge
   Checking for header locale.h                :

Any ideas where to look?

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


