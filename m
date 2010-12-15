Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PSx8A-00066B-Cx
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 20:35:19 +0100
Received: by fxm11 with SMTP id 11so2275225fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 11:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=l46rMDkP7o6nwxezrY8UNyWgGhjPoYPRV+4/vNzrmtc=;
	b=pQappTOLMaKo3NXwyHSsD/ACHlP/AN5zyh7j4VTWOwDdK7cbyI5c4ObTooRW4dT59z
	yJ56BLHipXLy2BZOkPA1kPvU8NxVgJAotXsjyH1BeV9AmY1bbjCgT2o3/wqvv2EHX5we
	PyLQEW3wRAijAXpot1zP/ib2VurIO34Ayws5s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=CHptt910+W+LBpsATCKSReO1BZLlSSCtqgvceKDr9ZiIqkpawkM2xqOtSh03JT1tV5
	9nnDkrTjWhiEL7T9VSCNEBNRXMmb6A7Iu3z9TJ9ZGDzLHUw+TAJa2uvkRRz9/glCPkMJ
	In0IgqFdL55aRBnDQtCHo/1Ku4ohCgkbCq9CY=
Received: by 10.223.122.201 with SMTP id m9mr2839811far.79.1292441620604;
	Wed, 15 Dec 2010 11:33:40 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 5sm602219fak.23.2010.12.15.11.33.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Dec 2010 11:33:38 -0800 (PST)
Date: Wed, 15 Dec 2010 20:33:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20101215193339.GC3238@jama>
References: <1292416949-688-1-git-send-email-otavio@ossystems.com.br>
	<1292417425-1328-1-git-send-email-otavio@ossystems.com.br>
	<20101215130120.GB3238@jama>
	<AANLkTin_QS4A+UM2Oj3K82i+rtC4Qd_aD=oTDQ3iZB7q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTin_QS4A+UM2Oj3K82i+rtC4Qd_aD=oTDQ3iZB7q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] classes/gitpv.bbclass: use 'git describe' to for package version
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
X-List-Received-Date: Wed, 15 Dec 2010 19:35:19 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Dec 15, 2010 at 12:27:12PM -0200, Otavio Salvador wrote:
> On Wed, Dec 15, 2010 at 11:01, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Wed, Dec 15, 2010 at 10:50:25AM -0200, Otavio Salvador wrote:
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ---
> >>  classes/gitpv.bbclass |   41 +++++++++++++++++++++++++++++++++++++++++
> >>  1 files changed, 41 insertions(+), 0 deletions(-)
> >>  create mode 100644 classes/gitpv.bbclass
> >>
> >> diff --git a/classes/gitpv.bbclass b/classes/gitpv.bbclass
> >> new file mode 100644
> >> index 0000000..c9496f1
> >> --- /dev/null
> >> +++ b/classes/gitpv.bbclass
> >> @@ -0,0 +1,41 @@
> >> +# gitpv.bbclass provides a PV variable which is a sortable version
> >> +# with the output of "git describe".
> >> +#
> >> +# It can handle SRCREV = ${AUTOREV}, as well as SRCREV = "<hash>"
> >> +
> >> +PV = "${@get_git_pv(d)}"
> >
> > can you integrate it with
> > classes/gitpkgv.bbclass ?
> 
> I can however I think the usage is different.

I find 3 similar classes a bit confusing
gitpkgv, gitver and now gitpv

so I was hoping that all 3 classes could be merged to one (probably
gitver is best name) where all usefull variables will be prepared, and
then only the right one used in recipe.

Like in gitpkgv.bbclass example:
# inherit gitpkgv
#
# PV = "1.0+git${SRCPV}"        
# PKGV = "1.0+git${GITPKGV}"

btw there should be '+gitr' not '+git' AFAIK

in your case, you can use something like
PV = "${GITVER}"

btw your current implementation imho doesn't provide sortable version in
case someone makes tag "something-special" between tags "release-2010.12" and
"release-2011.03".

> The gitpkgv does not use describe and if there's users of it (there's
> no in recipes) we'd change it for them. That is wrong in my opinion.

agreed but it can still be in same bbclass maybe in new variable ?GITTAGVER?
as long as bbclass is not changing variables like PV (and expects recipe
to use provided variables itself).

> about assign to PV ?= I agree however why someone might want to use it
> only in PKGV?

Here is a bit longer thread with reasoning and description
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg06746.html

Even after converting many recipes from SRCREV to SRCPV I find this
concept nice and if local persistent cache will be still needed in new fetchers 
implementation, then we should probably convert git recipes using SRCPV to
something like GITPKGV (this time hopefully without PE bump).

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


