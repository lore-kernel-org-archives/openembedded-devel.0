Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aspnair@gmail.com>) id 1OTD79-0000u5-7V
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 14:07:32 +0200
Received: by gwaa12 with SMTP id a12so1357955gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 05:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=vbZ553DrtGNkPtxAnpTt0UOU6vrTZ0YX0ZIUef+fAWc=;
	b=vOAM2Onatj1uq4EMhtHYzd2xHRybaL/QvUqOAGaqa5CbADH5n2qD91+teY5HOfW9hc
	T4ylAal3eU24nJbum+h+S7sxwWwSjqX/jQqaRP4nDecAkMS3DkGvvxUnuv0J748YidqP
	pOYmFlr/MceMh/FdqDgEir/z1zuy+GhWB2nrE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=H8eGMZDHdYSC/uJ3wKibWcVgdODzz//e7zzDjhGU3pC6eso5J7oYd+QwKb2sv+y4eM
	8rvlob+Hks5l0r559IBXqRQeoLN0AC7bJYN5pTzrnbS0nFBIsgOG+qjb0N2bemBbMwAV
	vbC4sZWl+pRslpyV0KtKcYyodThrl2Dm9M/hk=
MIME-Version: 1.0
Received: by 10.90.204.13 with SMTP id b13mr4254359agg.162.1277726540238; Mon, 
	28 Jun 2010 05:02:20 -0700 (PDT)
Received: by 10.90.34.8 with HTTP; Mon, 28 Jun 2010 05:02:20 -0700 (PDT)
Date: Mon, 28 Jun 2010 17:32:20 +0530
Message-ID: <AANLkTimtQogqYVnJvtD2BQInWujKyXs3ecFTptF6ZlBf@mail.gmail.com>
From: Anand Sivaram <aspnair@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: aspnair@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bitbake: environments getting lost inside python callback function
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
X-List-Received-Date: Mon, 28 Jun 2010 12:07:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear All,

I am using OE to make a davinci dm6446 build.  The build machine is an
Athlon X4 with Ubuntu 10.04 amd64 installed.  Everything is building fine
(palmtop-image, x11-gpe-image etc.), now I am moving onto gstreamer-ti
related recipes.

As a part of that I tried the following
bitbake -v -b ./recipes/ti/ti-dspbios_5.41.00.06.bb -f
This downloads bios_setuplinux_5_41_00_06.bin from TI site and trying to
unpack it for which it uses recipes/ti/ti-eula-unpack.inc

Since it was not working, I tried to understand
recipes/ti/ti-eula-unpack.inc, used the following debug code snippets.

Updated the first python callback "python do_unpack" to the following to get
the list of environments
python do_unpack () {
    os.system("/usr/bin/env > /tmp/env_py.txt 2>&1")
    os.system("/bin/echo env complete >> /tmp/env.txt")
    bb.build.exec_func('base_do_unpack', d)
    bb.build.exec_func('ti_bin_do_unpack', d)
}

Now going through the output of "cat /tmp/env_py.txt" from a shell.
*Every* *environment* *is* *lost* *with* *the* *exception* of PWD,
SHLVwhere PWD is showing the complete path of workdir,SHLV=1 (like a
top level shell)
This was causing the rest of the script file to give errors.

Next I commented out the whole python do_unpack() callback put a new custom
do_unpack() shell callback, just for finding the environment list.
do_unpack() {
   echo unpacking..................
   env > /tmp/env_shell.txt 2>&1
   sleep 100
}
Now cat /tmp/env_shell.txt is showing proper environments.

Could anyone throw some light on this?

Thanks and Regards

Anand

