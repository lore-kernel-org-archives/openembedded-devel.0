Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MDO3n-0006X1-Dg
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 21:29:39 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MDNuh-0001V6-Ds
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 20:20:15 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1244402010.4463.36.camel@utx.utx.cz>
References: <1244366174.4412.11.camel@daniel-laptop>
	<1244384219.4431.46.camel@utx.utx.cz>
	<1244385233.4151.27.camel@lenovo.internal.reciva.com>
	<1244402010.4463.36.camel@utx.utx.cz>
Date: Sun, 07 Jun 2009 20:20:13 +0100
Message-Id: <1244402413.4151.36.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: e2fsprogs-libs failed	on	latest	org.openembedded.dev	branch
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
X-List-Received-Date: Sun, 07 Jun 2009 19:29:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, 2009-06-07 at 21:13 +0200, Stanislav Brabec wrote:
> 1. This path apparently mixes path elements defined by two different
> recipes. I was under impression, that there exists some type of
> unintended =EF=BB=BFcv_libdir inheritance between these two recipes. Mayb=
e my
> impression was incorrect, but

There certainly shouldn't be any such inheritance.  If there is, that's
a bug and we should fix it.

> 2. After applying of this patch, I did not see this error any more.
> I even tested rebuild from scratch with no error. And finally

I suspect that was probably just coincidence.  This bug seems to be
somewhat intermittent; I don't know exactly what's causing it, and it's
never actually happened for me, but (re)building things in a different
order seems to clear it up.

> 3. The =EF=BB=BFvariable name cv_libdir is deduded from "libcv" in opencv=
 recipe
> and has no relation to e2fsprogs nor util-linux-ng.

Yeah, it's very possibly true that all this code was cut'n'pasted from
opencv.  That oughtn't to be a problem though.

p.




