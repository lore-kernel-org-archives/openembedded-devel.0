Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1M7Pkq-0002Hc-P1
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 10:05:25 +0200
Received: by yw-out-1718.google.com with SMTP id 9so904219ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2009 00:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=s0/Se/cnWao2nGtkUseeErexBcUn5VWpB2+VpvUGF/o=;
	b=wZ20rHYTECNrXR46Vvu4aQ8gX1ISxXjmj8OIkaQybvffETFLduUl917jyEx3qvEIH1
	wI9QwvIfrd917VQtYrOPYb+Pi9zeGs+tM6q1oKZ0VvxRzN09wJzLkhLDJEeOJWDsjO+6
	adwRN5CakwA2AVDSch08oqyMx2w+zUY1V0Flw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=wxKNaBj4zUIdZ1Sq6nPa6irfGd4Fdu+cc0XWDdi7CPBq5DJz0CAjmGWjm5RFfYp9Im
	2gusmQaZcg55BnuyLr3r0bFMHTjaBsumK2Bj6ALsnfcbcgeCfddNHH4d46cyzMGEqhnt
	6YipcmW+nwW1sS8Dv9u1L1KIOmFnm+4c6x6JY=
Received: by 10.90.68.20 with SMTP id q20mr2919034aga.93.1242979061504;
	Fri, 22 May 2009 00:57:41 -0700 (PDT)
Received: from is.home (93-81-140-165.broadband.corbina.ru [93.81.140.165])
	by mx.google.com with ESMTPS id 40sm7084192aga.23.2009.05.22.00.57.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 May 2009 00:57:40 -0700 (PDT)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 May 2009 11:57:31 +0400
User-Agent: KMail/1.9.10
References: <gv4d2h$oft$1@ger.gmane.org> <gv4i2t$90h$1@ger.gmane.org>
	<gv4md5$jmq$1@ger.gmane.org>
In-Reply-To: <gv4md5$jmq$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200905221157.32033.jay4mail@gmail.com>
Subject: Re: [RFC] policy about nonworking recipes
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
X-List-Received-Date: Fri, 22 May 2009 08:05:26 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

> we're still discussing to find a good solution.  No need to get all
> worked up yet and calling other people pendantic[sic].  Is it really too
> much to ask that the data in OE should generally be such that "bitbake
> $target" at least builds?
>
> If the distribution's settings are responsible for a build failing then
> it's the distribution's responsibility to fix this.  The pulseaudio and
> autoconf example you gave is essentially bug 3722 but can otherwise be
> handled.  BTW, the workflow you then described is not what I'm
> suggesting.
>
> My intention is not to abuse COMPATIBLE_MACHINE if that is not the right
> place.  I can only go by the well-defined meaning in the documentation
> which at least does not mention build-time vs. run-time.
> conf/documentation.conf:COMPATIBLE_MACHINE[doc] = "A regular expression
> which matches the MACHINES support by the package/file. Failure to match
> will cause the file to be skipped by the parser."  IMHO setting it to an
> empty string to indicate that no compatible machines are (currently!)
> known does not conflict with that.

Another portion of FreeBSD ports examples :)
I hope it can be useful.

ATM FreeBSD ports have such knobs in similar area:

# FORBIDDEN     - Package build should not be attempted because of
#                 security vulnerabilities.
# IGNORE        - Package build should be skipped entirely (e.g.
#                 because of serious unfixable problems in the build,
#                 because it cannot be manually fetched, etc).  Error
#                 logs will not appear on pointyhat, so this should be
#                 used sparingly.
# BROKEN        - Port is believed to be broken.  Package builds will
#                 still be attempted on the pointyhat package cluster to
#                 test this assumption.
# DEPRECATED    - Port is deprecated to install. Advisory only.
# EXPIRATION_DATE
#               - If DEPRECATED is set, determines a date when
#                 the port is planed to remove. The date format is
#                 ISO 8601 (YYYY-MM-DD).

# Set these if your port only makes sense to certain architectures.
# They are lists containing names for them (e.g., "alpha i386").
# (Defaults: not set.)
#
# ONLY_FOR_ARCHS
#               - Only build ports if ${ARCH} matches one of these.
# NOT_FOR_ARCHS - Only build ports if ${ARCH} doesn't match one of these.
# ONLY_FOR_ARCHS_REASON
# ONLY_FOR_ARCHS_REASON_${ARCH}
#               - Reason why it's only for ${ONLY_FOR_ARCHS}s
# NOT_FOR_ARCHS_REASON
# NOT_FOR_ARCHS_REASON_${ARCH}
#               - Reason why it's not for ${NOT_FOR_ARCHS}s

Typical examples from real life:
IGNORE=           needs at least FreeBSD 5.3-RELEASE
BROKEN=           Does not compile with GCC 4.2
DEPRECATED=       author has abandoned this program
ONLY_FOR_ARCHS=        i386
ONLY_FOR_ARCHS_REASON= Rebuild of i386 package provided by Nominum.

-- 
Yuri Bushmelev


