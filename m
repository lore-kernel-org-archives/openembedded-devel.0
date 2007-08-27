Received: from [61.129.64.66] (helo=mail.og-int.com)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <yangtf@envision.com.cn>) id 1IPW8S-0005Ao-Ra
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Aug 2007 06:23:33 +0200
Received: from [211.144.100.19]; Mon, 27 Aug 2007 12:21:50 +0800
From: =?UTF-8?Q?=E6=9D=A8=E5=90=8C=E5=B3=B0?= <yangtf@envision.com.cn>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <432beae0708262104o6ff849cr957ad60b1584e2ca@mail.gmail.com>
References: <1188186507.2137.17.camel@localhost.localdomain>
	<432beae0708262104o6ff849cr957ad60b1584e2ca@mail.gmail.com>
Date: Mon, 27 Aug 2007 12:23:50 +0800
Message-Id: <1188188630.2137.23.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.3 (2.8.3-2.fc6) 
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: I hava an idea to Make OpenEmbedded Run Faster
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
X-List-Received-Date: Mon, 27 Aug 2007 04:23:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

really?? Bitbake same to be single thread . My Main Idear is like this =20
when some task is compiling ,Some task is fetching ,and other maybe
do_installing .
but  bitbake don't look like this .

Tongfeng.Yang

=E5=9C=A8 2007-08-26=E6=97=A5=E7=9A=84 21:04 -0700=EF=BC=8CJustin Patrin=E5=
=86=99=E9=81=93=EF=BC=9A

> On 8/26/07, =E6=9D=A8=E5=90=8C=E5=B3=B0 <yangtf@envision.com.cn> wrote:
> > EveryOne:
> >       By two week  of using OE , I hava notice that task was topology
> > sort to a queue .and  Run Task One By One.
> > draw on the experience of Design of CPU . we can make a multiply thread
> > run of it !
> >
> >       I notice that the biggest bottleneck of OE is do_fetch . then we
> > can use a mutiply thread downloader instead of wget
> >       And about task schedule ,use method like this:
> >
> >      bb_No1 do_fetch   do_patch do_configure do_build do_install
> >      bb_No2                  do_fetch  do_patch       do_configure
> > do_build do_install
> >      bb_No3                                 do_fetch      do_patch
> > do_configure do_build do_install
> >      bb_No4
> > do_fetch  .......
> >
> >      Idea 1 :    focus on download one file one time ,and make it more
> > fast use mutiply thread downloader
> >      Idea 2 :    make 0ther task of bb files  to run  asynchronously
> >      Idea 3 :   deal with task  topology more carefully to make sure
> > that  the bb file that was dependend was finish before
> >                     this one start to do_patch (Notice : not before
> > do_fetch )
> >      Idea 4 :   If topology can't make sure Idea 3 ,we must tell OE how
> > and when  to wait
> >
> >      If the Idea can come true ,The speed can go 3 times faster then
> > now
> >
>=20
> bitbake already does this.
>=20

