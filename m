Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OM1IX-00074J-RQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 18:05:28 +0200
Received: by pwj4 with SMTP id 4so1928885pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=VjNc+bxd6w0sAjZJFsYA2ipaHO3t1wmWSJQSpuxNLGM=;
	b=MdFizUJlHxKc2VqETCnj2GKVy7IaeWw7Bjo6eTyZQ0TpHW/PqsO5bHNMw1hOGi6LA5
	/xmgr0kVCJ2eI10AFyjX7iF+gnAHSY9M8SaPW4k55Yi49dw6CZc2wKq0G9LAJE4b7qlE
	/sczeZFPGN3cDVGqoKS1zYsmYxs0nXEL5M0FU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Ums4MWLctpl1tdviglYZ2qGIVOImN3dJAlIISe+n9A9Lc5eqY0uM5HCcfiGmiDXh5u
	plZkccS2cv9ov4coydkA4GanOL4nRBDmJpjoPSy0zBW5DeGnKN+wY8v5OnkAjqgMk3AP
	Spl16RXEcODGiCdj2R8LyK84/ULoM/TXEG6Lk=
Received: by 10.229.214.10 with SMTP id gy10mr6075442qcb.195.1276012843342; 
	Tue, 08 Jun 2010 09:00:43 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Tue, 8 Jun 2010 09:00:23 -0700 (PDT)
In-Reply-To: <BAY127-W19ADD48625F491474C8E31D8D60@phx.gbl>
References: <BAY127-W19ADD48625F491474C8E31D8D60@phx.gbl>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 8 Jun 2010 09:00:23 -0700
X-Google-Sender-Auth: S1qAngKWp9nuim1PnuiWgwu9R3g
Message-ID: <AANLkTim9ROHW2Xn6vksEXJC7yKttMV0fXaSNTjfxiIhq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: path error in bitbake file
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
X-List-Received-Date: Tue, 08 Jun 2010 16:05:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Did you actually bother trying what I told you to try?  You can specify a
path to a directory just fine, and the file:///sdr/GPP_node I gave you will
work just fine.  It'll copy the entire tree into workdir and build there.

On Tue, Jun 8, 2010 at 8:34 AM, saleh usman <salehusman@hotmail.com> wrote:

>
>
> If there are too many files in directory then I have to mention each file
> one by one? Is there no option to give path of directory?
> Saleh
> >Chris Larson <clarson <at> kergoth.com> writes:
>
> >
> > As you'd know if you'd read the manuals, local paths are specified with
> > file://.  file:///sdr/GPP_node is what you want.
>
>
>
> > On Tue, Jun 8, 2010 at 8:05 AM, saleh usman <salehusman <at> hotmail.co=
m>
> wrote:
> >
> > >
> > > I want to give a path of a directory /sdr/GPP_node in bitbake recipe =
in
> > > which source files are placed. I did this as
> > >
> > > SRC_URI =3D "/sdr;module=3DGPP_node"
> > >
> > > But it is showing error as shown below. kindly tell me the exact form=
at
> for
> > > this path.
> > >
> > >
> > > NOTE: Running task 1783 of 3200 (ID: 1081,
> > > /sdr/ossie_collection/packages/ossie-nodes/ossie-gpp-node_svn.bb,
> > > do_fetch)
> > > NOTE: Task failed: Malformed URL: /sdr;module=3DGPP_node
> > > ERROR: TaskFailed event exception, aborting
> > > ERROR: Build of /sdr/ossie_collection/packages/ossie-nodes/
> > > ossie-gpp-node_svn.bb do_fetch failed
> > > ERROR: Task 1081 (/sdr/ossie_collection/packages/ossie-nodes/
> > > ossie-gpp-node_svn.bb, do_fetch) failed
> > > NOTE: Tasks Summary: Attempted 1782 tasks of which 1782 didn't need t=
o
> be
> > > rerun and 1 failed.
> > > ERROR: '/sdr/ossie_collection/packages/ossie-nodes/
> ossie-gpp-node_svn.bb'
> _________________________________________________________________
> Hotmail: Trusted email with Microsoft=E2=80=99s powerful SPAM protection.
> https://signup.live.com/signup.aspx?id=3D60969
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

