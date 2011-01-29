Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1Pj5LM-0007LZ-PZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 08:35:36 +0100
Received: by vws6 with SMTP id 6so1417423vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 23:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=02G/QbtNjkhWkpgnZgLW9K/zBXL+OyUKBnGkpOCSbpY=;
	b=vJkIKxHEcX675UByqaWZn1uIwQwyy8J8wRXmV/tpqrsFpvna0Epdr2iaMDEKt752Ac
	ieh8c9pU95vdVFnVvPYMD29H9GITpop/ND8LIJkqo8Tnh8CbfYx51RsO9E2nC2f+QAGa
	mdczKQ/NBfb9SlxIx7eIFGFiL1WDfpy94HghI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LeXhAQIvpOwClh1Ywcjs8A9PimaGvPj3UAEMjkUF+PFgi1qy+fCNtmUwvCKb7yu2oA
	ON6nAIU981lWaze/LpIknCzwgd2CACgwyyIIs1FnTiGKkIMKc2Go49jFj4NlGs8JPo5A
	uH9NQbEk7AtB1ScBEzpPftSfwO0DnEyPgOrq8=
MIME-Version: 1.0
Received: by 10.220.201.193 with SMTP id fb1mr910526vcb.5.1296286485548; Fri,
	28 Jan 2011 23:34:45 -0800 (PST)
Received: by 10.220.188.3 with HTTP; Fri, 28 Jan 2011 23:34:45 -0800 (PST)
In-Reply-To: <4D430EA4.7000504@eukrea.com>
References: <1296220547-14948-1-git-send-email-sujak.marek@gmail.com>
	<4D430EA4.7000504@eukrea.com>
Date: Sat, 29 Jan 2011 08:34:45 +0100
Message-ID: <AANLkTi=W1L5-7L_jdNhXNu8JsW09GGJ=bO0KTKrFb9Ek@mail.gmail.com>
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] barebox: patches for barebox 2010.10 to support vmx25
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
X-List-Received-Date: Sat, 29 Jan 2011 07:35:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Eric

On Fri, Jan 28, 2011 at 7:44 PM, Eric B=E9nard <eric@eukrea.com> wrote:

> I think you should merge this patch with the one adding the barebox 2010.=
10
> recipe. Or add a plain barebox 2010.10 recipe and then add ...
>

Yes, this is much more clean solution. I will to that as you recommended
1. first patch - universal barebox 2010.10 recipe
2. second patch - support for vmx25

I have  a question about these commits.
Should i reset git to default state (or clone it again) and then commit new
files?
Or make commit that will firstly remove these files and them upload them in
correct order (firstly raw support, then architecture depended patch)?

Best regards,
 marek

