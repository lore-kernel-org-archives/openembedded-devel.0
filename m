Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 46FFA6DC4C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 18:06:48 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id l6so796021oag.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 10:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=UD0hBYBHgXxtDQF/UW6keSVBGBnr41Zlp+ckgZXijEA=;
	b=T22B8oSzfO8Asg+ehyzcMQNN8f4uk5LHx2BD9BWFl4K82Bab7ipG+ANTbPyQthl53z
	eH30YhvzVGCTfBWhd8NlAihOh8sz0jqirm0lj7BR9dQcAyY8uawKBMRhxBdo/BPx8FKo
	yAUEM2S5CM9+s3VV/bmHQl1ukogoDtrRIAAK4pkS/9x+sfqlV415s9/Xd4LliPFHPZHT
	5+p0RkVHlqkU4HOv1kYAzzo6TghzW9+5K8UcmYpbdB2CTcZcRByyLc02eYRB8f5UPdrv
	g5iwV2T7XhsKwdZ5rlfK2uyD2Z2wd/2BRwUPfO2Jr8BgNXvQx6k798S+Br+rz0CKgti0
	qCww==
X-Gm-Message-State: ALoCoQkKyDtjTe+MfPqZOffl3NUQkMuCGa5NT6npQx6Mtds5bGnazLe+m0vek1DlJu+JOwI1rW48
X-Received: by 10.60.130.234 with SMTP id oh10mr22835194oeb.60.1393265209424; 
	Mon, 24 Feb 2014 10:06:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Mon, 24 Feb 2014 10:06:29 -0800 (PST)
In-Reply-To: <20140222082502.GL3854@jama>
References: <1393047007-20507-1-git-send-email-armccurdy@gmail.com>
	<1393047007-20507-2-git-send-email-armccurdy@gmail.com>
	<20140222063919.GJ3854@jama> <20140222082502.GL3854@jama>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 24 Feb 2014 19:06:29 +0100
Message-ID: <CAP71WjzXR=qCBBqHLK1UtvtwJ4Cr8wy60tjvmsHsB5ajr4HU0Q@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2 2/2] qtwebkit-examples: add RDEPENDS for ca-certificates
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Feb 2014 18:06:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 22, 2014 at 9:25 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Please ignore my comment, I haven't noticed that you've added
> PACKAGECONFIG_OPENSSL to qt5.inc and it's actually "from qtbase's
> PACKAGECONFIG".
>
> I've added comment in qtbase.inc and integrated this to master-next.

hmm. still i don't get it. openssl can be added to PACKAGECONFIG
without being added in PACKAGECONFIG_OPENSSL, right? so why don't we
test is openssl is in PACKAGECONFIG?

Am I missing anything?

nico

