Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PKE9x-0004L2-SS
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 18:57:08 +0100
Received: by wwb31 with SMTP id 31so947053wwb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 09:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=nq+NOKwXjOiQWljVHD/syyQdr5UOj21Vu6wNJrn12Us=;
	b=kirPP+ubyVy+212zyDkI5S1MhX/+BDOiFdm7GZz6EnXuciPMy6HUQIJBokNOF9YeuR
	yqUSrmoBEZ1NyLUsFlfjoj8qDxdMDFgjPMCmSdW3eTa5J3kfy36g1poTUiVtI2kF68eJ
	R2PAwt6BiwZBueLqa+ekCQGtkYCWayDgbbOcE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=lWHoRS+0w+oBLNPl0tyCJ3dEsAz4v6F3dU4GSJPGLpy/Ik/j9m9QIJPCcmE2DhJAE3
	XlsMQgf4383jC/myQggFguqeStYIU3l/jZaCbuDeqRPX6UApXKlQies38FeBGT/kD65N
	tdKBozhNjGtNyEklkeXhnHDHzr7lazRDTpHDw=
Received: by 10.216.239.199 with SMTP id c49mr4201886wer.12.1290362151857;
	Sun, 21 Nov 2010 09:55:51 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Sun, 21 Nov 2010 09:55:31 -0800 (PST)
In-Reply-To: <4CE95578.8000604@opendreambox.org>
References: <4CE6FA0C.2090801@balister.org> <4CE9332C.7020701@opendreambox.org>
	<AANLkTim-vJEbUXtQtm4TQLbKBBrwG2m_tbao0u4kJuWu@mail.gmail.com>
	<4CE95578.8000604@opendreambox.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 21 Nov 2010 10:55:31 -0700
X-Google-Sender-Auth: 8JAGahPAmfu13qxWsM6UHqL-HsE
Message-ID: <AANLkTikc4Pm+kgyym+Qdd32R3gPo1HX4QtWE0yCf3ykb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8
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
X-List-Received-Date: Sun, 21 Nov 2010 17:57:09 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 21, 2010 at 10:23 AM, Andreas Oberritter
<obi@opendreambox.org>wrote:

> > agreed. but we are soon going to make a release. So it compiled (in
> > whatever way)
> > and now it doesnt (looking from 36000 ft above).
> > So either we fix the known regressions caused or backout because we
> > can not make release in this state for sure.
>
> Soon means in 10 days AFAIK, and you can still revert the patch in the
> release branch if needed. No need to revert it in master just to hide
> already existing bugs.


The release branch is being merged back to master after the release is
tagged, FYI.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

