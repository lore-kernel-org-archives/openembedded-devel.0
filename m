Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyCLv-0003iB-5t
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 01:06:39 +0100
Received: by yia13 with SMTP id 13so1390565yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 16:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=ls/4LjzndUsRegZJZvuyqDO7eV/5E9ZYIQzkUIztyLU=;
	b=Rjn+fHSLwx23tAjHFEAki9Zhd2hzYYJ7ZEIVRPq7tnuQbrXYYH/IMi7WvzzpevrMU6
	H7VSAm2F+iDWhA6xzLPM3q6fPAH5z92ttrU+lMKtNLYg8K9LTsGVpITWtiwo1gVw1xz+
	SKsd6ePDwSpMpPdlzA4M9429DtKB5eZfV8FJo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=uiC6jOUgDSdj8Rc+kh+OcIVzpY3opn27uiidATlpNBu4p2UMuWMNu9fBYIaPp9jg8j
	iKGnSeBCIRp+Sm/WMHTDSdcppKRIUDcipWnHskc1TkvSt9Pq+Am93z0S097jXaa+13ZU
	7c338BFl/xTds2oziO4HAfitd3FjcDBlMtPh4=
Received: by 10.147.131.7 with SMTP id i7mr14513178yan.11.1299888300117;
	Fri, 11 Mar 2011 16:05:00 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w4sm6003502anw.16.2011.03.11.16.04.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 16:04:59 -0800 (PST)
Date: Fri, 11 Mar 2011 16:05:24 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110312000524.GE5603@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <k.kooi@student.utwente.nl>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<ild6ma$ton$1@dough.gmane.org> <4D7A4566.6070607@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4D7A4566.6070607@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
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
X-List-Received-Date: Sat, 12 Mar 2011 00:06:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (11/03/11 16:53), Steffen Sledz wrote:
> On 03/11/2011 02:05 PM, Koen Kooi wrote:
> > On 11-03-11 12:04, Steffen Sledz wrote:
> >> Fixes compile error
> > 
> >> | ./.libs/libnetsnmpmibs.so: undefined reference to `nl_handle_destroy'
> >> | ./.libs/libnetsnmpmibs.so: undefined reference to `nl_handle_alloc'
> > 
> >> which occurred sometimes depending on build order (not in clean package
> >> only builds).
> > 
> > What features do we loose when disabling netlink support? I'd rather get
> > the libnl recipe fixed (e.g. static lib only) instead of hacking the
> > dependants.
> 
> I'm not sure.
> 
> But there is no dependency to libnl. If *libnl was not built before net-snmp* the autotools/configure does not find it. So in that case libnl wasn't used anyway.
> 
> Just in case *it was built before* net-snmp tries to use it and hits the mentioned error.

So assuming that successful builds before did not link in libnl this
seems ok to me.
> 
> Regards,
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
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


