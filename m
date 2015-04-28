Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id E62EE72491
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 19:55:18 +0000 (UTC)
Received: by qcrf4 with SMTP id f4so3178613qcr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 12:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=FktqHUENdK0GU4ofGedF2vOZCksbVHNCFMJrZnDc5Ic=;
	b=JIbVoUqPNWrBYP3wKKw2EQ1BZ8KAdCgsjbgYzYpKPuTIMSq40Y5eIYQPJ+lkXGc4+5
	mkTKbkig2wNVMkx6UnFukMosQ0t6cPn1g7UcxpgzZAAivulB4TaIjaHONttVARcv4zih
	Uq5m9MgkyaB1KJpb5EHKRU5IJenJ7gwg7HD75PIo/PwGUH7RbTJ+IVA1Hn3A2NeVZR8M
	1wHhz89U6IDWy7cCrK5MUg1iS8hXx+894oK1MH6j/jakWlh3oxzIecR/6sfffK0PjAAf
	nz384cmU5PcseiH3QQJ12SPq7wCjbqSnlmHMCxiyywHnen5KiKWOS3eE3mEI9WFcNu4f
	18ZA==
X-Gm-Message-State: ALoCoQluov7lWlKhDZVqzKW3PaXl1Dx7qX3SnM2gvJpTF9F2atCMObvWNfwcRZHe6KG2Ts4N4QhL
X-Received: by 10.55.23.16 with SMTP id i16mr22534890qkh.14.1430250919459;
	Tue, 28 Apr 2015 12:55:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 28 Apr 2015 12:54:58 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Apr 2015 20:54:58 +0100
Message-ID: <CAJTo0LbHVrLM=Wt++3ue-VQ3KFB42tGaJUwFRW_UHfBDXuqc_w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Moving GStreamer 0.10 to meta-multimedia
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
X-List-Received-Date: Tue, 28 Apr 2015 19:55:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

This is basically a heads-up that we're working on moving GStreamer 0.10
out of oe-core[1] and into meta-multimedia, where anyone who still needs
0.10 can use and maintain them.

In case anyone out there using GStreamer 0.10 isn't aware, it's been
unmaintained since March 2013[2] and upstream there really mean that:

Last gstreamer commit on 0.10 branch: September 2013
gst-plugins-base: May 2013
gst-plugins-good: August 2013
gst-plugins-bad: August 2013
gst-plugins-ugly: July 2013

If your BSP vendor only ships GStreamer 0.10 plugins now is the time to
harass them about upgrading.

Ross

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=6294
[2]
http://lists.freedesktop.org/archives/gstreamer-announce/2013-March/000273.html

