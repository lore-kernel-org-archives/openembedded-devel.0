Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PS5dZ-0002Dr-Ot
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 11:28:11 +0100
Received: by mail-wy0-f175.google.com with SMTP id 40so5904159wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 02:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9IKj5F4PGaoMO53R/3IadZsIWF5TXhzXZtUnECkOdgY=;
	b=dhaRni4l63ss8+6ZUTiqCuhOFLHC+yut3fBAsaHW49XUhXCatN0SC38wLJtb3k8AfJ
	sKFTfYZlPy4te2rJ9A+/MVr2CZivQpkHVeluJF3SnUdaHq7Hl9gaBM4uEI5w+YC4cjr1
	lEbAdIkOMNav2UYHmTMdoRANiqiExxr/4/mnc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qTOL70+LMmk3ODqj1kmNq/YwL31QhXM6q9yp5PX8Rp7+K2lTBSWyod0ZXxwbVNvQC/
	bYC2Rbo9cV8zz9hP6+HrDE4pHwNusTrmd5TJ6m+vS8fCQ2pzdVgbKb6zeo/vKCP21Hmb
	9N8hKw17xu1FhOuRA4t4metJAWmEFjuJlLhG0=
MIME-Version: 1.0
Received: by 10.227.168.79 with SMTP id t15mr1515394wby.200.1292235997009;
	Mon, 13 Dec 2010 02:26:37 -0800 (PST)
Received: by 10.227.20.15 with HTTP; Mon, 13 Dec 2010 02:26:36 -0800 (PST)
In-Reply-To: <1291914227-25068-6-git-send-email-obi@opendreambox.org>
References: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
	<1291914227-25068-6-git-send-email-obi@opendreambox.org>
Date: Mon, 13 Dec 2010 11:26:36 +0100
Message-ID: <AANLkTimwgUTHoKxYoaX93aWcam-Z3d0UPF4AUiNi3Hgq@mail.gmail.com>
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
Subject: Re: [PATCH 6/8] gst-plugins-bad: remove unpinned versions
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
X-List-Received-Date: Mon, 13 Dec 2010 10:28:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2010 at 6:03 PM, Andreas Oberritter <obi@opendreambox.org> w=
rote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0.../gst-plugins-bad/gst-plugins-directfb-fix.patch | =A0 32 ------
> =A0.../gstreamer/gst-plugins-bad/ivorbis-thumb.patch =A0| =A0 11 --
> =A0recipes/gstreamer/gst-plugins-bad/vorbisdec.h =A0 =A0 =A0| =A0 87 ----=
-------------
> =A0recipes/gstreamer/gst-plugins-bad/vorbisenc.h =A0 =A0 =A0| =A0101 ----=
----------------
> =A0recipes/gstreamer/gst-plugins-bad_0.10.11.bb =A0 =A0 =A0 | =A0 15 ---
> =A0recipes/gstreamer/gst-plugins-bad_0.10.12.bb =A0 =A0 =A0 | =A0 14 ---
> =A0recipes/gstreamer/gst-plugins-bad_0.10.18.bb =A0 =A0 =A0 | =A0 11 --
> =A0recipes/gstreamer/gst-plugins-bad_0.10.19.bb =A0 =A0 =A0 | =A0 11 --
> =A0recipes/gstreamer/gst-plugins-bad_0.10.6.bb =A0 =A0 =A0 =A0| =A0 16 --=
-
> =A0recipes/gstreamer/gst-plugins-bad_0.10.9.bb =A0 =A0 =A0 =A0| =A0 17 --=
--
> =A010 files changed, 0 insertions(+), 315 deletions(-)
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


