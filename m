Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tmnichols@gmail.com>) id 1OKYIy-0004bz-7p
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 16:55:31 +0200
Received: by wyb32 with SMTP id 32so976592wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=3vA2RaVakvkq5/zJH2b3ud4uVFcUQfJvkZ3qi9xYgCI=;
	b=WFOrCmUcmKJyVWXK16GeqxktfPtNlg7FIXpO1EiLWzzUCdBzswkxNxHerHu8OydgdP
	y/dVukG14qesDmvt2/6U9QllzL/p5EhuQpXfC3XTA0Wsl+SJIadPPQ/IGUsvXdtimgtK
	94qhtjPm8hQ5Sv8KT6UqXVhwVYnaK7n79qRwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=o171u/YZdrgwy27Y8l8ZeCtc9BTce4zO30ryU8wFns3DICV3p3IJyRSQD+fkP+Mq5C
	ftgncIQiPGuVATkzwIHg2TnL2Y629hknNnK5PRE3Wor7ZCLoa7ugxWEiPmV7WvbCL8mz
	Oa+bLq2KvWUuPX2Hoa9gqYA7fX+FKi95r9gok=
MIME-Version: 1.0
Received: by 10.216.89.199 with SMTP id c49mr2377539wef.29.1275663067692; Fri, 
	04 Jun 2010 07:51:07 -0700 (PDT)
Received: by 10.216.3.137 with HTTP; Fri, 4 Jun 2010 07:51:07 -0700 (PDT)
Date: Fri, 4 Jun 2010 10:51:07 -0400
Message-ID: <AANLkTimWLWi4FwtKvArIIidNYYxuRDx68RphNpPim1W5@mail.gmail.com>
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
Subject: Python-dbus build error
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
X-List-Received-Date: Fri, 04 Jun 2010 14:55:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello OE wizards!

I'm experiencing an error building python-dbus_0.83.0:

| Making all in _dbus_bindings
| make[2]: Entering directory
`/home/tnichols/dev/oe/build/tmp/work/armv5te-oe-linux-gnueabi/python-dbus-0.83.0-ml2/dbus-python-0.83.0/_dbus_bindings'
| /bin/sh ../arm-oe-linux-gnueabi-libtool --tag=CC   --mode=link
arm-oe-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork
-mthumb
-isystem/home/tnichols/dev/oe/build/tmp/sysroots/armv5te-oe-linux-gnueabi/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -Wall
-Wextra -Wno-missing-field-initializers -Wdeclaration-after-statement
-Wshadow -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wdeprecated-declarations -std=c9x -fno-strict-aliasing -module
-avoid-version -export-symbols-regex init_dbus_bindings
-L/home/tnichols/dev/oe/build/tmp/sysroots/armv5te-oe-linux-gnueabi/lib
-ldbus-1 -lpthread -lrt
-L/home/tnichols/dev/oe/build/tmp/sysroots/armv5te-oe-linux-gnueabi/lib
-Wl,-rpath-link,/home/tnichols/dev/oe/build/tmp/sysroots/armv5te-oe-linux-gnueabi/lib
-Wl,-O1 -Wl,--hash-style=gnu -o _dbus_bindings.la -rpath
lib/python2.6/site-packages abstract.lo bus.lo bytes.lo conn.lo
conn-methods.lo containers.lo debug.lo exceptions.lo float.lo generic.lo
int.lo libdbusconn.lo mainloop.lo message-append.lo message.lo
message-get-args.lo module.lo pending-call.lo server.lo signature.lo
string.lo validation.lo
| arm-oe-linux-gnueabi-libtool: link: only absolute run-paths are allowed


Which I think is referring to this arg: -rpath lib/python2.6/site-packages.

Now that path is the value of $(pyexecdir) which is defined as: pyexecdir =
${exec_prefix}lib/python2.6/site-packages  in _dbus_bindings/Makefile. The
command in the Makefile looks like this:
_dbus_bindings.la: $(_dbus_bindings_la_OBJECTS)
$(_dbus_bindings_la_DEPENDENCIES)
    $(LINK) -rpath $(pyexecdir) $(_dbus_bindings_la_OBJECTS)
$(_dbus_bindings_la_LIBADD) $(LIBS)

I also see other locations in the makefile where it uses:
$(DESTDIR)$(pyexecdir).  However, modifying the -rpath line to read -rpath
$(DESTDIR)$(pyexecdir) doesn't seem to help.

So it appears that all of $(DESTDIR), ${exec_prefix} and ${prefix} (one of
which I would hope points to
/home/tnichols/dev/oe/build/tmp/sysroots/armv5te-oe-linux-gnueabi in my
case) are all unset (or the empty string...)  I'm not a make expert; where
do these variables get set?  More specifically, since $(pyexecdir) is
defined as ${exec_prefix}lib/python2.6/site-packages, I'm guessing
${exec_prefix} is what I'm looking for.

Also, is this an openembedded bug or a python-dbus bug?

Thanks in advance for the help.

-Thom

