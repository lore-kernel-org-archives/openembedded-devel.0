Return-Path: <vm.rod25@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id E1CB973694
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 14:57:45 +0000 (UTC)
Received: by iehx8 with SMTP id x8so64366437ieh.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=eeF1xM8V99dwKN0LQOLEUsVt0lPLV4wWnHt5iZFzIh4=;
	b=o1JiyFxswrFbRu1TfBwH0vh3IiFrnUmlSmnNzixB3GP4qX38fEEt6p2dhoj8SofEZi
	SV25Z/5gGPPJ99bTp4pmbDm4zVQHvCVW2SAdvL1bNLvbRtGw/4pJqiFap7OPOF+pTLM6
	NHnHslpqqC/m7T2j0tlGPvW2YOJy6+mTKqUiuI1E1lstul8MY2eRxtrIjI5etQ3eSXo4
	529KNY9Z+HrVCcEWE8DRhZc1d6ik2SiGnh5v6Q/Ce7FwvDL4gexgGiOuH0rP8kjTpnVq
	uDwJtuaqkGbseDyjPUJPtBdtXAaq37YAjLBlIUllqc4JowhjNmzFsOco563DYOI2cu0t
	MuHA==
MIME-Version: 1.0
X-Received: by 10.50.30.105 with SMTP id r9mr24734072igh.11.1437490665471;
	Tue, 21 Jul 2015 07:57:45 -0700 (PDT)
Received: by 10.50.141.228 with HTTP; Tue, 21 Jul 2015 07:57:45 -0700 (PDT)
Date: Tue, 21 Jul 2015 09:57:45 -0500
Message-ID: <CAK5mtexxdYxhwvv-MB27Ur56iwAV8O3Y6ah_BPAo+R58NmNouQ@mail.gmail.com>
From: Victor Rodriguez <vm.rod25@gmail.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-devel@lists.openembedded.org
Subject: Bug in Open CV receipt
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
X-List-Received-Date: Tue, 21 Jul 2015 14:57:47 -0000
Content-Type: text/plain; charset=UTF-8

Hi team

Few weeks ago I was having some problems with open CV receipt. In the
begining I toght I was adding opencv tro my core-image-minimal-xfce
just with this:

IMAGE_INSTALL_append = " gcc gcc-dev openssh php mariadb opencv"

Now after booting the image I realize that none of the libraries for
open stack were added to my image

What I had to do was the following:


IMAGE_INSTALL_append = " libopencv-core-dev libopencv-highgui-dev
libopencv-imgproc-dev libopencv-objdetect-dev libopencv-ml-dev
opencv-staticdev python-opencv"

Even last night when one of the opencv developers ask me for python
opencv I had to add the last part python-opencv. That is not cool at
all . If I add opencv in the beginning I assume we are more than cool
with that and yocto will add all the packages . Unless I am doing
something wrong, in taht case I am more than happy to get the
feedback.

Thanks a lot for all the help . If someone else can reproduce this bug
I am more than happy to report it in bugzila (not sure the URL)

Hope it helps to cut the time of some others

Best regards

Victor Rodriguez

