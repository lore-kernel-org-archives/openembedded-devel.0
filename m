Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id AC338701A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:15:02 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id bs8so7326949wib.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 00:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=vwS1OEeDe3tPo7kwL54gjIeqsuByafJnkHD3WPfHeXg=;
	b=Z94jl5u6ISOGFFFMGEUoOahSAAZGmjuJ9BxdUPQQP4V1d8SNJXqCR8ncFD5K8rXUKY
	//Ct3u+w0lxFjP4QSu2Ay5n2PcP4+hALry+suOSFrWYp8RaI1RPLKUVDtmtHpcd2ceYt
	TAr3ocafaqC7xyURUe8yNP5EfIsypl3M9VslObLM4YKY9UR1kqDqp0BxvIl5JR3awhT3
	ow6BL1MRyQbQzKoBgo9zmoDOcbalF3oUiz3wSsGbrgliPDBwAUpUaViNJrM7KCy+Ob7h
	Isj6nP4xAa8Z2KmAlBhqEaqkNpfiCToEnTYdunW8Yvy712XcoQY4RDL84pK3A7XDnFWU
	3Egg==
MIME-Version: 1.0
X-Received: by 10.194.184.200 with SMTP id ew8mr41088405wjc.61.1405581296914; 
	Thu, 17 Jul 2014 00:14:56 -0700 (PDT)
Received: by 10.194.18.114 with HTTP; Thu, 17 Jul 2014 00:14:56 -0700 (PDT)
In-Reply-To: <20140717070546.GB2666@mail.itconsulting-heinold.de>
References: <CAD2C2VT=3DipX=8chChc6_NefZSfs3jocmYxePJp5THxANiKVg@mail.gmail.com>
	<53BC1835.90204@balister.org>
	<CAD2C2VTnHrLsfhRXcUxpcpXgWK+LzxxD87XrvrN6wiiMK+CMUw@mail.gmail.com>
	<CAD2C2VSTKS+NX=0CAwh1PAtkKgcHh+mpwMMVmh_b4dw9GeaABw@mail.gmail.com>
	<53C51AE2.4030100@bec-systems.com>
	<CAD2C2VR22ww51=1UQbW7OxtWvr8dV1PjLhr0d0O176JtX6PJKQ@mail.gmail.com>
	<CAD2C2VRr+RfWqxJ_6gL+UCh1Y7j_T41NEpVAw=TrekmxKMadUg@mail.gmail.com>
	<20140717070546.GB2666@mail.itconsulting-heinold.de>
Date: Thu, 17 Jul 2014 00:14:56 -0700
Message-ID: <CAOLEWZXoVWCmT8UCW2YbZeeECpWd-HKtk+SbMTk3vV9FF_DEZA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: open embedded build issues with beagle board
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
X-List-Received-Date: Thu, 17 Jul 2014 07:15:12 -0000
Content-Type: text/plain; charset=UTF-8

Yes, check the layer index.  I have a patched meta-beagleboard on github,
with an older kernel, but meta-beagleboard is not as current as meta-ti
(and not quite as "official" I believe).  The latest kernel works
reasonably well (the patches maintained by RCN) if you want to check the
LinuxOnArm wiki.

Steve


On Thu, Jul 17, 2014 at 12:05 AM, Henning Heinold <
henning@itconsulting-heinold.de> wrote:

> On Thu, Jul 17, 2014 at 12:29:34PM +0530, Bryan wrote:
> > ---------- Forwarded message ----------
> > Hi,
> >    Thanks for your suggestion to use meta-ti layer. Cau you please tell
> us
> > where we can find this layer as we couldn't find it on openembedded git.
> >
> > We tried with following link to build but it gives error while building.
> > https://github.com/beagleboard/meta-beagleboard
> >
> >
> > Thanks
> > Bryan
>
> Have a look at
> http://layers.openembedded.org/layerindex/branch/master/layers/
>
>
> Bye Henning
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

