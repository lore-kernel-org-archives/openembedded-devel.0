Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zach.frey@gmail.com>) id 1PFp4w-00005w-2b
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 15:21:42 +0100
Received: by wyb34 with SMTP id 34so87720wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Nov 2010 06:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=+ouq23+ap6Cjl0eh+KiBABGwGb3YKaEO6T87eXHSqDw=;
	b=G1RZyboV8IlzCJUaGPvbpc9we4fog2Eds9Nl3AGQYBm/+N1EJMKql1FsMphktmHcgC
	yIV4hB/R+X8rHSmPl1f1VeOrHgcNDDf1J4atT+OvPQYt+UjPnJHpOX0W5yVh1rdgGEZ7
	xTNsbWCOas2EAacZjoKLThs+WE7Wa+HhIoF9A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=smRe/RQ5jfTFFxCIjOAYWtM/k4kiKg3DZOywir91uJLk/T+F86CYCdKgdQ5Cnx9B4E
	dBrpEzWmfeZduCCxcIhZOB66Y+9XgzzH1QDd5XApp3ndY3oe3CHbTW5RTbLD/qnOm6f7
	OFFPbjlmnk6BnJVF76QQVXyvfOwzZNv6Zv8I4=
MIME-Version: 1.0
Received: by 10.216.235.41 with SMTP id t41mr857752weq.55.1289312443085; Tue,
	09 Nov 2010 06:20:43 -0800 (PST)
Sender: zach.frey@gmail.com
Received: by 10.216.63.17 with HTTP; Tue, 9 Nov 2010 06:20:43 -0800 (PST)
In-Reply-To: <AANLkTi=eOF8txqPTf1cFU3ffb2CWg_TkeZD0JaRZkSqC@mail.gmail.com>
References: <AANLkTinnGqbxaJrF=-6OSJ1N=FsDaAcbvDNuYV5SiA2q@mail.gmail.com>
	<AANLkTi=eOF8txqPTf1cFU3ffb2CWg_TkeZD0JaRZkSqC@mail.gmail.com>
Date: Tue, 9 Nov 2010 09:20:43 -0500
X-Google-Sender-Auth: A_4TzbUBW5NX2g04Bkkz1eKXnY0
Message-ID: <AANLkTi=767mf4SZ6ET8NpDPo6+3FGVMC-7KiyiMTXAV5@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: zach.frey@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gcc-cross-intermediate-4.5-r18.0+svnr166342 build failure after today's pull
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
X-List-Received-Date: Tue, 09 Nov 2010 14:21:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 8, 2010 at 4:17 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Nov 8, 2010 at 11:52 AM, Zach Frey <zach@znfrey.com> wrote:
> > Hi,
> >
> > I'm seeing the following failure after updating to latest:
> >
>
> this can happen as gcc is build a bit peculiar way just rebuilding gcc
> is a bit tricky. You could do something like
> bitbake -c clean gcc-cross gcc-cross-initial gcc-cross-intermediate
> glibc glibc-initial; bitbake gcc-cross
> that should work
>
>
Thanks, Khem.  I ended up using the more drastic approach of starting again
with a clean tmp, which also did the trick.


-Zach

