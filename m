Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 3DBC865CC2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 11:24:24 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 65D9338D46
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 13:24:23 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <5721F2E8.6080306@pseudoterminal.org>
Date: Thu, 28 Apr 2016 13:24:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [RFT] GCC 6 Recipes
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
X-List-Received-Date: Thu, 28 Apr 2016 11:24:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Something that concerns me is a note from 
https://gcc.gnu.org/gcc-6/changes.html :

"Value range propagation now assumes that the this pointer of C++ member 
functions is non-null. This eliminates common null pointer checks but 
also breaks some non-conforming code-bases (such as Qt-5, Chromium, 
KDevelop). As a temporary work-around -fno-delete-null-pointer-checks 
can be used. Wrong code can be identified by using -fsanitize=undefined."

Sounds like this has potential to break a significant number of packages.

On 04/18/2016 07:15 AM, Khem Raj wrote:
> Hello all,
>
> I have put together a potential gcc6 upgrade recipe set, and pushed the branch to tree here
>
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-6
>
> and also at github fork of mine.
>
> https://github.com/kraj/openembedded-core/tree/kraj/master
>
> You need to set
>
> GCCVERSION = “6.%”
>
> in local.conf to enable it.
>
>
> There are few recipes in OE-Core which still don’t compile e.g.
>
> see
>
> http://errors.yoctoproject.org/Errors/Build/14782/
>
> any help in fixing them or otherwise fixing other layers is appreciated.
>
> gcc6 is a major release for some info see
>
> https://gcc.gnu.org/gcc-6/changes.html
>
> and porting guide
>
> https://gcc.gnu.org/gcc-6/porting_to.html
>
>
> Thanks
>
> -Khem
>
>


