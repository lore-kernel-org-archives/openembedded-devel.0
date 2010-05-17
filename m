Received: from mail-qy0-f172.google.com ([209.85.221.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OE5pp-0000CM-KM
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 21:18:45 +0200
Received: by qyk2 with SMTP id 2so7196715qyk.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ZETgSyqyEWM0xg0MnZgvNT4Tj9fuFG6BS3m7XXoqx+A=;
	b=nIQqQeHxi+kV1BtErvU2ftxPYktLsnmX/C0/+gsyjSjBNRTloJhYIiXNn503qfKIBU
	Cd+3lWYZ1FotkSauJrKDOG6ozLZXL43hRio1lCnufV2/GW8ld8pihCpPRyOBn5XdTRW7
	h75Pyxt4ZpyJOTFvS8L6BDxszGXU3h4BkUnLI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bkebsb6cozJ++mDBRy0E3stIT2dXxV7w2VDw8qPoC4Fj6CVwwvVMbp1Pol5H1DZLBQ
	y+FHPg1/1qZErPKJ1FNNE/tz5yd2cCj3Uq0OobZMcvJ7o18NXmAwaDjQz4xn6Qqj2cy8
	sm1Di9QdOeXFz2adKTyKzbbLESdSEEgeK5rVc=
MIME-Version: 1.0
Received: by 10.224.78.131 with SMTP id l3mr3072744qak.277.1274123677963; Mon, 
	17 May 2010 12:14:37 -0700 (PDT)
Received: by 10.229.230.77 with HTTP; Mon, 17 May 2010 12:14:37 -0700 (PDT)
In-Reply-To: <20100517190152.GB7868@gmail.com>
References: <AANLkTinM-N-vAT4yP0ptz0UcMBNsLHpQZ1er2VwnsDDv@mail.gmail.com>
	<20100517190152.GB7868@gmail.com>
Date: Mon, 17 May 2010 14:14:37 -0500
Message-ID: <AANLkTinsmKk2J576bTB0-Wkk48G5He9koqeQiU4MHhL_@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.172
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Microblaze gcc 4.5.0 support
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
X-List-Received-Date: Mon, 17 May 2010 19:18:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,

log.do_configure at http://pastebin.com/AjAtfnpu
log.do_compile at http://pastebin.com/bqAmHvuu

Regards

On Mon, May 17, 2010 at 2:01 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On (17/05/10 13:38), Adrian Alonso wrote:
> > Hi, I been working on adding OE support for microblaze arch
> > I have a repo in gitorious [1] holding the changes I made so far;
> > trying to build console-image fails on gcc-cross-initial compilation
> > with the error shown on log [2]
> > "configure: error: cannot compute suffix of object files: cannot compile"
> >
>
> Care to provide config.log ?
>
> > I also update gcc-svn.inc recipe to use gcc-microblaze branch
> > SRC_URI_xlnx-mb-gen = "svn://
> gcc.gnu.org/svn/gcc/branches;module=microblaze
> > And I get the same error shown in gcc-4.5.0
> >
> > From log error I see that OE is generates the suffix info but fails for
> > microblaze arch
> >
> >    1.  set -e; for ml in `cat fixinc_list`; do \
> >    2. |         sysroot_headers_suffix=`echo ${ml} | sed -e 's/;.*$//'`;
> \
> >    3. |         multi_dir=`echo ${ml} | sed -e 's/^[^;]*;//'`; \
> >    4. |         fix_dir=include-fixed${multi_dir}; \
> >
> >
> > Can some one help me out figuring what is missing??
> >
> >
> > [1] http://gitorious.org/oe-microblaze/oe-microblaze
> > <http://gitorious.org/oe-microblaze/oe-microblaze>[2]
> > http://pastebin.com/kqC8AP1s
> >
> > --
> > Saludos
> > Adrian Alonso
> > http://aalonso.wordpress.com
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

