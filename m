Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1QyQHS-0001yN-Fw
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 17:31:14 +0200
Received: by gxk3 with SMTP id 3so1073022gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=npdAhQUAjd4RbsUyq62yGG9gvQbAETBstnwyhrLefpM=;
	b=DqwSIcMoNOGsidVbLy1fo0PtZcG7D52SPl/EmGFBnXJ3jIK80mFkbUVKltUKnt7DUb
	J4ln4+X5s3Y/h0soxNuwZb/W+LGWPbXCtoJi/qb6pLErnPvSj08sMKLHBi/cbLHva+zv
	xNqx0LXHAQulQpnua9ediqPyu1pg0PLILCNgc=
MIME-Version: 1.0
Received: by 10.236.75.136 with SMTP id z8mr4178834yhd.37.1314717945866; Tue,
	30 Aug 2011 08:25:45 -0700 (PDT)
Received: by 10.236.109.33 with HTTP; Tue, 30 Aug 2011 08:25:45 -0700 (PDT)
In-Reply-To: <1314707457.3796.19.camel@mattotaupa>
References: <4E4E536D.7010103@dresearch-fe.de> <4E4E738C.70109@dresearch-fe.de>
	<4E5356B2.3060908@dresearch-fe.de> <4E53583A.3030405@gmx.net>
	<4E535B83.9080508@dresearch-fe.de>
	<CAFu+nvEh9tUGzQM1PFo1ErtOq+a+0yg94pZBO6Ohr92GNZoKBg@mail.gmail.com>
	<1314199372.21496.12.camel@jjg-linux>
	<4E562AFF.7090004@dresearch-fe.de>
	<4E56579C.7080207@dresearch-fe.de>
	<4E5CC094.2020500@dresearch-fe.de>
	<1314707457.3796.19.camel@mattotaupa>
Date: Tue, 30 Aug 2011 11:25:45 -0400
Message-ID: <CAFu+nvGj96aCyZdphiDL6Rw+VdY8Kpzbd_29Y4G-hLNuwYzTWQ@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [2011.03-maintenance] do_compile failed for cacao_0.99.3.bb
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
X-List-Received-Date: Tue, 30 Aug 2011 15:31:14 -0000
Content-Type: text/plain; charset=UTF-8

sorry about the format of the patch, I had not yet read the commit policy
when I wrote this.  actually when I wrote this I would have needed a pretty
detailed step-by-step, enter these commands, sort of guide.

On Tue, Aug 30, 2011 at 8:30 AM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> Am Dienstag, den 30.08.2011, 12:51 +0200 schrieb Steffen Sledz:
> > On 25.08.2011 16:09, Steffen Sledz wrote:
> > > On 25.08.2011 12:59, Steffen Sledz wrote:
> > >> On 24.08.2011 17:22, Jesse Gilles wrote:
> > >>> On Tue, 2011-08-23 at 13:16 -0400, George C. Huntington, III wrote:
> > >>>> I suspect that the problem is happening earlier, classpath isn't
> building.
> > >>>>  the javac wrapper eats the return code from a java compile.
> > >>>
> > >>> If George is right, then the following patch to the javac wrapper
> script
> > >>> may fix the issue.  It fixes building classpath as well as returns
> the
> > >>> error code if all javac attempts fail.
> > >>>
> > >>> http://patches.openembedded.org/patch/9521/
> > >>
> > >> In our case this patch helps.
> > >>
> > >> If nobody has objections i will commit this patch to oe-dev master and
> request a pull to 2011.03-maintenance.
> > >
> > > It would be still better if we can get some Acks from a java
> maintainer.
> >
> > No NACKs after another week. So i pushed the patch do oe-dev master.
>
> Next time it would be better to resend the patch with a appropriate
> subject line.
>
> Unfortunately the commit message [1] does not conform to our commit
> policy [2].
>
> Please make sure to check those things next time. I feel uncomfortable
> to ask new contributors to comply every time but when they look at the
> commit history they see that the policies are often not cared about.
>
>
> Thanks,
>
> Paul
>
>
> [1]
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=16a8a1e9175035b55d91a141d5302c38d63c16f1
> [2] http://openembedded.org/index.php/Category:Policy
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

