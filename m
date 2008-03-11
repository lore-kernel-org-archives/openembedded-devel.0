Received: from [72.14.204.230] (helo=qb-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1JZBhl-0007qO-EB
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 22:08:40 +0100
Received: by qb-out-0506.google.com with SMTP id p30so2333696qba.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 14:06:13 -0700 (PDT)
Received: by 10.115.54.1 with SMTP id g1mr2704998wak.140.1205269569893;
	Tue, 11 Mar 2008 14:06:09 -0700 (PDT)
Received: by 10.114.147.11 with HTTP; Tue, 11 Mar 2008 14:06:09 -0700 (PDT)
Message-ID: <bdb0025f0803111406p7ee059cbw461e38b2c496b857@mail.gmail.com>
Date: Tue, 11 Mar 2008 18:06:09 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <pan.2008.03.11.19.54.14@gmail.com>
MIME-Version: 1.0
References: <pan.2008.03.11.19.54.14@gmail.com>
X-SA-Exim-Connect-IP: 72.14.204.230
X-SA-Exim-Mail-From: rodrigo.vivi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cellwriter
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
X-List-Received-Date: Tue, 11 Mar 2008 21:09:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

CellWriter seems nice for embedded devices.

Some time ago I've tried to compile CellWriter for Mamona on N800 but
I couldn't get it working.
After some seg faults I gave up.

I admit that I didn't spend so much time on this task.

It would be great to see it running on my N800.

On Tue, Mar 11, 2008 at 4:54 PM, Ken Bloom <kbloom@gmail.com> wrote:
> I'm very surprised that CellWriter isn't in OpenEmbedded yet. This is a
>  GPL handwriting recognition system that can be used on keyboardless
>  systems, for example the Nokia 770, for input. Please add this if you
>  can, and encourage distributions for keyboardless devices (e.g. Poky
>  Linux, and Mamona) to include it in their images.
>
>  $ cat org.openembedded.dev/packages/cellwriter/cellwriter_1.3.3.bb
>  DESCRIPTION = "A grid-entry natural handwriting input panel. As you write
>  characters into the cells, your writing is instantly recognized at the
>  character level. When you press Enter on the panel, the input you entered
>  is sent to the currently focused application as if typed on the keyboard."
>  SECTION = "x11/input"
>  AUTHOR = "Michael Levin"
>  LICENSE = "GNU General Public License"
>  DEPENDS = "gtk+"
>
>  SRC_URI = "http://pub.risujin.org/cellwriter/cellwriter-1.3.3.tar.gz"
>  EXTRA_OECONF = "--without-gnome"
>
>  inherit autotools
>
>
>
>
>
>  --
>  Ken (Chanoch) Bloom. PhD candidate. Linguistic Cognition Laboratory.
>  Department of Computer Science. Illinois Institute of Technology.
>  http://www.iit.edu/~kbloom1/
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


