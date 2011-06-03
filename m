Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shanevolpe@gmail.com>) id 1QSI9p-0007xt-I1
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jun 2011 02:22:33 +0200
Received: by bwz5 with SMTP id 5so1627299bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 17:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=MDUUrQxEf4h4tSdDLg445n6IwH/ycrbyLMbf5+9gZY8=;
	b=P4SWUY7ajEDcsKyCSH9+32An5C9JRLQRLL+Ovhk5GX9R1HJavrBbFSpE9xWZNNCIJ2
	rGq019fLaVzYLDYPdQUtI+aSqlgn2KaQVy2uJGVDu+1ScfDLzPDrHCatVcp/UW8riccD
	GKMkVQ+aQ2cdjpluidgIb7Ust9OFCRNy++ev8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=On4qZG8rIU/s3M0a2MSTFFyzec0ySQ7ou+KKGYVodg2oXXO8DxNELtDPHz+wqMSs35
	cyf8Eq4XYKk6wawfoYPv8Gc/ldTQ/J3qt4vtA3g5s/dBmhYWXBPVQ9xZ7/k6Qr3ehoD8
	5/8V3/4x3gKT4C48it7GKPGfZE6eR4WNc82sU=
Received: by 10.204.46.132 with SMTP id j4mr1299203bkf.86.1307060361185; Thu,
	02 Jun 2011 17:19:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.69.194 with HTTP; Thu, 2 Jun 2011 17:19:01 -0700 (PDT)
In-Reply-To: <BANLkTimetpu_sD=1ESGaQ-x_oY3xKiDPVA@mail.gmail.com>
References: <BANLkTimetpu_sD=1ESGaQ-x_oY3xKiDPVA@mail.gmail.com>
From: Shane Volpe <shanevolpe@gmail.com>
Date: Thu, 2 Jun 2011 20:19:01 -0400
Message-ID: <BANLkTinNovsFAxZTs08aUrd9VWS7_QL0Bg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: TCL Memory tests
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
X-List-Received-Date: Fri, 03 Jun 2011 00:22:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

sorry, I realized I posted this to the wrong mailing list!

On Thu, Jun 2, 2011 at 3:37 PM, Shane Volpe <shanevolpe@gmail.com> wrote:

> All,
> I've been using openOCD for a little over a week now and I'm quite
> impressed.  I've decided to write a series of memory tests for it
> using the TCL interface. I've never used TCL before and I do not have
> much experience with openOCD yet so I'm sure my implementation is less
> than perfect. I've attached the memory tests to this email.  I'm
> hoping others will find them useful and give me additional suggestions
> or help in cleaning up the TCL code!  One thing I do not like is I had
> to set a local variable in each test for the BUSSIZE as the global
> variable TCL option did not seem to work for me.
>
> Again the attached file is untested and written by a novice (me).
> I will post any fixes or changes I make in the future.
>
> The memory tests are a port (algorithms 100% copied) from the
> following site and are public domain:
> http://www.netrino.com/Embedded-Systems/How-To/Memory-Test-Suite-C
> Regards,
> Shane
>

