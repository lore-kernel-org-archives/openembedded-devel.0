Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N559q-0002Kn-R9
	for openembedded-devel@openembedded.org; Mon, 02 Nov 2009 23:13:53 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA2M9kFe011618
	for <openembedded-devel@openembedded.org>; Mon, 2 Nov 2009 22:09:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3LL5It+jsq0W for <openembedded-devel@openembedded.org>;
	Mon,  2 Nov 2009 22:09:46 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA2M9gn0011589
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>; Mon, 2 Nov 2009 22:09:44 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1257169407.11338.71.camel@dax.rpnet.com>
References: <1257169407.11338.71.camel@dax.rpnet.com>
Date: Mon, 02 Nov 2009 22:09:00 +0000
Message-Id: <1257199740.10804.41.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Staging - time to end the current mess - now with patches
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
X-List-Received-Date: Mon, 02 Nov 2009 22:13:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This is much more interesting with patches so we now have:

http://cgit.openembedded.net/cgit.cgi/openembedded/log/?h=rpurdie/work-in-progress

I ended up cleaning a lot of stuff up as I went but the two really
interesting things this branch contains are:

a) Removal of the layout_* variables. This allows Poky's cross canadian
SDK functionality to be merged. It also cleans up things quite a bit,
I've not tested how the other canadian implementation fairs with this
but the intent is to replace that with the Poky implementation which is
much cleaner (no boatloads of duplicated variables and uses
BBCLASSEXTEND).

b) Change the way do_stage operates.

The intent is that do_install installs to ${D}. Nothing should operate
directly on ${D} other than the install.

do_package takes a copy of ${D} into ${PKGD} and then runs the functions
in PACKAGE_PREPROCESS_FUNCS which can alter this directory. The result
is then packaged.

do_stage detects if the do_stage function is defined. The default is
there is no definition anymore. If it is defined we go into legacy mode
which works like current staging, we take a lock, take a snapshot of
staging, run do_stage, run any SYSROOT_PREPROCESS_FUNCS which operate
against SYSROOT_DESTDIR="", see what changed, take a copy of the changes
and release the lock.

If we're not legacy, SYSROOT_DESTDIR=${WORKDIR}/sysroot-destdir, we copy
${D} into ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}, we any
SYSROOT_PREPROCESS_FUNCS against SYSROOT_DESTDIR, save the result for
creating the staging package, take the staging lock and copy into
staging ("install the package"), release the lock.

For fun, we also detect two special cases - where autotools_stage_all is
used by itself and where native.bbclass is used with an autotooled
recipe with no do_stage changes. In those two cases we don't need to use
legacy mode.

Porting Guide
=============

There is a bb.debug in base.bbclass which tells us which functions are
using legacy staging functions. We can raise the profile of this message
as we work through the recipes dealing with the staging functions.

As a guide:

* Any do_stage where we do an autotools_stage_all can just be deleted.

* Any do_stage which matches the do_install can just be removed.

* Native packages with delete do_install should not anymore.

* Any do_stage function which installs extra things compared to
do_install is very suspect and needs an explanation of why. Most likely
do_install should be fixed and do_stage then deleted.

* If do_stage really needs to do something other than what is in
do_install a function should be written to operate on SYSROOT_DESTDIR
and that function should be appended to SYSROOT_PREPROCESS_FUNCS. There
are some -native binary special cases which will need this but almost
everything should *not* need this.

* Any other cases, post to the list and we'll work something out

Comments and experiments with the branch welcome. If I get some time
I'll try and start adding a few conversions to the branch.

FWIW in Poky I have about 25% legacy staging and 75% using the new
functions since I've been pushing autotools_stage there heavily the past
few months.

Cheers,

Richard






