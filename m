Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1K1INu-0006kK-Fy
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 May 2008 11:55:54 +0200
Received: by ug-out-1314.google.com with SMTP id c2so111252ugf.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2008 02:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=AT5juDVI/YgWBPs4WL4cFLgAltEcHUOfSXz+TiJ16OI=;
	b=BMTXFRKU5K1HRvYXptrTRxf8WTTvwvHvtjdqUsW+IaWkVVJKDVdaR0/bgf11GbuSr6ftc4xL49GKgmA8QfupEH7jzDzUbqPkmGjeG9rfOqaswxh6yc+oqiPmr7nli+W4v0LJDJuFsFX6qhbfBaM9bqWsToM1ucypr022A/XZzVk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=hLeC3VZC46PROzWlWOkn+ktSP9oWovN3E60h3lklUv8kvgIiuLUGy48Nre1/xqaiL4P7xdfuCDMrE8nGjh1Zh4jk4+QFQT+cbOJ4xxUSFH3A+MKrqVT4kspUjvnZ24lhq1iyvO02+eyK6+w1rk3FSkrS4baO5e7DqwhfMoWDaBc=
Received: by 10.78.140.17 with SMTP id n17mr13461hud.32.1211968343503;
	Wed, 28 May 2008 02:52:23 -0700 (PDT)
Received: by 10.78.160.4 with HTTP; Wed, 28 May 2008 02:52:23 -0700 (PDT)
Message-ID: <35a670560805280252o3fc348d1x7b7cf51b01f209e9@mail.gmail.com>
Date: Wed, 28 May 2008 11:52:23 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1211958108.27777.15.camel@isis>
MIME-Version: 1.0
References: <70c9a9110805220710x6663f582lc5d6b75744960d08@mail.gmail.com>
	<70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>
	<1211958108.27777.15.camel@isis>
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 28 May 2008 09:55:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, May 28, 2008 at 9:01 AM, Khem Raj <raj.khem@gmail.com> wrote:
> I could reproduce this problem as well. I also tried to reduce the
> issue. It is an ICE in GCC and I have made a small testcase which I am
> able to reproduce on gcc-4_3-branch I have reported a gcc bug(PR36350)
> for it  Meanwhile you can remove -frename-registers optimization pass
> and ICE should go away.

I've 'solved' this in my local GCC 4.3 builds by patching GCC with the
patch in the following bug-report:

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=35964

After that GLIBC was building fine (for me).

The only other issues I had were in the Linux kernel (needs a small
patch to be compilable with GCC 4.3) and in opkg (which chokes on
-Wall -Werror with an array bounds check). I've patched opkg by
disabling the -Wall -Werror, because I couldn't find the problem in
the code (maybe this new GCC 4.3 warning is wrong sometimes).

One of these days I'll gather my GCC 4.3 patches and put them in
Bugzilla, but the above sums up the most important things I think.

Regards, Matthijs


