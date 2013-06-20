Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5D90A601AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 13:15:44 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so7168508obq.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 06:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=Rfr+M++96AIU22FknmFtL9elnDwdUjk+c8hvQo3y18s=;
	b=YSPCMVA8Oq8yQWTZCj046WHLay8ozHw6hZJxzp7pO02pBvsUXvuCUvprqWvIho7hcc
	PbEc1VW1ZVBc6mO3H0CNSHOTBp3LHkv1gRGQ58I1xkO91crlXU6OfqB1uKRH+fRlQdjv
	/+CRjs5BVydExBFJ4xzGCN816DXmGRulgs5j2f4Xeky35+M/4DinT4JhEft7EuuG2Tu+
	qVFWzQAH1HcXw3/Gdnz4T3VdV9LWz3FQ6FtnqQreaSo5u257Z+d6WapeItZrKh4zWAr5
	fQxUxCHbCFa4Pnwqetv3aSQcBW90zQPn80JycAlYL/uuqoeiB106nV7HgjjlvTnnOF//
	ohWg==
X-Received: by 10.60.141.231 with SMTP id rr7mr4258172oeb.77.1371734145089;
	Thu, 20 Jun 2013 06:15:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.27.165 with HTTP; Thu, 20 Jun 2013 06:15:24 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jun 2013 09:15:24 -0400
Message-ID: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnf9hasuhVo3qXbXKmfEtiwd2BIDPh459N0NRTAm25v5BG9fFkXVzyclP9BkNi/MyE3a4Ne
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Issues with Qt5/mesa and eglfs
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
X-List-Received-Date: Thu, 20 Jun 2013 13:15:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi there,

i am trying to build Qt5/meta-qt5 with dylan branch in a non X11 distro,
and i got failures during the Qt5 configure step (when auto-detecting EGL
feature). Looking into the issue, the good news is that it seems to be
fixed in oe-core/master with:

d7033f4 mesa: upgrade to 9.1.3

thanks to this :

    Add EGL-Mutate-NativeDisplayType-depending-on-config.patch to build
correctly in
    a non-X11 environment.

    Drop dont-fail-if-libX11-isnt-installed.patch and
    fix-egl-compilation-without-x11-headers.patch as they were backports.


Would you guys consider 'backporting' this patch onto dylan a viable thing?
I will make the backport, but it would be nice if you can confirm that it
can be merged in dylan.

thanks

nico

