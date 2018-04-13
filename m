Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 424CB74577
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 11:11:31 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1f6wZw-0007Yy-MJ for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2018 13:09:16 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 13 Apr 2018 13:11:20 +0200
Message-ID: <paq34l$o0b$1@blaine.gmane.org>
References: <CALbNGRT5ZWGZ=YCaSgpmryCzQFPKxDFYLCbOgSP3T1L9gJ0L3g@mail.gmail.com>
	<1523588270-121531-1-git-send-email-hongxu.jia@windriver.com>
	<papp8c$n9j$1@blaine.gmane.org>
	<f6d6ee40-e3f2-d105-738b-2369bb26323a@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
In-Reply-To: <f6d6ee40-e3f2-d105-738b-2369bb26323a@windriver.com>
Subject: Re: [PATCH V2][meta-gnome] metacity: add back and change upstream
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
X-List-Received-Date: Fri, 13 Apr 2018 11:11:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: nl

Op 13-04-18 om 11:08 schreef Hongxu Jia:
> On 2018年04月13日 16:22, Koen Kooi wrote:
>> Op 13-04-18 om 04:57 schreef Hongxu Jia:
>>
>>> +
>>> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
>>> +PR = "r1"
>> Please drop the PR=r1 line, since the recipe gets readded there shouldn't be an issue for package feeds.
>>
> 
> I do not drop it on purpose, if the oe developer do not
> 
> update the repo frequently, the missing RP caused confusing?

I don't think it is too confusing, if someone really needs it a bbappend is easy enough to write and drop into their DISTRO layer.


