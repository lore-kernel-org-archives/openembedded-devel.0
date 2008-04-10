Received: from [66.249.90.176] (helo=ik-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1Jk0Eq-0003yG-Kz
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Apr 2008 19:07:04 +0200
Received: by ik-out-1112.google.com with SMTP id c30so78475ika.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2008 10:07:03 -0700 (PDT)
Received: by 10.78.159.7 with SMTP id h7mr408645hue.95.1207847221248;
	Thu, 10 Apr 2008 10:07:01 -0700 (PDT)
Received: by 10.78.160.9 with HTTP; Thu, 10 Apr 2008 10:07:01 -0700 (PDT)
Message-ID: <35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>
Date: Thu, 10 Apr 2008 19:07:01 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47FE2530.2@gmx.net>
MIME-Version: 1.0
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>
	<47FE2530.2@gmx.net>
Subject: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
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
X-List-Received-Date: Thu, 10 Apr 2008 17:07:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Apr 10, 2008 at 4:33 PM, Robert Schuster <theBohemian@gmx.net> wrote:
> Hi Matthijs,
>  I am interested in seeing a working GCJ on ARM EABI, too.
Good, I hope we get it working :)

>  You do not need to modify gcc-cross-initial and gcc-cross-sdk in the
>  first place because the GCJ in them is not used at all. You need to
>  modify gcc-cross and gcc however.
I know they're not all needed to get a working arm-linux-gnueabi-gcj.
But I'm not sure if I should mix GCC versions...
So I changed my preferred version of GCC to '4.2.3-ubuntu' so that one
will be used in the entire build and started a clean build. I thought
I was a good idea to keep all gcc things that are built based on the
same code-base. Is that a wrong assumption? To test I just did a
"bitbake glibc" which I presume will build enough to know if things
work.

>  > and changed gcc-4.2.3-ubuntu.inc to point its SRC_URI to svn, S to the
>  > correct dir and enabled JAVA by
>  > JAVA_linux-gnueabi = ",java"
>  Not quite sure whether this is the way it is supposed to do. I thought
>  there is a variable enable_java or something like that in the recipes
>  which you have to set to 1 in your local.conf.
I cannot find something like that and it does look like I have to set
this JAVA, because it will end up in --enable-languages on the
configure command.

>  Please report your results.
The build has just failed on glibc-intermediate with a linking error:
cannot find -lgcc_eh. I'll look into that now.
It has finished building the following stuff:
binutils-cross-2.18-r1
gcc-cross-4.2.3-ubuntu-r6
gcc-cross-initial-4.2.3-ubuntu-r6
glibc-2.6.1-r3
glibc-intermediate-2.6.1-r3
linux-libc-headers-2.6.24-r2

>  If you get it working please try whether the GCJ patches can be applied
>  to any of the existing GCC versions within OE. That way all
>  distributions in OE can make use of it optionally (when they switch to
>  this GCC).
That patch will be massive: there are tons of new .java files....

Regards,
Matthijs


