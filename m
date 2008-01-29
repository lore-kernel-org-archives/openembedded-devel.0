Received: from [72.14.220.159] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JJeCN-0006vz-10
	for openembedded-devel@openembedded.org; Tue, 29 Jan 2008 01:19:35 +0100
Received: by fg-out-1718.google.com with SMTP id e12so1846656fga.0
	for <openembedded-devel@openembedded.org>;
	Mon, 28 Jan 2008 16:19:41 -0800 (PST)
Received: by 10.78.173.20 with SMTP id v20mr8473075hue.12.1201565981517;
	Mon, 28 Jan 2008 16:19:41 -0800 (PST)
Received: from widy.localdomain ( [88.231.77.184])
	by mx.google.com with ESMTPS id v27sm2421256hub.40.2008.01.28.16.19.39
	(version=SSLv3 cipher=OTHER); Mon, 28 Jan 2008 16:19:40 -0800 (PST)
Date: Tue, 29 Jan 2008 02:31:05 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080129023105.1a0cf354@widy.localdomain>
In-Reply-To: <1201562570.4687.79.camel@localhost.localdomain>
References: <20080129011635.42467fc9@widy.localdomain>
	<1201562570.4687.79.camel@localhost.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] A case of distro config overriding DISTRO var
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
X-List-Received-Date: Tue, 29 Jan 2008 00:19:35 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello Richard,

On Mon, 28 Jan 2008 23:22:50 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> On Tue, 2008-01-29 at 01:16 +0200, Paul Sokolovsky wrote:
> > I'd like to know what's the idea behind overriding DISTRO var from
> > the value being set by user? For example, angstrom.inc does:
> > 
> > DISTRO = "angstrom" 
> 
> It means that the override in active use becomes "angstrom" and we
> don't have 1001 different overrides (angstrom2007, angstrom1008 etc.)
> all over the tree.

That means that we use the same var for 2 different purposes, and
that's where problem is.

> 
> > The problem with is that real distro name is lost, as thus
> > cannot be passed to some other tool (e.g., bbimage).
> > 
> > If there're good reasons to do that, and we would be lazy enough to
> > convert to something like: DISTRO_FOO = "${DISTRO}" in bitbake.conf,
> > and let those good reasons apply to DISTRO_FOO, which must replace
> > DISTRO in the appropriate places, then I at least propose to do:
> > 
> > DISTRO_ORIGINAL := "${DISTRO}"
> > 
> > in bitbake.conf, so we always have real distro config name handy.
> 
> What you didn't say is where exactly in bitbake.conf you are going to
> define that?
> 
> You need to put the := directly before the code that changes DISTRO.
> Yes, you could add this in bitbake.conf after local.conf and before
> including ${DISTRO}.conf but that seems ugly to me.

Ugly (or better, unclean) is to reuse top-level input parameter from
user for different purpose. So, at first, the meaning of DISTRO is
"name of the distro config", and then suddenly it changes to "value to
use for overrides, etc". The second use should have different name then,
as again, DISTRO is user's primary input param for OE. That would be
clean solution...

> 
> I'd prefer USERDISTRO = "${DISTRO}" in bitbake.conf and then having
> angstrom overriding that using := if it really has to...

... But as we don't want to revamp OE up to that level ;-), then we
should find good place to work that around. The issue here is that
overriding DISTRO is common practice, we even have pe(a)rls like:

DISTRO = "Jornada Linux Mobility Edition"

So, it should be worked around on OE's level (== bitbake.conf), not on
distro's level.

Also, what's exactly ugly? ":="? Then we for sure should make exception
for bitbake.conf, simply because := is unavoidable for meta-stuff, and
bitbake.conf already has bunch of them. IMHO, it's uglier to have
something defined as "=" in bitbake.conf, and require distro to
override that with ":=".

So the patch I have now below. It assumes that local.conf is what may
set DISTRO, so captures it after that.


--- conf/bitbake.conf   5044eed5572b1c9c12c31cf7952ccedc1648524c
+++ conf/bitbake.conf   d28d0f5816ecef6736cc0b1cd2b48ce41d4a656e
@@ -529,6 +531,8 @@ include conf/local.conf
 include conf/site.conf
 include conf/auto.conf
 include conf/local.conf
+# DISTRO may be overriden, so preserve real config name
+DISTRO_ORIGINAL := "${DISTRO}"
 include conf/build/${BUILD_SYS}.conf
 include conf/target/${TARGET_SYS}.conf
 include conf/machine/${MACHINE}.conf

--- classes/image.bbclass       4d92381733b09bae07a07da35bd0024744924c3c
+++ classes/image.bbclass       dbdb61a027253ac692cf3fb722fd4a3549d31f78
@@ -90,6 +90,7 @@ fakeroot do_rootfs () {
        ${IMAGE_PREPROCESS_COMMAND}
 
        export TOPDIR=${TOPDIR}
+       export DISTRO=${DISTRO_ORIGINAL}
        export MACHINE=${MACHINE}
 
        for type in ${IMAGE_FSTYPES}; do


> 
> Regards,
> 
> Richard
> 


