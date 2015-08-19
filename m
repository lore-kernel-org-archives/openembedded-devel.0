Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9CF73CC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 23:11:04 +0000 (UTC)
Received: by igxp17 with SMTP id p17so117255893igx.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 16:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=oVTETXRqXQA07QuIvrfSsPipfMw8HjWEEpCxGsj/NWw=;
	b=a6tMP+PgVDV8KIkrm5ycaG4m126H3gwvBGSlSHvdbOIs6IW7OThE+gW0a6GTspAsxm
	cWkCXsL3A8+4TRjgR+z2fNG4TVtuqOl+6rUEaWmUS0k6yYOo4Nf+/f8Us6ZhUHfQH7Re
	ZMYUcWQvtM1MVqRjce+RPwNd5nJI0NyDM4bQ6tS3puWId4N3KO6d4GMyYaeITjifnno3
	vBeQ4SGFfG8d8N5muZ+INDLET8dEx6eW/HNzoY7L3zazUIlnjXSX6K8KBnWDCSLrs6kw
	9mEpQK4KP4QsI5AYCTEcCLXMOduP90cNDafBoE2aRSEzx+FH7q1UWIVShrnwirrXoxVr
	IDCA==
X-Gm-Message-State: ALoCoQmfekssG7ROiqPTXSNi5pFWoR7p3rmg26Kiq3jvtO8tvUk3ev1bGDdAU/csdbziyz6emcrY
X-Received: by 10.50.138.2 with SMTP id qm2mr26277935igb.32.1440025864531;
	Wed, 19 Aug 2015 16:11:04 -0700 (PDT)
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com.
	[209.85.213.182]) by smtp.gmail.com with ESMTPSA id
	v11sm1847353iov.20.2015.08.19.16.11.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Aug 2015 16:11:03 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igui7 with SMTP id i7so1460290igu.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 16:11:02 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.66.166 with SMTP id g6mr29199360igt.19.1440025862496;
	Wed, 19 Aug 2015 16:11:02 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 19 Aug 2015 16:11:02 -0700 (PDT)
In-Reply-To: <1439996526-3303-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1439996526-3303-1-git-send-email-ricardo.ribalda@gmail.com>
Date: Wed, 19 Aug 2015 20:11:02 -0300
Message-ID: <CAP9ODKq5OA0xTcZb4cOtZRdZcJy99YHr_n0ZBkO1_PSAeZWRoA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Nathan Lynch <Nathan_Lynch@mentor.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v5] Opencv: Add OpenCV 3.0
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
X-List-Received-Date: Wed, 19 Aug 2015 23:11:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 19, 2015 at 12:02 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> -Support for new PACKAGECONFIGS
> -Merge with opencv-samples
>
> Since it is not backward compatible with 2.x and cannot be installed in
> parallel it has a DEFAULT_PREFERENCE of -1.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Please port the last patches from 2.x for this one. The libv4l is
important for i.MX.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

