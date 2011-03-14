Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzApC-0001SR-GI
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 17:40:54 +0100
Received: by pxi1 with SMTP id 1so1336681pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 09:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=KRpY5g90gl/bn2zDst6FjoqSgs7x6O/+2rac/sCdWmI=;
	b=f3niLdsEZftlssbLuKJJSQJj0QB0d1pho/wg5v6gInvh0hanKmFj0MTBrv5RsK5ez2
	/kotHUf6xuYoqAujUDMTRb0GxfPRJAUFjbyj19L2Gqbpxu/3q/G0hcuTCtuy5av7xqUo
	l/c9PnaCaNHHg7YdyEBuE8RmOPgwKvHkOFEEU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=nDIRpwiq8rn2KyQ/3vW4BqUtik+TTpMtlNDlZGqUSSoSyIyXB0XavSVd/n1/XZgzGk
	4F5LoIUJ0lcn+isGwUmZfdo8MJSl/Pdutr2YrlkBRdOT6KQgjETstdA4Fub6kNQxv136
	BJ+7VKlL26ah3f0XJsClIbBLMSPVdRFQAdgmQ=
Received: by 10.142.140.11 with SMTP id n11mr1036001wfd.140.1300120752585;
	Mon, 14 Mar 2011 09:39:12 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w27sm10467595wfd.16.2011.03.14.09.39.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Mar 2011 09:39:10 -0700 (PDT)
Date: Mon, 14 Mar 2011 09:39:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Steffen Sledz <sledz@dresearch.de>
Message-ID: <20110314163950.GB18023@sakrah.homelinux.org>
Mail-Followup-To: Steffen Sledz <sledz@dresearch.de>,
	openembedded-devel@lists.openembedded.org
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<ild6ma$ton$1@dough.gmane.org> <4D7A4566.6070607@dresearch.de>
	<20110312000524.GE5603@sakrah.homelinux.org>
	<4D7DBE92.5010906@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4D7DBE92.5010906@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] net-snmp: disable libnl use
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
X-List-Received-Date: Mon, 14 Mar 2011 16:40:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (14/03/11 08:06), Steffen Sledz wrote:
> Am 12.03.2011 01:05, schrieb Khem Raj:
> > On (11/03/11 16:53), Steffen Sledz wrote:
> >> On 03/11/2011 02:05 PM, Koen Kooi wrote:
> >>> On 11-03-11 12:04, Steffen Sledz wrote:
> >>>> Fixes compile error
> >>>
> >>>> | ./.libs/libnetsnmpmibs.so: undefined reference to `nl_handle_destroy'
> >>>> | ./.libs/libnetsnmpmibs.so: undefined reference to `nl_handle_alloc'
> >>>
> >>>> which occurred sometimes depending on build order (not in clean package
> >>>> only builds).
> >>>
> >>> What features do we loose when disabling netlink support? I'd rather get
> >>> the libnl recipe fixed (e.g. static lib only) instead of hacking the
> >>> dependants.
> >>
> >> I'm not sure.
> >>
> >> But there is no dependency to libnl. If *libnl was not built before net-snmp* the autotools/configure does not find it. So in that case libnl wasn't used anyway.
> >>
> >> Just in case *it was built before* net-snmp tries to use it and hits the mentioned error.
> > 
> > So assuming that successful builds before did not link in libnl this
> > seems ok to me.
> 
> Can i take that as an ACK?

Acked-by: Khem Raj <raj.khem@gmail.com>
> 
> Steffen
> 
> -- 
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@DResearch.de
> Fax: +49 30 515932-299
> Geschäftsführer: Dr. Michael Weber, Werner Mögle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
> 

-- 
-Khem


