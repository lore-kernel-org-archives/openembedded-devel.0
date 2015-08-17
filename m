Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC0260125
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 19:00:24 +0000 (UTC)
Received: from [192.168.0.201] ([37.24.103.185]) by mail.gmx.com (mrgmx003)
	with ESMTPSA (Nemesis) id 0LedVG-1YzTE61CVK-00qQUJ for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 21:00:24 +0200
Message-ID: <55D22EAB.9050103@gmx.de>
Date: Mon, 17 Aug 2015 20:57:47 +0200
From: =?windows-1252?Q?Dominic_Sacr=E9?= <dominic.sacre@gmx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <55CFD8B5.4000501@gmx.de>
	<CAMKF1sr0Bp6HCAA869S6tJrKa2jv2OPo5qhU9ews8SYy4aBxYQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr0Bp6HCAA869S6tJrKa2jv2OPo5qhU9ews8SYy4aBxYQ@mail.gmail.com>
X-Provags-ID: V03:K0:PLBIdS9KE0gxKpoIB7iB2CaPhH8MHqRr6nKL6Z5VJ2nggv5Ax7C
	Gf/xadP+1f4oM0NJ/kaPMPg6O/XGQgQMZs6xV9rM9zc/mDKrnwxGntujENczPlGU87zPu90
	jFMydJt2Czne9TQ3eU3sTQ0apPDlD6CrcbMI6jc9tziSUd2pX7NFFdsHJnFnfjyepq0HDSs
	TSsh63gxSeRhi8WcfEklw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:VGnc0JBIQDE=:YDeOyr2cKZ5RTIIltpKYaJ
	4tMuVMzbGq3iS77HsxRDJyI+jhYtl6RLE5qZvSibv43DEX5Bnjn9OdoJPJmfBcsTNCtaOwa78
	O9v6WwZswQ2s9kTIHTnCoGZCjOXDGC9de+stqya1Aw1bBd5f6/LBLAHnauU3ofZbPgkg/Wz3c
	EtkTKpsipoMtjuZeoA1/n73w/LF7dUopr6jk56bXmOga8Y0lyA/zzpoq5D7kTmU0CTk76BkmS
	8839/aFUwDVfOsGXvxiaCmGlRtOzCmv3V05PvsPBcewIpAGJAKNB2WIFGhovmnFPdy2s/Ovd6
	umKn/LTiUz88FsbJwxiNPi4+pJZS3Kf3p4VSOoPgf5rsWY/muM4/vMWGoEarCotKKxhKZVCXM
	g1wtfxtCpeOgyqpmaCaaIgoecqRZ6P5oLUD0FKlUi2Ptwkhc1CE2ohZECe1JmyLAdipmNM+7j
	WpUcOckFmxs3VW/ssg+aDpEk7i0lj7sFDAbRmEhJ1uJEap+pa5UfzIMuiiTRiEHnwqF6/QIgF
	4KDek/gOLidrHKXciywim6+qY7iZBlYM3mSee2ElFeRSIKHr+Yy4z32LrpAu/vkoB5834uA4f
	nflERfRuKTWUI3amwb9cW28ehetGwzMdGwGi0zg2OTH48cVbBrrM/SnixooGKtCvvFgORYjv9
	1HEwkR9a/WL77siL4tpZ9quiIIRZILS0S5tzp6TmXcf30WuKFa1LILvR5BQKUFKeONgv6bq6S
	vhc9Ah8Cmb+6ztgBo1siJl/3FuCZm1S7+zq1Fw==
Subject: Re: Python 2 and Python 3 module recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Aug 2015 19:00:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 2015-08-16 02:40, Khem Raj wrote:
> On Sat, Aug 15, 2015 at 5:26 PM, Dominic Sacré <dominic.sacre@gmx.de> wrote:
>> I'm trying to build a Python 3 application which depends on some modules
>> that are already packaged in OE for Python 2, but not for Python 3.
>> Since OE currently has virtually no Python 3 module recipes, this makes
>> me wonder what the best approach to create these recipes would be.
>>
>> In most cases, I could just copy a Python 2 recipe, change the name from
>> "python-foo" to "python3-foo", and replace "inherit distutils" with
>> "inherit distutils3". However that would create a lot of duplication,
>> and might turn into a maintenance nightmare.
>>
>> Do you have a suggestion what the right course of action would be? Move
>> most of the recipes' content to .inc files that can then be included by
>> both Python 2 and Python 3 recipes? Or maybe create a .bbclass that
>> would build both versions from the same recipe?
>> Is there any functionality already in place that would simplify this task?
> 
> bbclassextend comes to mind, but then its not a core thing, secondly
> python2 is not going away soon so we will have to have them coexist.
> Best is to encapsulate in .inc files and then have 1 liner recipe
> files, that wont be as bad to maintain.

Ok, .inc files are certainly the most straightforward option. It might
get a little messy if at some point the majority of packages come in
Python 2 and Python 3 variants, but I suppose that could take a while.

Should PV be part of the .inc filename? It would make sense if things
like SRCREV or tarball checksums are set in the .inc files, but it would
also mean that we'd have the same version number in five different
places (two .bb filenames, one .inc filename, two includes).


Dominic

