Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SKp9h-0004cL-DM
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 13:04:05 +0200
Received: by iaag37 with SMTP id g37so12039045iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2012 03:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=zln2Xg47hCTGrj1U5DtE0nPxMj28y6apNtwrxf+JFds=;
	b=VNPLIdzHlkd4Fl6nMt8fXNzwHIDBpuCBkRORqgSQ+4V/d1q/F82RbMuYY6Zpjc+Ip5
	E6YbBx636NIvMwOUSZPyNNh9A7mnMYo7JnLK1E/chvTNRI+tKBu/lvdCDvRM5yrOdX7s
	bRG9/PNQGLiMk+gWZE/zpP0ki6da2jyJqU9U4q9HIQhmrfmHPHwmKQNRqRo0PUO2HGKl
	K+W62VYVZMGyRkKBaiqKxWu7j6gi9dOggtQQumiPUhGNhajlYjJJ6D+65qR2kwH4nHoP
	YQ3MdGYWV8Ltr3HuQ7kkBvayuQFKiQx6WJGQ3mzdqiACF/M2ROfStm++gWLuAsU1/yw6
	BibQ==
MIME-Version: 1.0
Received: by 10.50.15.162 with SMTP id y2mr870077igc.32.1334832876243; Thu, 19
	Apr 2012 03:54:36 -0700 (PDT)
Received: by 10.231.67.134 with HTTP; Thu, 19 Apr 2012 03:54:36 -0700 (PDT)
Date: Thu, 19 Apr 2012 12:54:36 +0200
Message-ID: <CAOHjBZtTxc7L8OpwMsSFr_xqc6WVXRRWK7eV95BDxnOLrjMqyQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [oe-core] gcc-runtime failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2012 11:04:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

a question about gcc-runtime package.
It fails building due to the lack of gmp/mpfr/mpc libraries/headers.
Indeed the native ones were correctly built and looking at the config.log
file I can see
the problem is due to libraries wrong format (in fact I'm building for sh
arch and the gmp/mpfr/mpc libs it
includes are the native ones).
The question is: should the package build the target libraries given that
there is the DEPENDS =+ "gmp mpfr libmpc" string in the
gcc_4.6.inc file?
I think yes, but actually this doesn't happen.
Moreover I can think gcc-runtime is not intended for target but for
something else. Isn't it?

Please clarify this to me... :)
Cheers,
Giuseppe

