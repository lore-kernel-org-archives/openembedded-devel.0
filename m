Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 354BC707BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 10:23:36 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rp18so5570218iec.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 03:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=StcX0ZPkPeGxWVQNf8xp2AXnIQi3yWSl8y3iW/+UhEQ=;
	b=GfuE/Q6kXHcFWv/nagRvyiqSpHPf+qyoVQTkvn59Ef2YAFBSmVG0zz9wC31I9MSyq5
	LuXRX9qiiFCZNcs/zdFTDIRhP/rsxw72G/NVzVnvvb94u+NNtWtnmHUPHLmTS98Pt0+n
	Pim986ZzkCRgJETameJoTD06vYPVxzAEuXOcFPpMApCV7IMU6H0vqBowe0z7qDhgmEre
	dK3xrS5b/btcurlbKNCLcvhgHsA8fmkXiUUc/IURFf1KBFnQGDfVUyl5s2VOx5MuEGL0
	9Svgqy/cU2fhrsg3h3YUHKXt7Q83NrskoVvUo17wPJ9vIoD+he8YXzHWUFyT7mAmIgv1
	5H/g==
MIME-Version: 1.0
X-Received: by 10.50.39.8 with SMTP id l8mr6090552igk.13.1406888617634; Fri,
	01 Aug 2014 03:23:37 -0700 (PDT)
Received: by 10.107.9.214 with HTTP; Fri, 1 Aug 2014 03:23:37 -0700 (PDT)
In-Reply-To: <3353440.oUBJEHypqt@peggleto-mobl5.ger.corp.intel.com>
References: <CALYKT1jXkq-Ci_gpLs4v4rn50P6UsVRQUL7pO2BrWd9V-==eaA@mail.gmail.com>
	<3353440.oUBJEHypqt@peggleto-mobl5.ger.corp.intel.com>
Date: Fri, 1 Aug 2014 19:23:37 +0900
Message-ID: <CALYKT1gD5KrrS9bOtG9gY4NwzmXD0rfhk1oPQAPGX1zmF=jgeQ@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [boost]How can I develop a daemon which depends on boost?
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
X-List-Received-Date: Fri, 01 Aug 2014 10:23:37 -0000
Content-Type: text/plain; charset=UTF-8

Hi Paul,

Thank you for your kindness!

I will try with your method.

Have a good day!
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------


2014-08-01 18:37 GMT+09:00 Paul Eggleton <paul.eggleton@linux.intel.com>:

> Hi Journeyer,
>
> On Friday 01 August 2014 16:55:24 Journeyer J. Joh wrote:
> > I just submitted a question about how to include boost. Now I'd like to
> ask
> > another question - How can I develop a daemon which depends on boost?
> >
> > I believe firstly, I need to make boost be included into my binary image.
> > Secondly I believe that I need to develop a daemon which compiles with
> > boost library. Then how can I compile this daemon with boost library? The
> > boost library doesn't exist when the compile is executed.
>
> This would be a build dependency, so simply add boost to DEPENDS. To help
> answer your other question, since this will be (presumably) dynamically
> linked
> to your application, you don't need to do anything else because we detect
> dynamic links between files within packages and add a runtime dependency
> between the packages.
>
> As for generally how to add packages to an image, please see:
>
>
> http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#usingpoky-extend-customimage
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

