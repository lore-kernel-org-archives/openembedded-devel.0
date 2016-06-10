Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 83C2B6080F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 08:36:37 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 9EC2768A01C; Fri, 10 Jun 2016 09:36:37 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 507BF68A019;
	Fri, 10 Jun 2016 09:36:37 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id CD039674036C;
	Fri, 10 Jun 2016 10:35:55 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
	<CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
	<33320.10.7.198.51.1465487815.squirrel@linux.intel.com>
	<CAHPquwP2RDW3T5hiizow6=1xJzwgCPDDs=z+OHgaEedcXTh6bg@mail.gmail.com>
	<CAJTo0LZhrKJvg=m05_SUPktikELaDRq8gTvvtjfhaj_9Uq+vPw@mail.gmail.com>
	<20160609181613.GB2586@jama>
	<CAHPquwPKh0hgOuvHvB0KYVfU0PhtR_sZ8vKO8EgH_YgsZrwtkA@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <575A7BEB.1060808@mlbassoc.com>
Date: Fri, 10 Jun 2016 10:35:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAHPquwPKh0hgOuvHvB0KYVfU0PhtR_sZ8vKO8EgH_YgsZrwtkA@mail.gmail.com>
Subject: Re: [OE-core] the fate of Vala in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 08:36:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-06-10 02:04, Petr Nechaev wrote:
> I can see that libsecret in oe-core depends on vala though for testing only.
>
> If moving to meta-oe is community's decision, I will prepare the patch.
>

It looks like a lot of things need vala (or more precisely vala-native).
I just tried a build which included meta-browser (I know this isn't OE-core
but _is_ very common) and saw this dependency chain:
"vala-native" -> "libxslt-native" [style=solid]
"vala-native" -> "glib-2.0-native" [style=solid]
"vala-native" -> "autoconf-native" [style=solid]
"vala-native" -> "automake-native" [style=solid]
"vala-native" -> "libtool-native" [style=solid]
"vala-native" -> "gnu-config-native" [style=solid]
"vala-native" -> "pkgconfig-native" [style=solid]
"vala-native" -> "flex-native" [style=solid]
"vala-native" -> "bison-native" [style=solid]

In this case, I think vala (vala-native) deserves OE-core status.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

