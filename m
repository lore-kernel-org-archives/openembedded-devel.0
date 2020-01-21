Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A2B1C7FD82
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:46:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 20so2018120wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mbZtznX9cTrrFLvPuBdeE5m6dxgCSv2ThaWmLuEG6QA=;
	b=kAYu5fQPxWGH9H8txS8z+4TG/DGv3iETCnRCGapi4omWX9CRkgYUSogUZelA/3PUWf
	JWUI0ndeZdW1XFi9X9wsnb/epnfBXqpUDZI1t6awzV4qD19NJPXsCA8UvQfbEX6ksWVj
	TLA6+OGQ9u4sHAupqux6qz/+1mGM99DAgbFjyZZZUmjvt4PniT1QTmHoiXUzFnbQhHFv
	Hc1ZQoBa5rkWloU5tmJzRupzTdcqY/IltGXrsK8HnbWAn8i4awsZnNbdDQ/G02Mn3QkE
	DRMUNTKx/NgoYeTMdvcovVC/IW7KbPpeBZGz0UXzN2naWeKPRtRUJ14wRO/RvT2a5d2D
	qnWA==
X-Gm-Message-State: APjAAAUBu+YNDHSFhCDPtgyknJudBEJKeI5CqBWOAM3G3bJLqMlZ35O4
	HzdMvdInPAa0cj5YiTiMDrk=
X-Google-Smtp-Source: APXvYqwXLdictWWlssBsr5v3YAU4l3yIB/WhCO4P2ikMkYTrIkjUTyQeGWz4lV8xs/JbQCgwUzGWrQ==
X-Received: by 2002:a05:600c:23c9:: with SMTP id
	p9mr3186739wmb.160.1579596390539; 
	Tue, 21 Jan 2020 00:46:30 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i16sm2990501wmb.36.2020.01.21.00.46.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 00:46:29 -0800 (PST)
Message-ID: <bd94e91dbbfd01500f86432e1c30ee356bb85d12.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Leitner <richard.leitner@skidata.com>, "Davis, Michael"
	<michael.davis@essvote.com>
Date: Tue, 21 Jan 2020 08:46:29 +0000
In-Reply-To: <20200121064438.GA1567918@pcleri>
References: <20200120202815.58841-1-michael.davis@essvote.com>
	<20200121064438.GA1567918@pcleri>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] java.bbclass: oe_makeclasspath does nothing without -s
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
X-List-Received-Date: Tue, 21 Jan 2020 08:46:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-21 at 07:44 +0100, Richard Leitner wrote:
> Hi,
> this is a note to let you know that I've just added this patch to the
> master-next branch of the meta-java repository at
>      git://git.yoctoproject.org/meta-java
> 
> As soon as it has gone through some more testing it will likely be
> merged to the master branch.
> 
> If you have any questions, please let me know.
> 
> regards;Richard.L
> 
> On Mon, Jan 20, 2020 at 08:28:31PM +0000, Davis, Michael wrote:
> > oe_makeclasspath is supposed to output for the target platform by default and the staging platform with -s.
> > However it checks if the file exists even if -s is not defined which is always false.
> > Additionaly remove comment around an error that never occurs.
> > 
> > Signed-off-by: Michael Davis <michael.davis@essvote.com>
> > ---
> >  classes/java.bbclass | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/classes/java.bbclass b/classes/java.bbclass
> > index fc97295..7b9677a 100644
> > --- a/classes/java.bbclass
> > +++ b/classes/java.bbclass
> > @@ -80,8 +80,6 @@ oe_makeclasspath() {
> >    # in variable "bootcp".
> >    # 
> >    # Provide the -s at the beginning otherwise strange things happen.
> > -  # If -s is given the function checks whether the requested jar file exists
> > -  # and exits with an error message if it cannot be found.
> >    #
> >    # Note: In order to encourage usage of the DEPENDS variable, the function
> >    # can accept recipe names. If a recipe has no corresponding Jar file it
> > @@ -91,6 +89,7 @@ oe_makeclasspath() {
> >    classpath=
> >    delimiter=
> >    retval=$1
> > +  staging=false
> >  
> >    shift
> >  
> > @@ -106,6 +105,7 @@ oe_makeclasspath() {
> >                    dir=${STAGING_DATADIR_JAVA}
> >                    ;;
> >                esac
> > +              staging=true
> >                ;;
> >            -*)
> >                bbfatal "oe_makeclasspath: unknown option: $1"
> > @@ -113,9 +113,9 @@ oe_makeclasspath() {
> >            *)
> >                file=$dir/$1.jar
> >  
> > -              if [ -e $file ]; then
> > -                  classpath=$classpath$delimiter$file
> > -                  delimiter=":"
> > +              if [ $staging == false ] || [ -e $file ]; then
                                 ^^
Can you please remove this bashism. One '=' is enough.

Cheers,
Andre'


> > +                classpath=$classpath$delimiter$file
> > +                delimiter=":"
> >                fi
> >  
> >            ;;
> > -- 
> > 2.24.1
> > 


