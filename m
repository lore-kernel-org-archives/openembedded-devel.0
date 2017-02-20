Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0FADB71BA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 12:11:05 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170220121104676_0684
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 12:11:04 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [174.118.92.171] (port=54122 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cfmnz-0004JI-5d for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2017 07:10:59 -0500
Date: Mon, 20 Feb 2017 07:10:56 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.20.1702200641270.22953@localhost.localdomain>
Message-ID: <alpine.LFD.2.20.1702200709170.28884@localhost.localdomain>
References: <alpine.LFD.2.20.1702200641270.22953@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: "Can't install krb5-dev-1.13.6-r0@ppc7400: no package provides krb5 = 1.13.6-r0"
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
X-List-Received-Date: Mon, 20 Feb 2017 12:11:06 -0000
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Feb 2017, Robert P. J. Day wrote:

>   ok, i hope this issue is not trivially simple. i'm building
> core-image-minimal for qemuppc, and tossing in a bunch of other
> recipes, everything builds until:
>
> ///// start /////
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Unable to install
> packages. Command
> '/home/rpjday/oe/builds/qemuppc_oe_small/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/smart
> --log-level=info
> --data-dir=/home/rpjday/oe/builds/qemuppc_oe_small/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/smart
> install -y packagegroup-core-boot@qemuppc rpm@ppc7400
> packagegroup-wrl-regular-recipes@all smartpm@ppc7400
> run-postinsts@all' returned 1:
> Loading cache...
> Updating cache...
> ######################################## [100%]
>
> Computing transaction...error: Can't install
> krb5-dev-1.13.6-r0@ppc7400: no package provides krb5 = 1.13.6-r0
>
>
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
> ERROR: Logfile of failure stored in:
> /home/rpjday/oe/builds/qemuppc_oe_small/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.22573
> ERROR: Task
> (/home/rpjday/oe/dist/layers/poky/meta/recipes-core/images/core-image-minimal.bb:do_rootfs)
> failed with exit code '1'
> ///// end /////

  a simple solution was to add the line:

ALLOW_EMPTY_krb5 = "1"

to my local.conf. is that really the proper fix?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


