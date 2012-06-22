Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Shvp3-00029i-Fv
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 06:50:17 +0200
Received: by dalh21 with SMTP id h21so1736547dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 21:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=OqWvK3n71dEUdyXKENygF0ttcIu+8cOTomCo3Qfd5p0=;
	b=Q7X8a+KFQ2Ejakid+h7o4siY0N0rMPoW/htdi7KLBJ77/CFVUlBddPxNeDCIBEWVyJ
	jtnIl4A+OftNDZtxiMRkvo3Rgn6WnLQjEpr6828nNM6Jz045QVGsSb+pp5kFVYjLbwlV
	DOkCgQtHu0bMYjyK1yA3Eyaa2GtO+TewDBwb0NUsfZiHXabtsz+y471ySoCAEzy7qR0I
	x/t+S8NjBcWWY9RoiH77YQXzJO5mx4hMAecqCR0SPS7aRFkQJCtw/6SZK6O/eXS+35LS
	cyVsyLTnvjrzhvrWrhGAUY9gFOBtocyByEoqQjtLEGuRv2MbvH8UMTvd95JqXBo4T4L7
	yaPg==
Received: by 10.68.200.104 with SMTP id jr8mr6416965pbc.9.1340339970051;
	Thu, 21 Jun 2012 21:39:30 -0700 (PDT)
Received: from [192.168.1.102] ([94.205.109.242])
	by mx.google.com with ESMTPS id qm6sm37755876pbc.10.2012.06.21.21.39.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 21:39:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <4FE3F482.50506@gmail.com>
Date: Fri, 22 Jun 2012 08:39:24 +0400
Message-Id: <CC9E678D-B16D-472D-9896-2DDA3E23CB19@gmail.com>
References: <1340338450-23907-1-git-send-email-elvis.dowson@gmail.com>
	<4FE3F482.50506@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1278)
Subject: Re: [meta-openembedded] python_numpy: Fix SRC_URI warnings.
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
X-List-Received-Date: Fri, 22 Jun 2012 04:50:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Jun 22, 2012, at 8:28 AM, Khem Raj wrote:

> Did you test it on arm/mipsel and made sure that SRC_URI is correct
> after this change ?

No, I did not. The location of the files had move to architecture =
specific folders, but the main recipe had not been updated to reflect =
this, so I just corrected the recipe.=20

I have an armv7a board (TI OMAP3530 based Gumstix Overo Fire), but no =
mipsel based board. At the moment, I'm focussing on the powerpc440 on my =
virtex5 fpga board, so perhaps someone else with an arm and mipsel could =
help test it out.

Best regards,

Elvis Dowson=


