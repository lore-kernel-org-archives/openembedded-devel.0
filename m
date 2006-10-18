Received: from [64.233.162.198] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nicolasfr@gmail.com>) id 1GaIVq-0004DY-5N
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Oct 2006 22:59:42 +0200
Received: by nz-out-0102.google.com with SMTP id q3so169185nzb
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Oct 2006 13:52:42 -0700 (PDT)
Received: by 10.64.253.12 with SMTP id a12mr15252237qbi;
	Wed, 18 Oct 2006 13:52:42 -0700 (PDT)
Received: by 10.65.197.7 with HTTP; Wed, 18 Oct 2006 13:52:42 -0700 (PDT)
Message-ID: <b9481e140610181352ufe50bd6ja3d1950a3623c3ac@mail.gmail.com>
Date: Wed, 18 Oct 2006 22:52:42 +0200
From: "Nicolas FR" <nicolasfr@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <1161203833.1649.114.camel@gandalf.tm.informatik.uni-frankfurt.de>
MIME-Version: 1.0
References: <b9481e140610181332p11dbbd7ybec6afd31d9e2260@mail.gmail.com>
	<1161203833.1649.114.camel@gandalf.tm.informatik.uni-frankfurt.de>
Subject: Pytgtk2: follow up
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 20:59:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As suggested by Mickey, this might be of public interest.

Basically I asked Mickey for help to make a receipe for
python-pygtk2_2.10.0 which adds support for the gtk.StatusIcon class
which 'should' allow to use statusicon in panels which follow the
freedesktop.org directives (hint: matchbox!).

python-pygtk2_2.10.0 currently in OE, compiles fine but after
installing it and trying in python to "import gtk", it would complain
about missing pangocairo module.

After checking in log_do_configure I noticed that indeed that
pangocairo was not found. After some research, I realised the
pycairo.pc was missing from
staging/arm-angstrom-linux-gnueabi/share/pkgconfig

Now I know that pkconfig is used to install .pc files
(http://www.openembedded.org/user-manual&dpage=ch07s07), so basically
python-pycairo should just inherit pkgconfig to solve the problem?

Is that it Mickey?


---------- Forwarded message ----------
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
Date: Oct 18, 2006 10:37 PM
Subject: Re: Pytgtk2: follow up
To: Nicolas FR <nicolasfr@gmail.com>


> I finally made some progress to compile Pygtk2 with pangocairo
> support. I made a simple recipe for pycairo-native but the problem is
> that pycairo.pc is not installed in
> "/opt/OE/build/tmp/staging/arm-angstrom-linux-gnueabi/share/pkgconfig".
> Copying the file manually there solves the problem.
>
> Of course I can add a rule in the do_staging to copy the file, but I'd
> like to understand why the *.pc files do get copied for other packages
> (pygobject for example) and not for pycairo? Any idea?

Seems like pycairo.bb doesn't inherit pkgconfig.

> Here is the .bb I made for python-pycairo-native_1.2.2.bb:
>
> ----------
> require python-pycairo_${PV}.bb
>
> DEPENDS = "python-native"
>
> do_stage() {
>         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
>         ${STAGING_BINDIR}/python setup.py install
> --prefix=${STAGING_LIBDIR}/.. --install-data=${STAGING_DATADIR} || \
>         oefatal "python setup.py install execution failed."
> }

Why would we need pycairo-native in addition to pycairo?

Btw., I think these things are of public interest, we better switch to
using openembedded-devel@lists.openembedded.org

--
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de


