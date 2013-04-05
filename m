Received: from mail-ie0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jtverity@gmail.com>) id 1UO9FF-0005I7-7r
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 18:12:11 +0200
Received: by mail-ie0-f171.google.com with SMTP id e14so4519682iej.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 08:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=bqp3p/bXwCblW+4O2LjVLolAKbbwuCgLauYT2R2ow0A=;
	b=Gl0Fa2HqOnYoZ/Cdl9Ikpms0DTI705on3M7HlYJkLmsbAvX8UG35DORaRzZ3V8RJ9z
	xFBNHEJWoeRiiinGSpfpThz4F68EG07oTKWH4UXcqvWwW+p36SDu0xgFPTeav/qhlibp
	qLKxTLVwxQ6nLCYMhbHMKWuTOgBgmPM87R2OBx9owevBxdjMuAbC8a7K5+0Vx8Jpj9IF
	DtNnYU3KbbNfdILPOScgDXLncSL2j1S9ysy/icYi8sDLZiWjP62z0Sia4kWJMdB57+O3
	l3wdY5aDeZsnZAdvLQ75EZeah3zfzxtsJM0pGRGguaXOVDcKkBflnBoAMPctQzqPCZ9A
	cxmg==
MIME-Version: 1.0
X-Received: by 10.50.7.69 with SMTP id h5mr2032377iga.69.1365177290357; Fri,
	05 Apr 2013 08:54:50 -0700 (PDT)
Sender: jtverity@gmail.com
Received: by 10.231.113.2 with HTTP; Fri, 5 Apr 2013 08:54:50 -0700 (PDT)
Date: Fri, 5 Apr 2013 11:54:50 -0400
X-Google-Sender-Auth: CrmCdNSwIAP6U7vj3Fctn7UFrGQ
Message-ID: <CAP8YevqRwF9BY_i+=yNCU_hv0bC7EW9kXb7bGBBj0pkbjHiVbA@mail.gmail.com>
From: "hobbesc7@gmail.com" <hobbesc7@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: libproxy glib.h build error
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
X-List-Received-Date: Fri, 05 Apr 2013 16:12:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Has anyone else had the following build error with libproxy?

/work/yocto/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libproxy-0.4.
7-r4/libproxy-0.4.7/libproxy/modules/pxgsettings.cpp:26:18: fatal error:
glib.h:     No such file or directory

On Google some people suggest adding the output of:

pkg-config --cflags glib-2.0

to CFLAGS, but I don't know how to do this within my crosscompile oe
environment.

