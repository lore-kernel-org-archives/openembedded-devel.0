Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1LMTXM-00051w-H7
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jan 2009 21:37:28 +0100
Received: by rv-out-0708.google.com with SMTP id f25so12367562rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2009 12:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=D/CCsbTm6r5Ww9YBXzSpdZxsmfQ2QqOl/M1YbiPU8Uc=;
	b=tNReNcwxZ9ZpM8Fr6t/RYjdyqlOYm3wOauuMkqpLrRkKtc+7ESUIxuWpFtqlquWBwI
	dR2f+KkGeF08PPGOMTfNMl2invH3J5P/HLUfyBUav8afmeXgmqGyQWLW8+eW4rWFJr4q
	KQQxlTrngF6nEIDtXbzpo3etR6v3veU3tKQ1U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=T4NczjJWmYfY+R+BchycuRei3Alq1drPYlrN0mktjingoADKPiC8SzQ0EeCTte1aFL
	7rmls3+ViXUjFxmob6ehx1qyKIYsKXW2iyzBeXpxHU1tFN8Qe+nW3IL0QBZNYZIFIh+E
	7BcNyg7y1YL8Eg8I0CXcPVAOWGyCOJEKqivr0=
MIME-Version: 1.0
Received: by 10.140.202.12 with SMTP id z12mr14860084rvf.183.1231792259744; 
	Mon, 12 Jan 2009 12:30:59 -0800 (PST)
In-Reply-To: <20090109011603.GE400@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<1231462490.6467.85.camel@dax.rpnet.com>
	<20090109011603.GE400@smtp.west.cox.net>
Date: Mon, 12 Jan 2009 21:30:59 +0100
Message-ID: <d2b9ea600901121230j30c55a1dya21d22a3c810df1c@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: "Virtual" native and sdk recipes
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
X-List-Received-Date: Mon, 12 Jan 2009 20:37:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2009 at 2:16 AM, Tom Rini <trini@kernel.crashing.org> wrote:
> On Fri, Jan 09, 2009 at 12:54:50AM +0000, Richard Purdie wrote:
>> * I'm also not keen on the SDK_PREFIX -> SDK_PATH change. Why? It
>>   breaks things for people. In fact please back this out before merging
>>   anything above, I don't see a good reason for it.
>
> Esben?

At best, I find it rather disturbing to have BUILD_PREFIX, HOST_PREFIX and
TARGET_PREFIX meaning one thing, and then having a SDK_PREFIX which
is totally different.  And given that we introduce a number of SDK_* variab=
les
similar to the BUILD_*, HOST_* and TARGET_* variables, I think it will dist=
urb
a reasonable number of other people to without this change.

As for it breaking for other people, I did a search of the org.openembedded=
.dev
before making this change, and found that SDK_PATH was used so sparingly,
that the change was so clean that I fail to see a problem with it.  Of-cour=
se,
I don't know how much non org.openembedded.dev code uses it, but I assume
that any such code should be fixed to rely on proper path variables and not
use the SDK_PREFIX (SDK_PATH) directly.

Best regards,
Esben
--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


