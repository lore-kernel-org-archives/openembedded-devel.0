Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 526 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Jul 2018 16:49:10 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 46B2978D7D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:49:10 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 4294A280447; Fri, 27 Jul 2018 09:44:20 -0700 (PDT)
Date: Fri, 27 Jul 2018 09:44:20 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: William Delacre <williamdelacre@gmail.com>
Message-ID: <20180727164420.GM20696@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	William Delacre <williamdelacre@gmail.com>,
	Mark Asselstine <mark.asselstine@windriver.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
	<CAPuovE+nMp9xaj_gusMTGM9_ChFuuHDzc9NKBRYZMX493DbU=Q@mail.gmail.com>
	<CAOnRZEJ7iVfFxr4e=6VcjCCpi4uERXhv-e8FZgMuAQv6XD2GXQ@mail.gmail.com>
	<1748388.J95ykxND2L@yow-masselst-lx1>
	<CAOnRZEKK9xiSzTFH0+RQJxPzu2=qaEuNhYHKv4jFY0MPh-eWtw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnRZEKK9xiSzTFH0+RQJxPzu2=qaEuNhYHKv4jFY0MPh-eWtw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: (No subject)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2018 16:49:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

It depends on the role of the particular dependency:

* tool you need to run during build             <-- native dependency
* library you need to link against during build <-- target dependency

--SJLC

On Fri, Jul 27, 2018 at 06:25:27PM +0200, William Delacre wrote:
> Okay, it makes sense!
> 
> My question may seem stupid but then why don’t we always use ‘-native’ for
> the dependencies ?
> 
> Is it because sometimes we know that the behavior of ‘foo’ and ‘foo-native’
> would be the same, independently of the architecture ?
> 
> William
> 
> Le ven. 27 juil. 2018 à 18:16, Mark Asselstine <
> mark.asselstine@windriver.com> a écrit :
> 
> > On Friday, July 27, 2018 12:04:37 PM EDT William Delacre wrote:
> > > Thanks a lot for the answer, it worked perfectly !
> > >
> > > There is just one point I don’t really understand : why do we need to
> > add a
> > > dependency to ‘python-incremental-NATIVE’ ?
> > >
> > > What would happen if I just add to the python-twisted recipe :
> > >
> > > DEPENDS += “${PYTHON_PN}-incremental“
> >
> > This would assume that python is completely arch independent, which it is
> > not.
> > Assume for example python-incremental had some C extensions, using DEPENDS
> > would build them for the target arch yet possibly attempt to run them on
> > your
> > build host. -native takes care of this.
> >
> > Some may say this is a bit of a hack since the difference in ARCH *might*
> > equate to a difference in behavior. But I have dealt with many python
> > recipes
> > and have yet to run into any scenario where this potential issue exists.
> >
> > At least that is what I can recall at the moment. Unfortunately I have
> > forgotten some of the subtleties that might be in play.
> >
> > Mark
> >
> > >
> > > William
> > >
> > > Le ven. 27 juil. 2018 à 17:03, Mark Asselstine <
> > >
> > > mark.asselstine@windriver.com> a écrit :
> > > > On Thu, Jul 26, 2018 at 3:40 PM, Mark Asselstine
> > > >
> > > > <mark.asselstine@windriver.com> wrote:
> > > > > On Mon, Jul 23, 2018 at 8:28 AM, William Delacre
> > > > >
> > > > > <williamdelacre@gmail.com> wrote:
> > > > >> Hi ! :-)
> > > > >>
> > > > >> I’m facing issues when trying to run ‘bitbake python-twisted’
> > > >
> > > > (do_compile
> > > >
> > > > >> error)
> > > > >>
> > > > >> Log says :
> > > > >> “Download error on https://pypi.python.org/simple/incremental/:
> > [Errno
> > > >
> > > > -3]
> > > >
> > > > >> Temporary failure in name resolution
> > > >
> > > > With the additional info you sent me along with a second look at the
> > > > error I can fairly confidently say I know what the issue is.
> > > >
> > > > Python, like some other languages (ruby, go...) will attempt to
> > > > download dependencies/requirements if they are not present. This is
> > > > done "outside" of the bitbake system and thus will ignore
> > > > BB_NO_NETWORK and is generally a bad thing. It isn't quite host
> > > > contamination but it is very similar. What we do with our python
> > > > recipes in bitbake is review a python package's source setup.py,
> > > > requirements.txt...files in order to determine what other python
> > > > packages are needed, add them as RDEPENDS or similar in order to avoid
> > > > the python attempting to complete a download such as this.
> > > >
> > > > In this case python-twisted 'requires' python-incremental but the
> > > > Rocko version of the python-twisted recipe lacks the needed assignment
> > > > to ensure this is available in the recipe sysroot and thus the
> > > > attempted download.
> > > >
> > > > Cherry pick commit b08b570c8624303acbb6bb064a7bda466a679df4
> > > > [python-twisted: avoid downloading build dependencies] to Rocko and
> > > > you will be good to go. You should also follow up this thread with a
> > > > request to have this commit put onto Rocko to avoid others hitting the
> > > > same issue.
> > > >
> > > > Mark
> > > >
> > > > >> ............
> > > > >>
> > > > >> distutils.errors.DistutilsError : Could not find suitable
> > distribution
> > > >
> > > > for
> > > >
> > > > >> Requirement.parse(‘incremental>=16.10.1’)”
> > > > >>
> > > > >> First of all I’m not connected to internet, so I’ve pre-downloaded
> > all
> > > >
> > > > the
> > > >
> > > > >> required packages (twisted-17.9.0.tar.bz2 &
> > incremental-17.5.0.tar.gz
> > > >
> > > > are
> > > >
> > > > >> present in my build/downloads folder)
> > > > >>
> > > > >> It’s the first time I have some “downloading issues” and I’m stuck
> > on
> > > > >> it
> > > > >> for a few hours now..
> > > > >>
> > > > >> Any tips for me ?
> > > > >
> > > > > Check all aspects of what you have manually downloaded and populated
> > > > > in your downloads. My guess is that a checksum or some other detail
> > > > > isn't matching and it is rejecting what you have and thus attempting
> > > > > to re-download the file.
> > > > >
> > > > > Mark
> > > > >
> > > > >> Thanks in advance !
> > > > >> --
> > > > >> _______________________________________________
> > > > >> Openembedded-devel mailing list
> > > > >> Openembedded-devel@lists.openembedded.org
> > > > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> >
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

