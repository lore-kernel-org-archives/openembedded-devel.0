Return-Path: <akini@synapticon.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id A8D146CC50
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 11:33:10 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id z5so3135065lbh.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 04:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=9FOh7PAgEDMZuyrjBF4vWaguRkUOFwLx2VqD+jq5KZc=;
	b=E+aEi9KxFTYP+KC1Gk3W8TypfVdB16y+CYyAvJJ6RuqcGm7WFCvsU+m7wqYRI0ajZO
	lF02xt6jqkYS6qmqXhDe6Rexl9+jJJxiJWUInW96WUDn6kmMJxQmfAGe4k4z7hETEnfp
	hyStsplHAq2kLBjjhEP2wnu7Jv25MKJJSo43a639w0YzIMzP91wKvhDb+SwKjLOuwX39
	Y4Gak0SZRPX4rXIRgHvJ0hCmq3qwFRrZ92zXVFdai7RgNjAggiiiC8ONpGICt/WlFV7R
	TX/UviDyRPojmZd8bg6SwbaSNIFqO3zCKXmcG9O9HeWTfc8KnRirAVWKzDZ6tH037Jnl
	8qOg==
X-Gm-Message-State: ALoCoQkoBP/FkOHo2n4J13G3Edf68Srmw3o4CcgjHvHdP5Kv1jdfy9nRb8l/TnNKl6hMY6gtIIOo
MIME-Version: 1.0
X-Received: by 10.112.210.136 with SMTP id mu8mr11354069lbc.25.1380886391473; 
	Fri, 04 Oct 2013 04:33:11 -0700 (PDT)
Received: by 10.114.3.8 with HTTP; Fri, 4 Oct 2013 04:33:11 -0700 (PDT)
Date: Fri, 4 Oct 2013 13:33:11 +0200
Message-ID: <CAKS01onZvQhWDq63OmQ+u7E9NCPSvWyhSnShnrexGXi6ma77Nw@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: building a recipe with runtime dependencies - ERROR: QA Issue : contains bad RPATH.
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
X-List-Received-Date: Fri, 04 Oct 2013 11:33:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I am trying to build a recipe for PCL library, similar to the one that
Lukas [1] has derived but for a older version because fo some dependencies
with other packages and support for ARM platform.

1.
https://github.com/bulwahn/meta-ros/commit/2c1fb8dbc46f8bc3f3fe58fbdfb7b2c8f244431a

I am using PCL 1.6 instead of PCL 1.7 as used by Lukas.

When i try to include the package in the image (rootfs) i get the following
error message:
ERROR: QA Issue: libpcl: Files/directories were installed but not shipped
  /usr/share
  /usr/share/pcl-1.6
  /usr/share/pcl-1.6/PCLConfigVersion.cmake
  /usr/share/pcl-1.6/PCLConfig.cmake
ERROR: QA Issue: package libpcl *contains bad
RPATH*/usr/lib:/home/akini/poky/build/tmp/sysroots/zc702-zynq7/usr/lib/vtk-5.8
in
file
/home/akini/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libpcl/1.6.0-r0/packages-split/libpcl/usr/bin/pcl_ply2raw
ERROR: QA Issue: package libpcl* contains bad
RPATH*/usr/lib:/home/akini/poky/build/tmp/sysroots/zc702-zynq7/usr/lib/vtk-5.8
in
file
/home/akini/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libpcl/1.6.0-r0/packages-split/libpcl/usr/bin/timed_trigger_test
ERROR: QA Issue: package libpcl *contains bad
RPATH*/usr/lib:/home/akini/poky/build/tmp/sysroots/zc702-zynq7/usr/lib/vtk-5.8
in
file
/home/akini/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libpcl/1.6.0-r0/packages-split/libpcl/usr/bin/pcl_convert_pcd_ascii_binary
... many more such errors.
ERROR: Function failed: do_package_qa

VTK is a runtime dependency for PCL and i have included the following line
in my recipe:

...
RDEPENDS_${PN} = "eigen boost libflann vtk"
...

Let me know if i am doing something wrong and hwo to over come this error
the right way !!



Thanks,
-- 

*Anup Kini
*Systems Engineer****
*
------------------------------
*

*Synapticon** * |  Cyber-Physical System Solutions ****

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:****
+49 7335 / 186 999 1


 **

 ****

synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>
****

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127****

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

