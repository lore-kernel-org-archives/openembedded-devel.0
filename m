Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LxmVz-0003P0-3s
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Apr 2009 20:22:15 +0200
Received: by an-out-0708.google.com with SMTP id b6so1038588ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Apr 2009 11:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=DEjt7Bjx+9VCH1Gk4WV1hvPstfKNPtRyZS3gY3Bsn6o=;
	b=qANij3IkLoq84X24tJwLAOBHYitu03rdlI44kHweRK35U+2NgbRe59u9CBlpDkCVWe
	ra9u1jZKrdtRziiZvApBbz0AbT+vTZ60xg74F2xKtYI3GIN6byiXk/U/MBrRDCnFN9NZ
	PRFSWNGOpg/z9uZerwpZC4dkV4+gU8SoSWpvQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=G4EQ7OUJfr3+bxlE1ncDe4pAOx/f3uE2Ago68neNoE3Xn52vK2zBruJGBgivKhwA+X
	3ljz/5F8IkPEYwAQO3mpLPNYAinJQ7K9xZGXcMq1tXVaLuSksNwWZ85jWgHLcxFqATcQ
	bCaJU2VqwRVzQW6Gg6W9wWZXN5f3WPzUIYpi8=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.197.7 with SMTP id u7mr5316310anf.108.1240683443064; Sat, 
	25 Apr 2009 11:17:23 -0700 (PDT)
In-Reply-To: <200904251540.40566.mickey@vanille-media.de>
References: <20090425075933.E6E18188456@amethyst.openembedded.net>
	<200904251304.17624.mickey@vanille-media.de>
	<49F310E0.6030909@balister.org>
	<200904251540.40566.mickey@vanille-media.de>
Date: Sat, 25 Apr 2009 15:17:22 -0300
X-Google-Sender-Auth: f1651daed16e8095
Message-ID: <be7a9f3d0904251117p5b0df982wb20f861bb90d9270@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : Revert "ecore: catch up with the new SONAMEs; move to autosplitting"
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
X-List-Received-Date: Sat, 25 Apr 2009 18:22:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Mickey,

On Sat, Apr 25, 2009 at 10:40 AM, Michael 'Mickey' Lauer
<mickey@vanille-media.de> wrote:
> On Saturday 25 April 2009 15:32:16 Philip Balister wrote:
>> Both Graeme and I have expressed concern that the commits in
>> question should be reviewed.
>
> Good. Then do that. The commits fix the linking and RRECOMMENDS issue which was
> not fixed by Koen's commit. Yes, they may break the update path, I'm sorry for
> that, but sometimes you have to catch up with upstream and we have a stable
> branch for a reason.

I belive that the stable branch is not a proper justification for this.

At least for me, stable is to provide a less moving target. A place where
only tested things get in and all involved transitions are done only when
already done in dev and merged all at same time to avoid a breakage.

This all is not a justification to break the whole World at dev. dev will
be the basis of next stable, and even more, it is the source of changes
for stable. So if we mess it up we'll end up with an very difficult to maintain
stable branch and an unusable dev.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


