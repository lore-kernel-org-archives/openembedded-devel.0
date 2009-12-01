Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NFQGQ-0004ZC-VX
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 11:47:26 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NFQEv-0008OW-Ix for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 05:45:49 -0500
Date: Tue, 1 Dec 2009 05:45:36 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091201103917.GC4345@xora.vm.bytemark.co.uk>
Message-ID: <alpine.LFD.2.00.0912010544560.8109@localhost>
References: <ad82c8890912010126u374499a4jdbd39414b67558fb@mail.gmail.com>
	<ac9c93b10912010229g2b53c52fw671178a33c644114@mail.gmail.com>
	<20091201103917.GC4345@xora.vm.bytemark.co.uk>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Error while running bibake
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
X-List-Received-Date: Tue, 01 Dec 2009 10:47:26 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-678330293-1259664339=:8109"

--8323328-678330293-1259664339=:8109
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 1 Dec 2009, Graeme Gregory wrote:

> On Tue, Dec 01, 2009 at 11:29:46AM +0100, Frans Meulenbroeks wrote:
> > 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> > > hi
> > > I want cross compile linphone for compulab EM-x270 board.when i try
> > > =A0 sudo bitbake -b
> > > /home/development/em-x270/stuff/openembedded/recipes/linphone/
> > > linphone_3.1.0.bb
> > > =A0 =A0then i will get the following error
> > > =A0 *bb.parse.ParseError: Could not inherit file classes/autotools.bb=
class
> > > *
> > > =A0 =A0pleasse guide me in compiling linphone for compulab board.
> >
> > first remark:
> > there is no need to run bitbake as root.
> >
> Rephrase that.
>
> DONT RUN BITBAKE AS ROOT!!!!!!!!!
>
> That way will only lead to your host machine having bits of its
> filesystem replaced/deleted. OE relies on sandboxing the build as a
> non priviledged user.

  if you feel that strongly about it, why not just have bitbake refuse
to run as root?  seems like a simple solution.

rday
--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323328-678330293-1259664339=:8109--
