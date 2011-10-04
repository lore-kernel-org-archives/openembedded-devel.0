Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RBCXa-0006Vd-PA
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Oct 2011 23:28:44 +0200
Received: by yxj17 with SMTP id 17so952136yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Oct 2011 14:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=FctjC73cqh7lZnSoRZvly2VFaZycb1j36q+cFn7ZsJA=;
	b=tz7cbhx7TKfUCH0b9liGgUsKjaeAPLxLRwb/pnpRWv/OLt+8LSq2dEo4b5Wo0jjAEi
	8hKK2qaEnqtG+lOCcx0n6ZiS2Z42L4lXXd+vvL3l+FOO8b01hZNWfXiaoD+wiWj7vSDg
	U70WTuRdDs4hBgnA1NXqJkfG4CMmXpDClySxE=
MIME-Version: 1.0
Received: by 10.150.113.5 with SMTP id l5mr1608055ybc.256.1317763388085; Tue,
	04 Oct 2011 14:23:08 -0700 (PDT)
Received: by 10.151.47.19 with HTTP; Tue, 4 Oct 2011 14:23:07 -0700 (PDT)
In-Reply-To: <201109171113.30005.paul.eggleton@linux.intel.com>
References: <1316213951-31505-1-git-send-email-andrea.adami@gmail.com>
	<j51qrk$kpi$2@dough.gmane.org>
	<201109171113.30005.paul.eggleton@linux.intel.com>
Date: Tue, 4 Oct 2011 23:23:07 +0200
Message-ID: <CAAQYJAsx3mAhP+a=FUFMQQzGpmFhs8zSJR9BowANEAK1K7UFwQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] tzcode-native, tzdata: remove recipes from meta-oe
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
X-List-Received-Date: Tue, 04 Oct 2011 21:28:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Sep 17, 2011 at 12:13 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Saturday 17 September 2011 10:56:04 Koen Kooi wrote:
> > Op 17-09-11 00:59, Andrea Adami schreef:
> > > * Up-to-date versions are maintained in oe-core.
> >
> > Are they as good as the ones in meta-oe? There's a good reason for the
> > recipes to be present :)
>
> So if they are indeed better, would you mind submitting a patch to improve
> the
> ones in oe-core instead?
>
> Cheers,
> Paul
>
>
Any news?
Today tzdata from meta-oe still fails miserably

| ERROR: Function 'Fetcher failure for URL: '
ftp://elsie.nci.nih.gov/pub/tzdata2011g.tar.gz;subdir=tzdata-2011g'. Unable
to fetch URL
ftp://elsie.nci.nih.gov/pub/tzdata2011g.tar.gz;subdir=tzdata-2011g from any
source.' failed
NOTE: package tzdata-2011g-r10.0: task do_fetch: Failed
ERROR: Task 3545 (/oe/meta-openembedded/meta-oe/recipes-extended/tzdata/
tzdata_2011g.bb, do_fetch) failed with exit code '1'

Note the two issues here:

1) it try to fetch the old 2011g
2) SRC_URI differs (subdir)
in meta-oe SRC_URI = "
ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;subdir=${BPN}-${PV}"
in oe-core  SRC_URI = "
ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;name=tzdata"

So, finally, about taking the 'good' bits form the meta-oe recipe...which
ones?
Offhand, I see differences in tzdata's do_install (build${prefix}, timezone
and localtime) and for tzcode-native just a pointless NATIVE_INSTALL_WORKS =
1.
Ah, imho having an inc for a single recipe is also overkill.

Am I missing more?

Andrea

--
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

