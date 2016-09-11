Return-Path: <guzaszymon@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 979DF77162
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 18:10:23 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id a6so22181176wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 11:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=ULXbaiAwJzha53B7V8pueim22n72Yn5j54vemIQi1Fw=;
	b=G/6swDVAHc7c4lkyiyTuTxhISZAv5NKR1YRlw7UR8+EbjIFZK0YccpfdoiKhAJjrKz
	f0o96RNYkE5SLUs/8NBb0rM0IEsv18XfxXYIUaLyDGl2ZN3M9RnuwbixXg/Z2VTEFF5N
	LRAN5y1dL4nr5iKI4vggKrzLHxGctKrZkgcdvg4lQSFwzIU/a2PCqSvrSAhNv0T1BdQb
	ibSMezi1zk/bbsxe7a0GJPXRkwvmnIwBiq9w2XjHoZqNDeuqbtqY5hpDgtlNtHIof38g
	vgNxjlosn3AdI2OFRKh7tgD2mLYah6EJNFLAxGGkndP1W3lt/x+tFb02xYUtJKNmoKfN
	mB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ULXbaiAwJzha53B7V8pueim22n72Yn5j54vemIQi1Fw=;
	b=lpmdqwjtJ0jDIOaNdu9Cl8d3w9hoULlANZW120IyaeYdIWqnNhFhJ8pOljLDuOz+7y
	1h9sysT/UGzOuB/51RW0v7ub7dQ5DveuZDJDtIiOo8xW1EWuTQKW35C7AiXELZwQu9Bw
	GwVmYm8VmdCS83sQFqCxzVRIbcU+88mf+ihjw4h+Dx3qRd99UW3iHxDoFDgZZudC2NS6
	U45B2GWQs4V/y6Ar5bLQ8p/NdVj+xPB+iMIAzb5p6LV/JGiXhfE3yfDx5T2InKzJW6ow
	hTjBYS+7ZRWUI3XntalEMVzMlC5+WdCc4oTAvYmVO9OW+oGsx46LKL/FLojQh+vU1V/z
	5Nhw==
X-Gm-Message-State: AE9vXwNxIEXTQe9bLb8gkFKdsinWBwZOHizTTiaAvo2hchYaSApl0CzHf8tA9rDs1vHLT/3Vs01pdeYVV5Nphg==
X-Received: by 10.28.166.197 with SMTP id p188mr7736433wme.85.1473617423612;
	Sun, 11 Sep 2016 11:10:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.15.2 with HTTP; Sun, 11 Sep 2016 11:10:23 -0700 (PDT)
From: Szymon Guza <guzaszymon@gmail.com>
Date: Sun, 11 Sep 2016 20:10:23 +0200
Message-ID: <CAO=ipHJL-FjdSgDE7pCaxUTjh-DcaMthn0y-X=PxqpJRiG+rvw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [yocto] problem with openCV
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Sep 2016 18:10:24 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I want to create my own yocto disto image based on core-image-weston with
C/C++ compliers and openCV. But when I'm trying to bitbake openCV error
appears:

| -- Configuring incomplete, errors occurred!
| See also "/home/admin/Zynq/poky/build/tmp/work/i586-poky-linux/
opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/CMakeFiles/CMakeOutput.log".
| See also "/home/admin/Zynq/poky/build/tmp/work/i586-poky-linux/
opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/CMakeFiles/CMakeError.log".
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/home/admin/Zynq/poky/build/tmp/work/i586-poky-linux/opencv/3.1+gitAUTOINC+
92387b1ef8-r0/temp/log.do_configure.7661)
ERROR: Task 278 (/home/admin/Zynq/poky/meta-openembedded/meta-oe/recipes-
support/opencv/opencv_3.1.bb, do_configure) failed with exit code '1'

It is connected with this:

This recipe is *blacklisted* by the meta-oe
<https://layers.openembedded.org/layerindex/branch/master/layer/meta-oe/>
layer. The reason provided is:

BROKEN: fails to build with gcc-6

??
Am I right or openCV is now unavailable? Or Am i doing something wrong?
I am looking forward to hearing from you.

