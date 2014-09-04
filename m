Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-01.prod.phx3.secureserver.net
	(p3plsmtpa09-01.prod.phx3.secureserver.net [173.201.193.230])
	by mail.openembedded.org (Postfix) with ESMTP id DE60471477
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 15:29:49 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa09-01.prod.phx3.secureserver.net with 
	id n3Vm1o00k1mTNtu013VnDA; Thu, 04 Sep 2014 08:29:50 -0700
Message-ID: <5408856A.5080806@pabigot.com>
Date: Thu, 04 Sep 2014 10:29:46 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
	<54087F3F.2040103@windriver.com>
In-Reply-To: <54087F3F.2040103@windriver.com>
Subject: Re: Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 15:29:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2014 10:03 AM, Robert Yang wrote:
>
> On 09/04/2014 10:12 PM, Burton, Ross wrote:
>> Hi,
>>
>> Quick question of style for the community to bikeshed on:  in the
>> general case should recipes be split into foo_1.2.bb and foo.inc, or
>> should they only split to bb/inc if there are multiple versions and
>> generally there should just be foo_1.2.bb.
>
> I think that put the constants in .inc is helpful for upgrading, for
> example, the SUMMARY, DESCRIPTION, HOMEPAGE, SECTION, inherit and so on,
> they are unlikely to change when upgrade.

I believe most of those carry over when an upgrade is simply a matter of 
renaming the recipe from foo_1.2.bb to foo_3.4.bb and changing the 
checksums.  I don't think foo.inc is warranted when only one file will 
ever include it.

I agree libunwind is a perfect example of where they can be merged into 
one file to simplify things, as long as everybody remembers to use -M 
when generating the patch.

Peter

