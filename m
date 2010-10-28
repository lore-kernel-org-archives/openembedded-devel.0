Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PBW1q-0001x9-B5
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 19:12:48 +0200
Received: by wya21 with SMTP id 21so2128712wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 10:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=RMkDCYixkhUo3vG7hs/adkrri+nj+E9AzKqEqY1afl0=;
	b=GKC+Uyrymd30RzDsP7LjAURdEigQFUkulq5z1DN0rCGfMXpJOBdf4JDxsMZRDJveal
	YVtaQAQBKXqmUA2gAYcDcXMxDVgm11fnMLUdesK02Qjxm1iyIWPRoNUweKL8y8PTpERI
	cEhTV6ui0eFPZ4HgtIktjUN8NrGGT/XsV4OWo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=LEeM9O8mRyW7TtdyO4A/CAVGNYRJDLmPFE7mzKeCVhN23XygZAJX6fipbg7UN8tGlX
	Zo0deGXJn05IvAMCMPe+v1PYxwv+hn6lIjbI+ggRc9aDA/prjLojXMDWBiA0FR9/CP8w
	zoaqxnUPfQdYVfsxh+yTtTilZRW4LtmM6Y7V0=
MIME-Version: 1.0
Received: by 10.227.145.208 with SMTP id e16mr6822847wbv.164.1288285916344;
	Thu, 28 Oct 2010 10:11:56 -0700 (PDT)
Received: by 10.227.154.13 with HTTP; Thu, 28 Oct 2010 10:11:34 -0700 (PDT)
In-Reply-To: <E1PBVKs-0003ja-Sw@melo.openembedded.org>
References: <E1PBVKs-0003ja-Sw@melo.openembedded.org>
Date: Thu, 28 Oct 2010 19:11:34 +0200
Message-ID: <AANLkTi=R5zdtjWXbmZLwCtsa7Yu15Mr67H4SNtPz+EB4@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Stefan Schmidt : cacaoh-*native: Try to be libtool version agnostic.
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
X-List-Received-Date: Thu, 28 Oct 2010 17:12:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2010 at 6:28 PM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: master
> Commit: 44bc5a638065a7ac705c2d7f21c256c7ebda516c
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3D44bc5a638065a7ac705c2d7f21c256c7ebda516c
>
> Author: Stefan Schmidt <stefan@datenfreihafen.org>
> Date: =A0 Thu Oct 28 15:50:55 2010 +0200
>
> cacaoh-*native: Try to be libtool version agnostic.
>
> Based on a suggestion from Enrico Scholz we should use libtool --mode=3Di=
nstall
> for install libtool stuff. This fixes a regresion for me that came in wit=
h
> commit 93c4d9d84096c817e74abf3f4c02f82af4c95178
>
> It is working fine again now with libtool 2.2.6b (angstrom-2008), testing=
 with
> libtool 2.4 would be appreciated.

Tested with SHR (libtool-2.4) on host without libtool installed:

NOTE: package cacaoh-openjdk-native-0.99.4-r1: task do_install: Started
ERROR: Function do_install failed
NOTE: Task failed: ('function do_install failed',
'/home/shr/shr-unstable/tmp/work/x86_64-linux/cacaoh-openjdk-native-0.99.4-=
r1/temp/log.do_install.31027')
ERROR: Task 8799
(/home/shr/shr-unstable/openembedded/recipes/cacao/cacaoh-openjdk-native_0.=
99.4.bb,
do_install) failed with 256
NOTE: oestats: task failed, see
http://tinderbox.openembedded.net/public/logs/task/9277293.txt
ERROR: Logfile of failure stored in:
/home/shr/shr-unstable/tmp/work/x86_64-linux/cacaoh-openjdk-native-0.99.4-r=
1/temp/log.do_install.31027
Log data follows:
| /home/shr/shr-unstable/tmp/work/x86_64-linux/cacaoh-openjdk-native-0.99.4=
-r1/temp/run.do_install.31027:
line 777: libtool: command not found
NOTE: package cacaoh-openjdk-native-0.99.4-r1: task do_install: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/shr/shr-unstable/openembedded/recipes/cacao/cacaoh-openjdk-native_0.9=
9.4.bb
do_install failed
ERROR: Task 8799
(/home/shr/shr-unstable/openembedded/recipes/cacao/cacaoh-openjdk-native_0.=
99.4.bb,
do_install) failed with 256
NOTE: Running task 9972 of 17485 (ID: 8811,
/home/shr/shr-unstable/openembedded/recipes/cacao/cacaoh-openjdk-native_0.9=
9.4.bb,
do_distribute_sources)

Regards,


