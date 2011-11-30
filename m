Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RVXi5-00079E-6l
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 01:07:37 +0100
Received: by qyk30 with SMTP id 30so13516qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2011 16:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=pId/Z+CwtKq0hcEwPExswxm5y6vYFAGpC9LZ9lhr2j4=;
	b=pN81rIA2o4UYXodK3D4gjtjSX82eNdOAMh7U8Q4ZgsMfUIrjUVjHB//HrJnt8RHiN7
	snXCqM6I22jAQ/nW+3cpv80Jm6tnehiSUY02J8WQoP9IRIvbZDsWQUdF1DBlAo1cZKCl
	X89VKSa1wEmg7Hmk8bq0Tm/zbE2yMUaiRA0N0=
MIME-Version: 1.0
Received: by 10.229.46.4 with SMTP id h4mr1966qcf.188.1322611257041; Tue, 29
	Nov 2011 16:00:57 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Tue, 29 Nov 2011 16:00:57 -0800 (PST)
In-Reply-To: <1322524602-11331-1-git-send-email-raj.khem@gmail.com>
References: <1322524602-11331-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 29 Nov 2011 17:00:57 -0700
Message-ID: <CA+M6bXkdMk9msMLi_ape5a4i2LBV+Rj3zXGf+CMN6+nNVQ9jUA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance][PATCH] eglibc: Fix build when OPTION_EGLIBC_NSSWITCH is not set.
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
X-List-Received-Date: Wed, 30 Nov 2011 00:07:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2011 at 4:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Few of build problems are being reported on classic OE
> when OPTION_EGLIBC_NSSWITCH is set to 'n' by default it
> works well. But when its set to 'n' then we have to make
> sure that OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG and
> OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS are set to point
> to abosolute paths in sources
>
> Fixes build errors like
>
> Makefile:85: *** OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG variable left
> unset. =A0Stop.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

After confirming oe-core has this fix already, applied, thanks.

--=20
Tom


