Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 1796E6011A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 20:20:58 +0000 (UTC)
Received: (qmail 18936 invoked by uid 1003); 11 Sep 2016 20:20:58 -0000
Received: from unknown (HELO ?192.168.1.30?) (philip@opensdr.com@66.87.31.44)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	11 Sep 2016 20:20:58 -0000
To: openembedded-devel@lists.openembedded.org
References: <CAO=ipHJL-FjdSgDE7pCaxUTjh-DcaMthn0y-X=PxqpJRiG+rvw@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <6dde3cd8-e6c9-7883-54a7-3603d57eb6dc@balister.org>
Date: Sun, 11 Sep 2016 16:20:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAO=ipHJL-FjdSgDE7pCaxUTjh-DcaMthn0y-X=PxqpJRiG+rvw@mail.gmail.com>
Subject: Re: [yocto] problem with openCV
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
X-List-Received-Date: Sun, 11 Sep 2016 20:21:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 09/11/2016 02:10 PM, Szymon Guza wrote:
> Hello,
> 
> I want to create my own yocto disto image based on core-image-weston with
> C/C++ compliers and openCV. But when I'm trying to bitbake openCV error
> appears:
> 
> | -- Configuring incomplete, errors occurred!
> | See also "/home/admin/Zynq/poky/build/tmp/work/i586-poky-linux/
> opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/CMakeFiles/CMakeOutput.log".
> | See also "/home/admin/Zynq/poky/build/tmp/work/i586-poky-linux/
> opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/CMakeFiles/CMakeError.log".
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /home/admin/Zynq/poky/build/tmp/work/i586-poky-linux/opencv/3.1+gitAUTOINC+
> 92387b1ef8-r0/temp/log.do_configure.7661)
> ERROR: Task 278 (/home/admin/Zynq/poky/meta-openembedded/meta-oe/recipes-
> support/opencv/opencv_3.1.bb, do_configure) failed with exit code '1'
> 
> It is connected with this:
> 
> This recipe is *blacklisted* by the meta-oe
> <https://layers.openembedded.org/layerindex/branch/master/layer/meta-oe/>
> layer. The reason provided is:
> 
> BROKEN: fails to build with gcc-6

This is telling you you need to update the recipe by finding or writing
patches so the opencv builds with gcc6. Try looking for a more recent
version of opencv and/or patches to address the compile problems.

Philip

Philip

> 
> ??
> Am I right or openCV is now unavailable? Or Am i doing something wrong?
> I am looking forward to hearing from you.
> 

