Received: from [209.85.132.242] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MAWzA-0003En-A5
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 00:25:06 +0200
Received: by an-out-0708.google.com with SMTP id b6so3724566ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 15:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=1JLjwqJOcZK1M4uPVtTp+Dyy+mdmNZOXKK9M4noNPqo=;
	b=DFsZKHa34ah2erdFJTvj5GeVYfYc39LJGUBqB2kTgGr4otPfE5pD/TMSShfSR4MY/t
	KAqyYwqhc6j3//ZssQLbAyILh1Zop1DhB20Bq3p2dAG+ctCRNjzsxpk33qOwrVYCc1Pj
	YlvKoEJZ50Ig58p+qpwSY9WbBowpstAEFr7zI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=X5bGWMnkksxwNrAKFlSZFELcKbtr16k4BGKj2cKExaROf+QR7y/PbkSoUY8W2VcjWK
	WFTPZ+wTGn8iL+9gIkrtnLakUwX36/yq1U/ctC+AqYfm2ZuxHU7Iz/9w9U2e7I6UxHbo
	hdIDXVIiy3fZOLIu5seUodN+/yoJuSflqGFbg=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.120.9 with SMTP id s9mr2913499anc.190.1243721790113; Sat, 
	30 May 2009 15:16:30 -0700 (PDT)
In-Reply-To: <20090530213323.GR23842@smtp.west.cox.net>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<200905242049.30726.marcin@juszkiewicz.com.pl>
	<20090530191647.GL23842@smtp.west.cox.net>
	<gvs7gu$3ha$2@ger.gmane.org>
	<20090530213323.GR23842@smtp.west.cox.net>
Date: Sat, 30 May 2009 19:16:29 -0300
X-Google-Sender-Auth: f9e28440355d6070
Message-ID: <be7a9f3d0905301516r30b0f82fv8227f2a3ba28a89f@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sat, 30 May 2009 22:25:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Tom,

On Sat, May 30, 2009 at 6:33 PM, Tom Rini <trini@embeddedalley.com> wrote:
[...]
> Every machine might be able to make use of it, if it either depends on
> unstable / in development programs or modules, OR it can use some
> external kernel module (IMHO the right answer for this is versioned
> dependancies, having the PR be increasing from 2.6.29 to 2.6.30 is
> different than normal behavior). =A0This isn't always going to be an
> option.

I agree that a versioned dependency would be the optimal solution for
it, even better would be if we could use ABI versions for those
depends (somewhat as done for X packages in Debian) however AFAIK
bitbake doesn't support it yet, does it?

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


