Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PS5eC-0002Qa-Qe
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 11:28:49 +0100
Received: by wyb40 with SMTP id 40so5904883wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 02:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oPa8YNFAF9q/OdQuOv8WNQaFXMrYal5zMf4gCCvx8C4=;
	b=fYoBf3JQvzNluW8OAT8oBfvwAYcbIM40i3egbD/YUFNp7yBT/5ez0GcldXmUAqSU/O
	eHDUy9E+4h22EkNMKOY4TWffKLVp/58l5quYuUG7MJ5x4zVUwZgVWHPyV2a/dydAyzUG
	HdpQ1bEGj6BtEEC3h2bHG1rKt6UJusLMrKwb0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Va0KTg2DVEdzHkH2GfeMUakQ+e8XBSd6zj/hq+X/4nEVIXCJ4hEdm/U9XSoOwNbD6n
	/g9iGvqYVMtFovfTYelDBNHnEQcmYCy700Ykc/g8qulVmXoFddDmxlVK/BJHkbDDX5P6
	rlH0HCDJ2hqOK0k3CZQLbbi4xqesFrsCs2Wb0=
MIME-Version: 1.0
Received: by 10.227.151.204 with SMTP id d12mr1518876wbw.113.1292236033167;
	Mon, 13 Dec 2010 02:27:13 -0800 (PST)
Received: by 10.227.20.15 with HTTP; Mon, 13 Dec 2010 02:27:13 -0800 (PST)
In-Reply-To: <1291914227-25068-3-git-send-email-obi@opendreambox.org>
References: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
	<1291914227-25068-3-git-send-email-obi@opendreambox.org>
Date: Mon, 13 Dec 2010 11:27:13 +0100
Message-ID: <AANLkTikQC8OimJgqS559=7YZi_ANJMwbYXs76vx0B69v@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/8] gstreamer: remove unpinned versions
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
X-List-Received-Date: Mon, 13 Dec 2010 10:28:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2010 at 6:03 PM, Andreas Oberritter <obi@opendreambox.org> w=
rote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0recipes/gstreamer/gstreamer/gstreamer.xsession =A0 =A0 | =A0 =A04 -
> =A0recipes/gstreamer/gstreamer/use-gettext-0.18.patch | 1012 ------------=
--------
> =A0recipes/gstreamer/gstreamer_0.10.22.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A09 -
> =A0recipes/gstreamer/gstreamer_0.10.23.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
1 -
> =A0recipes/gstreamer/gstreamer_0.10.28.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
6 -
> =A0recipes/gstreamer/gstreamer_0.10.29.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
1 -
> =A0recipes/gstreamer/gstreamer_0.10.30.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
3 -
> =A07 files changed, 0 insertions(+), 1076 deletions(-)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


