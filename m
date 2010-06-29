Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OTexE-0005jA-DA
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 19:50:44 +0200
Received: by pvg13 with SMTP id 13so1662157pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 10:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=YYAPdZO8ewz+6WWhqBgIV1KT6xih2NUjyUsRk1t+rac=;
	b=STUpBzjRQqV4Qs8L4WQw9+BfLeCsWd50RmUKrHfqze4ceYLIXS3px+ADRjtfubaB9w
	hrpqoi0PG9SNMGGWJgSIZoSX+xdIJDpwRGDn0ljl1FrVUa1Ic8tntcWohZCer20zH/cS
	bQwfFLERGxv9eRFa23DKRUbNcj+CVjStdo4hM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=LYZPfSC3ndUKSY6lcS0vGqhtdkFgx0VkVkhqj+EeW6racrCIGSbCgqoZ9MXkqB3tdD
	IkInD3P57/scVjNblorBtPpAdbA/7o1B7u/UKisMhirS2hdFwLzH5188C2MCl+dW7SCp
	tqcvld69XTOR2711/V0FyiSb0fL11GPv2j0r4=
Received: by 10.142.208.19 with SMTP id f19mr8647958wfg.39.1277833244833; Tue, 
	29 Jun 2010 10:40:44 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.177.19 with HTTP; Tue, 29 Jun 2010 10:40:24 -0700 (PDT)
In-Reply-To: <AANLkTimtQogqYVnJvtD2BQInWujKyXs3ecFTptF6ZlBf@mail.gmail.com>
References: <AANLkTimtQogqYVnJvtD2BQInWujKyXs3ecFTptF6ZlBf@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 29 Jun 2010 10:40:24 -0700
X-Google-Sender-Auth: 3wasbbLhnAKyy3t-CfYAwBVAlrA
Message-ID: <AANLkTimvW1gNNl6n2Qogc5Z6Di1ALEvRxF_7F10QGHx9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: bitbake: environments getting lost inside python callback function
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
X-List-Received-Date: Tue, 29 Jun 2010 17:50:45 -0000
Content-Type: text/plain; charset=UTF-8

exported bitbake variables are emitted into the run. shell script when the
task is executed.  They are not exported into the actual environment of the
bitbake process, so they do not end up in the child processes spawned by
os.system().  See the oe_popen/oe_system wrapper functions.

On Mon, Jun 28, 2010 at 5:02 AM, Anand Sivaram <aspnair@gmail.com> wrote:

> Dear All,
>
> I am using OE to make a davinci dm6446 build.  The build machine is an
> Athlon X4 with Ubuntu 10.04 amd64 installed.  Everything is building fine
> (palmtop-image, x11-gpe-image etc.), now I am moving onto gstreamer-ti
> related recipes.
>
> As a part of that I tried the following
> bitbake -v -b ./recipes/ti/ti-dspbios_5.41.00.06.bb -f
> This downloads bios_setuplinux_5_41_00_06.bin from TI site and trying to
> unpack it for which it uses recipes/ti/ti-eula-unpack.inc
>
> Since it was not working, I tried to understand
> recipes/ti/ti-eula-unpack.inc, used the following debug code snippets.
>
> Updated the first python callback "python do_unpack" to the following to
> get
> the list of environments
> python do_unpack () {
>    os.system("/usr/bin/env > /tmp/env_py.txt 2>&1")
>    os.system("/bin/echo env complete >> /tmp/env.txt")
>    bb.build.exec_func('base_do_unpack', d)
>    bb.build.exec_func('ti_bin_do_unpack', d)
> }
>
> Now going through the output of "cat /tmp/env_py.txt" from a shell.
> *Every* *environment* *is* *lost* *with* *the* *exception* of PWD,
> SHLVwhere PWD is showing the complete path of workdir,SHLV=1 (like a
> top level shell)
> This was causing the rest of the script file to give errors.
>
> Next I commented out the whole python do_unpack() callback put a new custom
> do_unpack() shell callback, just for finding the environment list.
> do_unpack() {
>   echo unpacking..................
>   env > /tmp/env_shell.txt 2>&1
>   sleep 100
> }
> Now cat /tmp/env_shell.txt is showing proper environments.
>
> Could anyone throw some light on this?
>
> Thanks and Regards
>
> Anand
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

