Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 66C9D6E754
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 06:23:37 +0000 (UTC)
Received: from [192.168.101.5] (afplatform.bmw-carit.intra [192.168.101.5])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 4620840086;
	Mon, 24 Feb 2014 05:47:06 +0100 (CET)
Message-ID: <530AE55F.9090108@oss.bmw-carit.de>
Date: Mon, 24 Feb 2014 07:23:27 +0100
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, Tobias Blom <tobias@blom.org>
References: <94BAA6DD-BBE2-46CE-8248-E8432BE9F242@blom.org>
	<20140220144314.GF3854@jama>
In-Reply-To: <20140220144314.GF3854@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: python-netifaces in oe?
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
X-List-Received-Date: Mon, 24 Feb 2014 06:23:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tobias,

We provide a recipe for python-netifaces in the meta-ros layer as well. 
In fact, a quick search on the OpenEmbedded Layer Index [1] reveals that 
meta-ros and meta-openstack both provide a recipe for python-netifaces. 
With your use case and recipe, we would have now three recipes. So, I 
suggest to unify all three recipes and come up with the best (complete) 
recipe from these three versions and add them to the meta-oe layer. We 
then can remove the duplicate recipes in the application layers.

Lukas

[1] 
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=python-netifaces


On 02/20/2014 03:43 PM, Martin Jansa wrote:
> On Thu, Feb 20, 2014 at 03:35:19PM +0100, Tobias Blom wrote:
>> Hi Martin,
> Hi Tobias,
>
>> I'm working with a yocto-project and needed a python module (netifaces). I now have a recipe for this, and I just wonder if it's of any interest push this upstream?
> Better to ask in openembedded-devel@lists.openembedded.org
>
> Generally good recipes are always welcome.
>
>> I'm pretty new to Yocto / OE, so I don't really know how things works. Saw your name in the logs, and thought I'd just send an email and ask...
>>
>> By the way, thanks for your work!
> You're welcome
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


