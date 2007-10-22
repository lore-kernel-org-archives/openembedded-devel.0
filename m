Received: from [64.233.170.184] (helo=rn-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Ik9Yf-0005IV-Qv
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2007 04:31:53 +0200
Received: by rn-out-0102.google.com with SMTP id e24so640902rng
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2007 19:24:46 -0700 (PDT)
Received: by 10.150.225.14 with SMTP id x14mr879520ybg.1193085999926;
	Mon, 22 Oct 2007 13:46:39 -0700 (PDT)
Received: by 10.90.66.15 with HTTP; Mon, 22 Oct 2007 13:46:39 -0700 (PDT)
Message-ID: <c384c5ea0710221346i4814d76dmd98f3dfc58987ec0@mail.gmail.com>
Date: Mon, 22 Oct 2007 22:46:39 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1193077473.6088.68.camel@localhost.localdomain>
MIME-Version: 1.0
References: <4510693243.20071017152524@vanille-media.de>
	<471729ED.9080208@student.utwente.nl>
	<1192708743.6158.25.camel@localhost.localdomain>
	<471C8BF4.1050206@student.utwente.nl>
	<1193063767.6088.54.camel@localhost.localdomain>
	<471CC31D.2010401@student.utwente.nl>
	<1193077473.6088.68.camel@localhost.localdomain>
Subject: Re: Cleaning up SDK/Toolchain
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
X-List-Received-Date: Tue, 23 Oct 2007 02:31:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On 10/22/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Mon, 2007-10-22 at 17:34 +0200, Koen Kooi wrote:
> > Richard Purdie schreef:
> > > * We implement packaged staging and only stage the dependencies needed
> > > for each package.
> >
> > That would be a better approach. Graeme, do you still want to have a
> > shot at implementing a unionfs based approach?
>
> Hmm. Does that need root privs?
>

Depending on a (virtual) filesystem is not really user-friendly, given
that it needs both a specific kernel configuration and probably root
access.

By the way, unionfs is soon deprecated by an in-kernel union mount
system, like the *BSD's already have, so the solution will be not
future-proof.

Please avoid both the unionfs solution, or the future union mount
options for OpenEmbedded user space.

Regards,

Leon.


