Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9E26C921
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 08:20:35 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B31D8223205D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 09:20:33 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6D796223205B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 09:20:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 09:20:32 +0100 (CET)
Date: Tue, 28 Jan 2014 09:20:25 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140128082025.GA31309@mail.itconsulting-heinold.de>
References: <52E686D4.4040906@dresearch-fe.de>
	<CAMKF1srbr9PCgJSbmXLFTPcMxsEwno7EUAKqc-ADzbiO1DU6kw@mail.gmail.com>
	<52E765CB.3090600@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <52E765CB.3090600@dresearch-fe.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: opencv QA issue
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
X-List-Received-Date: Tue, 28 Jan 2014 08:20:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 28, 2014 at 09:09:47AM +0100, Steffen Sledz wrote:
> On 27.01.2014 17:29, Khem Raj wrote:
> > On Mon, Jan 27, 2014 at 8:18 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> >> After the latest update of our build host (Fedora-18) the opencv build fails with an QA issue.
> >>
> >> -------------> snip <-------------
> >> ERROR: QA Issue: non debug package contains .debug directory: opencv-apps path /work/cortexa9hf-vfp-neon-angstrom-linux-gnueabi/opencv/2.4.6+gitAUTOINC+c5afaa4e8d-r0/packages-split/opencv-apps/usr/share/OpenCV/java/.debug/libopencv_java246.so
> >> WARNING: QA Issue: opencv-apps: found library in wrong location: /usr/share/OpenCV/java/libopencv_java246.so
> >> opencv-apps: found library in wrong location: /usr/share/OpenCV/java/.debug/libopencv_java246.so
> >> ERROR: QA run found fatal errors. Please consider fixing them.
> >> ERROR: Function failed: do_package_qa
> >> ERROR: Logfile of failure stored in: /CACHE/jenkins-workspace/hipos-dfe-closed/build-closed/tmp-eglibc/work/cortexa9hf-vfp-neon-angstrom-linux-gnueabi/opencv/2.4.6+gitAUTOINC+c5afaa4e8d-r0/temp/log.do_package.15005
> >> NOTE: recipe opencv-2.4.6+gitAUTOINC+c5afaa4e8d-r0: task do_package: Failed
> >> ERROR: Task 502 (/CACHE/jenkins-workspace/hipos-dfe-closed/meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do_package) failed with exit code '1'
> >> -------------> snap <-------------
> >>
> >> After some research we found that the libopencv_java246.so wasn't build before the mentioned build host update. I'm not a cmake guru, so i can't determine why it is build after this update.
> >>
> >> But it seems to be clear that the path /usr/share/OpenCV/java/.debug/libopencv_java246.so is not covered by the package-split definition in meta-oe/recipes-support/opencv/opencv_2.4.bb:
> >>
> >> -------------> snip <-------------
> >> FILES_${PN} = ""
> >> FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
> >> FILES_${PN}-dbg += "${libdir}/.debug"
> > 
> > it should be added like something below
> > 
> > FILES_${PN}-dbg += "${datadir}/OpenCV/java/.debug"
> > 
> > can you try it out if it fixes the problem.
> 
> The error is gone. But there's still a QA warning.
> 
> -------------> snip <-------------
> WARNING: QA Issue: opencv-apps: found library in wrong location: /usr/share/OpenCV/java/libopencv_java246.so
> opencv-dbg: found library in wrong location: /usr/share/OpenCV/java/.debug/libopencv_java246.so
> -------------> snap <-------------

Hm either it's a jni-lib or opencv using jna, but installing it under /usr/share is wrong. If it is a jni-lib /usr/lib/jni
would be a good place if it is used by jna /usr/lib would be sufficient.


Bye Henning

