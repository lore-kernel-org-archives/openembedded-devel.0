Return-Path: <chase.maupin@ti.com>
X-Greylist: delayed 453 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Jun 2014 16:52:11 UTC
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE6F6B7A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 16:52:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s55Gicog024263;
	Thu, 5 Jun 2014 11:44:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s55GicIC016133;
	Thu, 5 Jun 2014 11:44:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 5 Jun 2014 11:44:37 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s55GiYoT005764;	Thu, 5 Jun 2014 11:44:35 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>, <koen@dominion.thruhere.net>
Date: Thu, 5 Jun 2014 11:44:30 -0500
Message-ID: <1401986670-3799-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] yavta: Update to latest sources
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
X-List-Received-Date: Thu, 05 Jun 2014 16:52:13 -0000
Content-Type: text/plain

* Update the yavta test utility to the latest sources in the
  git repository.
* Updated the patch by Koen Kooi that allows stdout mode to be
  used to work with the latest sources.
* Added a CFLAGS setting to use the include directory in the
  sources which are more up-to-date and intended to be used
  when building the application.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...mode-to-allow-streaming-over-the-network-.patch |  551 ++++++++++++--------
 meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb   |    7 +-
 2 files changed, 335 insertions(+), 223 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta/0001-Add-stdout-mode-to-allow-streaming-over-the-network-.patch b/meta-oe/recipes-multimedia/v4l2apps/yavta/0001-Add-stdout-mode-to-allow-streaming-over-the-network-.patch
index 430836f..41a5dbf 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/yavta/0001-Add-stdout-mode-to-allow-streaming-over-the-network-.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/yavta/0001-Add-stdout-mode-to-allow-streaming-over-the-network-.patch
@@ -1,18 +1,35 @@
-From 1146a0f01fc8730d5633b46b85d00154a721abbe Mon Sep 17 00:00:00 2001
+From 141d3b3593722eb3d588e7c4b1542f810bc25853 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 22 Jun 2012 12:40:23 +0200
+Date: Thu, 5 Jun 2014 11:29:20 -0500
 Subject: [PATCH] Add stdout mode to allow streaming over the network with nc
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
 ---
- yavta.c |  288 ++++++++++++++++++++++++++++++++++-----------------------------
- 1 file changed, 157 insertions(+), 131 deletions(-)
+ yavta.c |  315 ++++++++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 169 insertions(+), 146 deletions(-)
 
 diff --git a/yavta.c b/yavta.c
-index f3deae0..8020209 100644
+index 32adc26..b398da0 100644
 --- a/yavta.c
 +++ b/yavta.c
