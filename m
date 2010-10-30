Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBz8L-0002ad-Na
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 02:17:22 +0200
Received: by pva4 with SMTP id 4so193123pva.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 17:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=azgXwFOq9E9mFiBwc+iUZjSXK6epm/tETCrk/NuiXoQ=;
	b=ZSMnqgGYVn+GgefzaTTX/mGwgP2GyBRdHI1NQVKSqz3Us6PdpWrANggjQTHNdIb9k8
	uQFCOogSv8XL5qB6slEc64v1hMw9lrAspbl93f8w3Ob8262G0248xcDaiU74reV2Nia1
	lH3XSnuxWDEy4KKRKP1i1HMLKU+eDIWDHwUN4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=vcKuxZWzO+OvkW2oGRAw//yFePZ1h7GHRoTBIDvUb8OtCbUGX+keFqI8ka0IBY1pi6
	G1MqaiqWVrej170x1BHSOi5fOezbxhHFyIFwYwojBPnOCB+Tuq4tVuEMBM1E5pgxaK3p
	P09dDeBqZnIQcoMZdYu/6h/HGpqB5Ef2l8EGM=
Received: by 10.143.45.11 with SMTP id x11mr1845704wfj.79.1288397791483;
	Fri, 29 Oct 2010 17:16:31 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm2728093wfa.23.2010.10.29.17.16.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 29 Oct 2010 17:16:30 -0700 (PDT)
Date: Fri, 29 Oct 2010 17:16:28 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101030001628.GB2437@gmail.com>
References: <1288395329-10474-1-git-send-email-eric@eukrea.com>
	<4CCB5DC0.3030607@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4CCB5DC0.3030607@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: remove unused versions
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
X-List-Received-Date: Sat, 30 Oct 2010 00:17:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (30/10/10 01:50), Eric Bénard wrote:
> Le 30/10/2010 01:35, Eric Bénard a écrit :
> >keep the following versions :
> >1.2.1 (used by oplinux)
> >1.7.2 (used by nylon)
> >1.13.2 (used by angstrom, kaeilos and slugos)
> >1.17.1 (used by angstrom)
> >1.17.3 (latest one)
> >
> forget this one, 1.16.2 should not be removed as it's used by shr.
> 

may be SHR maintainers can chime in if they can move to newer ones.
otherwise we keep it.

> >--- a/recipes/busybox/busybox_1.16.2.bb
> >+++ /dev/null
> >@@ -1,9 +0,0 @@
> >-require busybox.inc
> >-require busybox_1.1x.inc
> >-PR = "${INC_PR}.3"
> >-
> >-DEFAULT_PREFERENCE = "-1"
> >-DEFAULT_PREFERENCE_shr = "1"
> >-
> >-SRC_URI[md5sum] = "2ba980f720a5bdce4ec05423519acc35"
> >-SRC_URI[sha256sum] = "3bf1b1a41294d25335abdd10c65cffdb01c36337ca011f1b38c6ad89590115ba"
> 
> Eric
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


