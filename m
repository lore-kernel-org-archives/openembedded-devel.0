Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MdKrE-0005WV-GL
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 11:19:56 +0200
Received: by bwz17 with SMTP id 17so2662824bwz.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 02:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Pw6uGySlFgfpAYQa6QUs4o1iIV0GbraQ34KUl4UgG7Q=;
	b=k23Yf7U1g11e7qbFZxTdLy+N7btz9zokmTDos4zrF92Btjzdcdsc0i9T7kW+QR9xo8
	j0PbIUsDF/ZRoeApQXx7WGdQ9PZumvTzRXJRAThIedsHpIKqI/KQ1HwSlXP7GGXGeq1q
	mrG068l+69QAwZcmK3+wjQJE3++GUDMuOR4pc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=wXNnW1CV8PtepMSaWFrgfj6G1I97R6KG99m6LrYkOwV6dt9P9+oFMyQsa6j0R8/NOC
	v34B42REJYkFxX0WkCDfNueFA6XZbJn0eLeDQ/7q3sW120bOw9T7oO4KthiglcSOrGbB
	XYAH4a4JLunWbbr7p3xKxPQ/RoUXe0a2XSxIc=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.179.94 with SMTP id c30mr422371hbg.159.1250586171578; Tue, 
	18 Aug 2009 02:02:51 -0700 (PDT)
In-Reply-To: <200908171611.08535.holger+oe@freyther.de>
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com>
	<1250515743-10823-2-git-send-email-msmith@cbnco.com>
	<200908171611.08535.holger+oe@freyther.de>
Date: Tue, 18 Aug 2009 06:02:51 -0300
X-Google-Sender-Auth: e8c89724aff21fe1
Message-ID: <be7a9f3d0908180202t125e5c21tf77ed80c0ab07d22@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] mtools: don't install-info; fixes build on 	non-Debian hosts
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
X-List-Received-Date: Tue, 18 Aug 2009 09:19:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Holger,

On Mon, Aug 17, 2009 at 11:11 AM, Holger Hans Peter
Freyther<holger+oe@freyther.de> wrote:
> again, no need to bump the PR.

I completely disagree with changes landing without PR bump.

Not bumping them can cause a change, that breaks something, to not be
noticed for long time.

In my opinion we ought to _always_ bump PR when changing the recipe.
This ensure it is widely tested and deployed.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


