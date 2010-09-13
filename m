Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvFWf-0004fE-GC
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 22:21:22 +0200
Received: by iwn2 with SMTP id 2so5441526iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 13:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=tX3wDgldztput2KnstL9SltFlrPZ4J382lya0vXPtTc=;
	b=iq5O5UO4nwx9X4ZrgH1/wFuPE97YCfSlc0/HFpTtgDmj6G2SlVINo9iwYKFWxitwmn
	R/iY36cXFseRIzjpLKKZuqNwTTSRzVmbgXwqnj+bpmF/qNv6P77zDd26LZOL9KDnX7e3
	8Va9IoM1aFCAjfuFr9zStAH+UlBeWmWrRroR8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pIjxp6QN2vVCsdztNCYaYwYFk+oaag1SieWCc4f9vlFEESK8uw3Q2Qv2LXEqbKAREa
	icq78864dL8i4V5vhO8voIH2K6Rlnr1DpHyHYCCbSr078OWv2tG+ogGOu5BEZYApFXmm
	vqehS1mC0Fp4VbD2FuVgDL9SVw1LBnItryJDU=
MIME-Version: 1.0
Received: by 10.231.118.28 with SMTP id t28mr6131726ibq.131.1284409231319;
	Mon, 13 Sep 2010 13:20:31 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 13 Sep 2010 13:20:31 -0700 (PDT)
In-Reply-To: <AANLkTim9n1JsDc+bmYN5g20kBtobi5Ti-60Joq1U_rQZ@mail.gmail.com>
References: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>
	<AANLkTikd-_vDny=kJKeS+NVWeYyfxiE_yXdUE+t1ac48@mail.gmail.com>
	<AANLkTi=s9gHBx_uPgiPGhu9b7D10JGytQaxyd-SZ+sfQ@mail.gmail.com>
	<AANLkTinWXK-HZHOLv2b2ApdPQ+LW22bvwsOO5TGOc1kx@mail.gmail.com>
	<AANLkTim9n1JsDc+bmYN5g20kBtobi5Ti-60Joq1U_rQZ@mail.gmail.com>
Date: Mon, 13 Sep 2010 22:20:31 +0200
Message-ID: <AANLkTi=r1NxVPeRVSSP24YXJSRDxUBwvLQo4PH6_iRxj@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: script to remove orphaned files
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
X-List-Received-Date: Mon, 13 Sep 2010 20:21:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

As I don't really see progress on this, I am planning to take action
in a few days.
Since Khem expressed a preference to keep the files accessible, I'm
planning not to remove the unneeded patches, but instead move the to
the obsolete dir.
(alternate could be to move them to a dir called unused in the recipe dir).
Removal will be tested by verifying that bitbake -c patch remains
working on all dirs where unused files are removed.

Frans.


