Return-Path: <max.oss.09@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id D1BC271957
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Aug 2018 10:56:28 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id j21-v6so1299831edp.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Aug 2018 03:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JJKQYiWQywKnjJiu5GSmjsBAM3aE0oMAi95poANbXCg=;
	b=QgOy/O8G3dQjscjG7DAfuN9KgoKl+JZcC0PGzu7C4TwLqVCjp2VfzlOKowE8Mjcz/m
	UaEg1VmBeVLQ3LbyaZ29dOMzw3JA0tByVbQgTTIdFgtCKlyr/vexMefCFpyKCyRNUD7P
	Kb6oj5w5kJziQcJEPheHv4WEqd5kYyCZ5XbGcTA/9JQL1kRcgYmFosm5FOxabrezOv7C
	cZDBc85bj/27wEhBslbN3dbC2OIFHfDDFPOOEUFTM7CTYZ4QheXXhVOBkFWCHsB4gWhF
	VyrxgGvuOXrVuL2X0LtwdTwGdAuAP4HymDdEESU7vjLJdViZ9Wvt5BVcyJ3TkKp0Mx5E
	pr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JJKQYiWQywKnjJiu5GSmjsBAM3aE0oMAi95poANbXCg=;
	b=jgPUCjBA8SDHbL8MHKn72tL+ejCQ3dyVLFDqEKFJlBfvGvzZuujAOsWXKDfszwy7Cq
	kvTkjudtg5F3MgOaUSzKoyx+ybXvU+oeSxcu3UztnahIWFj9cbMo+fFr4tzy70me4I4o
	e91f06c8J4/axP1ImSjLRJkogFy/I9z1rHbriwLygDGiZQeaUide/asRMo3SVlIr2qSI
	RJWG/VgOBzbLO2NxlJtlonRmM+lx51llNqQv0b2oq9MstUbHWDn+Cx3f6RFDZ/i4eXiM
	nHfp0034bjddPkLdubUrIRTWcqvOrD/AfyGWfnvsJDLw1HI1725oj+ZNJO3ZoYaOg70K
	7kIA==
X-Gm-Message-State: AOUpUlFmV2pd4A8bmqaqGU6gHAF6jneGl6axel/CsZiMmwT7U5rklYVW
	xn/yWzc35TbGw9QAMFDkQRdZeiQi
X-Google-Smtp-Source: AAOMgpdxTndcfbWYQZdZts9z8Uni2HXnB1x9KfmB5yyeThPsHmJH09mRv0J8X/3ASe/YIDTxBSQgHg==
X-Received: by 2002:a50:944f:: with SMTP id
	q15-v6mr14440921eda.70.1533466589547; 
	Sun, 05 Aug 2018 03:56:29 -0700 (PDT)
Received: from Saturn.local.all ([195.48.14.138])
	by smtp.gmail.com with ESMTPSA id
	s41-v6sm8040601edd.61.2018.08.05.03.56.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 05 Aug 2018 03:56:28 -0700 (PDT)
Message-ID: <1533466587.3114.25.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: William Delacre <williamdelacre@gmail.com>
Date: Sun, 05 Aug 2018 12:56:27 +0200
In-Reply-To: <CAOnRZE+mRfYDwY7P3Dhs9-RcMZRH8QH9-2MQzKbVaxUBNpdeRA@mail.gmail.com>
References: <CAOnRZEJX6vtCikSJK4py2y3r3J-N3fT_tA5FLFYFyPF6vrczjw@mail.gmail.com>
	<1533334371.30932.14.camel@gmail.com>
	<CAOnRZELTAgoQ4yMaB8L4vmo8JV6Lx-HWfGCAORk=Rm3Djn0aaw@mail.gmail.com>
	<CAOnRZE+mRfYDwY7P3Dhs9-RcMZRH8QH9-2MQzKbVaxUBNpdeRA@mail.gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Actually installed packages
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
X-List-Received-Date: Sun, 05 Aug 2018 10:56:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

> Sorry, I just have a last question about those packages.
> In bitbake.conf, you can find this :
> 
> PACKAGE_BEFORE_PN ?= ""
> PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale
> ${PACKAGE_BEFORE_PN} ${PN}"
> 

This is the default list of packages which together with the
corresponding FILES_* variables define what packages with what
content get created.

See also the following links into the documentation:
https://www.yoctoproject.org/docs/2.5/mega-manual/mega-manual.html#new-recipe-packaging
https://www.yoctoproject.org/docs/2.5/mega-manual/mega-manual.html#splitting-an-application-into-mul
tiple-packages

> This means that all those packages (whatever the recipe is) will be
> automatically installed

No, that is plain wrong. The packages will get created but if they get
installed or not is up to the image recipe you are building.

Packages get installed because they are listed in IMAGE_INSTALL
variable of the image recipe or they are RDEPENDS, RRECOMMENDS of
a package which gets installed.

>  if the PACKAGES variable is not redefined in the
> recipe (so if '=' is used and not '+=' or *append) *So if I don't want
> those packages for one of my software/library, I have to explicitely
> specify it in the recipe ?

I guess that is the wrong question, yes if you don't want a specific
package you would need to not have it in the PACKAGES variable. 
I think though that I've seen strange things happening when not
having the defaults (-dbg, -dev, ...) though.

However, 

if your install task installs files which you do not want in any package,
then you rather should delete those files before packaging them, i.e.:
do_install_append () { rm -f ${D}/usr/bin/not_to_be_distributed }

if the defaults package files into the wrong package then mess with the
FILES_* variable.

Max


