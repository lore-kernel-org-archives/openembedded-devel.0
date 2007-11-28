Received: from [62.70.27.18] (helo=esparsett.troll.no)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <lpotter@trolltech.com>) id 1IxTKM-0001pR-QR
	for openembedded-devel@openembedded.org; Wed, 28 Nov 2007 21:16:10 +0100
Received: from esparsett.troll.no (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP
	id E016B742EB; Wed, 28 Nov 2007 21:13:12 +0100 (CET)
Received: from mail.trolltech.com.au (unknown [10.1.1.12])
	by esparsett.troll.no (Postfix) with ESMTP
	id 78E17742DB; Wed, 28 Nov 2007 21:13:12 +0100 (CET)
Received: from [172.18.1.3] (unknown [172.18.1.3])
	by mail.trolltech.com.au (Postfix) with ESMTP id A4F413B2843;
	Thu, 29 Nov 2007 06:13:09 +1000 (EST)
Message-ID: <474DCBD4.6060605@trolltech.com>
Date: Thu, 29 Nov 2007 06:13:08 +1000
From: Lorn Potter <lpotter@trolltech.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.9) Gecko/20071030 SeaMonkey/1.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <474CF3AF.5010407@trolltech.com>
	<1196248199.8098.13.camel@localhost.localdomain>
In-Reply-To: <1196248199.8098.13.camel@localhost.localdomain>
Cc: openembedded-devel@openembedded.org
Subject: Re: CROSS_DIR
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
X-List-Received-Date: Wed, 28 Nov 2007 20:16:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Richard Purdie wrote:
> On Wed, 2007-11-28 at 14:50 +1000, Lorn Potter wrote:
>> Was CROSS_DIR changed somewhat recently (last 2 months or so) to link 
>> the includes and lib dirs to staging?
>>
>> If so, why? This means I cannot distribute this toolchain to other 
>> machines, and makes the entries in the pkgconfig files wrong.
> 
> It was changed, yes. The reason was to remove duplication of files
> between staging and cross. There are various reasons for doing that
> including faster builds, less error prone builds (file duplication means
> both copies have to be kept the same) and that cleaning this up assists
> some future planned developments (e.g. sysroot and packaged staging).
> 
> The symlink is intended as a transition fix and ultimately we can switch
> to the sysroot option of the toolchain for everything but gcc 3.3 and
> earlier. Poky already has done so and it is *much* cleaner.
> 
> I have seen the pkgconfig problem and its unfortunate, I didn't realise
> until it was too late. Its not more wrong than pointing at staging
> really though. The good news is that it goes away entirely when we
> switch to using sysroot options for pkgconfig.

If CROSS_DIR is simply a symlink to staging, whats the point? I see no 
point in setting this if it doesn't work as it used to, and put the 
toolchain somewhere else, otherwise it's redundant and pointless.


> 
>> CROSS_DIR should mean just that - this is where I want the toolchain to 
>> be - like it used to do.
> 
> Well, the cross toolchain components are still there. The target system
> header/libraries (glibc and libc-headers-linux) only get installed to
> the target system staging directory now though.
> 
> CROSS_DIR is not meant to be a toolchain you can transfer between
> machines, its meant to be the cross components of the builds. If you
> want a toolchain to transfer between machines you can build one with
> meta-toolchain.

You guys must like doing things the hard way. As per the old method, 
CROSS_DIR can be used as a distributable toolchain. Now, _everything_ 
and their sister are there, which is not what a toolchain should be.

What is the path to whatever meta-toolchain creates? is it CROSS_DIR? or 
somewhere in the build directory? which could very easily be in 
someone's home directory, and not redistributable. Is there an good way 
to set the path to it?



-- 
Lorn 'ljp' Potter
Software Engineer, Systems Group, MES, Trolltech


