Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N77sz-00031G-2X
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 14:32:56 +0100
Received: by bwz9 with SMTP id 9so2456571bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 05:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=x9Je91GASP+iKizpXxP6PpGwQRlc/hb1A5Xcd3rsmCI=;
	b=m9CzveK8e7xx0Fhml3GkiTJ94MntEE8KJ/TPf6fvexbrHzjVOC0wXhHq5vWmmwDfBY
	ONEnf/0UFSoyxIAN+BYfZIP8qphB70ct/TOToUvqjlAbMq1/pW8LAbTptLsdVtO+65fg
	5YPjuEztlElPoYze65QsK8k/hmEexdhvoNi9c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=hn3z7bR1NEqPnTJtGg6fSPMqt1fel8U3NcnqbyaYQ+LGRt4CCt/91EhWhPVcARprPP
	y7aEhAnAM4ja/J5voBuOs7rd83yEzmcTZprjFfZqqPED2ui8zCtIsIgJRx8tT9um3roQ
	TyKoeui3R1hHrmkDPy/dpMNLLjK6FsdNvS5Lk=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.179.80 with SMTP id c16mr597250hbg.155.1257687097093; Sun, 
	08 Nov 2009 05:31:37 -0800 (PST)
In-Reply-To: <hd63e9$t75$1@ger.gmane.org>
References: <hd63e9$t75$1@ger.gmane.org>
Date: Sun, 8 Nov 2009 11:31:37 -0200
X-Google-Sender-Auth: 4acfc86165a767ea
Message-ID: <be7a9f3d0911080531r5f12d1e4g85bef92b9ced4e66@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini sorting and updating
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
X-List-Received-Date: Sun, 08 Nov 2009 13:32:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Sun, Nov 8, 2009 at 7:36 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Now 1) can be solved by running a script like the one I mentioned above, but
> 2) needs an attitude adjustment. OE is not wikipedia where recipes get
> deleted because a single person thinks no-one is using them. We have lots of
> people using external overlays for various recipes and deleting things from
> checksums.ini will only make their life harder.
>
> So, please stop deleting checksums and start using a more automated way to
> update checksums.ini :)

While I agree that we shouldn't remove recipes just for fun I also
believe we ought to ignore overlays out there since if they wait to
use a stable codebase, there's a stable branch available for it.
Another thing is that I disagree about keeping it growing. IMO
checksums.ini ought to reflect what is in current metadata and not
all versions that has existed on it.

If someone uses it in a overlay he/she can keep a specific
checksums.ini for it as well.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


