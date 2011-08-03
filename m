Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QoePh-0002Di-Kp
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 18:35:21 +0200
Received: by ywe9 with SMTP id 9so587609ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2011 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=cRKMZ0WwLcc9y/op3t7au6dTdJfbHL1rE3U9/PTEEI8=;
	b=EqptQ0Um2donhCAFswNjX9sTFLl1hMmjNvbNOV8+XYZbft+jKoXat76ScinKqPl5Vb
	xno+PEj5QF8sQ2piESwK37Ex/I4AcNR3DEEkeWDIVa04UL6X7S0epX5gY+mQVVO/mNLQ
	iBCubtRg5d2bqLHh1YEv8gP7SEBi/ptAQMNGk=
Received: by 10.142.66.40 with SMTP id o40mr1592492wfa.380.1312389055296;
	Wed, 03 Aug 2011 09:30:55 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id o6sm1207010pbj.82.2011.08.03.09.30.54
	(version=SSLv3 cipher=OTHER); Wed, 03 Aug 2011 09:30:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 03 Aug 2011 09:30:51 -0700
Message-ID: <16204200.VAzIQNRjoR@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <j1b7fv$cac$1@dough.gmane.org>
References: <1312313539-3772-1-git-send-email-raj.khem@gmail.com>
	<j1b7fv$cac$1@dough.gmane.org>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] gcc-4.6: Bring in linaro patches upto 07.2011 release
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
X-List-Received-Date: Wed, 03 Aug 2011 16:35:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, August 03, 2011 12:21:51 PM Koen Kooi wrote:
> Op 02-08-11 21:32, Khem Raj schreef:
> > I have build/run tested this patch on arm/mips/x86 and on ppc the image
> > did not build so could not run the image but that a different issue
> > right now being addressed in oe-core.
> > 
> > see
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/0073
> > 43.html
> > 
> > Similarily x86-64 built fine but could not do boot testing since it is
> > broken too see.
> > 
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/00743
> > 9.html
> > 
> > Otherwise angstrom/console-image booted for all above said arches
> > successfully except ppc x86_64 for the reasons stated earlier. All
> > builds were done from scratch w/o sstate
> it doesn't apply for me:

it had one really long line and I had to use --no-validate option to get
git send-email in agreement. I have now pushed it to contrib tree here

http://git.openembedded.org/cgit.cgi/meta-openembedded-
contrib/log/?h=kraj/gcc-4.6-linaro-update



