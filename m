Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1QhDOx-00043e-LB
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 06:19:51 +0200
Received: by ewy5 with SMTP id 5so2454893ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 21:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=+m1tPgiY1f2BEEecxa52j97cZZriZGp7L6e5B+TiksY=;
	b=f1eVz0VIbn9CHLcCaLJ2hyNKOpswhs1vWCxyZ7bl+/6RDyLfPj+r9HpQEqeyBbeiA+
	SQ4/TRvfDBBj3JXcmkzGKmM9KOZr+jaWYXRpesWrNP75gc/i1utZJ73s7rGeZaYoWjrp
	EuIUT0xwXJKtklfprgbhEH4JnFxkiF83+pI6A=
MIME-Version: 1.0
Received: by 10.213.13.72 with SMTP id b8mr1006847eba.16.1310616868081; Wed,
	13 Jul 2011 21:14:28 -0700 (PDT)
Received: by 10.213.10.148 with HTTP; Wed, 13 Jul 2011 21:14:28 -0700 (PDT)
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04AD2583@nzc-ap-xch-02.ap.trimblecorp.net>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04AD2583@nzc-ap-xch-02.ap.trimblecorp.net>
Date: Thu, 14 Jul 2011 16:14:28 +1200
Message-ID: <CAE21AQqgx5Hqri5QLB1ANFMwCzh74Fyqc6fUzGmijUTQw43f+A@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Errors on fetching files
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
X-List-Received-Date: Thu, 14 Jul 2011 04:19:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2011 at 11:26 AM, Bernard Mentink
<Bernard_Mentink@trimble.com> wrote:
>
> Hi Guys,
>
> I am getting the following fetch errors when trying to compile ..
> I am behind a http proxy so have made sure the wget, svn,cvs,ftp,git etc
> work ... and they do on the command line, however I am still getting
> these errors.
>
> A dump of the current error is below ..
>
> If I "wget" the file it is complaining about and install it in the
> ~/sources directory and add an md5checksum file as well, it gets past
> this error next time I run .... Until the next time.
> So the question is if wget works from the command line why does it not
> work from bitbake .... Unless it uses another method to get the file,
> but I see nothing in the .bb file to indicate what
> program is used ..

Not really help, but commiseration...

Bitbake changes the environment so what works from the command line
will not always work from inside bitbake.

I have had limited success fiddling with overriding fetching
parameters, but it is ultimately a lot easier to work without a proxy.


>
> Any and all help appreciated.
>
> Thanks,
> Bernie
>
>
> ------------------------------------------------------------------------
> --------------------------------------
> METADATA_REVISION =3D "b59743b"
> TARGET_ARCH =A0 =A0 =A0 =3D "arm"
> TARGET_OS =A0 =A0 =A0 =A0 =3D "linux-gnueabi"
> MACHINE =A0 =A0 =A0 =A0 =A0 =3D "mx31ads"
> DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D "angstrom"
> DISTRO_VERSION =A0 =A0=3D "v2011.07"
> TARGET_FPU =A0 =A0 =A0 =A0=3D "hard"
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 114 of 606 (ID: 571,
> virtual:native:/home/bmentink/devel/openembedded/recipes/sqlite/sqlite3_
> 3.6.23.1.bb,
> do_fetch)
> --2011-07-14 11:17:29-- =A0http://www.sqlite.org/sqlite-3.6.23.1.tar.gz
> NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_fetch: Started
> =A0Resolving www.sqlite.org... 67.18.92.124
> =A0Connecting to www.sqlite.org|67.18.92.124|:80... failed: Connection
> refused.
> =A0--2011-07-14 11:17:30--
> http://mirrors.openembedded.org/sqlite-3.6.23.1.tar.gz
> =A0Resolving mirrors.openembedded.org... 82.197.159.157
> =A0Connecting to mirrors.openembedded.org|82.197.159.157|:80... failed:
> Connection refused.
> =A0--2011-07-14 11:17:30--
> http://sources.openembedded.org/sqlite-3.6.23.1.tar.gz
> =A0Resolving sources.openembedded.org... 140.211.169.165
> =A0Connecting to sources.openembedded.org|140.211.169.165|:80... failed:
> Connection refused.
> =A0--2011-07-14 11:17:30--
> http://www.angstrom-distribution.org/unstable/sources/sqlite-3.6.23.1.ta
> r.gz
> =A0Resolving www.angstrom-distribution.org... 188.40.83.200
> =A0Connecting to www.angstrom-distribution.org|188.40.83.200|:80...
> failed: Connection
> refused.
> NOTE: package sqlite3-native-3.6.23.1-r4.0: task Fetch failed: Unable to
> fetch URL
> http://www.sqlite.org/sqlite-3.6.23.1.tar.gz from any source.: Failed
> ERROR: Function 'Fetch failed: Unable to fetch URL
> http://www.sqlite.org/sqlite-3.6.23.1.tar.gz from any source.' failed
> ERROR: Task 571
> (virtual:native:/home/bmentink/devel/openembedded/recipes/sqlite/sqlite3
> _3.6.23.1.bb,
> do_fetch) failed with exit code '1'
> ERROR:
> 'virtual:native:/home/bmentink/devel/openembedded/recipes/sqlite/sqlite3
> _3.6.23.1.bb'
> failed
> ------------------------------------------------------------------------
> -------------------------------------------
> Bernard Mentink
> Caterpillar Trimble Control Technologies
> P.O. Box 8729, Riccarton
> 11 Birmingham Drive, Christchurch
> New Zealand
> Phone +64-3-9635335
> Fax +64-3-9635417
> Email bmentink@trimble.co.nz
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


