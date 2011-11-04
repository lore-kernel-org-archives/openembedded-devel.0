Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1RMML2-0004fK-NM
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 17:09:52 +0100
Received: by pzk37 with SMTP id 37so3446710pzk.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 09:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Yue/FJgPSOP1y/cZxO+XkRA63LSMvWZiwkRiN8QV0Vg=;
	b=f3ozDBe/HpevoYRpThsFMin9Otqy06ZbAUxlKsCRK5wZxbc+vvTeIfa71fbM1UrQWW
	SfVtyEgCO67azv2ah0Dj6OKRtl9frCUatFtGVS2QH50rGjcytQEgpZUTU4vMCgOf0mMP
	NxY44b242eZB2BH1Z86thbfkMy6xhaLTJW/iY=
MIME-Version: 1.0
Received: by 10.182.17.103 with SMTP id n7mr3020811obd.68.1320422621146; Fri,
	04 Nov 2011 09:03:41 -0700 (PDT)
Received: by 10.182.192.99 with HTTP; Fri, 4 Nov 2011 09:03:40 -0700 (PDT)
In-Reply-To: <1320416709.20107.115.camel@ted>
References: <1320361692.20107.103.camel@ted>
	<CAFu+nvG9gLNyCOEcE9ZdCwCe8wtzn=4vxdd3fGz2mP_zBtAM_Q@mail.gmail.com>
	<1320416709.20107.115.camel@ted>
Date: Fri, 4 Nov 2011 12:03:40 -0400
Message-ID: <CAFu+nvFhs+YGSfs6=Jy6wHnY3c-yTGnTxG=FdzbuRe=n9ZpiXw@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] Bitbake 1.14.0 released!
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
X-List-Received-Date: Fri, 04 Nov 2011 16:09:53 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 4, 2011 at 10:25 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2011-11-04 at 10:05 -0400, George C. Huntington, III wrote:
> > can the new bitbake be used on oe-classic, 2011.03-maintenance branch?
>
> It should work there, yes.
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

hmm the new bitbake isn't working on the 2011.03-maintenance branch.  It is
reporting errors like
 "ERROR: There is a comment on line 59 of file
/home/mscudder/oe-phase2/openembedded/recipes/gcc/gcc-4.3.1.inc (#
file://pr34130.patch
\) which is in the middle of a multiline expression.
Bitbake used to ignore these but no longer does so, please fix your
metadata as errors are likely as a result of this change."

this seems to be mostly in the gcc area.  are there any patches that can be
pulled in to the 2011.03-maintenance branch that fix the comments in
multiline expressions?

