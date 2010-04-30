Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O7vlu-00034Q-R8 for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 21:21:11 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O7viL-0007fo-Pq for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 21:17:29 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Apr 2010 21:17:29 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Apr 2010 21:17:29 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 30 Apr 2010 21:17:21 +0200
Message-ID: <hrfac1$gid$1@dough.gmane.org>
References: <q2x8db82dd41004300634g46c42cf7na4871677b8d92cb7@mail.gmail.com>	<1272646386.21120.84.camel@trini-m4400>	<20100430175823.GB5713@denix.org>
	<t2x8db82dd41004301201mb827e1f6p2eced7b49a5a031f@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <t2x8db82dd41004301201mb827e1f6p2eced7b49a5a031f@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Usage of meta recipe external-toolchain-csl
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
X-List-Received-Date: Fri, 30 Apr 2010 19:21:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-04-10 21:01, Jerry Jacobs wrote:
> On Fri, Apr 30, 2010 at 7:58 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> On Fri, Apr 30, 2010 at 09:53:06AM -0700, Tom Rini wrote:
>>> On Fri, 2010-04-30 at 15:34 +0200, Jerry Jacobs wrote:
>>>> Dear all,
>>>>
>>>> I'm very new to openembedded and already have a clear view how it is
>>>> structured. My embedded board mini2440 is already in git and want to create
>>>> my own distro.
>>>> The problem where I bump against is how to use the Codesourcery external
>>>> toolchain for my target. I know there is the file in recipes/meta/
>>>> external-toolchain-csl.bb
>>>> but it not clear how to use it.
>>>
>>> There's 2 ways.  One way is, in local.conf:
>>> ### CSL public ARM does <arch>-none-<os>, so fill in the -none
>>> TARGET_VENDOR = "-none"
>>> ### Bring in external-toolchain-csl.bb
>>> TOOLCHAIN_BRAND = "csl"
>>> ### Where the CSL version is installed.
>>> TOOLCHAIN_PATH = "/full/path/to/arm-2009q3"
>>> ### Where inside the CSL install the target libraries exist.
>>> TOOLCHAIN_SYSPATH = "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi"
>>> ### Add tools to the PATH automatically.
>>> PATH_prepend = "${TOOLCHAIN_PATH}/bin:"
>>> require conf/distro/include/toolchain-external.inc
>>>
>>> The other way has a few less variables in local.conf but assumes PATH is
>>> already updated.  Denys will reply shortly with that, I imagine.
>>
>> The only difference I have from Tom's setup is I expect the CSL toolchain
>> being already in the PATH variable:
>>
>> export PATH=/full/path/to/arm-2009q1/bin:$PATH
>>
>> And then set the other several BitBake variables accordingly (in local.conf
>> and toolchain-csl.conf):
>>
>> TARGET_VENDOR = "-none"
>> # no need to include/require toolchain-external.inc, as TOOLCHAIN_TYPE does it
>> TOOLCHAIN_TYPE = "external"
>> TOOLCHAIN_BRAND = "csl"
>>
>> [There I also set CPPFLAGS and LDFLAGS to point to CSL directly, but it's not
>> required as necessary files are staged by the recipe these days.]
>>
>> The "black magic" in the local.conf is basically a Python code to set
>> TOOLCHAIN_PATH and TOOLCHAIN_SYSPATH based on the user's PATH:
>>
>> TOOLCHAIN_PATH = "${@code-to-extract-csl-path-from-PATH}"
>> TOOLCHAIN_SYSPATH = ${TOOLCHAIN_PATH}/${TARGET_SYS}
>>
>> So, with my setup, no modifications to local.conf are required, as long as CSL
>> is in your PATH. With Tom's setup, users would need to add the CSL path to
>> local.conf.
>>
>> Hope this helps.
>>
>> --
>> Denys
> 
> This clears things up, bit still its not sufficient to get it working.
> 
> The DISTRO seems to overwrite the TOOLCHAIN rules. And this while I
> set the TOOLCHAIN variables in local.conf

DISTRO=micro overwrites the rules, DISTRO=angstrom-2008.1 doesn't.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL2yzBMkyGM64RGpERAvKlAJ4745jP9G7hJDuUQuru8Xav9d4JFACglCKR
tdktixAjXdjbh9wqGrxgXc8=
=1vNF
-----END PGP SIGNATURE-----



