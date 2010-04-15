Received: from qw-out-1920.google.com ([74.125.92.150])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O2QGz-00031n-W2
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 16:42:30 +0200
Received: by qw-out-1920.google.com with SMTP id 4so412661qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:received:message-id:subject
	:from:to:content-type;
	bh=rXuWc4LAY0gf2sSV/nFRAp14Ewljiv27KjEpsAqT69g=;
	b=wtf8emVVvm86B6MRqmSJlltJFbsTwchRKIeG+RlzCNEL82NXUEOyd5IyZgd4NDaIV0
	6XlE9MnzFWRTRlOVLfSZOem0/423l4RMPuzGO4DBtbljsg/Mq3mFUXWgHxa0IBLV8m1G
	XzbrrnKM8769DqnHGCaYWdhCAKaJ+Z6uRJp9s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=EsVFahon15nAggQoDsNg3wdvIhVCiP7l5ibVrJ50Jyy6nhNAW4V8XXRUVwa2EHI73f
	p0vi14dfGc/Asg/QS7WheeNYhLXqQe3v1M0OP0BeVTcqSWrm+bk8ZaCcNsDJZ5tuxU6p
	58V3GnOWPW+ck0tISsDdygDjU10cQiad6elvg=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.46.205 with HTTP; Thu, 15 Apr 2010 07:39:02 -0700 (PDT)
In-Reply-To: <r2ud1b08f941004150317i789f7c89qb3f5a3bd14a7ac5a@mail.gmail.com>
References: <E1O2Ljk-00073j-3j@melo.openembedded.org>
	<r2ud1b08f941004150317i789f7c89qb3f5a3bd14a7ac5a@mail.gmail.com>
Date: Thu, 15 Apr 2010 07:39:02 -0700
X-Google-Sender-Auth: 3bee9d8123ac7132
Received: by 10.229.224.133 with SMTP id io5mr65677qcb.37.1271342342251; Thu, 
	15 Apr 2010 07:39:02 -0700 (PDT)
Message-ID: <m2nb6ebd0a51004150739y964a3f32o19d881338231197a@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.92.150
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Koen Kooi : kernel bbclass: read version from ${B}, remove obsolete hostap logic that breaks the build (from poky)
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
X-List-Received-Date: Thu, 15 Apr 2010 14:42:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thursday, April 15, 2010, Andrea Adami <andrea.adami@gmail.com> wrote:
> Thx, this unbreaks the things!
> Still, is masking the broken base_version_less_or_equal (bitbake's
> vercmp) issue.
>
> Chris seems working on it.

As far as I know, that is fixed in master & 1.10.  Don't think it was
broken in 1.8.

-Chris

-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


