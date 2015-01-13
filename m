Return-Path: <petr.nechaev@cogentembedded.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3547162E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 21:48:51 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id hs14so5035489lab.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 13:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=t2ncnzzhnK005o+rF5Ha8635kBFRbw8SlgjmDtOH018=;
	b=dsuwE1TTvP4L61pet5xf2fvwiZDVA3fATUbcZlcetsbIrVMZtZIpaK9Z9UvqHI6se9
	K+xNr89WqExzs9pmO7asQqJVR4yccXsFJQrCsmoHwCOIyUc/YjXFEXRCuMLU8OgW6A5N
	TlAEKQzjfAu8UUlLZZ4i/5dCpEZMUsym+sVDk4QsD86A08Qh7O4zWaZE2FIQrHeqztSB
	e4g1ycO4xNl/4BLn7DsQTYMgmRIoeb+RhHJIFV3erMUeR4rMgRHUI4lwnjq1U2IqTIvo
	9O/rpuZIxSRdOW3RkSScJXHyvVInoMUKpf7M7BdrBWWvyZWZ0i2RdfDa5HWaXS1uppdq
	5gcw==
X-Gm-Message-State: ALoCoQkZ0v0cAQRAyXHRvg8Nfu6Tv0EldiDK3ZZ61Rrf8oi5KaZIdKUEnl06AhUplzqdfRwj9eyZ
MIME-Version: 1.0
X-Received: by 10.112.12.134 with SMTP id y6mr611873lbb.34.1421185731165; Tue,
	13 Jan 2015 13:48:51 -0800 (PST)
Received: by 10.25.23.170 with HTTP; Tue, 13 Jan 2015 13:48:51 -0800 (PST)
Date: Wed, 14 Jan 2015 01:48:51 +0400
Message-ID: <CAHPquwNE8dJtcQ1yM0BuXKG5ug3B89FjZV7z2uxZTp_hFkM=EA@mail.gmail.com>
From: Petr Nechaev <petr.nechaev@cogentembedded.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] What is the proper way to enable OpenGL ES v2 without using .bbappend
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
X-List-Received-Date: Tue, 13 Jan 2015 21:49:00 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

 what is the proper way to tell meta-qt5 to build with OpenGL ES v2 support
without using a .bbappend file like this:
----------------------
# switch to GLES 2 support
PACKAGECONFIG_GL = "${@base_contains('DISTRO_FEATURES', 'opengl', 'gles2',
'', d)}"
----------------------

I encountered several boards with have only GLES support, no desktop OpenGL.

AFAIK there is no "opengles" distro feature (in DISTRO_FEATURES)
standardized yet.
Googling resulted in
http://lists.openembedded.org/pipermail/openembedded-core/2013-October/085508.html

https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg45278.html

Should we define something opengles-2, opengles-3 etc for DISTRO_FEATURES?

---
Thanks,
Petr

