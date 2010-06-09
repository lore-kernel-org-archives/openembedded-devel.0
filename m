Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tmnichols@gmail.com>) id 1OMQ89-0007Bw-OG
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 20:36:02 +0200
Received: by wyi11 with SMTP id 11so508242wyi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 11:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=d4YBrZLv6uid8Cy8zqYmfRqZCFqXdL2d9QnythX8FaQ=;
	b=KmTDlAXTw3HAAWmjeGRYY9BaeFSbLd8bjbh4VYmvnixvZbTNfVMiWUihOF79UddQ6N
	OeIJTXxaFsTR83vzSTMSlSY3gZU94yk+22zLkGIyjA1C8Ba3UwTi/AEPodU5sIee1eZC
	U1l53M1F3PF0r0RfENqzCZcWrjiomO+L7rOuM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TnbiTlI5MQjrLDMvn49No8a6lfm4Y0ZIPxEqDUUq3D8beJ3VJ9Hf6EII2NuYBrvM7z
	KtQ7JBNZaqgG52baPB1rRxIr1f1gg1UZzDkOFBT+rgUAi6bE/GVPLUYKqFe0gPOaE4TT
	C+9Wh9VVJ56dJVL15+gR9ztpnSgLiYLGqrqYg=
MIME-Version: 1.0
Received: by 10.227.155.81 with SMTP id r17mr2035779wbw.128.1276108299623; 
	Wed, 09 Jun 2010 11:31:39 -0700 (PDT)
Received: by 10.216.3.137 with HTTP; Wed, 9 Jun 2010 11:31:39 -0700 (PDT)
In-Reply-To: <AANLkTimWLWi4FwtKvArIIidNYYxuRDx68RphNpPim1W5@mail.gmail.com>
References: <AANLkTimWLWi4FwtKvArIIidNYYxuRDx68RphNpPim1W5@mail.gmail.com>
Date: Wed, 9 Jun 2010 14:31:39 -0400
Message-ID: <AANLkTinpHwTYC2aOYJ1Qvcg2KTGiznyOjht1ysqlgJwe@mail.gmail.com>
From: Thom Nichols <tmnichols@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: tmnichols@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Python-dbus build error
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
X-List-Received-Date: Wed, 09 Jun 2010 18:36:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Follow-up - I've found my problem; pyexecdir and pythondir were defined like
this in the Makefiles:

pyexecdir = ${exec_prefix}lib/python2.6/site-packages
pythondir = ${prefix}lib/python2.6/site-packages

They're missing a leading / so lib/python2.6/site-packages looks like
relative path when it should just be /lib/python2.6/site-packages.

So this would appear to be a bug...  The value comes from the configure
script but I'm not sure how to fix it.  I just fixed the Makefiles
manually.  Any suggestions on how I can fix the source of the problem or if
I should open an issue?  Please let me know how I can help.

Thanks.
-Thom


On Fri, Jun 4, 2010 at 10:51 AM, Thom Nichols <tmnichols@gmail.com> wrote:

> Hello OE wizards!
>
> I'm experiencing an error building python-dbus_0.83.0:
>
> | Making all in _dbus_bindings
> | make[2]: Entering directory
> `/home/tnichols/dev/oe/build/tmp/work/armv5te-oe-linux-gnueabi/python-dbus-0.83.0-ml2/dbus-python-0.83.0/_dbus_bindings'
> | /bin/sh ../arm-oe-linux-gnueabi-libtool --tag=CC   --mode=link
> arm-oe-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork
> -mthumb
> -isystem/home/tnichols/dev/oe/build/tmp/sysroots/armv5te-oe-linux-gnueabi/include
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -Wall
> -Wextra -Wno-missing-field-initializers -Wdeclaration-after-statement
> -Wshadow -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
> -Wdeprecated-declarations -std=c9x -fno-strict-aliasing -module
> -avoid-version -export-symbols-regex init_dbus_bindings
> -L/home/tnichols/dev/oe/build/tmp/sysroots/armv5te-oe-linux-gnueabi/lib
> -ldbus-1 -lpthread -lrt
> -L/home/tnichols/dev/oe/build/tmp/sysroots/armv5te-oe-linux-gnueabi/lib
> -Wl,-rpath-link,/home/tnichols/dev/oe/build/tmp/sysroots/armv5te-oe-linux-gnueabi/lib
> -Wl,-O1 -Wl,--hash-style=gnu -o _dbus_bindings.la -rpath
> lib/python2.6/site-packages abstract.lo bus.lo bytes.lo conn.lo
> conn-methods.lo containers.lo debug.lo exceptions.lo float.lo generic.lo
> int.lo libdbusconn.lo mainloop.lo message-append.lo message.lo
> message-get-args.lo module.lo pending-call.lo server.lo signature.lo
> string.lo validation.lo
> | arm-oe-linux-gnueabi-libtool: link: only absolute run-paths are allowed
>
>
> Which I think is referring to this arg: -rpath lib/python2.6/site-packages.
>
> Now that path is the value of $(pyexecdir) which is defined as: pyexecdir =
> ${exec_prefix}lib/python2.6/site-packages  in _dbus_bindings/Makefile. The
> command in the Makefile looks like this:
> _dbus_bindings.la: $(_dbus_bindings_la_OBJECTS)
> $(_dbus_bindings_la_DEPENDENCIES)
>     $(LINK) -rpath $(pyexecdir) $(_dbus_bindings_la_OBJECTS)
> $(_dbus_bindings_la_LIBADD) $(LIBS)
>
> I also see other locations in the makefile where it uses:
> $(DESTDIR)$(pyexecdir).  However, modifying the -rpath line to read -rpath
> $(DESTDIR)$(pyexecdir) doesn't seem to help.
>
> So it appears that all of $(DESTDIR), ${exec_prefix} and ${prefix} (one of
> which I would hope points to
> /home/tnichols/dev/oe/build/tmp/sysroots/armv5te-oe-linux-gnueabi in my
> case) are all unset (or the empty string...)  I'm not a make expert; where
> do these variables get set?  More specifically, since $(pyexecdir) is
> defined as ${exec_prefix}lib/python2.6/site-packages, I'm guessing
> ${exec_prefix} is what I'm looking for.
>
> Also, is this an openembedded bug or a python-dbus bug?
>
> Thanks in advance for the help.
>
> -Thom
>
>
>

