Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NAsvV-0004sN-19
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 23:23:04 +0100
Received: by bwz9 with SMTP id 9so1661543bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 14:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=ZSHZFUlKnz0qBnZPoyZi7KhKq9fKaSl5Rs1s+fA7mDk=;
	b=PxhqzH6HejpRBI41blq3pGH/vmCA7FWpK755OOW3ne4+wHcMqGHwHjD+uLc2O3lZm+
	xWy90qPWyVoZWUWLECRi/oLEUu5xJj9MsBdmrQLsvIDfUiUotiY2/0CKi8tkVNAPSdLN
	ErvComPjqhq9qcgLcV/q5JhAxzQ9xfOuwll5Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=uYt9rZzLa0rRylej3mfSvzILxHopR2d7qF+/lPWsESG78W2y7T6fjy8mCUO06mGmc+
	r1H5gCfqf5QseMn+MOS/Sjy1/rwRHsVRN+3gdKh/zDG4IAL8utdQNy0wigyi3aTE6WtU
	fwAAC+9rGnQYAAtXscbN+NgmiAYQNRcQPqlFY=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.185.77 with SMTP id b13mr881335hbh.158.1258582895984; Wed, 
	18 Nov 2009 14:21:35 -0800 (PST)
In-Reply-To: <1258576924.25369.687.camel@lenovo.internal.reciva.com>
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
	<1258576924.25369.687.camel@lenovo.internal.reciva.com>
Date: Wed, 18 Nov 2009 20:21:35 -0200
X-Google-Sender-Auth: 1fad45021704c4da
Message-ID: <be7a9f3d0911181421i4d3a1ffy2417cbbd91d9a1ff@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Wed, 18 Nov 2009 22:23:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Phil,

On Wed, Nov 18, 2009 at 6:42 PM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2009-11-18 at 18:11 -0200, Otavio Salvador wrote:
>> From my POV the best alternative is, before we start changing a lot of
>> stuff in dev we do a merge of stable/2009 into dev to allow easy
>> merging from outside "forks" made by users.
>
> I don't quite understand what you mean by merging stable/2009 into dev.
> Isn't it the case that all the changesets in stable/2009 were
> cherry-picked from .dev in the first place, and hence are already there?
>
> Can you give a bit more detail on what exactly you are proposing?

Please try it:

git checkout -b merge-try origin/org.openembedded.dev
git merge stable/2009

You'll notice how many conflicts it produces.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


