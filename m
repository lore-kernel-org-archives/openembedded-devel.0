Return-Path: <ashcharles@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id A3CC96FC70
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 13:57:53 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id hy10so2341687vcb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CwugFlG85V2+N6pMAfg1HUXiNRO7yso/KBg3Kc7nb/I=;
	b=YLkpAqOjG5wF7hl24bJzPtdRt9aIy7rgOGElrjwLYegMFJiMJY36qvrbHO0SkQNHWq
	aMzVRtMSxUJIrw+ZQU1OPe2yk1IN45QZ+EZv64FuNuEMkCgaBN9SZaO/anR/voi4C+a1
	9FhEoB4zg6R7RlgLNwGEAIc7z/zcjUE0YAyKZw1ghfl4JbJFHvrpJgibaMMytwal+2Nc
	1AbrVXgyJnmk6kN7k66v2DnYvm8E2CsDV4ToDXiCCX1m0qsA7gawHv8Szi772w2xv8AJ
	zmOVW4/i2dxInWhyDZUKsr/ykrn8LrRJ1GdJVmvzSOVP1s6v/1ACTFSvFbPCgaedvtS3
	yfOA==
MIME-Version: 1.0
X-Received: by 10.58.209.233 with SMTP id mp9mr1475603vec.30.1402667874249;
	Fri, 13 Jun 2014 06:57:54 -0700 (PDT)
Received: by 10.58.196.229 with HTTP; Fri, 13 Jun 2014 06:57:54 -0700 (PDT)
Received: by 10.58.196.229 with HTTP; Fri, 13 Jun 2014 06:57:54 -0700 (PDT)
In-Reply-To: <20140613114047.GI2428@jama>
References: <20140610112604.GF2433@jama>
	<1402424282-324-1-git-send-email-ashcharles@gmail.com>
	<20140613114047.GI2428@jama>
Date: Fri, 13 Jun 2014 06:57:54 -0700
Message-ID: <CAK8F28kOVF4uwefMHoFmjv8TLfhARRbbvASQyTC4avWfdWf3uw@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Patch v3] eject: copy po subdirectory for out-of-tree build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jun 2014 13:57:58 -0000
Content-Type: text/plain; charset=UTF-8

Any chance this is getting built with autotools-brokensep still in place?
On Jun 13, 2014 4:40 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> On Tue, Jun 10, 2014 at 11:18:02AM -0700, Ash Charles wrote:
> > The po subdirectory found on the VPATH for an out-of-tree build so we
> > copy it over. See [1] for discussion.
> >
> > [1]
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/096052.html
> >
> > v3: only create and populate po/ if it doesn't already exist
>
> ^ this doesn't match with patch and it still fails:
>
> ERROR: Function failed: do_compile (log file is located at
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/temp/log.do_compile.31092)
> ERROR: Logfile of failure stored in:
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/temp/log.do_compile.31092
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> 'bit-64', 'x86_64-linux', 'common']
> | DEBUG: Executing shell function do_compile
> | cp:
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/CVS'
> and
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/CVS'
> are the same file
> | cp:
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/Makefile'
> and
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/Makefile'
> are the same file
> | cp:
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/cs_CZ.po'
> and
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/cs_CZ.po'
> are the same file
> | cp:
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/de_DE.po'
> and
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/de_DE.po'
> are the same file
> | cp:
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/eject.pot'
> and
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/eject.pot'
> are the same file
> | cp:
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/es_ES.po'
> and
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/es_ES.po'
> are the same file
> | cp:
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/fr_FR.po'
> and
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/fr_FR.po'
> are the same file
> | cp:
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/ja_JP.eucJP.po'
> and
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/ja_JP.eucJP.po'
> are the same file
> | cp:
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/pt_BR.po'
> and
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/pt_BR.po'
> are the same file
> | cp:
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/tr_TR.po'
> and
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/tr_TR.po'
> are the same file
> | cp:
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/zh_TW.UTF-8.po'
> and
> `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/zh_TW.UTF-8.po'
> are the same file
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/temp/log.do_compile.31092)
> NOTE: recipe eject-2.1.5-r1: task do_compile: Failed
> ERROR: Task 21543
> (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/recipes-support/eject/
> eject_2.1.5.bb, do_compile) failed with exit code '1'
>
> > Signed-off-by: Ash Charles <ashcharles@gmail.com>
> > Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-support/eject/eject_2.1.5.bb | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > index c47c653..a71d83f 100644
> > --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > @@ -16,6 +16,12 @@ S = "${WORKDIR}/${BPN}"
> >
> >  PR = "r1"
> >
> > +do_compile_prepend() {
> > +    # PO subdir must be in build directory
> > +    mkdir -p ${B}/po
> > +    cp -r ${S}/po/* ${B}/po/
> > +}
> > +
> >  ALTERNATIVE_${PN} = "volname eject"
> >  ALTERNATIVE_LINK_NAME[volname] = "${bindir}/volname"
> >  ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
> > --
> > 1.8.3.2
> >
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

