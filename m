Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PKZRq-00011U-QT
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 17:40:59 +0100
Received: by wwb31 with SMTP id 31so339758wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 08:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=xUGGCv1JgNp51HwfYM1dxh3LVyEslXbU7irUJ10PL/s=;
	b=mwqZ25xq69mWgv0DF2fSKU+ZY75VxNmy+VEzQ93SJ1aZ2oKOMZAoSDVVtwrJvKes3t
	r3GA/i+q1EKs7tcPAs1B3cC0RZqWiGbJyy05hVrtobYh/PskmN1ztSM/MIj2bKLp3LYr
	FznfnNkoA5cbNahMLqv2d+fs1WzwJoJ0C36b4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=QYCqBRJiDqKxz+uiN3b3+THXZrF37+TEOLPUSXGjN2gt7MxS0e3rW+TmXNG92F7GHa
	B5Gcc4iLPu1FPE8pensaytadXEj4oOBzLXF0Pzn4sDr3gHRekJ2CsEJFO+1RRd3G9Ts9
	SksIKeD3Tk2gZcYnQRTaT7QwetDRI3rdNdmrc=
Received: by 10.216.22.70 with SMTP id s48mr4377098wes.27.1290443981407; Mon,
	22 Nov 2010 08:39:41 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Mon, 22 Nov 2010 08:39:20 -0800 (PST)
In-Reply-To: <4CEA7E5B.7070900@opendreambox.org>
References: <4CE6FA0C.2090801@balister.org> <4CE9332C.7020701@opendreambox.org>
	<AANLkTim-vJEbUXtQtm4TQLbKBBrwG2m_tbao0u4kJuWu@mail.gmail.com>
	<4CE95578.8000604@opendreambox.org>
	<AANLkTikc4Pm+kgyym+Qdd32R3gPo1HX4QtWE0yCf3ykb@mail.gmail.com>
	<4CEA7E5B.7070900@opendreambox.org>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 22 Nov 2010 09:39:20 -0700
X-Google-Sender-Auth: 6LCFTIZ-yDWS4CfxDd2FxrtoEUA
Message-ID: <AANLkTi=64shSQLA58Kxjb=i2S9nL+8Gc6E+OfvgGTFLP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Merging the release branch into master (was: Re: Revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8)
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
X-List-Received-Date: Mon, 22 Nov 2010 16:40:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 22, 2010 at 7:29 AM, Andreas Oberritter <obi@opendreambox.org>wrote:

> On 11/21/2010 06:55 PM, Chris Larson wrote:
> > The release branch is being merged back to master after the release is
> > tagged, FYI.
>
> I've been thinking about it, but I'm not really sure what the point is
> in that if all fixes should already be in master before entering the
> release branch, except for maybe some release-branch specific stuff
> (which in turn must not exist, because it would get merged into master
> after release has been tagged)? You can't even put some release notes
> into the release branch?
>

Primarily for clean git logs.  By *marking* it merged, even though the merge
wouldn't actually make any changes to content, we ensure that git knows
there are no commits in the release tag that aren't also in master (git log
master..releasetag would show nothing, rather than every cherry pick).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

