Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MWOkb-0007vl-8x
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 08:04:26 +0200
Received: by qyk35 with SMTP id 35so1726268qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2009 22:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VQuOtevkLpGtiCyI3AW6QYCSaHsW1KXyXRqCXGtkdS0=;
	b=W6X647B/ckIeuz3lzhgf7SlDRsLE4Tj37vqvS2Z8OkBNyoCqjSpiBQOaIi7OYGLRpW
	c0GTQWtlY2caS8aQ1nRnwqaD/zPLMdwzC4gemhVFlpul3JI/OoOgRlklPcsVyvkirUnF
	q4A/Cr4YYr4xnU/6sdD1rkNFR9mWjw+cCCOBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=exObF6KN3D7wO0qpoxSylg6WF6YAEYBcImghiUVy6pUsCmmbdzKWbJwM12Pexj15gz
	TsoQVFEhPXL7kSNULjgDQTBKE3L4r4uSLR/8GDakGxUcb210qPzD0FmLc7Thv+bsRwb4
	WxAyKXCA1wxZ7a2Lo0iqa/ziWbk1PKee5sJk8=
MIME-Version: 1.0
Received: by 10.229.85.11 with SMTP id m11mr135944qcl.96.1248932964860; Wed, 
	29 Jul 2009 22:49:24 -0700 (PDT)
In-Reply-To: <20090730053353.GF25691@smtp.west.cox.net>
References: <4A6FD077.1060001@gmail.com> <h4ou1e$s42$1@ger.gmane.org>
	<4A700A74.7040507@xora.org.uk>
	<200907291131.04967.marcin@juszkiewicz.com.pl>
	<6ec4247d0907292211w6afc1f60s9fcf21bc7b2d56d3@mail.gmail.com>
	<20090730053353.GF25691@smtp.west.cox.net>
Date: Thu, 30 Jul 2009 15:19:24 +0930
Message-ID: <6ec4247d0907292249k42c582ddid3d53e847c5f835d@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Thu, 30 Jul 2009 06:04:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/7/30 Tom Rini <trini@embeddedalley.com>:
> That should work.

Could you show me how?
I have tried, but the ${UBOOT_ENTRYPOINT} used by either linux.inc or
kernel.bbclass is parsed and put into the run.do_foo file before the
symbol searching occurs.


