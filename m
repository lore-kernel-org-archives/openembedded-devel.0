Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PS5eb-0002Uc-O2
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 11:29:15 +0100
Received: by wwi17 with SMTP id 17so5719615wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 02:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tTtlgGtD9S1jHpM80Gnnyf+RnZpdDcHfYqhd7xZQ6fc=;
	b=fVvoNAjNWTZfJtju7ae2anLuvjXQaMkzq79h0bLcDxpTRJHp6y3WoEIO3rWP2nEPGJ
	we0Ta3ow/jX72AqQqNdSr/C+q/gvvBzcZMQqDGUdQr7hELu0ESCepmblphZ8Qk44YYzN
	iTccgCKrqlqAXAW9WC0gvSJNFU20h8UFt5AS4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UXzQJ5H1+qHBIejGpZ1b9svWbCUgOWU7rxhuMajtn/V+xuz8iGEZf5N7ISM9Upuhh1
	roFBs4n5nv9LakyUzgufzQt5wqJrI4ozC3Ke6sYyN+uGOsi4AFYPZ/m4DINmOZePOtXF
	PgIggvYn3q7XW7fiup60mn7uYGGTnhlyQ0g/A=
MIME-Version: 1.0
Received: by 10.227.58.73 with SMTP id f9mr983703wbh.171.1292236058678; Mon,
	13 Dec 2010 02:27:38 -0800 (PST)
Received: by 10.227.20.15 with HTTP; Mon, 13 Dec 2010 02:27:38 -0800 (PST)
In-Reply-To: <1291914227-25068-8-git-send-email-obi@opendreambox.org>
References: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
	<1291914227-25068-8-git-send-email-obi@opendreambox.org>
Date: Mon, 13 Dec 2010 11:27:38 +0100
Message-ID: <AANLkTind9YHSDAj9Q0nxzghiXWMSSZdF24OM5iPMO_Am@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 8/8] gst-ffmpeg: remove unpinned versions
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
X-List-Received-Date: Mon, 13 Dec 2010 10:29:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2010 at 6:03 PM, Andreas Oberritter <obi@opendreambox.org> w=
rote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0.../gst-ffmpeg-0.10.4/configure-hack.diff =A0 =A0 =A0 =A0 =A0| =A0 10 =
------
> =A0.../gst-ffmpeg-0.10.6/configure-hack.diff =A0 =A0 =A0 =A0 =A0| =A0 10 =
------
> =A0.../gst-ffmpeg-0.10.7/configure-hack.diff =A0 =A0 =A0 =A0 =A0| =A0 12 =
-------
> =A0recipes/gstreamer/gst-ffmpeg_0.10.10.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 3=
0 -----------------
> =A0recipes/gstreamer/gst-ffmpeg_0.10.4.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 3=
4 -------------------
> =A0recipes/gstreamer/gst-ffmpeg_0.10.6.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 3=
5 --------------------
> =A0recipes/gstreamer/gst-ffmpeg_0.10.7.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 3=
5 --------------------
> =A0recipes/gstreamer/gst-ffmpeg_0.10.8.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 3=
1 -----------------
> =A08 files changed, 0 insertions(+), 197 deletions(-)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


