Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <bernardo@bandos.net>) id 1HbFzg-0006Yc-T9
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 15:02:46 +0200
Received: by py-out-1112.google.com with SMTP id n39so1299841pyh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2007 06:02:43 -0700 (PDT)
Received: by 10.65.114.4 with SMTP id r4mr14184493qbm.1176210163317;
	Tue, 10 Apr 2007 06:02:43 -0700 (PDT)
Received: by 10.64.3.17 with HTTP; Tue, 10 Apr 2007 06:02:43 -0700 (PDT)
Message-ID: <3ef3a7ad0704100602v610f6c10k447a1551f79ca750@mail.gmail.com>
Date: Tue, 10 Apr 2007 14:02:43 +0100
From: "=?ISO-8859-1?Q?Jos=E9_Bernardo_Bandos_Rodrigues?=" <bernardo@bandos.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <432beae0704091515n6a55a294jfdf64c9e855b9537@mail.gmail.com>
MIME-Version: 1.0
References: <evcm2e$15q$1@sea.gmane.org>
	<1176155636.5842.25.camel@localhost.localdomain>
	<432beae0704091515n6a55a294jfdf64c9e855b9537@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: OE a deterministic build system?
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
X-List-Received-Date: Tue, 10 Apr 2007 13:02:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Are you by any chance using ubuntu? If so, do a "sudo dpkg-reconfigure dash"
and stop it replacing /bin/sh.
That was the reason for most of the problems I had with oe, including a
couple of "undefined reference to main".

2007/4/9, Justin Patrin <papercrane@gmail.com>:
>
> On 4/9/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> > Hi,
> >
> > On Mon, 2007-04-09 at 15:22 +0900, Rolf Leggewie wrote:
> > > I am pulling my hair out and losing faith in OE being a deterministic
> > > build system.  As documented in bug 1568, I have not been able to
> build
> > > nunome for about half a year now.  When I asked hrw for help in fixing
> > > it , I was quite surprised for him to come back and say "Built fine
> for
> > > me". This success was later repeated by psokolovsky.  Alas, I can't.
> > [...]
> > >    9. "bitbake qte-mt && bitbake nunome" then fails with the same old
> > >       error of "undefined reference to `main'" as always ->
> > >       http://bugs.openembedded.org/attachment.cgi?id=1335
> >
> > FWIW, I tried bitbake qte-mt and then bitbake nunome and it succeeded
> > for me.
>
> As I said in a comment on the bug earlier, "me too". I even used your
> local.conf (with paths fixed) and it built fine for me. Whether or not
> it's useful I don't know.
>
> >
> > > Now, I really wonder what causes this virgin build to fail for me when
> > > it seems everybody else can happily build it?  Is OE not
> deterministic?
> > > Hints and discussion welcome.
> >
> > OE is deterministic but it does to some degree depend the environment
> > your building within too. Whilst we go to lengths to remove that from
> > the equation, it does sometimes creep in. You need to debug that build
> > failure, looking particularly to something creeping in from your build
> > system...
> >
>
> I'll second that. You need to figure out where your host is creeping
> into OE and fix that. If it's an option you could try switching host
> distros or releases, trying chroot, using another computer, or just
> dig in and figure out what's going on. The .log files in the temp/
> directory for nunome may be of help.
>
> --
> Justin Patrin
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

