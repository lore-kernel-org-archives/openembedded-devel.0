Received: from [209.85.219.166] (helo=mail-ew0-f166.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Ld5Hg-00079D-Vy
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2009 17:10:00 +0100
Received: by ewy10 with SMTP id 10so1292771ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2009 08:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LlssRhUwtCKRdgxOX+kSnSs84xB6Z4ckKMkUCb/m97k=;
	b=su5VptYxugbrIojdBw2xO7nzLDh6eyMLMP2evmH5YZ4+fHiaOZkAAvkYTjcvyCi9As
	hmq7SzzsTfQLl6KqgtGUnZGQcz0fFMvCXX2Q5/5nmAZqggN7RH/yuBu6oHJEgNEHouHp
	88wjcZwI9Qmm9bknouzn68UlN1NfXJxbM2Lbk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=K/Rx8dS3HUzzqw5HK0f69xgxqosavbPCNHyQ6grGAA5oPtfuFS5P6SoKSJ+FyJ8oy5
	uQ44tJfAiM/g1N8zIy8AFbYk0VLKJRvp1Xbd39ubQSrfs5xdqDiB/Zr7TfZTUhw0WV1N
	fEY1M4fgM0x4cN97JcP4hX1PtCCe5vyDIe7Ig=
MIME-Version: 1.0
Received: by 10.220.92.139 with SMTP id r11mr1015032vcm.15.1235750785585; Fri, 
	27 Feb 2009 08:06:25 -0800 (PST)
In-Reply-To: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
References: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
Date: Fri, 27 Feb 2009 17:06:25 +0100
Message-ID: <c384c5ea0902270806n70ce6bbfg45d19b5ebaf64050@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE breakages, was: Re: fakeroot fails to build
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
X-List-Received-Date: Fri, 27 Feb 2009 16:10:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Thu, Feb 26, 2009 at 6:20 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
>> On 25-02-09 16:14, Mike (mwester) wrote:
>
> The problem I am facing is somewhat different.
> I've added packages which build and test fine in my environment but
> for some reason they do not build properly on tinderbox.
>
That often indicates a leak to the host and/or missing DEPENDS.

The build machines that run test builds, should do so with the minimal
amount of host requirements.

Easily testable using virtual machines with freshly installed Linux,
as most machines grow their installed package base during their
lifecycle.

Regards,
-- 
Leon


