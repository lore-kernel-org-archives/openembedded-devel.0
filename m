Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3p3A-0007GK-SN
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 13:54:17 +0200
Received: by iwn37 with SMTP id 37so82619iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 04:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ceueuPOvW5mWizG29/zIRLmjLx1uY484LWqyO0POlOM=;
	b=mQhkZhp8k2dUm7W9qZgTdUDoki0qcUfpR4m6MRR0wWGO0HxIWinasZn+lGTihACOYh
	8Bt+i7AIacI4YNxBUYxbr40aEzUVZSF9gt4sqjR/J1bGsmYqhqSlAtYrNU/VEiKkZbCc
	kSEWT4QrVuATx1bsDQJY07ibjDvWJ4jotfCLE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FrofJTdfBWI9raRDDPW5oEK0qmtAxhios6KbEFwAyRiSgrwd862kDDPFbZZtrDVaeV
	0w2DOhAz7TxinCZwaiQOvx6tVu0pSwq1pvcmp268ncQFnwfszNfzZZwRQtwnEEf7/UZ6
	gGDpAZMprVzH5btRcdAZB38Esu4RvE+BGdA+k=
MIME-Version: 1.0
Received: by 10.231.183.10 with SMTP id ce10mr722568ibb.96.1286452433929; Thu,
	07 Oct 2010 04:53:53 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 7 Oct 2010 04:53:53 -0700 (PDT)
In-Reply-To: <AANLkTin7gk9uWugcHOBUXPCFc0-QyYcn2MvucKt0Qsrb@mail.gmail.com>
References: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1286399340-15927-2-git-send-email-fransmeulenbroeks@gmail.com>
	<4CACF810.6030402@balister.org>
	<AANLkTin7gk9uWugcHOBUXPCFc0-QyYcn2MvucKt0Qsrb@mail.gmail.com>
Date: Thu, 7 Oct 2010 13:53:53 +0200
Message-ID: <AANLkTimY9cy09+TxWHH+oSJuE5Fs-Vwm5gv5iVL-NCg8@mail.gmail.com>
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
Subject: Re: [PATCH 1/4] RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Thu, 07 Oct 2010 11:54:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Triggered by a remark from Martin on irc:

Do we need a PR bump for all users of those classes?
Did a quick grep, there are 75 recipes inheriting image, about 160
inheriting cpan and about 200 inheriting distutils
rubyextensions.bbclass is not used.

And if it is felt that a bump is needed, is it ok that I make this
change (strictly limiting myself to incrementing PR) and commit that
without further review ?
(each bbclass change + associated PR bump will be a separate commit;
so 4 commits)

(Since a PR bump addresses quite some files, a review has the
disadvantage that the patch probably won't apply any more due to other
changes because one of the files involved has been touched)

Frans.


