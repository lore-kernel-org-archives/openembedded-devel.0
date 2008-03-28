Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JfCXP-00015I-7h
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 12:14:23 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 1259C62805E;
	Fri, 28 Mar 2008 12:14:23 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1206700621.5029.50.camel@dax.rpnet.com>
References: <20080328011211.7c66e00b@zaurus>
	<1206696274.5029.14.camel@dax.rpnet.com>
	<1206699605.18251.39.camel@hammer.suse.cz>
	<1206700621.5029.50.camel@dax.rpnet.com>
Date: Fri, 28 Mar 2008 12:16:05 +0100
Message-Id: <1206702966.3790.22.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.0 
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: binconfig.bbclass breaks packages QA
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
X-List-Received-Date: Fri, 28 Mar 2008 11:14:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:

> I don't think you understand the way sysroot works properly. It changes
> the way gcc works internally, it looks in the sysroot instead
> of /usr/include. It does not mangle paths passed in externally though.

Sorry. =EF=BB=BFYou are true. It's sad non-feature.

> I've had a quick look and the problem is from cups which doesn't have
> a .pc file. The two solutions that spring to mind are:
>=20
> 1. Add a .pc file to cups and have libgnomecups use it
> 2. Add some sed to the libgnomecups recipe to fix the bad paths after
> the compile completes.

=EF=BB=BFWe have many foo-config files embedded to other fooo-config or .=
pc.
System wide solution would be nicer.

=EF=BB=BF3. Wrap gcc.

Never call cross-gcc directly, but use small wrapper, which will replace
any -I dir by -I sysroot/dir (if sysroot is not already a part of dir)
etc.

I am ready to write such wrapper, either in bash, or in shell+sed, or
possibly in C. I already sent one in bash to the list last year.

4. Move to -isysroot for cross builds and change the mangling style:
Replace -Idir by -I=3Ddir and -I dir by -I =3Ddir.

=EF=BB=BF       -I dir
           ... If dir begins
           with "=3D", then the "=3D" will be replaced by the sysroot pre=
fix; see
           --sysroot and -isysroot.

5. Patch gcc to implement 3 on gcc level.

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



