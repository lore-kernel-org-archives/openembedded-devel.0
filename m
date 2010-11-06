Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PErOO-0004Kd-RI
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 23:37:51 +0100
Received: by wya21 with SMTP id 21so4536654wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 15:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=T6HcQXuUGI//Trve3JUImTP2H4berD6RNclvAhHDf8M=;
	b=VgxGnqvrdSMvjNUc5ZPcIlodf8VKSuAH4TfVc5LbBefB8QN+VUuAb6FLGv7+8NuQff
	dAWGMJZGWwClw78LS+5DDnIvFysmM/jrEkgrJwXMeMBA0Qub3+jKLy0eEygS7V1MBmWN
	R3KYRu3ycLKe4Ol+y/mmU7EBnKRLuW/xFYGlE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=ppkygHH77VX2SEgGYSeZ7O7nomkRenoi20J72/UuHONki0xV99saizb7rewF0jM5/6
	61ayds9zoh31jvoWOO8xXvBM9ZaSUk3rsQLa8V/owSvwrgCoQtDCZcNNpaBT6RuBm7RZ
	3c03UXsuTMcDhs6G3/9A1vAXjUp0+GTimO6+4=
Received: by 10.216.70.200 with SMTP id p50mr3674633wed.54.1289083012754; Sat,
	06 Nov 2010 15:36:52 -0700 (PDT)
MIME-Version: 1.0
Sender: pixdamix@gmail.com
Received: by 10.216.65.65 with HTTP; Sat, 6 Nov 2010 15:36:22 -0700 (PDT)
In-Reply-To: <AANLkTi=L6r1i9yayoo9=j_JNx5Yd+bGhgQYotEp=SJ-s@mail.gmail.com>
References: <1289061084-19901-1-git-send-email-moncelier@devlife.org>
	<AANLkTi=L6r1i9yayoo9=j_JNx5Yd+bGhgQYotEp=SJ-s@mail.gmail.com>
From: Camille Moncelier <moncelier@devlife.org>
Date: Sat, 6 Nov 2010 23:36:22 +0100
X-Google-Sender-Auth: BpDx7f14bYkhq25RQk47KUXhU50
Message-ID: <AANLkTi=i3bg7VdTKhEX4oAkXzX4m3y58F+8+qSfq1qsb@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 01/11] parted: Added parted-native
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
X-List-Received-Date: Sat, 06 Nov 2010 22:37:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 6, 2010 at 10:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>  > diff --git a/recipes/parted/parted_2.3.bb b/recipes/parted/
> parted_2.3.bb
> > index d2ac303..6efb398 100644
> > --- a/recipes/parted/parted_2.3.bb
> > +++ b/recipes/parted/parted_2.3.bb
> > @@ -3,14 +3,18 @@ HOMEPAGE = "
> http://www.gnu.org/software/parted/parted.html"
> >  LICENSE = "GPLv3"
> >  SECTION = "console/tools"
> >  DEPENDS = "readline util-linux-ng lvm2"
> > +DEPENDS_virtclass-native = "readline-native util-linux-ng-native"
>
> this should not be needed.
>

Are you saying this for DEPENDS_virtclass-native are for the whole recipe ?



-- 
Camille Moncelier
http://devlife.org/

If Java had true garbage collection, most programs would
delete themselves upon execution.

