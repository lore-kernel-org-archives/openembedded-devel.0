Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgyNV-00062A-41
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 13:13:03 +0200
Received: by fxm12 with SMTP id 12so2872891fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 04:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=wLcVP/Cj0SOWtWecs2smQm2OIQxCXvdGNL/wo7TCMcI=;
	b=FDduDhwRyzGk939v5dzoa9VVHqLoBJsZfVxylUVXhqlTPem4jkCmuotSiXNBNJJIEC
	NMVAXfjzeOfKcEVanYFUwg4Xe46rPlsX6BGFOUHmmnpYza7CgdXoZhRULr/rQZB4nHEv
	me6Aw98Vi+nLifUnV+xsa6Rv9I6Bw5I8J5VDA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YVrf6ToQCmJR8o1nwEhrq0MB54nlDLTruww8qe8k6pw+Bx7yLYJM1xTnwVRZXwVo5m
	MKjDsBYnHvHB9q0JKOauiTwi0+nLty43VpBlBiX/ikkkgxWrOLUaiE2ofPas3hsetxEn
	VA6I52jTKjQRV13gOqQTmzdo+pqYeGFVyIE5M=
MIME-Version: 1.0
Received: by 10.204.51.3 with SMTP id b3mr7223508bkg.44.1281006753057; Thu, 05 
	Aug 2010 04:12:33 -0700 (PDT)
Received: by 10.204.21.202 with HTTP; Thu, 5 Aug 2010 04:12:33 -0700 (PDT)
In-Reply-To: <1281003567.16235.254.camel@rex>
References: <1278323612.30247.3579.camel@rex> <1281003567.16235.254.camel@rex>
Date: Thu, 5 Aug 2010 13:12:33 +0200
Message-ID: <AANLkTinDqkXzuPxytNCEq6xinJ1kct1cj5vU_kM=NZ=Z@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Bitbake-dev] RFC: How to improve packaged-staging and setscene
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
X-List-Received-Date: Thu, 05 Aug 2010 11:13:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Richard,

Sounds good to me. Not sure whether I have time to try it out on short
term. Too much other things at hand.

One small concern:
Would it in your proposal be possible to disable packaged staging?
I think it would be nice if a user (in local.conf or so) could decide
on whether he wants to spent build time and space on this.

Frans


