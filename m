Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PEtwj-00021y-8c
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 02:21:28 +0100
Received: by bwz10 with SMTP id 10so4090880bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 18:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=FdfF3hlsW3d39OwTALVf7TRmcg3m/JS08+RnbuigJ7c=;
	b=xFmPIZBYio8k/8DmRg8WaXH7z1Sl2LfxH5F5rSezGsv5ZHHnI5+dOLSFP3W/GWxEGF
	d8s6g0E/NXq69PgyjE8VC78y64k8AmS0LCdHcaDVnTP9z/U5xDOQFEmphdsYUUovWQoh
	4tT78tXkeEca/gOSvBCq4wP5ErrDlZM38Wf+U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=N/jp4yB5M/5whNGdqqqzWFP7mH4vtGOX62wayC8TF3/hbPZiNPlHriualwXg58zlRo
	8C6drwJjRY3gf8kZb2zJzQMCOLlsIwdftmLPP+VrYl7oAPRs2Wvtg4jBP0XTnwo/zv4+
	+WclNNIvh3KONC5XmwpwqFK5N+iQYdfyEd5jA=
Received: by 10.204.98.84 with SMTP id p20mr3264952bkn.213.1289092830464;
	Sat, 06 Nov 2010 18:20:30 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v25sm2413032bkt.6.2010.11.06.18.20.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 06 Nov 2010 18:20:29 -0700 (PDT)
Date: Sun, 7 Nov 2010 02:20:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101107012026.GB3843@jama>
References: <1289061084-19901-1-git-send-email-moncelier@devlife.org>
	<AANLkTi=L6r1i9yayoo9=j_JNx5Yd+bGhgQYotEp=SJ-s@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=L6r1i9yayoo9=j_JNx5Yd+bGhgQYotEp=SJ-s@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: Re: [PATCH 01/11] parted: Added parted-native
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
X-List-Received-Date: Sun, 07 Nov 2010 01:21:28 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Nov 06, 2010 at 02:48:29PM -0700, Khem Raj wrote:
> On Sat, Nov 6, 2010 at 9:31 AM, Camille Moncelier <moncelier@devlife.org> wrote:
> > Signed-off-by: Camille Moncelier <moncelier@devlife.org>
> > ---
> >  recipes/parted/parted_2.3.bb |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> >
> > diff --git a/recipes/parted/parted_2.3.bb b/recipes/parted/parted_2.3.bb
> > index d2ac303..6efb398 100644
> > --- a/recipes/parted/parted_2.3.bb
> > +++ b/recipes/parted/parted_2.3.bb
> > @@ -3,14 +3,18 @@ HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
> >  LICENSE = "GPLv3"
> >  SECTION = "console/tools"
> >  DEPENDS = "readline util-linux-ng lvm2"
> > +DEPENDS_virtclass-native = "readline-native util-linux-ng-native"
> 
> this should not be needed.

should not.. but now it is, because it's broken by autotools/base/vala
bbclass (in this case is maybe even intentional to remove lvm2
dependency?).

http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/026188.html
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/026189.html

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


