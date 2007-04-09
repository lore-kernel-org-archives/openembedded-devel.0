Received: from [64.233.184.239] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1Hb28s-0002Tb-GZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 00:15:18 +0200
Received: by wr-out-0506.google.com with SMTP id 50so955881wri
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2007 15:15:17 -0700 (PDT)
Received: by 10.114.14.1 with SMTP id 1mr2521063wan.1176156914049;
	Mon, 09 Apr 2007 15:15:14 -0700 (PDT)
Received: by 10.115.91.8 with HTTP; Mon, 9 Apr 2007 15:15:13 -0700 (PDT)
Message-ID: <432beae0704091515n6a55a294jfdf64c9e855b9537@mail.gmail.com>
Date: Mon, 9 Apr 2007 15:15:14 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1176155636.5842.25.camel@localhost.localdomain>
MIME-Version: 1.0
References: <evcm2e$15q$1@sea.gmane.org>
	<1176155636.5842.25.camel@localhost.localdomain>
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
X-List-Received-Date: Mon, 09 Apr 2007 22:15:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/9/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> Hi,
>
> On Mon, 2007-04-09 at 15:22 +0900, Rolf Leggewie wrote:
> > I am pulling my hair out and losing faith in OE being a deterministic
> > build system.  As documented in bug 1568, I have not been able to build
> > nunome for about half a year now.  When I asked hrw for help in fixing
> > it , I was quite surprised for him to come back and say "Built fine for
> > me". This success was later repeated by psokolovsky.  Alas, I can't.
> [...]
> >    9. "bitbake qte-mt && bitbake nunome" then fails with the same old
> >       error of "undefined reference to `main'" as always ->
> >       http://bugs.openembedded.org/attachment.cgi?id=1335
>
> FWIW, I tried bitbake qte-mt and then bitbake nunome and it succeeded
> for me.

As I said in a comment on the bug earlier, "me too". I even used your
local.conf (with paths fixed) and it built fine for me. Whether or not
it's useful I don't know.

>
> > Now, I really wonder what causes this virgin build to fail for me when
> > it seems everybody else can happily build it?  Is OE not deterministic?
> > Hints and discussion welcome.
>
> OE is deterministic but it does to some degree depend the environment
> your building within too. Whilst we go to lengths to remove that from
> the equation, it does sometimes creep in. You need to debug that build
> failure, looking particularly to something creeping in from your build
> system...
>

I'll second that. You need to figure out where your host is creeping
into OE and fix that. If it's an option you could try switching host
distros or releases, trying chroot, using another computer, or just
dig in and figure out what's going on. The .log files in the temp/
directory for nunome may be of help.

-- 
Justin Patrin


