Received: from [209.85.216.183] (helo=mail-px0-f183.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1N90dF-0006WR-Pz
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 19:12:29 +0100
Received: by pxi13 with SMTP id 13so36482pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 10:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=3ROiawm+XW4OP4PgNJu5eSjLAxQuQcXb6HQ2VadDlVs=;
	b=gKvGSSpUg5bd0WNuUTMXS5v9psKAieYywUKEmHkfa7bMU4QDOHFPWbGfg1Mau+nh7U
	XwX3J0OAdLrgLg8usY/cPgoL4xxT7dEzFIU5a6DxaAgKG+h5Zp8b1lV3RxkIsMEgIPlS
	NFSER4fWY2yEfmxp90o3p+7sWhedYQVsK7bcU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LtCxMpTWI1PntF+9+0mADZFklvVjp6qpm3iCABsQAgIhwG+31re2AblHHdj9+tryXu
	1/wMjy4FLXjE61c+IOnHB3OwCQtl9RF3d88YOU3rwwduVzA5E1npTvVwPJgwVwJBf1Z+
	xANwT94pFaAH6wBz96cQQcSg/ABrJiYdfK69c=
MIME-Version: 1.0
Received: by 10.114.248.35 with SMTP id v35mr8311440wah.9.1258135864743; Fri, 
	13 Nov 2009 10:11:04 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.0911130446000.1157@localhost>
References: <alpine.LFD.2.00.0911130446000.1157@localhost>
Date: Fri, 13 Nov 2009 12:11:04 -0600
Message-ID: <d1ded4380911131011t4273a9c9v7784681f44599c3d@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: build breakage: guile-native-1.8.6-r0
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
X-List-Received-Date: Fri, 13 Nov 2009 18:12:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi this is ugly but works to get around guile-native-1.8.6 build

cd work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6/libguile

cat alist.doc arbiters.doc async.doc backtrace.doc boolean.doc chars.doc
continuations.doc debug.doc deprecation.doc deprecated.doc discouraged.doc
dynl.doc dynwind.doc environments.doc eq.doc error.doc eval.doc evalext.doc
extensions.doc feature.doc fluids.doc fports.doc futures.doc gc.doc
goops.doc gsubr.doc gc-mark.doc gc-segment.doc gc-malloc.doc gc-card.doc
guardians.doc hash.doc hashtab.doc hooks.doc i18n.doc init.doc ioext.doc
keywords.doc lang.doc list.doc load.doc macros.doc mallocs.doc modules.doc
numbers.doc objects.doc objprop.doc options.doc pairs.doc ports.doc
print.doc procprop.doc procs.doc properties.doc random.doc rdelim.doc
read.doc root.doc rw.doc scmsigs.doc script.doc simpos.doc smob.doc sort.doc
srcprop.doc stackchk.doc stacks.doc stime.doc strings.doc srfi-4.doc
srfi-13.doc srfi-14.doc strorder.doc strports.doc struct.doc symbols.doc
threads.doc throw.doc values.doc variable.doc vectors.doc version.doc
vports.doc weaks.doc ramap.doc unif.doc dynl.doc filesys.doc posix.doc
net_db.doc socket.doc regex-posix.doc | guile
../scripts/snarf-check-and-output-texi > guile-procedures.texi || { rm
guile-procedures.texi; false; }

And rebuild

Note that I'm using `guile` form my host system instead of `pre-inst-guile`
that produces the error

ERROR: unknown doc attribute: (location (string . alist.c) (int . 40) (hash
. hash))
cat: write error: Broken pipe

I now I should push patches instead of workarounds... but one step at the
time =P



On Fri, Nov 13, 2009 at 3:47 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>
>  the log file:
>
> NOTE: make -j4
> make  all-recursive
> make[1]: Entering directory
> `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6'
> Making all in oop
> make[2]: Entering directory
> `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6/oop'
> Making all in goops
> make[3]: Entering directory
> `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6/oop/goops'
> make[3]: Nothing to be done for `all'.
> make[3]: Leaving directory
> `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6/oop/goops'
> make[3]: Entering directory
> `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6/oop'
> make[3]: Nothing to be done for `all-am'.
> make[3]: Leaving directory
> `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6/oop'
> make[2]: Leaving directory
> `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6/oop'
> Making all in libguile
> make[2]: Entering directory
> `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6/libguile'
> make  all-am
> make[3]: Entering directory
> `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6/libguile'
> cat alist.doc arbiters.doc async.doc backtrace.doc boolean.doc chars.doc
> continuations.doc debug.doc deprecation.doc deprecated.doc discouraged.doc
> dynl.doc dynwind.doc environments.doc eq.doc error.doc eval.doc evalext.doc
> extensions.doc feature.doc fluids.doc fports.doc futures.doc gc.doc
> goops.doc gsubr.doc gc-mark.doc gc-segment.doc gc-malloc.doc gc-card.doc
> guardians.doc hash.doc hashtab.doc hooks.doc i18n.doc init.doc ioext.doc
> keywords.doc lang.doc list.doc load.doc macros.doc mallocs.doc modules.doc
> numbers.doc objects.doc objprop.doc options.doc pairs.doc ports.doc
> print.doc procprop.doc procs.doc properties.doc random.doc rdelim.doc
> read.doc root.doc rw.doc scmsigs.doc script.doc simpos.doc smob.doc sort.doc
> srcprop.doc stackchk.doc stacks.doc stime.doc strings.doc srfi-4.doc
> srfi-13.doc srfi-14.doc strorder.doc strports.doc struct.doc symbols.doc
> threads.doc throw.doc values.doc variable.doc vectors.doc version.doc
> vports.doc weaks.doc ramap.doc unif.doc dynl.doc filesys.doc posix.doc
> net_db.doc socket.doc regex-posix.doc |
> GUILE="/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6/pre-inst-guile"
> ../scripts/snarf-check-and-output-texi          > guile-procedures.texi || {
> rm guile-procedures.texi; false; }
> ERROR: unknown doc attribute: (location (string . alist.c) (int . 40) (hash
> . hash))
> cat: write error: Broken pipe
> make[3]: *** [guile-procedures.texi] Error 1
> make[3]: Leaving directory
> `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6/libguile'
> make[2]: *** [all] Error 2
> make[2]: Leaving directory
> `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6/libguile'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory
> `/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.6-r0/guile-1.8.6'
> make: *** [all] Error 2
> FATAL: oe_runmake failed
>
> rday
> --
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>            Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com
Fedora Project Contributor
https://fedoraproject.org/wiki/User:Aalonso

