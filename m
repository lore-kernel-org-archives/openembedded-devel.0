Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD6D773D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 21:07:10 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id g62so87705356wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 13:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=uhvL7Jm/D41FXUwIcEgiF60eHZRbp9yTHW/D+GM8xwo=;
	b=DDWxM0QKs1UbymilCBkbRWvyjNKDFj9wWd7hYbYsTL7dTeWJj/1pQ5aXZJL7yL7qPf
	taVdnZTNnv+qGsWGkXFx3xVdjEViwPbMs+64Cp9FqztQ7vHX9VWMHOCjlm3KdWrnA/85
	Ty+3z9GjXzNNcl/tx0/g5RuANFKuWUILbLhJ8agNHYBSQIHrS4q32u5MgpgJqR3j6Wwb
	GPRGYCCPJ/d6lS64mmFrHgTqAQk1IhuH3kLMmcWdTkoX+WTP0+J63MCxk0aeal03yW2f
	5HG3X2uI7O2A40eGfs3QAu8TJfSJCOjxRuBUOK+jOQmXzKO+iQzYS8ytlTbMIAyGcTFT
	ZCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=uhvL7Jm/D41FXUwIcEgiF60eHZRbp9yTHW/D+GM8xwo=;
	b=Re4CpI/A5d0PiQh048Lb5TDMS4ycUuGAXbiL88eNxztS3Drd4VRZ7BnI6xdEdayBDE
	DwyH9qEfOEca+UBbDyrGNMP/FJy0dUpx6b2c7MF9S7Fdo6reINLLkUfm0V3NkJXiWrU5
	0sTv8Qg/8d31wIhsVar02teAHtVvAlvCoPt4l9t/dKRoO5vzH0gHr+OBoipwUNAT9Xi8
	GVcBUEtco3dVnKxWdJLgV7utDtUDiXvVIAI6H67SatPT4O+LFDdZGW4dC/zTCp5pe6Eg
	efILLqkCI1sKPq3a58b0noNqb1hiHdeII6TFhc0eOb3/343MuqkXTfISR5XvFdKmUPjM
	/40Q==
X-Gm-Message-State: AD7BkJLgGp1YyHDytYstzEwaJkw9Kxaa2VF4aozQ0WG+9Kazu1wLRH4tFSPs0WupfMCPGvB2fRWL/ESbXxIV5w==
MIME-Version: 1.0
X-Received: by 10.28.92.13 with SMTP id q13mr4851713wmb.43.1456520831305; Fri,
	26 Feb 2016 13:07:11 -0800 (PST)
Received: by 10.194.58.176 with HTTP; Fri, 26 Feb 2016 13:07:11 -0800 (PST)
In-Reply-To: <56D0BBDC.4080101@gmail.com>
References: <CAP9ODKpg19uSG8=jvwrqsA88EJQQOTkWROwxvmdziLpoA8HG_w@mail.gmail.com>
	<56D0BBDC.4080101@gmail.com>
Date: Fri, 26 Feb 2016 22:07:11 +0100
Message-ID: <CA+chaQeJDw6a4CTDQZqY_TLqn47w24THGZcGA_NTm7HTi6tyBQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [jethro] Backport proposal
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
X-List-Received-Date: Fri, 26 Feb 2016 21:07:12 -0000
Content-Type: text/plain; charset=UTF-8

better to include oe-core ML not oe-devel.

On Fri, Feb 26, 2016 at 9:55 PM, akuster808 <akuster808@gmail.com> wrote:

> On 2/24/16 11:50 AM, Otavio Salvador wrote:
> > Hello folks
> >
> > [Cced Robert Yang]
> >
> > I would like to propuse the backport of following changes:
>
>
> Seems responsible to me.
>
> - armin
> >
> > Author: Mariano Lopez <mariano.lopez@linux.intel.com>
> > Date:   Wed Dec 30 06:52:54 2015 +0000
> >
> >     image_types.bbclass: Rebuild when WICVARS change
> >
> >     The procces to do a wic image is to save a file with
> >     variables required by wic and then call wic using this
> >     file. Because this is external to bitbake if the vars
> >     change, the image won't be rebuild; an example of such
> >     is IMAGE_BOOT_FILES.
> >
> >     This patch adds these variables to vardeps of do_rootfs
> >     when a wic image is build. This will rebuild the image
> >     if a variable needed by wic changes.
> >
> >     [YOCTO #8693]
> >
> >     Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> >     Signed-off-by: Ross Burton <ross.burton@intel.com>
> >     (cherry picked from commit 12c54d50ed4c321dc272beb3c6cb770965c979f1)
> >
> > Author: Christopher Larson <chris_larson@mentor.com>
> > Date:   Tue Nov 10 14:18:20 2015 -0700
> >
> >     image_types: improve wks path specification
> >
> >     Hardcoding a full input path with zero flexibility goes against
> > everything the
> >     Yocto Project is about. Rework it to let the user specify the wks
> base
> >     filename with WKS_FILE and it'll search the layers for the wks file
> and use
> >     it.
> >
> >     Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> >     Signed-off-by: Ross Burton <ross.burton@intel.com>
> >     (cherry picked from commit 8cc7f5229f5447c2183ac319dd52c7ed737ec89b)
> >
> > Those improve the 'wic' image support on Jethro and are merged into
> > master for a while. Could those be backported?
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

