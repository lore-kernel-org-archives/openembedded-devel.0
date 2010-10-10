Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P4jg3-0006Hf-U4
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 02:22:35 +0200
Received: by wyf23 with SMTP id 23so1867313wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 17:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=5mn+FLeACWSteyv94eQkLRR1aDkUIRdmvQUZ7Pm/Af0=;
	b=qVZunoJcfAqawSkiih1v5G2GZvQ7GgeYYlvHIgDwS9nU851f5DeF/34zhp1gExPsw/
	5tWguIVVqYBOKnFOZkRWubjKo82WvJRKeLWltvRHOfvc9Fa+RHI60Q3pvgdZ+Zc+QiSW
	VW8xn1u7N+nrGl597PfFfAEpx+wYl6v0wRVCs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=a4+v/QQHLl4AqvTB0MEim02OP3dhsVOAHSF21CJpF86Igd4i8HBBwRAdNKe6s6a+DX
	ABZPhnAQ85FiFLhYsl0LxzPhNoLkwfBF365ACE1WdW+hSdATno2yt//eD9J+k6DfH0OF
	NqUE/Uwc9k2ghqp2z+HcK5HhtHaA8N5nCmO/E=
Received: by 10.227.72.149 with SMTP id m21mr4066045wbj.186.1286670106470;
	Sat, 09 Oct 2010 17:21:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Sat, 9 Oct 2010 17:21:26 -0700 (PDT)
In-Reply-To: <AANLkTinFUpD7NOQPWb6M6HhjegBGOYzySZOxSav4ht-k@mail.gmail.com>
References: <AANLkTi=gS-FkVTi7fUuzkQQ5uuudAbHGtp6ZPfr=YZSX@mail.gmail.com>
	<AANLkTinFUpD7NOQPWb6M6HhjegBGOYzySZOxSav4ht-k@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 9 Oct 2010 17:21:26 -0700
X-Google-Sender-Auth: TpA6C_ElxJjvCndi4tSJunYQbkU
Message-ID: <AANLkTi=HndERpqP10s23yKVtEPGfdepjephLTxmBttrn@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: RDEPENDS/RRECOMMENDS/RSUGGESTS/RPROVIDES/RCONFLICTS/RREPLACES
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
X-List-Received-Date: Sun, 10 Oct 2010 00:22:38 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 8, 2010 at 4:11 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> While doing so I also found things like:
> mokomaze/mokomaze_0.5.5.bb:RDEPENDS_shr += "fsoraw"
> No idea how many things there are with an _distro suffix
>

This is again the _<override>_append vs _append_<override> thing, also.
 They append to RDEPENDS_shr, then RDEPENDS_shr replaces RDEPENDS.  If this
is by design, so be it, but its more likely they want to conditionally
append -- _append_<override>.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

