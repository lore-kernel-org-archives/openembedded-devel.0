Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIRES-0005xc-Tc
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 22:02:36 +0200
Received: by eye27 with SMTP id 27so1076995eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=xKeRFDRCLjSQkfH5LHlOLP5Sa1PzF44GYFX1NsNVVks=;
	b=njSDckrQWwH24LsiX8OkGQIzruysKDiu2weba8V6FAp5goJzjPtbrw7jPHReULZ+f+
	NlhFGLOJd5MS4m4jRbCNAC8frlVBcScL4VCGERMyUjkZFXHMXV0rVNe+JvUynvkKQvCF
	uhLuK5UBLNcbZLRciI63/clmVaI13azQs92NY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=IqXX3hnfGdC737SJ5dwLO459DmXFf+xTM6zRhawyG5EyTy1A0apf80Gu4nxBFoUd2H
	yfVkRj60E7K+g73gR7XbsQqAupJn9J+4YsCWhx4ajD50eAl+/z/iRWPOPJhpJIMoLIwc
	dn5pMPhP+/rgElaFJutG5F4fTOypQF3c8CjNQ=
Received: by 10.14.42.195 with SMTP id j43mr2138149eeb.176.1304711995276; Fri,
	06 May 2011 12:59:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Fri, 6 May 2011 12:59:25 -0700 (PDT)
In-Reply-To: <1304666954.3162.3.camel@lenovo.internal.reciva.com>
References: <1304653677-2982-1-git-send-email-raj.khem@gmail.com>
	<1304666954.3162.3.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 May 2011 12:59:25 -0700
Message-ID: <BANLkTinMP8C0WQ5yEpckn7rM5yMap6QkZg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] conf/layer.conf: Use .= for BBPATH and += for BBFILES
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
X-List-Received-Date: Fri, 06 May 2011 20:02:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 6, 2011 at 12:29 AM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2011-05-05 at 20:47 -0700, raj.khem@gmail.com wrote:
>> =C2=A0# We have a conf and classes directory, prepend to BBPATH to prefe=
r our versions
>> -BBPATH :=3D "${LAYERDIR}:${BBPATH}"
>> +BBPATH .=3D ":${LAYERDIR}"
>
> This patch seems to cause the code to do the opposite of what the
> comment says. =C2=A0If changing it to be an append rather than a prepend =
is
> deliberate, please adjust the comment to match. =C2=A0(It would also be n=
ice
> to have some commentary in the commit message explaining why this is
> being done, since it isn't obvious to me why append would be better.)
>
That comment should be fixed. Since previously I has prepend and then
changed it to append but forgot
to correct the comment.
It needed to follow some order for consistency and I chose append. Now
it depends on the order of
layers specified in BBLAYERS from bblayer.conf. Which means 1st entry
gets priority
over second entry when bitbake searches BBPATH. Right now there are
two criteria's
BBFILES are selected per priority set by BBFILES_PRIORITY for the
layer but BBPATHs dont have this
capability they get searched as they appear in the list.  Ideally I
would think it would be simpler to have just one order for BBFILES and
BBPATH
so if BBPATHS followed the BBFILES priority too would make it easier
to comprehend.


> p.
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


