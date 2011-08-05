Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QpDc1-0003OW-AE
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 08:10:25 +0200
Received: by fxg11 with SMTP id 11so1661204fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2011 23:06:01 -0700 (PDT)
Received: by 10.204.141.83 with SMTP id l19mr555332bku.217.1312524361022;
	Thu, 04 Aug 2011 23:06:01 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id b3sm746738bke.44.2011.08.04.23.05.59
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 23:05:59 -0700 (PDT)
Message-ID: <4E3B8846.2080203@dresearch-fe.de>
Date: Fri, 05 Aug 2011 08:05:58 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <4E3A3C4B.8040208@dresearch-fe.de>
In-Reply-To: <4E3A3C4B.8040208@dresearch-fe.de>
X-Enigmail-Version: 1.2
Subject: Re: [2011.03-maintenance] unsatisfied dependencies to libgcc
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
X-List-Received-Date: Fri, 05 Aug 2011 06:10:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.08.2011 08:29, Steffen Sledz wrote:
> In the last days we switched our local development from an older oe-dev master to 2011.03-maintenance branch and hit an annoying problem.
> 
> The test builds on various developer machines were successful but the build on our continuous integration server (with exactly the same scripting) ended up with a lot of
> 
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for lighttpd:
> |  *    libstdc++6 (>= 4.3.3) *         libgcc1 (>= 4.3.3) *    libgcc1 (>= 4.3.3) *
> |  * opkg_install_cmd: Cannot install package lighttpd.
> 
> errors.
> 
> After some searching we found that there was no libgcc1_4.3.3-r24.2.6_armv5te.ipk in the deploy area.
> 
> I'm not sure which package should produce this but i guess it should come from gcc-cross-4.3.3 (because its recipe version is r24.2.6 in opposite to gcc-4.3.3 r24.1.6).
> 
> Looking into the log i hit the fact that the do_rootfs stage for the image was started *before* the do_package_stage of gcc-cross_4.3.3.bb was succeeded.
> 
> Any ideas?
> 
> PS: Bitbaking gcc-cross explicitly before bitbaking the image wors as a workaround for us at the moment.

Another collegue had a similar problem while bitbaking meta-toolchain.

|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-sdk-bare:
|  * 	libstdc++-dev *
|  * opkg_install_cmd: Cannot install package task-sdk-bare.

So it seems it is not a problem of our image recipe.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


