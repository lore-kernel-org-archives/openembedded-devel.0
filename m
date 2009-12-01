Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NFQeO-0004YC-FO
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 12:12:11 +0100
Received: by bwz9 with SMTP id 9so3185105bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 03:10:34 -0800 (PST)
Received: by 10.204.48.202 with SMTP id s10mr5813358bkf.106.1259665832816;
	Tue, 01 Dec 2009 03:10:32 -0800 (PST)
Received: from xora.vm.bytemark.co.uk (www.xora.org.uk [80.68.91.202])
	by mx.google.com with ESMTPS id 13sm1400222bwz.10.2009.12.01.03.10.31
	(version=SSLv3 cipher=RC4-MD5); Tue, 01 Dec 2009 03:10:31 -0800 (PST)
Date: Tue, 1 Dec 2009 11:10:29 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091201111029.GD4345@xora.vm.bytemark.co.uk>
References: <ad82c8890912010126u374499a4jdbd39414b67558fb@mail.gmail.com>
	<ac9c93b10912010229g2b53c52fw671178a33c644114@mail.gmail.com>
	<20091201103917.GC4345@xora.vm.bytemark.co.uk>
	<alpine.LFD.2.00.0912010544560.8109@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.0912010544560.8109@localhost>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: dp@xora.org.uk
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
X-List-Received-Date: Tue, 01 Dec 2009 11:12:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Dec 01, 2009 at 05:45:36AM -0500, Robert P. J. Day wrote:
> On Tue, 1 Dec 2009, Graeme Gregory wrote:
> 
> > On Tue, Dec 01, 2009 at 11:29:46AM +0100, Frans Meulenbroeks wrote:
> > > 2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> > > > hi
> > > > I want cross compile linphone for compulab EM-x270 board.when i try
> > > >   sudo bitbake -b
> > > > /home/development/em-x270/stuff/openembedded/recipes/linphone/
> > > > linphone_3.1.0.bb
> > > >    then i will get the following error
> > > >   *bb.parse.ParseError: Could not inherit file classes/autotools.bbclass
> > > > *
> > > >    pleasse guide me in compiling linphone for compulab board.
> > >
> > > first remark:
> > > there is no need to run bitbake as root.
> > >
> > Rephrase that.
> >
> > DONT RUN BITBAKE AS ROOT!!!!!!!!!
> >
> > That way will only lead to your host machine having bits of its
> > filesystem replaced/deleted. OE relies on sandboxing the build as a
> > non priviledged user.
> 
>   if you feel that strongly about it, why not just have bitbake refuse
> to run as root?  seems like a simple solution.
> 
You mean like

	if 0 == os.getuid():
		raise_sanity_error("Do not use Bitbake as root.")


Terminal stupidity is not really my problem, people will learn when
they need to rebuild their build machines from scratch.

Graeme



