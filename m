Return-Path: <gurrieristefano@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id B545B73D46
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 14:39:48 +0000 (UTC)
Received: by igdg1 with SMTP id g1so58015250igd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2015 06:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=DjU5cGHHQd7Evke9w6MuOGGbvMr0i9xS2pF+SN0qsKE=;
	b=MvQYgvoLdbgdBYhbg8U2WmjJc3YZhtKIPn/AYwbtlzwC/GrfSOpHqUTQoobAdt4j3U
	qEnWcLTL4Xce51kAzR4jc7YTAnonGDVQosAsFOgFmhdJtMmEQSSUmF4v3fzrtEdc0XDH
	hnwB/IuWuC6j6jhJE66BoIdN+iuwWrL5Dmh2ofLFg+kvBmKGwMBDbu0htK99sUfLPuKN
	ckVQ+OpfQ+7Bi1wBdte9d9RNZUPga5r96CR0UPIrBRrclYNPYDyeUiR7yzU/NZi07kIm
	g9Dshnc/BRJW6qdForHr3mbDT/iIqaLULxMhuwFprXC3Nd8aGzAjaotuyHJP4B2f2ys6
	iyjg==
MIME-Version: 1.0
X-Received: by 10.50.160.37 with SMTP id xh5mr11627376igb.6.1446475188836;
	Mon, 02 Nov 2015 06:39:48 -0800 (PST)
Received: by 10.107.192.5 with HTTP; Mon, 2 Nov 2015 06:39:48 -0800 (PST)
Date: Mon, 2 Nov 2015 15:39:48 +0100
Message-ID: <CAKpvFF2FXDnVtPvOcA59s-x=ux+97Xo+Mv_V5ZKdCRCJAu+tuQ@mail.gmail.com>
From: Stefano Gurrieri <gurrieristefano@gmail.com>
To: openembedded-devel@lists.openembedded.org, interest@qt-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: media player videowidget Qt5.4.2
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
X-List-Received-Date: Mon, 02 Nov 2015 14:39:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi people,

I've just compiled my Qt5.4.2 and installed them on my target.
But when I try to run some apps demo as videowidget or player, I always see
these messages:


(videowidget:642): GStreamer-CRITICAL **: gst_object_ref_sink: assertion
'object != NULL' failed
No m_videoSink available!

(videowidget:642): GStreamer-CRITICAL **: gst_element_set_state: assertion
'GST_IS_ELEMENT (element)' failed


I think the problem is "No m_videoSink available!". What miss in my linux
system?
In my file local.conf I add PACKAGECONFIG_append_pn-qtmultimedia = "
gstreamer" to enable the option gstreamer 1.0

Thanks a lot for the help!
Stefano

