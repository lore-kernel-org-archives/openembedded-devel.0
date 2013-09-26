Return-Path: <aguirre.nicolas@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id AE5916CB6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 16:26:48 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so1421366wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 09:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=eKe7r3MrqRWSYKhUKisHYsntXuE57PnJWzG0d372dOg=;
	b=PCmxwaetFGyCzXH2XtR9e712RUmV8Q4QxoOvBkAqaoxqNWzuk4n5Sjh2SC0P8VOmrd
	GomqLY/gTs/BObJYC0qaflD2dhLk5beNmhNViLsSb+E4IrXNrRuFJ2DoPcidfFHx/LDE
	NT5RwmRznqnJ790gC01CzJt1LWnQ5pVQyzMgm66EKrnAG1ADCAlBHAzfkosusdJjbNEx
	kzY72s2Eq3RTMordpCYt4AQCATV/4CVDd6tuUY+0v/ceipiMhuBdIqzqoDW2ctNJ0a40
	mmQh/3ZXOB3CYq9MQpzsUUgOREFLRp8fo8lrPqHzhXjDW10zweYyk1w1FrERncms0BKP
	Ft5Q==
X-Received: by 10.180.160.240 with SMTP id xn16mr28225138wib.62.1380212809585; 
	Thu, 26 Sep 2013 09:26:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.180.80.69 with HTTP; Thu, 26 Sep 2013 09:26:29 -0700 (PDT)
From: Nicolas Aguirre <aguirre.nicolas@gmail.com>
Date: Thu, 26 Sep 2013 18:26:29 +0200
Message-ID: <CAHTvVMe_qJ+k6gDMxnn=A=O3cemKz+cmGpsDWBOSg6VFqEzefA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-efl] question about OpenGL ES and Evas
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
X-List-Received-Date: Thu, 26 Sep 2013 16:26:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm building an image based on meta-efl.
I added recipes to build OpenGL ES for my hardware (allwinner sunxi
based processor with mali gpu) but i'm facing a problem.
When Evas is build, it will try to find gles includes in sysroot. If
they are found, it's correctly built with this support. So i need to
build and install all this stuff before building evas.
Which is not always the case, when i build an image from scratch for example

I would like to know wihch is the best practice in this case ?

- Add a bbappend to evas in my specific case ?
- Modify evas recipe upstream : detect opengl in distro feature and
add a dependency on virtual/gl in this case ?
- Another solution ?

Best regards,
-- 
Nicolas Aguirre
Mail: aguirre.nicolas@gmail.com
Web: http://enna.geexbox.org
Blog: http://dev.enlightenment.fr/~captainigloo/

