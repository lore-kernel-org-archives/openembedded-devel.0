Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PS5cS-00025x-01
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 11:27:00 +0100
Received: by wwi17 with SMTP id 17so5717721wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 02:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8eG2eud485LQ48fegYI2gsuA8yzpwvdSAkAUonRyoN4=;
	b=JB23U0h2aKEG9+2UK49qGJ6gz4UqxluU9bOglpPSM7mJh9sLD5lypZ/5KDBWHWkpzw
	SHiMF4DGue40ZPIIY4KFxPTPGp65OFzcKMeO4vytgcDWnW2pkMCt5sCjsueiLF2IZQuT
	EAVb+aD4A3cs0NyCNcbmTTTwWCcyd/rUNgRlw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DHa4o86I7vgRFCRBQvn0VuAxea5p6aMC3ppoMx1OPw+ZWKf8Tb8LqanUz7Qy9a0v+b
	lz5q4ob+xwxtTbl/tVBJHASM397gFs/LHts9ZouUOb6depBSI13lZ18ysuhIhHNLfKKA
	RrMvJG6CFRUp2KDIcYeh80fVh44YH2orv4yH4=
MIME-Version: 1.0
Received: by 10.227.135.13 with SMTP id l13mr1521654wbt.84.1292235924458; Mon,
	13 Dec 2010 02:25:24 -0800 (PST)
Received: by 10.227.20.15 with HTTP; Mon, 13 Dec 2010 02:25:24 -0800 (PST)
In-Reply-To: <1291914227-25068-4-git-send-email-obi@opendreambox.org>
References: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
	<1291914227-25068-4-git-send-email-obi@opendreambox.org>
Date: Mon, 13 Dec 2010 11:25:24 +0100
Message-ID: <AANLkTimDYOC3SwV1TpJATQ9h6F8f+Apw58oEwuYtVH8i@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/8] gst-plugins-good: remove unpinned versions
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
X-List-Received-Date: Mon, 13 Dec 2010 10:27:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2010 at 6:03 PM, Andreas Oberritter <obi@opendreambox.org> w=
rote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0.../gstreamer/gst-plugins-good/flvdemux-ecma.diff =A0| =A0 26 --------=
------------
> =A0recipes/gstreamer/gst-plugins-good_0.10.13.bb =A0 =A0 =A0| =A0 14 ----=
------
> =A0recipes/gstreamer/gst-plugins-good_0.10.14.bb =A0 =A0 =A0| =A0 14 ----=
------
> =A0recipes/gstreamer/gst-plugins-good_0.10.17.bb =A0 =A0 =A0| =A0 18 ----=
---------
> =A0recipes/gstreamer/gst-plugins-good_0.10.21.bb =A0 =A0 =A0| =A0 16 ----=
--------
> =A0recipes/gstreamer/gst-plugins-good_0.10.23.bb =A0 =A0 =A0| =A0 15 ----=
-------
> =A0recipes/gstreamer/gst-plugins-good_0.10.25.bb =A0 =A0 =A0| =A0 15 ----=
-------
> =A07 files changed, 0 insertions(+), 118 deletions(-)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