-@@ -188,12 +188,12 @@ static int video_open(struct device *dev, const char *devname, int no_query)
+@@ -309,7 +309,7 @@ static bool video_has_fd(struct device *dev)
+ static int video_set_fd(struct device *dev, int fd)
+ {
+ 	if (video_has_fd(dev)) {
+-		printf("Can't set fd (already open).\n");
++		fprintf(stderr, "Can't set fd (already open).\n");
+ 		return -1;
+ 	}
+ 
+@@ -321,18 +321,18 @@ static int video_set_fd(struct device *dev, int fd)
+ static int video_open(struct device *dev, const char *devname)
+ {
+ 	if (video_has_fd(dev)) {
+-		printf("Can't open device (already open).\n");
++		fprintf(stderr, "Can't open device (already open).\n");
+ 		return -1;
+ 	}
  
  	dev->fd = open(devname, O_RDWR);
  	if (dev->fd < 0) {
@@ -25,25 +42,27 @@ index f3deae0..8020209 100644
 -	printf("Device %s opened.\n", devname);
 +	fprintf(stderr, "Device %s opened.\n", devname);
  
- 	if (no_query) {
- 		/* Assume capture device. */
-@@ -211,13 +211,13 @@ static int video_open(struct device *dev, const char *devname, int no_query)
- 	else if (cap.capabilities & V4L2_CAP_VIDEO_OUTPUT)
- 		dev->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
- 	else {
--		printf("Error opening device %s: neither video capture "
-+		fprintf(stderr, "Error opening device %s: neither video capture "
- 			"nor video output supported.\n", devname);
- 		close(dev->fd);
+ 	dev->opened = 1;
+ 
+@@ -352,7 +352,7 @@ static int video_querycap(struct device *dev, unsigned int *capabilities)
+ 	*capabilities = cap.capabilities & V4L2_CAP_DEVICE_CAPS
+ 		     ? cap.device_caps : cap.capabilities;
+ 
+-	printf("Device `%s' on `%s' is a video %s (%s mplanes) device.\n",
++	fprintf(stderr, "Device `%s' on `%s' is a video %s (%s mplanes) device.\n",
+ 		cap.card, cap.bus_info,
+ 		video_is_capture(dev) ? "capture" : "output",
+ 		video_is_mplane(dev) ? "with" : "without");
+@@ -370,7 +370,7 @@ static int cap_get_buf_type(unsigned int capabilities)
+ 	} else if (capabilities & V4L2_CAP_VIDEO_OUTPUT) {
+ 		return V4L2_BUF_TYPE_VIDEO_OUTPUT;
+ 	} else {
+-		printf("Device supports neither capture nor output.\n");
++		fprintf(stderr, "Device supports neither capture nor output.\n");
  		return -EINVAL;
  	}
  
--	printf("Device `%s' on `%s' is a video %s device.\n",
-+	fprintf(stderr, "Device `%s' on `%s' is a video %s device.\n",
- 		cap.card, cap.bus_info,
- 		dev->type == V4L2_BUF_TYPE_VIDEO_CAPTURE ? "capture" : "output");
- 	return 0;
-@@ -280,7 +280,7 @@ static int get_control(struct device *dev, unsigned int id, int type,
+@@ -440,7 +440,7 @@ static int get_control(struct device *dev, unsigned int id, int type,
  		}
  	}
  
@@ -52,7 +71,7 @@ index f3deae0..8020209 100644
  		id, strerror(errno), errno);
  	return -1;
  }
-@@ -322,12 +322,12 @@ static void set_control(struct device *dev, unsigned int id, int type,
+@@ -484,12 +484,12 @@ static void set_control(struct device *dev, unsigned int id, int type,
  			val = old.value;
  	}
  	if (ret == -1) {
@@ -67,7 +86,7 @@ index f3deae0..8020209 100644
  	       id, old_val, val);
  }
  
-@@ -341,7 +341,7 @@ static int video_get_format(struct device *dev)
+@@ -504,7 +504,7 @@ static int video_get_format(struct device *dev)
  
  	ret = ioctl(dev->fd, VIDIOC_G_FMT, &fmt);
  	if (ret < 0) {
@@ -76,16 +95,34 @@ index f3deae0..8020209 100644
  			errno);
  		return ret;
  	}
-@@ -351,7 +351,7 @@ static int video_get_format(struct device *dev)
- 	dev->bytesperline = fmt.fmt.pix.bytesperline;
- 	dev->imagesize = fmt.fmt.pix.bytesperline ? fmt.fmt.pix.sizeimage : 0;
+@@ -514,7 +514,7 @@ static int video_get_format(struct device *dev)
+ 		dev->height = fmt.fmt.pix_mp.height;
+ 		dev->num_planes = fmt.fmt.pix_mp.num_planes;
+ 
+-		printf("Video format: %s (%08x) %ux%u field %s, %u planes: \n",
++	    fprintf(stderr, "Video format: %s (%08x) %ux%u field %s, %u planes: \n",
+ 			v4l2_format_name(fmt.fmt.pix_mp.pixelformat), fmt.fmt.pix_mp.pixelformat,
+ 			fmt.fmt.pix_mp.width, fmt.fmt.pix_mp.height,
+ 			v4l2_field_name(fmt.fmt.pix_mp.field),
+@@ -527,7 +527,7 @@ static int video_get_format(struct device *dev)
+ 					fmt.fmt.pix_mp.plane_fmt[i].bytesperline ?
+ 						fmt.fmt.pix_mp.plane_fmt[i].sizeimage : 0;
+ 
+-			printf(" * Stride %u, buffer size %u\n",
++			fprintf(stderr, " * Stride %u, buffer size %u\n",
+ 				fmt.fmt.pix_mp.plane_fmt[i].bytesperline,
+ 				fmt.fmt.pix_mp.plane_fmt[i].sizeimage);
+ 		}
+@@ -539,7 +539,7 @@ static int video_get_format(struct device *dev)
+ 		dev->plane_fmt[0].bytesperline = fmt.fmt.pix.bytesperline;
+ 		dev->plane_fmt[0].sizeimage = fmt.fmt.pix.bytesperline ? fmt.fmt.pix.sizeimage : 0;
  
--	printf("Video format: %s (%08x) %ux%u (stride %u) buffer size %u\n",
-+	fprintf(stderr, "Video format: %s (%08x) %ux%u (stride %u) buffer size %u\n",
- 		v4l2_format_name(fmt.fmt.pix.pixelformat), fmt.fmt.pix.pixelformat,
- 		fmt.fmt.pix.width, fmt.fmt.pix.height, fmt.fmt.pix.bytesperline,
- 		fmt.fmt.pix.sizeimage);
-@@ -374,12 +374,12 @@ static int video_set_format(struct device *dev, unsigned int w, unsigned int h,
+-		printf("Video format: %s (%08x) %ux%u (stride %u) field %s buffer size %u\n",
++		fprintf(stderr, "Video format: %s (%08x) %ux%u (stride %u) field %s buffer size %u\n",
+ 			v4l2_format_name(fmt.fmt.pix.pixelformat), fmt.fmt.pix.pixelformat,
+ 			fmt.fmt.pix.width, fmt.fmt.pix.height, fmt.fmt.pix.bytesperline,
+ 			v4l2_field_name(fmt.fmt.pix_mp.field),
+@@ -581,25 +581,25 @@ static int video_set_format(struct device *dev, unsigned int w, unsigned int h,
  
  	ret = ioctl(dev->fd, VIDIOC_S_FMT, &fmt);
  	if (ret < 0) {
@@ -95,12 +132,27 @@ index f3deae0..8020209 100644
  		return ret;
  	}
  
--	printf("Video format set: %s (%08x) %ux%u (stride %u) buffer size %u\n",
-+	fprintf(stderr, "Video format set: %s (%08x) %ux%u (stride %u) buffer size %u\n",
- 		v4l2_format_name(fmt.fmt.pix.pixelformat), fmt.fmt.pix.pixelformat,
- 		fmt.fmt.pix.width, fmt.fmt.pix.height, fmt.fmt.pix.bytesperline,
- 		fmt.fmt.pix.sizeimage);
-@@ -396,16 +396,16 @@ static int video_set_framerate(struct device *dev, struct v4l2_fract *time_per_f
+ 	if (video_is_mplane(dev)) {
+-		printf("Video format set: %s (%08x) %ux%u field %s, %u planes: \n",
++		fprintf(stderr, "Video format set: %s (%08x) %ux%u field %s, %u planes: \n",
+ 			v4l2_format_name(fmt.fmt.pix_mp.pixelformat), fmt.fmt.pix_mp.pixelformat,
+ 			fmt.fmt.pix_mp.width, fmt.fmt.pix_mp.height,
+ 			v4l2_field_name(fmt.fmt.pix_mp.field),
+ 			fmt.fmt.pix_mp.num_planes);
+ 
+ 		for (i = 0; i < fmt.fmt.pix_mp.num_planes; i++) {
+-			printf(" * Stride %u, buffer size %u\n",
++			fprintf(stderr, " * Stride %u, buffer size %u\n",
+ 				fmt.fmt.pix_mp.plane_fmt[i].bytesperline,
+ 				fmt.fmt.pix_mp.plane_fmt[i].sizeimage);
+ 		}
+ 	} else {
+-		printf("Video format set: %s (%08x) %ux%u (stride %u) field %s buffer size %u\n",
++		fprintf(stderr, "Video format set: %s (%08x) %ux%u (stride %u) field %s buffer size %u\n",
+ 			v4l2_format_name(fmt.fmt.pix.pixelformat), fmt.fmt.pix.pixelformat,
+ 			fmt.fmt.pix.width, fmt.fmt.pix.height, fmt.fmt.pix.bytesperline,
+ 			v4l2_field_name(fmt.fmt.pix.field),
+@@ -619,16 +619,16 @@ static int video_set_framerate(struct device *dev, struct v4l2_fract *time_per_f
  
  	ret = ioctl(dev->fd, VIDIOC_G_PARM, &parm);
  	if (ret < 0) {
@@ -120,7 +172,7 @@ index f3deae0..8020209 100644
  		time_per_frame->numerator,
  		time_per_frame->denominator);
  
-@@ -414,19 +414,19 @@ static int video_set_framerate(struct device *dev, struct v4l2_fract *time_per_f
+@@ -637,19 +637,19 @@ static int video_set_framerate(struct device *dev, struct v4l2_fract *time_per_f
  
  	ret = ioctl(dev->fd, VIDIOC_S_PARM, &parm);
  	if (ret < 0) {
@@ -143,7 +195,52 @@ index f3deae0..8020209 100644
  		parm.parm.capture.timeperframe.numerator,
  		parm.parm.capture.timeperframe.denominator);
  	return 0;
-@@ -449,12 +449,12 @@ static int video_alloc_buffers(struct device *dev, int nbufs,
+@@ -674,7 +674,7 @@ static int video_buffer_mmap(struct device *dev, struct buffer *buffer,
+ 		buffer->mem[i] = mmap(0, length, PROT_READ | PROT_WRITE, MAP_SHARED,
+ 				      dev->fd, offset);
+ 		if (buffer->mem[i] == MAP_FAILED) {
+-			printf("Unable to map buffer %u/%u: %s (%d)\n",
++			fprintf(stderr, "Unable to map buffer %u/%u: %s (%d)\n",
+ 			       buffer->idx, i, strerror(errno), errno);
+ 			return -1;
+ 		}
+@@ -682,7 +682,7 @@ static int video_buffer_mmap(struct device *dev, struct buffer *buffer,
+ 		buffer->size[i] = length;
+ 		buffer->padding[i] = 0;
+ 
+-		printf("Buffer %u/%u mapped at address %p.\n",
++		fprintf(stderr, "Buffer %u/%u mapped at address %p.\n",
+ 		       buffer->idx, i, buffer->mem[i]);
+ 	}
+ 
+@@ -697,7 +697,7 @@ static int video_buffer_munmap(struct device *dev, struct buffer *buffer)
+ 	for (i = 0; i < dev->num_planes; i++) {
+ 		ret = munmap(buffer->mem[i], buffer->size[i]);
+ 		if (ret < 0) {
+-			printf("Unable to unmap buffer %u/%u: %s (%d)\n",
++			fprintf(stderr, "Unable to unmap buffer %u/%u: %s (%d)\n",
+ 			       buffer->idx, i, strerror(errno), errno);
+ 		}
+ 
+@@ -725,7 +725,7 @@ static int video_buffer_alloc_userptr(struct device *dev, struct buffer *buffer,
+ 		ret = posix_memalign(&buffer->mem[i], page_size,
+ 				     length + offset + padding);
+ 		if (ret < 0) {
+-			printf("Unable to allocate buffer %u/%u (%d)\n",
++			fprintf(stderr, "Unable to allocate buffer %u/%u (%d)\n",
+ 			       buffer->idx, i, ret);
+ 			return -ENOMEM;
+ 		}
+@@ -734,7 +734,7 @@ static int video_buffer_alloc_userptr(struct device *dev, struct buffer *buffer,
+ 		buffer->size[i] = length;
+ 		buffer->padding[i] = padding;
+ 
+-		printf("Buffer %u/%u allocated at address %p.\n",
++		fprintf(stderr, "Buffer %u/%u allocated at address %p.\n",
+ 		       buffer->idx, i, buffer->mem[i]);
+ 	}
+ 
+@@ -809,12 +809,12 @@ static int video_alloc_buffers(struct device *dev, int nbufs,
  
  	ret = ioctl(dev->fd, VIDIOC_REQBUFS, &rb);
  	if (ret < 0) {
@@ -158,8 +255,8 @@ index f3deae0..8020209 100644
  
  	buffers = malloc(rb.count * sizeof buffers[0]);
  	if (buffers == NULL)
-@@ -470,35 +470,35 @@ static int video_alloc_buffers(struct device *dev, int nbufs,
- 		buf.memory = dev->memtype;
+@@ -835,12 +835,12 @@ static int video_alloc_buffers(struct device *dev, int nbufs,
+ 
  		ret = ioctl(dev->fd, VIDIOC_QUERYBUF, &buf);
  		if (ret < 0) {
 -			printf("Unable to query buffer %u: %s (%d).\n", i,
@@ -167,49 +264,13 @@ index f3deae0..8020209 100644
  				strerror(errno), errno);
  			return ret;
  		}
--		printf("length: %u offset: %u\n", buf.length, buf.m.offset);
-+		fprintf(stderr, "length: %u offset: %u\n", buf.length, buf.m.offset);
- 
- 		switch (dev->memtype) {
- 		case V4L2_MEMORY_MMAP:
- 			buffers[i].mem = mmap(0, buf.length, PROT_READ | PROT_WRITE, MAP_SHARED, dev->fd, buf.m.offset);
- 			if (buffers[i].mem == MAP_FAILED) {
--				printf("Unable to map buffer %u: %s (%d)\n", i,
-+				fprintf(stderr, "Unable to map buffer %u: %s (%d)\n", i,
- 					strerror(errno), errno);
- 				return ret;
- 			}
- 			buffers[i].size = buf.length;
- 			buffers[i].padding = 0;
--			printf("Buffer %u mapped at address %p.\n", i, buffers[i].mem);
-+			fprintf(stderr, "Buffer %u mapped at address %p.\n", i, buffers[i].mem);
- 			break;
- 
- 		case V4L2_MEMORY_USERPTR:
- 			ret = posix_memalign(&buffers[i].mem, page_size, buf.length + offset + padding);
- 			if (ret < 0) {
--				printf("Unable to allocate buffer %u (%d)\n", i, ret);
-+				fprintf(stderr, "Unable to allocate buffer %u (%d)\n", i, ret);
- 				return -ENOMEM;
- 			}
- 			buffers[i].mem += offset;
- 			buffers[i].size = buf.length;
- 			buffers[i].padding = padding;
--			printf("Buffer %u allocated at address %p.\n", i, buffers[i].mem);
-+			fprintf(stderr, "Buffer %u allocated at address %p.\n", i, buffers[i].mem);
- 			break;
+ 		get_ts_flags(buf.flags, &ts_type, &ts_source);
+-		printf("length: %u offset: %u timestamp type/source: %s/%s\n",
++		fprintf(stderr, "length: %u offset: %u timestamp type/source: %s/%s\n",
+ 		       buf.length, buf.m.offset, ts_type, ts_source);
  
- 		default:
-@@ -525,7 +525,7 @@ static int video_free_buffers(struct device *dev)
- 		case V4L2_MEMORY_MMAP:
- 			ret = munmap(dev->buffers[i].mem, dev->buffers[i].size);
- 			if (ret < 0) {
--				printf("Unable to unmap buffer %u: %s (%d)\n", i,
-+				fprintf(stderr, "Unable to unmap buffer %u: %s (%d)\n", i,
- 					strerror(errno), errno);
- 				return ret;
- 			}
-@@ -549,12 +549,12 @@ static int video_free_buffers(struct device *dev)
+ 		buffers[i].idx = i;
+@@ -899,12 +899,12 @@ static int video_free_buffers(struct device *dev)
  
  	ret = ioctl(dev->fd, VIDIOC_REQBUFS, &rb);
  	if (ret < 0) {
@@ -224,7 +285,7 @@ index f3deae0..8020209 100644
  
  	free(dev->buffers);
  	dev->nbufs = 0;
-@@ -589,7 +589,7 @@ static int video_queue_buffer(struct device *dev, int index, enum buffer_fill_mo
+@@ -974,7 +974,7 @@ static int video_queue_buffer(struct device *dev, int index, enum buffer_fill_mo
  
  	ret = ioctl(dev->fd, VIDIOC_QBUF, &buf);
  	if (ret < 0)
@@ -233,7 +294,7 @@ index f3deae0..8020209 100644
  			strerror(errno), errno);
  
  	return ret;
-@@ -602,7 +602,7 @@ static int video_enable(struct device *dev, int enable)
+@@ -987,7 +987,7 @@ static int video_enable(struct device *dev, int enable)
  
  	ret = ioctl(dev->fd, enable ? VIDIOC_STREAMON : VIDIOC_STREAMOFF, &type);
  	if (ret < 0) {
@@ -242,19 +303,20 @@ index f3deae0..8020209 100644
  			enable ? "start" : "stop", strerror(errno), errno);
  		return ret;
  	}
-@@ -623,9 +623,9 @@ static void video_query_menu(struct device *dev, struct v4l2_queryctrl *query)
+@@ -1009,10 +1009,10 @@ static void video_query_menu(struct device *dev, struct v4l2_queryctrl *query,
  			continue;
  
  		if (query->type == V4L2_CTRL_TYPE_MENU)
--			printf("  %u: %.32s\n", menu.index, menu.name);
-+			fprintf(stderr, "  %u: %.32s\n", menu.index, menu.name);
+-			printf("  %u: %.32s%s\n", menu.index, menu.name,
++			fprintf(stderr, "  %u: %.32s%s\n", menu.index, menu.name,
+ 			       menu.index == value ? " (*)" : "");
  		else
--			printf("  %u: %lld\n", menu.index, menu.value);
-+			fprintf(stderr, "  %u: %lld\n", menu.index, menu.value);
+-			printf("  %u: %lld%s\n", menu.index, menu.value,
++			fprintf(stderr, "  %u: %lld%s\n", menu.index, menu.value,
+ 			       menu.index == value ? " (*)" : "");
  	};
  }
- 
-@@ -655,7 +655,7 @@ static void video_list_controls(struct device *dev)
+@@ -1043,7 +1043,7 @@ static void video_list_controls(struct device *dev)
  			continue;
  
  		if (query.type == V4L2_CTRL_TYPE_CTRL_CLASS) {
@@ -263,7 +325,7 @@ index f3deae0..8020209 100644
  			continue;
  		}
  
-@@ -665,7 +665,7 @@ static void video_list_controls(struct device *dev)
+@@ -1053,7 +1053,7 @@ static void video_list_controls(struct device *dev)
  		else
  			sprintf(value, "%" PRId64, val64);
  
@@ -272,7 +334,7 @@ index f3deae0..8020209 100644
  			query.id, query.name, query.minimum, query.maximum,
  			query.step, query.default_value, value);
  
-@@ -677,9 +677,9 @@ static void video_list_controls(struct device *dev)
+@@ -1065,9 +1065,9 @@ static void video_list_controls(struct device *dev)
  	}
  
  	if (nctrls)
@@ -284,7 +346,7 @@ index f3deae0..8020209 100644
  }
  
  static void video_enum_frame_intervals(struct device *dev, __u32 pixelformat,
-@@ -700,30 +700,30 @@ static void video_enum_frame_intervals(struct device *dev, __u32 pixelformat,
+@@ -1088,30 +1088,30 @@ static void video_enum_frame_intervals(struct device *dev, __u32 pixelformat,
  			break;
  
  		if (i != ival.index)
@@ -322,7 +384,7 @@ index f3deae0..8020209 100644
  				ival.stepwise.min.numerator,
  				ival.stepwise.min.denominator,
  				ival.stepwise.max.numerator,
-@@ -731,7 +731,7 @@ static void video_enum_frame_intervals(struct device *dev, __u32 pixelformat,
+@@ -1119,7 +1119,7 @@ static void video_enum_frame_intervals(struct device *dev, __u32 pixelformat,
  			return;
  
  		case V4L2_FRMIVAL_TYPE_STEPWISE:
@@ -331,7 +393,7 @@ index f3deae0..8020209 100644
  				ival.stepwise.min.numerator,
  				ival.stepwise.min.denominator,
  				ival.stepwise.max.numerator,
-@@ -761,23 +761,23 @@ static void video_enum_frame_sizes(struct device *dev, __u32 pixelformat)
+@@ -1149,23 +1149,23 @@ static void video_enum_frame_sizes(struct device *dev, __u32 pixelformat)
  			break;
  
  		if (i != frame.index)
@@ -360,7 +422,7 @@ index f3deae0..8020209 100644
  				frame.stepwise.min_width,
  				frame.stepwise.min_height,
  				frame.stepwise.max_width,
-@@ -785,11 +785,11 @@ static void video_enum_frame_sizes(struct device *dev, __u32 pixelformat)
+@@ -1173,11 +1173,11 @@ static void video_enum_frame_sizes(struct device *dev, __u32 pixelformat)
  			video_enum_frame_intervals(dev, frame.pixel_format,
  				frame.stepwise.max_width,
  				frame.stepwise.max_height);
@@ -374,7 +436,7 @@ index f3deae0..8020209 100644
  				frame.stepwise.min_width,
  				frame.stepwise.min_height,
  				frame.stepwise.max_width,
-@@ -799,7 +799,7 @@ static void video_enum_frame_sizes(struct device *dev, __u32 pixelformat)
+@@ -1187,7 +1187,7 @@ static void video_enum_frame_sizes(struct device *dev, __u32 pixelformat)
  			video_enum_frame_intervals(dev, frame.pixel_format,
  				frame.stepwise.max_width,
  				frame.stepwise.max_height);
@@ -383,7 +445,7 @@ index f3deae0..8020209 100644
  			break;
  
  		default:
-@@ -823,19 +823,19 @@ static void video_enum_formats(struct device *dev, enum v4l2_buf_type type)
+@@ -1211,19 +1211,19 @@ static void video_enum_formats(struct device *dev, enum v4l2_buf_type type)
  			break;
  
  		if (i != fmt.index)
@@ -409,7 +471,7 @@ index f3deae0..8020209 100644
  	}
  }
  
-@@ -853,13 +853,13 @@ static void video_enum_inputs(struct device *dev)
+@@ -1241,13 +1241,13 @@ static void video_enum_inputs(struct device *dev)
  			break;
  
  		if (i != input.index)
@@ -426,7 +488,7 @@ index f3deae0..8020209 100644
  }
  
  static int video_get_input(struct device *dev)
-@@ -869,7 +869,7 @@ static int video_get_input(struct device *dev)
+@@ -1257,7 +1257,7 @@ static int video_get_input(struct device *dev)
  
  	ret = ioctl(dev->fd, VIDIOC_G_INPUT, &input);
  	if (ret < 0) {
@@ -435,7 +497,7 @@ index f3deae0..8020209 100644
  			strerror(errno), errno);
  		return ret;
  	}
-@@ -884,7 +884,7 @@ static int video_set_input(struct device *dev, unsigned int input)
+@@ -1272,7 +1272,7 @@ static int video_set_input(struct device *dev, unsigned int input)
  
  	ret = ioctl(dev->fd, VIDIOC_S_INPUT, &_input);
  	if (ret < 0)
@@ -444,7 +506,7 @@ index f3deae0..8020209 100644
  			strerror(errno), errno);
  
  	return ret;
-@@ -903,14 +903,14 @@ static int video_set_quality(struct device *dev, unsigned int quality)
+@@ -1291,14 +1291,14 @@ static int video_set_quality(struct device *dev, unsigned int quality)
  
  	ret = ioctl(dev->fd, VIDIOC_S_JPEGCOMP, &jpeg);
  	if (ret < 0) {
@@ -461,87 +523,99 @@ index f3deae0..8020209 100644
  
  	return 0;
  }
-@@ -930,7 +930,7 @@ static int video_load_test_pattern(struct device *dev, const char *filename)
- 
- 	if (filename == NULL) {
- 		if (dev->bytesperline == 0) {
--			printf("Compressed format detect and no test pattern filename given.\n"
-+			fprintf(stderr, "Compressed format detect and no test pattern filename given.\n"
- 				"The test pattern can't be generated automatically.\n");
- 			return -EINVAL;
+@@ -1313,7 +1313,7 @@ static int video_load_test_pattern(struct device *dev, const char *filename)
+ 	if (filename != NULL) {
+ 		fd = open(filename, O_RDONLY);
+ 		if (fd == -1) {
+-			printf("Unable to open test pattern file '%s': %s (%d).\n",
++			fprintf(stderr, "Unable to open test pattern file '%s': %s (%d).\n",
+ 				filename, strerror(errno), errno);
+ 			return -errno;
  		}
-@@ -947,7 +947,7 @@ static int video_load_test_pattern(struct device *dev, const char *filename)
+@@ -1331,7 +1331,7 @@ static int video_load_test_pattern(struct device *dev, const char *filename)
+ 		if (filename != NULL) {
+ 			ret = read(fd, dev->pattern[plane], size);
+ 			if (ret != (int)size && dev->plane_fmt[plane].bytesperline != 0) {
+-				printf("Test pattern file size %u doesn't match image size %u\n",
++				fprintf(stderr, "Test pattern file size %u doesn't match image size %u\n",
+ 					ret, size);
+ 				ret = -EINVAL;
+ 				goto done;
+@@ -1341,7 +1341,7 @@ static int video_load_test_pattern(struct device *dev, const char *filename)
+ 			unsigned int i;
+ 
+ 			if (dev->plane_fmt[plane].bytesperline == 0) {
+-				printf("Compressed format detected for plane %u and no test pattern filename given.\n"
++				fprintf(stderr, "Compressed format detected for plane %u and no test pattern filename given.\n"
+ 					"The test pattern can't be generated automatically.\n", plane);
+ 				ret = -EINVAL;
+ 				goto done;
+@@ -1410,7 +1410,7 @@ static void video_verify_buffer(struct device *dev, struct v4l2_buffer *buf)
  
- 	fd = open(filename, O_RDONLY);
- 	if (fd == -1) {
--		printf("Unable to open test pattern file '%s': %s (%d).\n",
-+		fprintf(stderr, "Unable to open test pattern file '%s': %s (%d).\n",
- 			filename, strerror(errno), errno);
- 		return -errno;
- 	}
-@@ -956,7 +956,7 @@ static int video_load_test_pattern(struct device *dev, const char *filename)
- 	close(fd);
+ 		if (dev->plane_fmt[plane].sizeimage &&
+ 		    dev->plane_fmt[plane].sizeimage != length)
+-			printf("Warning: bytes used %u != image size %u for plane %u\n",
++			fprintf(stderr, "Warning: bytes used %u != image size %u for plane %u\n",
+ 			       length, dev->plane_fmt[plane].sizeimage, plane);
  
- 	if (ret != (int)size && dev->bytesperline != 0) {
--		printf("Test pattern file size %u doesn't match image size %u\n",
-+		fprintf(stderr, "Test pattern file size %u doesn't match image size %u\n",
- 			ret, size);
- 		return -EINVAL;
- 	}
-@@ -1012,16 +1012,16 @@ static void video_verify_buffer(struct device *dev, int index)
- 	}
+ 		if (buffer->padding[plane] == 0)
+@@ -1424,16 +1424,16 @@ static void video_verify_buffer(struct device *dev, struct v4l2_buffer *buf)
+ 		}
  
- 	if (errors) {
--		printf("Warning: %u bytes overwritten among %u first padding bytes\n",
-+		fprintf(stderr, "Warning: %u bytes overwritten among %u first padding bytes\n",
- 		       errors, dirty);
+ 		if (errors) {
+-			printf("Warning: %u bytes overwritten among %u first padding bytes for plane %u\n",
++			fprintf(stderr, "Warning: %u bytes overwritten among %u first padding bytes for plane %u\n",
+ 			       errors, dirty, plane);
  
- 		dirty = (dirty + 15) & ~15;
- 		dirty = dirty > 32 ? 32 : dirty;
+ 			dirty = (dirty + 15) & ~15;
+ 			dirty = dirty > 32 ? 32 : dirty;
  
- 		for (i = 0; i < dirty; ++i) {
--			printf("%02x ", data[i]);
-+			fprintf(stderr, "%02x ", data[i]);
- 			if (i % 16 == 15)
--				printf("\n");
-+				fprintf(stderr, "\n");
+ 			for (i = 0; i < dirty; ++i) {
+-				printf("%02x ", data[i]);
++				fprintf(stderr, "%02x ", data[i]);
+ 				if (i % 16 == 15)
+-					printf("\n");
++					fprintf(stderr, "\n");
+ 			}
  		}
  	}
- }
-@@ -1061,15 +1061,29 @@ static void video_save_image(struct device *dev, struct v4l2_buffer *buf,
+@@ -1481,18 +1481,32 @@ static void video_save_image(struct device *dev, struct v4l2_buffer *buf,
+ 
+ 		ret = write(fd, dev->buffers[buf->index].mem[i], length);
+ 		if (ret < 0) {
+-			printf("write error: %s (%d)\n", strerror(errno), errno);
++			fprintf(stderr, "write error: %s (%d)\n", strerror(errno), errno);
+ 			break;
+ 		} else if (ret != (int)length)
+-			printf("write error: only %d bytes written instead of %u\n",
++			fprintf(stderr, "write error: only %d bytes written instead of %u\n",
+ 			       ret, length);
+ 	}
  	close(fd);
+ }
  
- 	if (ret < 0)
--		printf("write error: %s (%d)\n", strerror(errno), errno);
-+		fprintf(stderr, "write error: %s (%d)\n", strerror(errno), errno);
- 	else if (ret != (int)buf->bytesused)
--		printf("write error: only %d bytes written instead of %u\n",
-+		fprintf(stderr, "write error: only %d bytes written instead of %u\n",
-+		       ret, buf->bytesused);
-+}
-+
 +static void video_stdout_image(struct device *dev, struct v4l2_buffer *buf)
 +{
-+	int ret;
++    int ret;
 +
-+	fprintf(stderr, "stdout");
-+	ret = fwrite(dev->buffers[buf->index].mem, buf->bytesused, 1, stdout);
++    fprintf(stderr, "stdout");
++    ret = fwrite(dev->buffers[buf->index].mem, buf->bytesused, 1, stdout);
++
++    if (ret < 0)
++        fprintf(stderr, "write error: %s (%d)\n", strerror(errno), errno);
++    else if (ret != (int)buf->bytesused)
++        fprintf(stderr, "write error: only %d bytes written instead of %u\n",
++                ret, buf->bytesused);
++}
 +
-+	if (ret < 0)
-+		fprintf(stderr, "write error: %s (%d)\n", strerror(errno), errno);
-+	else if (ret != (int)buf->bytesused)
-+		fprintf(stderr, "write error: only %d bytes written instead of %u\n",
- 		       ret, buf->bytesused);
- }
- 
  static int video_do_capture(struct device *dev, unsigned int nframes,
  	unsigned int skip, unsigned int delay, const char *pattern,
 -	int do_requeue_last, enum buffer_fill_mode fill)
 +	int do_requeue_last, enum buffer_fill_mode fill, int do_stdout)
  {
- 	struct timespec start;
- 	struct timeval last;
-@@ -1099,7 +1113,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
+ 	struct v4l2_plane planes[VIDEO_MAX_PLANES];
+ 	struct v4l2_buffer buf;
+@@ -1529,7 +1543,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
  		ret = ioctl(dev->fd, VIDIOC_DQBUF, &buf);
  		if (ret < 0) {
  			if (errno != EIO) {
@@ -550,40 +624,26 @@ index f3deae0..8020209 100644
  					strerror(errno), errno);
  				goto done;
  			}
-@@ -1111,7 +1125,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
- 
- 		if (dev->type == V4L2_BUF_TYPE_VIDEO_CAPTURE &&
- 		    dev->imagesize != 0	&& buf.bytesused != dev->imagesize)
--			printf("Warning: bytes used %u != image size %u\n",
-+			fprintf(stderr, "Warning: bytes used %u != image size %u\n",
- 			       buf.bytesused, dev->imagesize);
- 
- 		if (dev->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
-@@ -1124,7 +1138,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
- 		fps = fps ? 1000000.0 / fps : 0.0;
+@@ -1550,7 +1564,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
  
  		clock_gettime(CLOCK_MONOTONIC, &ts);
--		printf("%u (%u) [%c] %u %u bytes %ld.%06ld %ld.%06ld %.3f fps\n", i, buf.index,
-+		fprintf(stderr, "%u (%u) [%c] %u %u bytes %ld.%06ld %ld.%06ld %.3f fps\n", i, buf.index,
+ 		get_ts_flags(buf.flags, &ts_type, &ts_source);
+-		printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
++		fprintf(stderr, "%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
  			(buf.flags & V4L2_BUF_FLAG_ERROR) ? 'E' : '-',
+ 			v4l2_field_name(buf.field),
  			buf.sequence, buf.bytesused, buf.timestamp.tv_sec,
- 			buf.timestamp.tv_usec, ts.tv_sec, ts.tv_nsec/1000, fps);
-@@ -1132,8 +1146,13 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
- 		last = buf.timestamp;
- 
- 		/* Save the image. */
--		if (dev->type == V4L2_BUF_TYPE_VIDEO_CAPTURE && pattern && !skip)
-+		if (dev->type == V4L2_BUF_TYPE_VIDEO_CAPTURE && pattern && !skip) {
+@@ -1563,6 +1577,9 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
+ 		if (video_is_capture(dev) && pattern && !skip)
  			video_save_image(dev, &buf, pattern, i);
-+		}
-+
-+		if (dev->type == V4L2_BUF_TYPE_VIDEO_CAPTURE && do_stdout && !skip) {
-+			video_stdout_image(dev, &buf);
-+		}
  
++		if (video_is_capture(dev) && do_stdout && !skip)
++			video_stdout_image(dev, &buf);
++
  		if (skip)
  			--skip;
-@@ -1149,7 +1168,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
+ 
+@@ -1577,7 +1594,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
  
  		ret = video_queue_buffer(dev, buf.index, fill);
  		if (ret < 0) {
@@ -592,7 +652,7 @@ index f3deae0..8020209 100644
  				strerror(errno), errno);
  			goto done;
  		}
-@@ -1159,7 +1178,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
+@@ -1587,7 +1604,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
  	video_enable(dev, 0);
  
  	if (nframes == 0) {
@@ -601,7 +661,7 @@ index f3deae0..8020209 100644
  		goto done;
  	}
  
-@@ -1176,7 +1195,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
+@@ -1604,7 +1621,7 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
  	bps = size/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
  	fps = i/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
  
@@ -610,12 +670,14 @@ index f3deae0..8020209 100644
  		i, ts.tv_sec, ts.tv_nsec/1000, fps, bps);
  
  done:
-@@ -1188,37 +1207,38 @@ done:
+@@ -1616,42 +1633,42 @@ done:
  
  static void usage(const char *argv0)
  {
 -	printf("Usage: %s [options] device\n", argv0);
 -	printf("Supported options:\n");
+-	printf("-B, --buffer-type		Buffer type (\"capture\", \"output\",\n");
+-	printf("                                \"capture-mplane\" or \"output-mplane\")\n");
 -	printf("-c, --capture[=nframes]		Capture frames\n");
 -	printf("-C, --check-overrun		Verify dequeued frames for buffer overrun\n");
 -	printf("-d, --delay			Delay (in ms) before requeuing buffers\n");
@@ -639,14 +701,19 @@ index f3deae0..8020209 100644
 -	printf("-w, --set-control 'ctrl value'	Set control 'ctrl' to 'value'\n");
 -	printf("    --enum-formats		Enumerate formats\n");
 -	printf("    --enum-inputs		Enumerate inputs\n");
+-	printf("    --fd                        Use a numeric file descriptor insted of a device\n");
+-	printf("    --field			Interlaced format field order\n");
 -	printf("    --no-query			Don't query capabilities on open\n");
 -	printf("    --offset			User pointer buffer offset from page start\n");
 -	printf("    --requeue-last		Requeue the last buffers before streamoff\n");
+-	printf("    --timestamp-source		Set timestamp source on output buffers [eof, soe]\n");
 -	printf("    --skip n			Skip the first n frames\n");
 -	printf("    --sleep-forever		Sleep forever after configuring the device\n");
 -	printf("    --stride value		Line stride in bytes\n");
 +	fprintf(stderr, "Usage: %s [options] device\n", argv0);
 +	fprintf(stderr, "Supported options:\n");
++	fprintf(stderr, "-B, --buffer-type		Buffer type (\"capture\", \"output\",\n");
++	fprintf(stderr, "                                \"capture-mplane\" or \"output-mplane\")\n");
 +	fprintf(stderr, "-c, --capture[=nframes]		Capture frames\n");
 +	fprintf(stderr, "-C, --check-overrun		Verify dequeued frames for buffer overrun\n");
 +	fprintf(stderr, "-d, --delay			Delay (in ms) before requeuing buffers\n");
@@ -655,7 +722,6 @@ index f3deae0..8020209 100644
 +	fprintf(stderr, "\tFor video capture devices, the first '#' character in the file name is\n");
 +	fprintf(stderr, "\texpanded to the frame sequence number. The default file name is\n");
 +	fprintf(stderr, "\t'frame-#.bin'.\n");
-+	fprintf(stderr, "    --stdout			write frames to stdout\n");
 +	fprintf(stderr, "-h, --help			Show this help screen\n");
 +	fprintf(stderr, "-i, --input input		Select the video input\n");
 +	fprintf(stderr, "-I, --fill-frames		Fill frames with check pattern before queuing them\n");
@@ -671,32 +737,35 @@ index f3deae0..8020209 100644
 +	fprintf(stderr, "-w, --set-control 'ctrl value'	Set control 'ctrl' to 'value'\n");
 +	fprintf(stderr, "    --enum-formats		Enumerate formats\n");
 +	fprintf(stderr, "    --enum-inputs		Enumerate inputs\n");
++	fprintf(stderr, "    --fd                        Use a numeric file descriptor insted of a device\n");
++	fprintf(stderr, "    --field			Interlaced format field order\n");
 +	fprintf(stderr, "    --no-query			Don't query capabilities on open\n");
 +	fprintf(stderr, "    --offset			User pointer buffer offset from page start\n");
 +	fprintf(stderr, "    --requeue-last		Requeue the last buffers before streamoff\n");
++	fprintf(stderr, "    --timestamp-source		Set timestamp source on output buffers [eof, soe]\n");
 +	fprintf(stderr, "    --skip n			Skip the first n frames\n");
 +	fprintf(stderr, "    --sleep-forever		Sleep forever after configuring the device\n");
 +	fprintf(stderr, "    --stride value		Line stride in bytes\n");
  }
  
  #define OPT_ENUM_FORMATS	256
-@@ -1229,6 +1249,7 @@ static void usage(const char *argv0)
- #define OPT_USERPTR_OFFSET	261
- #define OPT_REQUEUE_LAST	262
- #define OPT_STRIDE		263
-+#define OPT_STDOUT		264
+@@ -1665,6 +1682,7 @@ static void usage(const char *argv0)
+ #define OPT_FD			264
+ #define OPT_TSTAMP_SRC		265
+ #define OPT_FIELD		266
++#define OPT_STDOUT		267
  
  static struct option opts[] = {
- 	{"capture", 2, 0, 'c'},
-@@ -1238,6 +1259,7 @@ static struct option opts[] = {
- 	{"enum-inputs", 0, 0, OPT_ENUM_INPUTS},
+ 	{"buffer-type", 1, 0, 'B'},
+@@ -1677,6 +1695,7 @@ static struct option opts[] = {
+ 	{"field", 1, 0, OPT_FIELD},
  	{"file", 2, 0, 'F'},
  	{"fill-frames", 0, 0, 'I'},
 +	{"stdout", 0, 0, OPT_STDOUT},
  	{"format", 1, 0, 'f'},
  	{"help", 0, 0, 'h'},
  	{"input", 1, 0, 'i'},
-@@ -1274,7 +1296,8 @@ int main(int argc, char *argv[])
+@@ -1717,7 +1736,8 @@ int main(int argc, char *argv[])
  	int do_list_controls = 0, do_get_control = 0, do_set_control = 0;
  	int do_sleep_forever = 0, do_requeue_last = 0;
  	int do_rt = 0;
@@ -706,16 +775,25 @@ index f3deae0..8020209 100644
  	char *endptr;
  	int c;
  
-@@ -1321,7 +1344,7 @@ int main(int argc, char *argv[])
+@@ -1755,7 +1775,7 @@ int main(int argc, char *argv[])
+ 		case 'B':
+ 			ret = v4l2_buf_type_from_string(optarg);
+ 			if (ret == -1) {
+-				printf("Bad buffer type \"%s\"\n", optarg);
++				fprintf(stderr, "Bad buffer type \"%s\"\n", optarg);
+ 				return 1;
+ 			}
+ 			video_set_buf_type(&dev, ret);
+@@ -1775,7 +1795,7 @@ int main(int argc, char *argv[])
  			do_set_format = 1;
- 			pixelformat = v4l2_format_code(optarg);
- 			if (pixelformat == 0) {
+ 			info = v4l2_format_by_name(optarg);
+ 			if (info == NULL) {
 -				printf("Unsupported video format '%s'\n", optarg);
 +				fprintf(stderr, "Unsupported video format '%s'\n", optarg);
  				return 1;
  			}
- 			break;
-@@ -1357,7 +1380,7 @@ int main(int argc, char *argv[])
+ 			pixelformat = info->fourcc;
+@@ -1812,7 +1832,7 @@ int main(int argc, char *argv[])
  		case 'r':
  			ctrl_name = strtol(optarg, &endptr, 0);
  			if (*endptr != 0) {
@@ -724,7 +802,7 @@ index f3deae0..8020209 100644
  				return 1;
  			}
  			do_get_control = 1;
-@@ -1371,12 +1394,12 @@ int main(int argc, char *argv[])
+@@ -1826,12 +1846,12 @@ int main(int argc, char *argv[])
  			do_set_format = 1;
  			width = strtol(optarg, &endptr, 10);
  			if (*endptr != 'x' || endptr == optarg) {
@@ -739,7 +817,7 @@ index f3deae0..8020209 100644
  				return 1;
  			}
  			break;
-@@ -1384,12 +1407,12 @@ int main(int argc, char *argv[])
+@@ -1839,12 +1859,12 @@ int main(int argc, char *argv[])
  			do_set_time_per_frame = 1;
  			time_per_frame.numerator = strtol(optarg, &endptr, 10);
  			if (*endptr != '/' || endptr == optarg) {
@@ -754,7 +832,7 @@ index f3deae0..8020209 100644
  				return 1;
  			}
  			break;
-@@ -1399,12 +1422,12 @@ int main(int argc, char *argv[])
+@@ -1854,12 +1874,12 @@ int main(int argc, char *argv[])
  		case 'w':
  			ctrl_name = strtol(optarg, &endptr, 0);
  			if (*endptr != ' ' || endptr == optarg) {
@@ -769,7 +847,35 @@ index f3deae0..8020209 100644
  				return 1;
  			}
  			do_set_control = 1;
-@@ -1433,15 +1456,18 @@ int main(int argc, char *argv[])
+@@ -1873,16 +1893,16 @@ int main(int argc, char *argv[])
+ 		case OPT_FD:
+ 			ret = atoi(optarg);
+ 			if (ret < 0) {
+-				printf("Bad file descriptor %d\n", ret);
++				fprintf(stderr, "Bad file descriptor %d\n", ret);
+ 				return 1;
+ 			}
+-			printf("Using file descriptor %d\n", ret);
++			fprintf(stderr, "Using file descriptor %d\n", ret);
+ 			video_set_fd(&dev, ret);
+ 			break;
+ 		case OPT_FIELD:
+ 			field = v4l2_field_from_string(optarg);
+ 			if (field == (enum v4l2_field)-1) {
+-				printf("Invalid field order '%s'\n", optarg);
++				fprintf(stderr, "Invalid field order '%s'\n", optarg);
+ 				return 1;
+ 			}
+ 			break;
+@@ -1907,22 +1927,25 @@ int main(int argc, char *argv[])
+ 			} else if (!strcmp(optarg, "soe")) {
+ 				dev.buffer_output_flags |= V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
+ 			} else {
+-				printf("Invalid timestamp source %s\n", optarg);
++				fprintf(stderr, "Invalid timestamp source %s\n", optarg);
+ 				return 1;
+ 			}
+ 			break;
  		case OPT_USERPTR_OFFSET:
  			userptr_offset = atoi(optarg);
  			break;
@@ -791,7 +897,7 @@ index f3deae0..8020209 100644
  		return 1;
  	}
  
-@@ -1470,7 +1496,7 @@ int main(int argc, char *argv[])
+@@ -1959,7 +1982,7 @@ int main(int argc, char *argv[])
  		ret = get_control(&dev, ctrl_name,
  				  get_control_type(&dev, ctrl_name), &val);
  		if (ret >= 0)
@@ -800,15 +906,16 @@ index f3deae0..8020209 100644
  	}
  
  	if (do_set_control)
-@@ -1481,21 +1507,21 @@ int main(int argc, char *argv[])
+@@ -1970,7 +1993,7 @@ int main(int argc, char *argv[])
  		video_list_controls(&dev);
  
  	if (do_enum_formats) {
 -		printf("- Available formats:\n");
 +		fprintf(stderr, "- Available formats:\n");
  		video_enum_formats(&dev, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+ 		video_enum_formats(&dev, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
  		video_enum_formats(&dev, V4L2_BUF_TYPE_VIDEO_OUTPUT);
- 		video_enum_formats(&dev, V4L2_BUF_TYPE_VIDEO_OVERLAY);
+@@ -1979,14 +2002,14 @@ int main(int argc, char *argv[])
  	}
  
  	if (do_enum_inputs) {
@@ -825,7 +932,7 @@ index f3deae0..8020209 100644
  	}
  
  	/* Set the video format. */
-@@ -1537,7 +1563,7 @@ int main(int argc, char *argv[])
+@@ -2028,7 +2051,7 @@ int main(int argc, char *argv[])
  	}
  
  	if (do_pause) {
@@ -834,7 +941,7 @@ index f3deae0..8020209 100644
  		getchar();
  	}
  
-@@ -1546,12 +1572,12 @@ int main(int argc, char *argv[])
+@@ -2037,12 +2060,12 @@ int main(int argc, char *argv[])
  		sched.sched_priority = rt_priority;
  		ret = sched_setscheduler(0, SCHED_RR, &sched);
  		if (ret < 0)
@@ -850,5 +957,5 @@ index f3deae0..8020209 100644
  		return 1;
  	}
 -- 
-1.7.10
+1.7.9.5
 
diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
index a20f591..d4e32de 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
@@ -4,12 +4,17 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "git://git.ideasonboard.org/yavta.git \
            file://0001-Add-stdout-mode-to-allow-streaming-over-the-network-.patch"
-SRCREV = "82ff2efdb9787737b9f21b6f4759f077c827b238"
+SRCREV = "7e9f28bedc1ed3205fb5164f686aea96f27a0de2"
 
 PV = "0.0"
 PR = "r2"
 S = "${WORKDIR}/git"
 
+# The yavta sources include copies of the headers required to build in the
+# include directory.  The Makefile uses CFLAGS to include these, but since
+# we override the CFLAGS then we need to add this include path back in.
+CFLAGS += "-I${S}/include"
+
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 yavta ${D}${bindir}
-- 
1.7.9.5


