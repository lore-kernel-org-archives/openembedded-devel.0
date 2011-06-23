Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QZtLR-0000Fi-DP
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jun 2011 01:29:57 +0200
Received: by pvf24 with SMTP id 24so1530815pvf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 16:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=xh8NNNfx4VClrpANFCebFLQ6CZpFQgElWcJb0X9hEQE=;
	b=QTEk9RrCDZg9L9PVWJI9vgmxxjWTIkkHOycOVskDTumjQHheZXU+ZIuAdj0oToTcCs
	b+lvFTt/BSAmhguamkBtoBVsCxrPY8E4IzdNAFmyH869wk0zd0X8H647YMp3md8nwUMb
	7ukl8UChP1/A8erGfZ1kUzMUAcFb+aKjhEugI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sLFCIhIm5FT7pdqI4FD7TCF+s7q13Sa0g7Uv4NMi/+iD2VWLpxzXifHxXB9u+U1hw9
	ln6zeCUXCaJ5fG4TgTz/Pt7APqPv1Gy7HNGCSql/oR9BSrMA5z+AT8OHlNd96HzM3Gy8
	CJFuu/sgEqxkOqQioVlHx2J9QsJpxdhIJxDP4=
MIME-Version: 1.0
Received: by 10.142.204.1 with SMTP id b1mr554143wfg.194.1308871580590; Thu,
	23 Jun 2011 16:26:20 -0700 (PDT)
Received: by 10.142.142.18 with HTTP; Thu, 23 Jun 2011 16:26:20 -0700 (PDT)
In-Reply-To: <1308737894-5494-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1308736132.21613.68.camel@phil-desktop>
	<1308737894-5494-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Fri, 24 Jun 2011 01:26:20 +0200
Message-ID: <BANLkTikMSXUZ=0j7CzTrkgQz6P_QOJJKxQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] classes/native*.bbclass: fix error during parse with bitbake master
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
X-List-Received-Date: Thu, 23 Jun 2011 23:29:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2011 at 12:18 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Fixes "AttributeError: 'NoneType' object has no attribute 'split'" during
> parsing with bitbake master. We should not be calling explode_deps with
> None as the argument, so ensure the value isn't None.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> =A0classes/native.bbclass =A0 =A0| =A0 =A02 +-
> =A0classes/nativesdk.bbclass | =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
<snip>

Acked-by: Andrea Adami <andrea.adami@gmail.com>


