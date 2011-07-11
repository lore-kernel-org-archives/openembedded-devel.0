Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1Qg78r-0002nD-5l
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 05:26:46 +0200
Received: by bwf20 with SMTP id 20so3413331bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2011 20:22:11 -0700 (PDT)
Received: by 10.205.65.68 with SMTP id xl4mr1424913bkb.303.1310354530654;
	Sun, 10 Jul 2011 20:22:10 -0700 (PDT)
Received: from mail-bw0-f47.google.com (mail-bw0-f47.google.com
	[209.85.214.47])
	by mx.google.com with ESMTPS id bi20sm59412bkb.47.2011.07.10.20.22.08
	(version=SSLv3 cipher=OTHER); Sun, 10 Jul 2011 20:22:09 -0700 (PDT)
Received: by bwf20 with SMTP id 20so3413316bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2011 20:22:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.74.82 with SMTP id t18mr1174315bkj.320.1310354527651; Sun,
	10 Jul 2011 20:22:07 -0700 (PDT)
Received: by 10.204.102.139 with HTTP; Sun, 10 Jul 2011 20:22:07 -0700 (PDT)
In-Reply-To: <30961148.4888.1310051544384.JavaMail.geo-discussion-forums@yqu12>
References: <30961148.4888.1310051544384.JavaMail.geo-discussion-forums@yqu12>
Date: Sun, 10 Jul 2011 23:22:07 -0400
Message-ID: <CA+T6QP=Te90y3D0d=Ce=di5vPff+CFKW15LLoRnX_=HtcoNrag@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: beagleboard@googlegroups.com, openembedded-devel@lists.openembedded.org
Subject: Re: [beagleboard] bitbake blues
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
X-List-Received-Date: Mon, 11 Jul 2011 03:26:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 7, 2011 at 11:12 AM, Mark A. Yoder <mark.a.yoder@gmail.com> wro=
te:
> I'm try to get QT installed via bitbake. =A0I'm following the instruction=
s at
> [1] with a slight variation:
> $ git clone git://git.angstrom-distribution.org/setup-scripts oe
> $ cd oe
> $=A0MACHINE=3Dbeagleboard ./oebb.sh config beagleboard
> $ MACHINE=3Dbeagleboard ./oebb.sh update
> $ . ~/.oe/environment-2008
> $ bitbake wpa-gui
> After about 6 minutes this ends in the error:
> NOTE: Running task 26 of 4564 (ID: 37,
> /home/yoder/BeagleBoard/oe/sources/openembedded/recipes/quilt/quilt-nativ=
e_0.48.bb,
> do_package_write_ipk)
> ERROR: Logfile of failure stored in: /dev/null
> Log data follows:
> NOTE: package quilt-native-0.48-r7.1: task sysroot_stage_all: Failed
> ERROR: Function 'sysroot_stage_all' failed (see /dev/null for further
> information)
> ERROR: Task 23
> (/home/yoder/BeagleBoard/oe/sources/openembedded/recipes/quilt/quilt-nati=
ve_0.48.bb,
> do_populate_sysroot) failed with exit code '1'
> Waiting for 1 active tasks to finish:
> 0: quilt-native-0.48-r7.1 do_package_write_ipk (pid 30971)
> NOTE: package quilt-native-0.48-r7.1: task do_package_write_ipk: Started
> NOTE: package quilt-native-0.48-r7.1: task do_package_write_ipk: Succeede=
d
> ERROR:
> '/home/yoder/BeagleBoard/oe/sources/openembedded/recipes/quilt/quilt-nati=
ve_0.48.bb'
> failed
> The whole output is here [2]. =A0I'm running Ubuntu 10.4. =A0The oe direc=
tory
> was=A0initially=A0empty. =A0I even removed the ~/.oe/environment from a p=
revious
> install.
> Anyone have suggestions on what to do next?

Did you delete the temp directory and try again?  Given that you'd
done another build before this setup, I'm wondering if there is a
chance you have some stale bits in the picture.

> --Mark
> [1]=A0http://www.angstrom-distribution.org/building-angstrom
> [2]=A0http://pastebin.com/P0s8QNur
>
> --
> You received this message because you are subscribed to the Google Groups
> "Beagle Board" group.
> To view this discussion on the web visit
> https://groups.google.com/d/msg/beagleboard/-/t2k7slKnHmEJ.
> To post to this group, send email to beagleboard@googlegroups.com.
> To unsubscribe from this group, send email to
> beagleboard+unsubscribe@googlegroups.com.
> For more options, visit this group at
> http://groups.google.com/group/beagleboard?hl=3Den.
>


