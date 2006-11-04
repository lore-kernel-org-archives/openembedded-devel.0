Received: from [64.233.162.206] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1GgLjl-0008Gj-Vz
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Nov 2006 14:39:06 +0100
Received: by nz-out-0102.google.com with SMTP id q3so522099nzb
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Nov 2006 05:37:59 -0800 (PST)
Received: by 10.65.51.16 with SMTP id d16mr2476565qbk.1162647479557;
	Sat, 04 Nov 2006 05:37:59 -0800 (PST)
Received: by 10.65.243.9 with HTTP; Sat, 4 Nov 2006 05:37:59 -0800 (PST)
Message-ID: <c384c5ea0611040537l75b553c5pa78ce8ca8ff4b679@mail.gmail.com>
Date: Sat, 4 Nov 2006 14:37:59 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <432beae0610291732m7a58da9dk67002822666ea07f@mail.gmail.com>
MIME-Version: 1.0
References: <200610291528.40663.openembedded@hrw.one.pl>
	<432beae0610291732m7a58da9dk67002822666ea07f@mail.gmail.com>
Subject: Re: RFC: handling of machine/distro features stuff
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
X-List-Received-Date: Sat, 04 Nov 2006 13:39:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

On 10/30/06, Justin Patrin <papercrane@gmail.com> wrote:
>
> It *sounds* like what you want here is basically a USE-flag type of
> system. Introducing it as FEATURES flags makes sense to me given that
> OE is made for building embedded distros and not for local building,
> as portage.
>
Yes, USE flags came to my mind as well when I read this.

In my use case (beware of pun) I have a package overlay of graphical
packages (freetype, pango, cairo, gtk) but without dependencies on X
support (they render to framebuffers).

So, I recon this would fall into the domain of a DISTRO FEATURE (i.e. "no X11")

However, could I *disable* a feature in the intended framework? (much
like with the plus and minus signs in the emerge USE case)

Regards,

Leon 'likewise'


